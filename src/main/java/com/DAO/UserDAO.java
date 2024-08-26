package com.DAO;

import javax.servlet.http.HttpSession;

import com.entity.User;

public interface UserDAO {

	public boolean userRegister(User us);
	
	public User login(String email , String password);
	
	public boolean checkPassword(int id, String ps);
	
	public User updateProfile(User us, HttpSession session);
	
	public boolean updateUserDetails(User user);
	
	
}