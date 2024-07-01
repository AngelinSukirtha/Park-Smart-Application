package com.chainsys.parksmart.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.chainsys.parksmart.mapper.*;

import com.chainsys.parksmart.model.User;

@Repository
public class UserImpl implements UserDAO {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public boolean userRegistration(User user) {
		String selectQuery = "SELECT user_id, user_name, user_password, phone_number, email FROM user WHERE user_name=? AND user_password=? AND phone_number=? AND email=?";
		List<String> existingUsers = jdbcTemplate.queryForList(selectQuery, String.class, user.getUserName(),
				user.getUserPassword(), user.getPhoneNumber(), user.getEmail());
		if (!existingUsers.isEmpty()) {
			return false;
		}

		String insertQuery = "INSERT INTO user (user_name, user_password, phone_number, email) VALUES (?, ?, ?, ?)";
		Object[] params = { user.getUserName(), user.getUserPassword(), user.getPhoneNumber(), user.getEmail() };
		int rowsAffected = jdbcTemplate.update(insertQuery, params);
		return rowsAffected > 0;
	}

	@Override
	public boolean userLogin(User user) {
		String query = "SELECT COUNT(*) FROM user WHERE email=?";
		int count = jdbcTemplate.queryForObject(query, Integer.class, user.getEmail());
		return count == 1;
	}

	public User getUserById(User user) {
		String query = "SELECT user_id, user_name, user_password, phone_number FROM user WHERE email=?";
		Object[]details= {user.getEmail()};
		User existingUsers = jdbcTemplate.queryForObject(query, details, new UserMapper());
		return existingUsers;
	}

}
