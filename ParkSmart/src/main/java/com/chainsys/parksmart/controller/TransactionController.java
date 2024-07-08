package com.chainsys.parksmart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.parksmart.dao.UserDAO;
import com.chainsys.parksmart.model.Transaction;

import jakarta.servlet.http.HttpSession;

@Controller
public class TransactionController {

	@Autowired
	UserDAO userDAO;

	@GetMapping("/transaction")
	public String handleTransaction(HttpSession session, Model model) {

		Transaction transaction = new Transaction();

		int id = (int) session.getAttribute("userId");

		String vehicleType = (String) session.getAttribute("vehicleType");

		int reservationId = (int) session.getAttribute("reservationId");

		String startDateTime = (String) session.getAttribute("startDateTime");
		String endDateTime = (String) session.getAttribute("endDateTime");

		userDAO.getPrice(transaction, vehicleType, startDateTime, endDateTime);
		int price = transaction.getPrice();

		userDAO.getCurrentTransactionTimeFormatted(transaction);
		String transactionTime = transaction.getTransactionTime();

		model.addAttribute("price", price);
		model.addAttribute("transactionTime", transactionTime);

		userDAO.insertTransaction(reservationId, id, price, transactionTime);
		userDAO.readTransactions(transaction);
		return "transaction.jsp";
	}

	@GetMapping("/pay")
	public String handlePay(HttpSession session, @RequestParam("paymentMethod") String paymentMethod) {
		Transaction transaction = new Transaction();
		transaction.setPaymentMethod(paymentMethod);

		int id = (int) session.getAttribute("userId");
		userDAO.addPaymentMethod(transaction, id, paymentMethod);
		return "payment.jsp";
	}

	@GetMapping("/payment")
	public String handlePayment(HttpSession session, Model model, @RequestParam("cardNumber") String cardNumber,
			@RequestParam("expiryDate") String expiryDate, @RequestParam("cvv") String cvv) {

		Transaction transaction = new Transaction();

		transaction.setCardNumber(cardNumber);
		transaction.setExpiryDate(expiryDate);
		transaction.setCvv(cvv);

		int reservationId = (int) session.getAttribute("reservationId");

		userDAO.updateTransaction(transaction, reservationId);
		userDAO.readTransactions(transaction);

		return "transactionConfirmation.jsp";
	}

}
