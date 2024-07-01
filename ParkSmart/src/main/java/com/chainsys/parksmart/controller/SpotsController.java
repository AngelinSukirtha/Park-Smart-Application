package com.chainsys.parksmart.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.parksmart.dao.SpotsDAO;
import com.chainsys.parksmart.model.Spots;

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

//	@GetMapping("/address")
//	public String address(@RequestParam("address") String address) throws SQLException {
//		Spots spots = new Spots();
//		spots.setAddress(address);
//		if (address.equals("Mylapore") || address.equals("Velachery") || address.equals("Perungudi")
//				|| address.equals("Alanganallur") || address.equals("Kalavasal") || address.equals("Periyar")
//				|| address.equals("Jayanagar") || address.equals("Whitefield") || address.equals("Domlur")) {
//
//			spotsDAO.readSpotNumbers(spots);
//
//			return "spots.jsp";
//		} else {
//			return "location.jsp";
//		}
//	}

	@GetMapping("/address")
	public String address(@RequestParam("address") String address) throws SQLException {
		Spots spots = new Spots();
		spots.setAddress(address);
		if (address.equals("Mylapore") || address.equals("Velachery") || address.equals("Perungudi")
				|| address.equals("Alanganallur") || address.equals("Kalavasal") || address.equals("Periyar")
				|| address.equals("Jayanagar") || address.equals("Whitefield") || address.equals("Domlur")) {

			List<String> spotList = spotsDAO.readSpotNumbers(address);
			return "spots.jsp";
		} else {
			return "location.jsp";
		}
	}

}
