package com.chainsys.parksmart.dao;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.chainsys.parksmart.mapper.*;
import com.chainsys.parksmart.model.Reservation;
import com.chainsys.parksmart.model.Spots;
import com.chainsys.parksmart.model.Transaction;
import com.chainsys.parksmart.model.User;

@Repository
public class UserImpl implements UserDAO {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public boolean userRegistration(User user) {
		String selectQuery = "SELECT user_id, user_name, user_password, phone_number, email FROM user WHERE user_name=? AND user_password=? AND phone_number=? AND email=?";
		List<String> existingUsers = jdbcTemplate.queryForList(selectQuery, String.class, user.getUserName(),
				user.getUserPassword(), user.getPhoneNumber(), user.getEmail());
		if (!existingUsers.isEmpty()) {
			return false;
		}

		String insertQuery = "INSERT INTO user (user_name, user_password, phone_number, email) VALUES (?, ?, ?, ?)";
		Object[] params = { user.getUserName(), user.getUserPassword(), user.getPhoneNumber(), user.getEmail() };
		int rowsAffected = jdbcTemplate.update(insertQuery, params);
		return rowsAffected > 0;
	}

	@Override
	public boolean userLogin(User user) {
		String query = "SELECT COUNT(*) FROM user WHERE email=?";
		int count = jdbcTemplate.queryForObject(query, Integer.class, user.getEmail());
		return count == 1;
	}

	public Integer getUserById(User user) {
		String query = "SELECT user_id FROM user WHERE email=?";
		Object[] details = { user.getEmail() };
		int existingUsers = jdbcTemplate.queryForObject(query, Integer.class, details);
		return existingUsers;
	}

	public void insertSpots(Spots spots, int id, String locationName, String address, String vehicleType,
			String spotNumber) {
		String query = "INSERT INTO spots (user_id, location_name, address, vehicle_type, spot_number, spot_status) VALUES (?, ?, ?, ?, ?, ?)";
		Object[] params = { id, locationName, address, vehicleType, spotNumber, spots.getSpotStatus() };
		jdbcTemplate.update(query, params);
	}

	public List<String> readSpotNumbers(String locationName) {
		String query = "SELECT spot_number FROM spots WHERE location_name = ? AND spot_status = true";
		List<String> spotList = jdbcTemplate.queryForList(query, String.class, locationName);
		return spotList;

	}

	public void updateSpotStatus(Spots spots) {
		String update = "UPDATE spots SET spot_status=? WHERE spot_id = ?";
		Object[] params = { spots.getSpotStatus(), spots.getSpotId() };
		jdbcTemplate.update(update, params);
	}

	public int countSpotNumber(Spots spots, int id) {
		String query = "SELECT COUNT(spot_number) FROM spots WHERE user_id = ? and spot_status=1";
		Integer spotCount = jdbcTemplate.queryForObject(query, Integer.class, id);
		return spotCount;
	}

	public int getReservationByReservationId(int id) {
		String query = "SELECT reservation_id FROM reservation WHERE user_id = ? and reservation_status='pending'";
		Object[] details = { id };
		int existingUsers = jdbcTemplate.queryForObject(query, Integer.class, details);
		return existingUsers;
	}

	public void insertReservation(Reservation reservation, int id) {
		String query = "INSERT INTO reservation (user_id, reservation_id, number_plate, start_date_time, end_date_time, is_active) VALUES (?, ?, ?, ?, ?, ?)";
		Object[] params = { id, reservation.getReservationId(), reservation.getNumberPlate(),
				reservation.getStartDateTime(), reservation.getEndDateTime(), reservation.getIsActive() };
		jdbcTemplate.update(query, params);
	}

	public List<Reservation> readReservation() {
		String read = "SELECT user_id, reservation_id, number_plate, start_date_time, end_date_time, reservation_status, is_active FROM reservation";
		List<Reservation> reservation = jdbcTemplate.query(read, new ReservationMapper());
		return reservation;
	}

