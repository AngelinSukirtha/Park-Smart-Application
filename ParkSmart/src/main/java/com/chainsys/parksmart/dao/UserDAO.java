package com.chainsys.parksmart.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.chainsys.parksmart.model.Reservation;
import com.chainsys.parksmart.model.Spots;
import com.chainsys.parksmart.model.Transaction;
import com.chainsys.parksmart.model.User;

@Repository
public interface UserDAO {
	public boolean userRegistration(User user);

	public boolean userLogin(User user);

	public Integer getUserById(User user);

	public void insertSpots(Spots spots, int id, String locationName, String address, String vehicleType,
			String spotNumber);

	public List<String> readSpotNumbers(String locationName);

	public void updateSpotStatus(Spots spots);

	public int countSpotNumber(Spots spots, int id);

	public List<Spots> readSpots();

	public void insertReservation(Reservation reservation, int id);

	public List<Reservation> readReservation();

	public void updateReservationStatus(Reservation reservation);

	public void updateIsActive(Reservation reservation);

	public List<Reservation> readReservation(Reservation reservation);

	public void insertTransaction(Reservation reservation, Transaction transaction, String vehicleType,
			int reservationId, int id);

	public void addPaymentMethod(Transaction transaction, int id, String paymentMethod);

	public List<Transaction> readTransaction();

	public Transaction readTransactions(Transaction transaction);

	public int getReservationByReservationId(int id);
}
