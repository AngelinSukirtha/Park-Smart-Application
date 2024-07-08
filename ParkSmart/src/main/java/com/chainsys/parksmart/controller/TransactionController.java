package com.chainsys.parksmart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.parksmart.dao.UserDAO;
import com.chainsys.parksmart.model.Spots;
import com.chainsys.parksmart.model.Transaction;
import com.chainsys.parksmart.model.User;
import com.chainsys.parksmart.validation.Validation;

import jakarta.servlet.http.HttpSession;

@Controller
public class TransactionController {

	@Autowired
	UserDAO userDAO;

	@Autowired
	User user;

	@Autowired
	Transaction transaction;

	@Autowired
	Validation validation;

	@Autowired
	Spots spots;

	@GetMapping("/transaction")
	public String handleTransaction(HttpSession session, Model model) {
		int id = (int) session.getAttribute("userId");

		String vehicleType = (String) session.getAttribute("vehicleType");

		int reservationId = (int) session.getAttribute("reservationId");

		String startDateTime = (String) session.getAttribute("startDateTime");
		String endDateTime = (String) session.getAttribute("endDateTime");

		if (!validation.validateVehicleType(vehicleType)) {
			return "transaction.jsp";
		}

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
		transaction.setPaymentMethod(paymentMethod);

		if (!validation.validatePaymentMethod(paymentMethod)) {
			return "transaction.jsp";
		}

		int id = (int) session.getAttribute("userId");
		userDAO.addPaymentMethod(transaction, id, paymentMethod);
		return "payment.jsp";
	}

	@GetMapping("/payment")
	public String handlePayment(HttpSession session, Model model, @RequestParam("cardNumber") String cardNumber,
			@RequestParam("expiryDate") String expiryDate, @RequestParam("cvv") String cvv) {
		transaction.setCardNumber(cardNumber);
		transaction.setExpiryDate(expiryDate);
		transaction.setCvv(cvv);

		int reservationId = (int) session.getAttribute("reservationId");

		if (!validation.validateCardNumber(cardNumber) || !validation.validateExpiryDate(expiryDate)
				|| !validation.validateCvv(cvv)) {
			return "payment.jsp";
		}

		userDAO.updateTransaction(transaction, reservationId);
		userDAO.readTransactions(transaction);

		return "/transactionConfirmation";
	}

	@GetMapping("/transactionConfirmation")
	public String handleTransactionConfirmation(HttpSession session, Model model) {
		int id = (int) session.getAttribute("userId");
		System.out.println(id);

		userDAO.readTransactions(transaction);
		int price = transaction.getPrice();
		System.out.println(price);
		String transactionTime = transaction.getTransactionTime();
		System.out.println(transactionTime);
		userDAO.readSpotNumber(spots);
		String spotNumber = spots.getSpotNumber();
		System.out.println(spotNumber);
		userDAO.readUsers(user);
		String userName = user.getUserName();
		String phoneNumber = user.getPhoneNumber();
		String email = user.getEmail();
		System.out.println(userName);
		System.out.println(phoneNumber);
		System.out.println(email);

		model.addAttribute("userName", userName);
		model.addAttribute("phoneNumber", phoneNumber);
		model.addAttribute("email", email);
		model.addAttribute("price", price);
		model.addAttribute("transactionTime", transactionTime);
		model.addAttribute("spotNumber", spotNumber);

		return "transactionConfirmation.jsp";

	}

}