	public void updateReservationStatus(Reservation reservation) {
		String update = "UPDATE reservation SET reservation_status=? WHERE reservation_id = ?";
		Object[] params = { reservation.getReservationStatus(), reservation.getReservationId() };
		jdbcTemplate.update(update, params);
	}

	public void updateIsActive(Reservation reservation) {
		String update = "UPDATE reservation SET is_active=? WHERE reservation_id = ?";
		Object[] params = { reservation.getIsActive(), reservation.getReservationId() };
		jdbcTemplate.update(update, params);
	}

	public List<Reservation> readReservation(Reservation reservation) {
		String read = "SELECT reservation_id FROM reservation WHERE user_id=? and is_active=true";
		Object[] params = { reservation.getUserId() };
		List<Reservation> reservations = jdbcTemplate.query(read, new ReservationMapper(), params);
		return reservations;
	}

	public void insertTransaction(int reservationId, int id, int price, String transactionTime) {
		String query = "INSERT INTO transaction (user_id, reservation_id, price, payment_method, transaction_time, payment_status) "
				+ "VALUES (?, ?, ?, '', ?, ' ')";
		Object[] params = { id, reservationId, price, transactionTime };
		jdbcTemplate.update(query, params);
	}

	public int getPrice(Transaction transaction, String vehicleType, String startDateTime, String endDateTime) {
		LocalDateTime start = parseDateTime(startDateTime);
		LocalDateTime end = parseDateTime(endDateTime);
		int price = 0;

		if (start != null && end != null) {
			price = calculatePrice(vehicleType, start, end);
			transaction.setPrice(price);
		}
		return price;
	}

