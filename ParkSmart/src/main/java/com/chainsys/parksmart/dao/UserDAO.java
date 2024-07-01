package com.chainsys.parksmart.dao;

import org.springframework.stereotype.Repository;

import com.chainsys.parksmart.model.User;

@Repository
public interface UserDAO {
	public boolean userRegistration(User user);
	public boolean userLogin(User user);
	public User getUserById(User user);

}
