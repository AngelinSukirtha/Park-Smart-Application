package com.chainsys.parksmart.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.chainsys.parksmart.model.Spots;

@Repository
public class SpotsDAO {

	@Autowired
	JdbcTemplate jdbcTemplate;

	public void insertSpots(Spots spots, int id, String vehicleType, String spotNumber) {
		String query = "INSERT INTO spots (user_id, location_name, address, vehicle_type, spot_number, spot_status) VALUES (?, ?, ?, ?, ?, ?)";
		Object[] params = { spots.getUserId(), spots.getLocationName(), spots.getAddress(), spots.getVehicleType(),
				spots.getSpotNumber() };
		jdbcTemplate.update(query, params);
	}

	public List<String> readSpotNumbers(String locationName) {
		List<String> spotList = new ArrayList<>();
		String query = "SELECT spot_number FROM spots WHERE location_name = ? AND spot_status = true";
		spotList = jdbcTemplate.queryForList(query, String.class, locationName);
		return spotList;
	}

}
