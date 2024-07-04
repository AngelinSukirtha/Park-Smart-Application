package com.chainsys.parksmart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.parksmart.dao.UserDAO;
import com.chainsys.parksmart.model.Reservation;
import com.chainsys.parksmart.model.Spots;
import com.chainsys.parksmart.model.Transaction;
import com.chainsys.parksmart.model.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class ReservationController {

	@Autowired
	UserDAO userDAO;

	@GetMapping("/reservation")
	public String handleReservation(HttpSession session, @RequestParam("numberPlate") String numberPlate,
			@RequestParam("startDateTime") String startDateTime, @RequestParam("endDateTime") String endDateTime,
			Spots spots, Model model) {
		int id = (int) session.getAttribute("userId");
		spots.getCountSpotNumber();
		Reservation reservation = new Reservation();
		reservation.setNumberPlate(numberPlate);
		System.out.println(reservation.getNumberPlate());
		reservation.setStartDateTime(startDateTime);
		System.out.println(reservation.getStartDateTime());
		reservation.setEndDateTime(endDateTime);
		System.out.println(reservation.getEndDateTime());

		Transaction transaction = new Transaction();

		userDAO.insertReservation(reservation, id);
		userDAO.readReservation(reservation);
		int reservationId = reservation.getReservationId();
		transaction.setReservationId(reservationId);

		int userReservationId = userDAO.getReservationByReservationId(id);
		System.out.println("userReservationId" + userReservationId);
		session.setAttribute("reservationId", userReservationId);

		return "transaction.jsp";
	}

}
