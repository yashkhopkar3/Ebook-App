package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpSession;

import com.entity.User;

public class UserDAOImpl implements UserDAO {

	@Override
	public User login(String email, String password) {
		// TODO Auto-generated method stub
		User us = null;
		try {
			String sql ="select * from user where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				us = new User();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhno(rs.getString(4));
				us.setPassword(rs.getString(5));
				us.setAddress(rs.getString(6));
				us.setLandmark(rs.getString(7));
				us.setCity(rs.getString(8));
				us.setState(rs.getString(9));
				us.setPincode(rs.getString(10));
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return us;
	}

	private Connection conn;

	public UserDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean userRegister(User us) {
		
		boolean f=false;
		
		try {
			String sql= "insert into user(name,email,phno,password) values(?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,us.getName());
			ps.setString(2,us.getEmail());
			ps.setString(3,us.getPhno());
			ps.setString(4,us.getPassword());
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public boolean userExists(String email) {
	    boolean exists = false;
	    try {
	        String query = "SELECT * FROM user WHERE email=?";
	        PreparedStatement pstmt = conn.prepareStatement(query);
	        pstmt.setString(1, email);
	        ResultSet rs = pstmt.executeQuery();
	        if (rs.next()) {
	            exists = true;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return exists;
	}

	@Override
	public boolean checkPassword(int id, String ps) {
		boolean f = false;
		try {
		String sql = "select * from user where id=? and password=?";
		PreparedStatement pst = conn.prepareStatement(sql); pst.setInt(1, id);
		pst.setString(2, ps);
		ResultSet rs = pst.executeQuery();
		while (rs.next()) {
		f=true;
		}
		} catch (Exception e) {
		e.printStackTrace();
		}
		return f;
		}

	@Override
	public User updateProfile(User us, HttpSession session) {
	    boolean f = false;
	    try {
	        String sql = "UPDATE user SET name = ?, email = ?, phno = ? WHERE id = ?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1, us.getName());
	        ps.setString(2, us.getEmail());
	        ps.setString(3, us.getPhno());
	        ps.setInt(4, us.getId());
	        int i = ps.executeUpdate();
	        
	        if (i == 1) {
	            // Update the session attribute with the updated user information
	            session.setAttribute("userobj", us);
	            f = true;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return f ? us : null;
	}

	@Override
	public boolean updateUserDetails(User us) {
		boolean isUpdated = false;
        try {
            String sql = "UPDATE user SET name = ?, email = ?, phno = ?, address = ?, landmark = ?, city = ?, state = ?, pincode = ? WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, us.getName());
            ps.setString(2, us.getEmail());
            ps.setString(3, us.getPhno());
            ps.setString(4, us.getAddress());
            ps.setString(5, us.getLandmark());
            ps.setString(6, us.getCity());
            ps.setString(7, us.getState());
            ps.setString(8, us.getPincode());
            ps.setInt(9, us.getId());

            int i = ps.executeUpdate();
            if (i == 1) {
                isUpdated = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isUpdated;
	}

	public User adminLogin(String email, String password) {
		User user = null;
        try {
            String query = "SELECT * FROM admin WHERE email=? AND password=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("admin_id"));
                user.setName(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));            
                }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
	}
}