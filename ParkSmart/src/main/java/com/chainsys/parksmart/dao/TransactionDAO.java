package com.chainsys.parksmart.dao;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.chainsys.parksmart.model.*;
import com.chainsys.parksmart.mapper.*;

@Repository
public class TransactionDAO {
	@Autowired
	JdbcTemplate jdbcTemplate;

	public void insertTransaction(Reservation reservation, Transaction transaction, Spots spots, int id) {
		String query = "INSERT INTO transaction (user_id, reservation_id, price, payment_method, transaction_time, card_number, expiry_date, cvv, payment_status) VALUES (?, ?, ?, '', ?, ?, ?, ?, '')";

		LocalDateTime start = parseDateTime(reservation.getStartDateTime());
		LocalDateTime end = parseDateTime(reservation.getEndDateTime());
		int price = 0;

		if (start != null && end != null) {
			price = calculatePrice(spots.getVehicleType(), start, end);
		}

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String transactionTimeFormatted = LocalDateTime.now().format(formatter);

		Object[] params = { transaction.getUserId(), transaction.getReservationId(), transaction.getPrice(),
				transaction.getPaymentMethod(), transaction.getTransactionTime(), transaction.getCardNumber(),
				transaction.getExpiryDate(), transaction.getCvv(), transaction.getPaymentStatus() };
		jdbcTemplate.update(query, params);
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

	public List<Reservation> readReservation() {
		String read = "SELECT user_id, reservation_id, number_plate, start_date_time, end_date_time, reservation_status, is_active FROM reservation";
		List<Reservation> reservation = jdbcTemplate.query(read, new ReservationMapper());
		return reservation;
	}

	public void addPaymentMethod(Transaction transaction, int id, String paymentMethod) {
		String update = "UPDATE transaction SET payment_method = ?, payment_status='paid' WHERE user_id = ? and transaction_id=?";
		Object[] params = { paymentMethod, id, transaction.getTransactionId() };
		jdbcTemplate.update(update, params);
	}

	public List<Transaction> readTransaction() {
		String read = "SELECT user_id, reservation_id, transaction_id, price, payment_method, transaction_time, card_number, expiry_date, cvv FROM transaction";
		List<Transaction> transaction = jdbcTemplate.query(read, new TransactionMapper());
		return transaction;
	}

	public Transaction readTransactions(Transaction transaction, int id) {
		String read = "SELECT price, transaction_time FROM transaction WHERE user_id=?";
		jdbcTemplate.query(read, new TransactionMapper());
		return transaction;
	}

}
