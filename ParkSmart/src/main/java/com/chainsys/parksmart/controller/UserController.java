package com.chainsys.parksmart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.parksmart.dao.UserDAO;
import com.chainsys.parksmart.model.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	@Autowired
	UserDAO userDAO;

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
		User user = new User();
		user.setUserName(userName);
		user.setUserPassword(userPassword);
		user.setPhoneNumber(phoneNumber);
		user.setEmail(email);
		userDAO.userRegistration(user);
		return "userLogin.jsp";
	}

	@GetMapping("/login")
	public String userLogin(@RequestParam("email") String email, HttpSession session) {
		User user = new User();
		user.setEmail(email);

		boolean loginSuccessful = userDAO.userLogin(user);
		if (loginSuccessful) {
			User userId = userDAO.getUserById(user);
//			id.setEmail(email);
			session.setAttribute("userId", userId);
			return "location.jsp";
		} else {
			return "userRegister.jsp";
		}
	}

}
