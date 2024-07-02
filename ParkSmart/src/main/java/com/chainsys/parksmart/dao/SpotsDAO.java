package com.chainsys.parksmart.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.chainsys.parksmart.mapper.*;
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

	public void updateSpotStatus(Spots spots) {
		String update = "UPDATE spots SET spot_status=? WHERE spot_id = ?";
		Object[] params = { spots.getSpotId(), spots.getSpotStatus() };
		jdbcTemplate.update(update, params);
	}

	public Spots countSpotNumber(Spots spots, int id) {
		String query = "SELECT COUNT(spot_number) FROM spots WHERE user_id = ? and spot_status=1";
		int spotCount = jdbcTemplate.queryForObject(query, Integer.class, id);
		spots.setCountSpotNumber(spotCount);
		return spots;
	}

	public List<Spots> readSpots() {
		String read = "SELECT user_id, spot_id, location_name, address, vehicle_type, spot_number, count_spot_number, spot_status FROM spots";
		List<Spots> spots = jdbcTemplate.query(read, new SpotsMapper());
		return spots;
	}

}
