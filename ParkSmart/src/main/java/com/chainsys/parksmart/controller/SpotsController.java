package com.chainsys.parksmart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;

import com.chainsys.parksmart.dao.UserDAO;
import com.chainsys.parksmart.dao.UserImpl;
import com.chainsys.parksmart.model.Addresses;
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

	@Autowired
	UserImpl userImpl;

	@GetMapping("/locationName")
	public String handleLocations(Model model, @RequestParam("locationId") int locationId, HttpSession session) {
		session.setAttribute("locationId", locationId);
		List<Addresses> list = userImpl.readAddress(locationId);
		model.addAttribute("list", list);
		return "address.jsp";
	}

	@GetMapping("/address")
	public String address(@RequestParam("address") String address, Model model, HttpSession session) {
		spots.setAddressName(address);
		session.setAttribute("address", address);
		int locationId = (int) session.getAttribute("locationId");
		String locationName = userImpl.getLocationByLocationId(locationId);
		spots.setLocation(locationName);
		List<String> spotList = userDAO.readSpotNumbers(locationName);
		session.setAttribute("spotList", spotList);
		return "spots.jsp";
	}

	@GetMapping("/spots")
	public String selectedSpots(HttpSession session, String[] selectedSpots) {
		int id = (int) session.getAttribute("userId");
		int locationId = (int) session.getAttribute("locationId");
		String locationName = userImpl.getLocationByLocationId(locationId);
		spots.setLocation(locationName);
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
				session.setAttribute("countSpotNumber", countSpotNumber);
			}
		}
		return "reservation.jsp";
	}

}