	public String getCurrentTransactionTimeFormatted(Transaction transaction) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String transactionTime = LocalDateTime.now().format(formatter);
		transaction.setTransactionTime(transactionTime);
		return transactionTime;
	}

	public void updateTransaction(Transaction transaction, int reservationId) {
		String update = "UPDATE transaction SET card_number=?, expiry_date=?, cvv=? WHERE reservation_id = ?";
		Object[] params = { transaction.getCardNumber(), transaction.getExpiryDate(), transaction.getCvv(),
				reservationId };
		jdbcTemplate.update(update, params);
	}

	public void addPaymentMethod(Transaction transaction, int id, String paymentMethod) {
		String update = "UPDATE transaction SET payment_method = ?, payment_status='paid' WHERE user_id = ?";
		Object[] params = { paymentMethod, id };
		jdbcTemplate.update(update, params);
	}

	public LocalDateTime parseDateTime(String dateTimeString) {
		if (dateTimeString != null) {
			return LocalDateTime.parse(dateTimeString, DateTimeFormatter.ISO_LOCAL_DATE_TIME);
		} else {
			return null;
		}
	}

	public int calculatePrice(String vehicleType, LocalDateTime startDateTime, LocalDateTime endDateTime) {
		Duration duration = Duration.between(startDateTime, endDateTime);
		long hours = duration.toHours();
		int hourlyRate;
		switch (vehicleType) {
		case "Car":
			hourlyRate = 50;
			break;
		case "Bike":
			hourlyRate = 15;
			break;
		case "Truck":
			hourlyRate = 100;
			break;
		default:
			hourlyRate = 50;
			break;
		}
		return (int) (hours * hourlyRate);
	}

	public List<Reservation> readReservations() {
		String read = "SELECT user_id, reservation_id, number_plate, start_date_time, end_date_time, reservation_status, is_active FROM reservation";
		List<Reservation> reservation = jdbcTemplate.query(read, new ReservationMapper());
		return reservation;
	}

	public List<Transaction> readTransaction() {
		String read = "SELECT user_id, reservation_id, transaction_id, price, payment_method, transaction_time, card_number, expiry_date, cvv, payment_status FROM transaction";
		List<Transaction> transaction = jdbcTemplate.query(read, new TransactionMapper());
		return transaction;
	}

	public Transaction readTransactions(Transaction transaction) {
		String read = "SELECT price, transaction_time FROM transaction WHERE user_id=?";
		Object[] params = { transaction.getUserId() };
		jdbcTemplate.query(read, new TransactionMapper(), params);
		return transaction;
	}

	public List<User> readUser() {
		String read = "SELECT user_id, user_name, user_password, phone_number, email FROM user where status=1";
		List<User> user = jdbcTemplate.query(read, new UserMapper());
		return user;
	}

	public List<Spots> readSpotsAdmin() {
		String read = "SELECT user_id, spot_id, location_name, address, vehicle_type, spot_number, spot_status FROM spots";
		List<Spots> spots = jdbcTemplate.query(read, new SpotsMapper());
		return spots;
	}

	public void deleteUser(User user) {
		String delete = "UPDATE user SET status=0 WHERE email=?";
		Object[] params = { user.getEmail() };
		jdbcTemplate.update(delete, params);
	}

	public List<User> searchUser(String searchText) {
		String search = "SELECT user_id, user_name, user_password, phone_number, email " + "FROM user "
				+ "WHERE user_id = ? OR user_name LIKE ? OR phone_number LIKE ? OR email LIKE ?";
		Object[] params = { "%" + searchText + "%", "%" + searchText + "%", "%" + searchText + "%",
				"%" + searchText + "%" };

		List<User> userList = jdbcTemplate.query(search, new UserMapper(), params);
		return userList;
	}

	public List<Spots> searchSpots(String searchText) {
		String search = "SELECT user_id, spot_id, location_name, address, vehicle_type, spot_number, spot_status "
				+ "FROM spots "
				+ "WHERE user_id = ? OR spot_id=? OR location_name LIKE ? OR address LIKE ? OR vehicle_type LIKE ? OR spot_number LIKE ? OR spot_status LIKE ?";
		Object[] params = { searchText, searchText, "%" + searchText + "%", "%" + searchText + "%",
				"%" + searchText + "%", "%" + searchText + "%", "%" + searchText + "%" };
		List<Spots> spotsList = jdbcTemplate.query(search, new SpotsMapper(), params);
		return spotsList;
	}

	public List<Reservation> searchReservation(String searchText) {
		String search = "SELECT user_id, reservation_id, number_plate, start_date_time, end_date_time, reservation_status, is_active "
				+ "FROM reservation "
				+ "WHERE user_id = ? OR reservation_id = ? OR number_plate LIKE ? OR start_date_time = ? OR end_date_time = ? OR reservation_status = ? OR is_active = ?";
		Object[] params = { searchText, searchText, "%" + searchText + "%", searchText, searchText, searchText,
				searchText };
		List<Reservation> reservations = jdbcTemplate.query(search, new ReservationMapper(), params);
		return reservations;
	}

	public List<Transaction> searchTransaction(String searchText) {
		String search = "SELECT user_id, transaction_id, reservation_id, price, payment_method, transaction_time, card_number, expiry_date, cvv, payment_status "
				+ "FROM transaction "
				+ "WHERE user_id = ? OR transaction_id = ? OR reservation_id = ? OR price = ? OR payment_method LIKE ? OR transaction_time = ? OR card_number = ? OR expiry_date = ? OR cvv = ? OR payment_status = ?";
		Object[] params = { searchText, searchText, searchText, searchText, "%" + searchText + "%", searchText,
				searchText, searchText, searchText, searchText };
		List<Transaction> transaction = jdbcTemplate.query(search, new TransactionMapper(), params);
		return transaction;
	}

//	public List<String> readSpotNumber(int id) {
//		String query = "SELECT spot_number FROM spots WHERE location_name = ? AND spot_status = true";
//		List<String> spotList = jdbcTemplate.queryForList(query, String.class, id);
//		return spotList;
//	}

	public Spots readSpotNumber(Spots spots) {
		String query = "SELECT spot_number FROM spots WHERE location_name = ? AND spot_status = true";
		Object[] params = { spots.getUserId() };
		jdbcTemplate.queryForList(query, String.class, params);
		return spots;
	}

	public User readUsers(User user) {
		String read = "SELECT user_name, phone_number, email FROM user WHERE user_id = ? and status = 1";
		try {
			Object[] params = { user.getUserId() };
			jdbcTemplate.queryForObject(read, new UserMapper(), params);
			return user;
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

}
