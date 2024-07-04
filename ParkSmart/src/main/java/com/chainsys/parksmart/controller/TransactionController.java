package com.chainsys.parksmart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.chainsys.parksmart.dao.UserDAO;
import com.chainsys.parksmart.model.Reservation;
import com.chainsys.parksmart.model.Transaction;

import jakarta.servlet.http.HttpSession;

@Controller
public class TransactionController {

	@Autowired
	UserDAO userDAO;

	@GetMapping("/transaction")
	public String handleTransaction(HttpSession session, Model model) {
		System.out.println("transaction");
		int id = (int) session.getAttribute("userId");

		Reservation reservation = new Reservation();
		Transaction transaction = new Transaction();

		String vehicleType = (String) session.getAttribute("vehicleType");
		System.out.println(vehicleType);

		int reservationId = (int) session.getAttribute("reservationId");
		System.out.println(reservationId);

		userDAO.insertTransaction(reservation, transaction, vehicleType, reservationId, id);
		userDAO.readTransactions(transaction);
		int price = transaction.getPrice();
		String transactionTime = transaction.getTransactionTime();

		model.addAttribute("price", price);
		model.addAttribute("transactionTime", transactionTime);
		return "payment.jsp";
	}

}
