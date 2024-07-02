package com.chainsys.parksmart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;

import com.chainsys.parksmart.dao.SpotsDAO;
import com.chainsys.parksmart.model.Spots;
import com.chainsys.parksmart.model.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class SpotsController {

	@Autowired
	SpotsDAO spotsDAO;

	@GetMapping("/locationName")
	public String locationName(@RequestParam("locationName") String locationName) {
		Spots spots = new Spots();
		spots.setLocationName(locationName);
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
	public String address(@RequestParam("address") String address, Model model) {
		Spots spots = new Spots();
		spots.setAddress(address);
		if (address.equals("Mylapore") || address.equals("Velachery") || address.equals("Perungudi")
				|| address.equals("Alanganallur") || address.equals("Kalavasal") || address.equals("Periyar")
				|| address.equals("Jayanagar") || address.equals("Whitefield") || address.equals("Domlur")) {

			List<String> spotList = spotsDAO.readSpotNumbers(address);
			model.addAttribute("spotList", spotList);
			return "spots.jsp";
		} else {
			return "location.jsp";
		}
	}

	@GetMapping("/spots")
	public String selectedSpots(HttpSession session, String[] selectedSpots, String vehicleType) {
		Spots spots = new Spots();
		spots.setVehicleType(vehicleType);
		User id = (User) session.getAttribute("userId");
		System.out.println(id);

		for (String spotNumber : selectedSpots) {
			String cleanSpotNumber = spotNumber.substring(2, spotNumber.length() - 2);
			String[] spotNumbers = cleanSpotNumber.split("\",\"");
			for (String spot : spotNumbers) {
				String trimmedSpot = spot.trim().replace("\"", "");
				spotsDAO.insertSpots(spots, id.getUserId(), vehicleType, trimmedSpot);
				spotsDAO.countSpotNumber(spots, id.getUserId());
				int countSpotNumber = spots.getCountSpotNumber();
				spots.setCountSpotNumber(countSpotNumber);
			}
		}
		return "reservation.jsp";
	}

}
