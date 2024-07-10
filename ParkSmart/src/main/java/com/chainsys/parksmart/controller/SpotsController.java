package com.chainsys.parksmart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;

import com.chainsys.parksmart.dao.UserDAO;
import com.chainsys.parksmart.model.Spots;
import com.chainsys.parksmart.validation.Validation;

import jakarta.servlet.http.HttpSession;

@Controller
public class SpotsController {

	@Autowired
	UserDAO userDAO;

	@Autowired
	Spots spots;

	@Autowired
	Validation validation;

	@GetMapping("/locationName")
	public String locationName(@RequestParam("locationName") String locationName, HttpSession session) {
		spots.setLocationName(locationName);

		if (!validation.validateLocationName(locationName)) {
			return "location.jsp";
		}

		session.setAttribute("locationName", locationName);
		switch (locationName) {
		case "Chennai":
			return "addressChennai.jsp";
		case "Madurai":
			return "addressMadurai.jsp";
		case "Bangalore":
			return "addressBangalore.jsp";
		default:
			return "index.jsp";
		}
	}

	@GetMapping("/address")
	public String address(@RequestParam("address") String address, Model model, HttpSession session) {
		spots.setAddress(address);

		if (!validation.validateAddress(address)) {
			return "location.jsp";
		}

		session.setAttribute("address", address);
		String locationName = (String) session.getAttribute("locationName");

		if (address.equals("Mylapore") || address.equals("Velachery") || address.equals("Perungudi")
				|| address.equals("Alanganallur") || address.equals("Kalavasal") || address.equals("Periyar")
				|| address.equals("Jayanagar") || address.equals("Whitefield") || address.equals("Domlur")) {

			List<String> spotList = userDAO.readSpotNumbers(locationName);
			session.setAttribute("spotList", spotList);
			return "spots.jsp";
		} else {
			return "location.jsp";
		}

	}

	@GetMapping("/spots")
	public String selectedSpots(HttpSession session, String[] selectedSpots) {
		int id = (int) session.getAttribute("userId");
		String locationName = (String) session.getAttribute("locationName");
		String address = (String) session.getAttribute("address");

		for (String spotNumber : selectedSpots) {
			String cleanSpotNumber = spotNumber.substring(1, spotNumber.length() - 1);
			String[] spotNumbers = cleanSpotNumber.split("\",\"");
			for (String spot : spotNumbers) {
				String trimmedSpot = spot.trim().replace("\"", "");

				String vehicleType;
				if (trimmedSpot.startsWith("C")) {
					vehicleType = "Car";
				} else if (trimmedSpot.startsWith("B")) {
					vehicleType = "Bike";
				} else if (trimmedSpot.startsWith("T")) {
					vehicleType = "Truck";
				} else {
					return "location.jsp";
				}

				if (!validation.validateVehicleType(vehicleType)) {
					return "location.jsp";
				}

				spots.setVehicleType(vehicleType);
				session.setAttribute("vehicleType", vehicleType);

				userDAO.insertSpots(spots, id, locationName, address, vehicleType, trimmedSpot);

				int countSpotNumber = userDAO.countSpotNumber(spots, id);
				spots.setCountSpotNumber(countSpotNumber);
				System.out.println(countSpotNumber);
				session.setAttribute("countSpotNumber", countSpotNumber);
			}
		}
		return "reservation.jsp";
	}

}
