package com.chainsys.parksmart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.parksmart.dao.ReservationDAO;
import com.chainsys.parksmart.dao.TransactionDAO;
import com.chainsys.parksmart.model.Reservation;
import com.chainsys.parksmart.model.Spots;
import com.chainsys.parksmart.model.Transaction;

@Controller
public class ReservationController {

	@Autowired
	ReservationDAO reservationDAO;

	@GetMapping("/reservation")
	public String handleReservation(@RequestParam("numberPlate") String numberPlate,
			@RequestParam("startDateTime") String startDateTime, @RequestParam("endDateTime") String endDateTime,
			int id, Spots spots, Model model) {
		spots.getCountSpotNumber();
		Reservation reservation = new Reservation();
		Transaction transaction = new Transaction();
		TransactionDAO transactionDAO = new TransactionDAO();

		reservationDAO.insertReservation(reservation, id);
		reservationDAO.readReservation(reservation, id);
		int reservationId = reservation.getReservationId();
		transaction.setReservationId(reservationId);

		transactionDAO.insertTransaction(reservation, transaction, spots, id);
		transactionDAO.readTransactions(transaction, id);
		int price = transaction.getPrice();
		String transactionTime = transaction.getTransactionTime();

		model.addAttribute("price", price);
		model.addAttribute("transactionTime", transactionTime);
		return "transaction.jsp";
	}

}
