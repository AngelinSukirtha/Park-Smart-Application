package com.chainsys.parksmart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;

import com.chainsys.parksmart.dao.UserDAO;
import com.chainsys.parksmart.model.Spots;

import jakarta.servlet.http.HttpSession;

@Controller
public class SpotsController {

	@Autowired
	UserDAO userDAO;

	@GetMapping("/locationName")
	public String locationName(@RequestParam("locationName") String locationName, HttpSession session) {
		Spots spots = new Spots();
		spots.setLocationName(locationName);
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
		Spots spots = new Spots();
		spots.setAddress(address);
		session.setAttribute("address", address);

		if (address.equals("Mylapore") || address.equals("Velachery") || address.equals("Perungudi")
				|| address.equals("Alanganallur") || address.equals("Kalavasal") || address.equals("Periyar")
				|| address.equals("Jayanagar") || address.equals("Whitefield") || address.equals("Domlur")) {

			List<String> spotList = userDAO.readSpotNumbers(address);
			model.addAttribute("spotList", spotList);
			return "spots.jsp";
		} else {
			return "location.jsp";
		}
	}

	@GetMapping("/spots")
	public String selectedSpots(HttpSession session, String[] selectedSpots,
			@RequestParam("vehicleType") String vehicleType) {
		Spots spots = new Spots();
		spots.setVehicleType(vehicleType);
		session.setAttribute("vehicleType", vehicleType);

		int id = (int) session.getAttribute("userId");
		String locationName = (String) session.getAttribute("locationName");
		String address = (String) session.getAttribute("address");

		for (String spotNumber : selectedSpots) {
			String cleanSpotNumber = spotNumber.substring(2, spotNumber.length() - 2);
			String[] spotNumbers = cleanSpotNumber.split("\",\"");
			for (String spot : spotNumbers) {
				String trimmedSpot = spot.trim().replace("\"", "");
				userDAO.insertSpots(spots, id, locationName, address, vehicleType, trimmedSpot);
				int countSpotNumber = userDAO.countSpotNumber(spots, id);
				spots.setCountSpotNumber(countSpotNumber);
				session.setAttribute("countSpotNumber", countSpotNumber);
			}
		}
		return "reservation.jsp";
	}

}
