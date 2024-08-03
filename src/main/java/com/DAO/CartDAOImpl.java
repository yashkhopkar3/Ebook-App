package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Cart;

public class CartDAOImpl implements CartDAO {
	
	private Connection conn;
	
	public CartDAOImpl(Connection conn) {
	    this.conn = conn;
	}

	@Override
	public boolean addCart(Cart c) {
		boolean isSuccess = false;

            
            try {
            	String query = "INSERT INTO cart (bid, uid, bookName, author, price, total_price) VALUES (?, ?, ?, ?, ?, ?)";
            	PreparedStatement ps = conn.prepareStatement(query);
                ps.setInt(1, c.getBid());
                ps.setInt(2, c.getUid());
                ps.setString(3, c.getBookName());
                ps.setString(4, c.getAuthor());
                ps.setDouble(5, c.getPrice());
                ps.setDouble(6, c.getTotalPrice());

                int rowsAffected = ps.executeUpdate();
                isSuccess = rowsAffected > 0;
            }
         catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
	}

	@Override
	public List<Cart> getCartItems(int uid) {
		  List<Cart> cartItems = new ArrayList<>();
	        try {
	         String query = "SELECT * FROM cart WHERE uid = ?";
	            PreparedStatement pstmt = conn.prepareStatement(query);
	            pstmt.setInt(1, uid);
	            ResultSet rs = pstmt.executeQuery();

	            while (rs.next()) {
	                Cart item = new Cart();
	                item.setCid(rs.getInt("cid"));
	                item.setBid(rs.getInt("bid"));
	                item.setUid(rs.getInt("uid"));
	                item.setBookName(rs.getString("bookName"));
	                item.setAuthor(rs.getString("author"));
	                item.setPrice(rs.getDouble("price"));
	                item.setTotalPrice(rs.getDouble("total_price"));
	                cartItems.add(item);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return cartItems;
	}

}
