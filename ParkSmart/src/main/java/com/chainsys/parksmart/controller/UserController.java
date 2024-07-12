package com.chainsys.parksmart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.parksmart.dao.UserDAO;
import com.chainsys.parksmart.dao.UserImpl;
import com.chainsys.parksmart.model.Locations;
import com.chainsys.parksmart.model.User;
import com.chainsys.parksmart.validation.Validation;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	@Autowired
	User user;

	@Autowired
	UserDAO userDAO;

	@Autowired
	Validation validation;

	@Autowired
	UserImpl userImpl;

	@RequestMapping("/")
	public String home() {
		return "index.jsp";
	}

	@RequestMapping("/about")
	public String about() {
		return "aboutUs.jsp";
	}

	@RequestMapping("/price")
	public String price() {
		return "aboutUs.jsp";
	}

	@GetMapping("/register")
	public String saveUser(@RequestParam("userName") String userName, @RequestParam("userPassword") String userPassword,
			@RequestParam("phoneNumber") String phoneNumber, @RequestParam("email") String email) {

		if (!validation.validateUserName(userName) || !validation.validateUserPassword(userPassword)
				|| !validation.validatePhoneNumber(phoneNumber) || !validation.validateEmail(email)) {

			return "userRegister.jsp";
		}

		user.setUserName(userName);
		user.setUserPassword(userPassword);
		user.setPhoneNumber(phoneNumber);
		user.setEmail(email);
		userDAO.userRegistration(user);
		return "userLogin.jsp";
	}

	@GetMapping("/login")
	public String userLogin(@RequestParam("email") String email, HttpSession session,
			@RequestParam("userPassword") String userPassword, Model model) {

		if (!validation.validateEmail(email) || !validation.validateUserPassword(userPassword)) {
			return "userLogin.jsp";
		}

		user.setEmail(email);

		if (email.equals("angelin@parkingspot.com") && userPassword.equals("Angelin1")) {
			return "admin.jsp";
		} else {
			boolean loginSuccessful = userDAO.userLogin(user);
			if (loginSuccessful) {
				int userId = userDAO.getUserById(user);
				session.setAttribute("userId", userId);
				List<Locations> list = userImpl.readLocations();
				model.addAttribute("list", list);
				return "location.jsp";
			} else {
				return "userRegister.jsp";
			}
		}
	}

}