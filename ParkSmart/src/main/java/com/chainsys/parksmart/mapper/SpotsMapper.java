package com.chainsys.parksmart.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.chainsys.parksmart.model.Spots;

@Repository
public class SpotsMapper implements RowMapper<Spots> {

	@Override
	public Spots mapRow(ResultSet rs, int rowNum) throws SQLException {
		Spots spots = new Spots();
		spots.setUserId(rs.getInt("user_id"));
		spots.setSpotId(rs.getInt("spot_id"));
		spots.setLocationName(rs.getString("location_name"));
		spots.setAddress(rs.getString("address"));
		spots.setVehicleType(rs.getString("vehicle_type"));
		spots.setSpotNumber(rs.getString("spot_number"));
//		spots.setCountSpotNumber(rs.getInt("count_spot_number"));
		spots.setSpotStatus(rs.getBoolean("spot_status"));
		spots.setSpotNumber(rs.getString("spot_number"));
		return spots;
	}

}
