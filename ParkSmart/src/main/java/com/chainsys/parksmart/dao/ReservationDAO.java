package com.chainsys.parksmart.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.chainsys.parksmart.model.Reservation;
import com.chainsys.parksmart.model.Transaction;
import com.chainsys.parksmart.mapper.*;

@Repository
public class ReservationDAO {
	@Autowired
	JdbcTemplate jdbcTemplate;

	public void insertReservation(Reservation reservation, int id) {
		String query = "INSERT INTO reservation (user_id, reservation_id, number_plate, start_date_time, end_date_time, reservation_status, is_active) VALUES (?, ?, ?, ?, ?, ?, ?)";
		Object[] params = { reservation.getUserId(), reservation.getReservationId(), reservation.getNumberPlate(),
				reservation.getStartDateTime(), reservation.getEndDateTime(), reservation.getReservationStatus(),
				reservation.getIsActive() };
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
		String update = "UPDATE Reservations SET is_active=? WHERE reservation_id = ?";
		Object[] params = { reservation.getIsActive(), reservation.getReservationId() };
		jdbcTemplate.update(update, params);
	}

	public Reservation readReservation(Reservation reservation, int id) {
		String read = "SELECT reservation_id FROM reservation WHERE user_id=? and is_active=true";
		jdbcTemplate.query(read, new ReservationMapper());
		return reservation;
	}

}
