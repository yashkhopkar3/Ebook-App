package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Cart;

public class CartDAOImpl implements CartDAO {
	
	private Connection conn;
	
	public CartDAOImpl(Connection conn) {
	    this.conn = conn;
	}

	@Override
	public boolean addCart(Cart c, int uid, int bid) {
	    boolean isSuccess = false;
	    PreparedStatement ps = null;
	    ResultSet rs = null;

	    try {
	        // Check the copies of the book in the book_dtls table
	        String checkCopiesQuery = "SELECT copies FROM book_dtls WHERE bookId = ?";
	        ps = conn.prepareStatement(checkCopiesQuery);
	        ps.setInt(1, bid);
	        rs = ps.executeQuery();

	        if (rs.next()) {
	            int availableCopies = rs.getInt("copies");

	            if (availableCopies > 0) {
	                // Check if the item already exists in the cart
	                String checkQuery = "SELECT copies FROM cart WHERE uid = ? AND bid = ?";
	                ps = conn.prepareStatement(checkQuery);
	                ps.setInt(1, uid);
	                ps.setInt(2, bid);
	                rs = ps.executeQuery();

	                if (rs.next()) {
	                    // Update the existing record
	                    int existingCopies = rs.getInt("copies");
	                    int newCopies = existingCopies + 1; // Add 1 copy
	                    double newTotalPrice = c.getPrice() * newCopies;

	                    String updateQuery = "UPDATE cart SET copies = ?, total_price = ? WHERE uid = ? AND bid = ?";
	                    ps = conn.prepareStatement(updateQuery);
	                    ps.setInt(1, newCopies);
	                    ps.setDouble(2, newTotalPrice);
	                    ps.setInt(3, uid);
	                    ps.setInt(4, bid);

	                    int rowsUpdated = ps.executeUpdate();
	                    isSuccess = rowsUpdated > 0;
	                } else {
	                    // Insert a new record
	                    String insertQuery = "INSERT INTO cart (bid, uid, bookName, author, price, total_price, copies) VALUES (?, ?, ?, ?, ?, ?, ?)";
	                    ps = conn.prepareStatement(insertQuery);
	                    ps.setInt(1, c.getBid());
	                    ps.setInt(2, c.getUid());
	                    ps.setString(3, c.getBookName());
	                    ps.setString(4, c.getAuthor());
	                    ps.setDouble(5, c.getPrice());
	                    ps.setDouble(6, c.getTotalPrice());
	                    ps.setInt(7, 1); // Start with 1 copy for a new cart item

	                    int rowsAffected = ps.executeUpdate();
	                    isSuccess = rowsAffected > 0;
	                }
	            } else {
	            	return false;
	            }
	        }
	    } catch (SQLException e) {
	        // Handle SQL exception
	        e.printStackTrace();
	    } finally {
	        // Ensure resources are closed
	        try {
	            if (rs != null) rs.close();
	            if (ps != null) ps.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
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
	            item.setCopies(rs.getInt("copies"));
	            cartItems.add(item);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return cartItems;
	}

	@Override
    public boolean updateCartQuantity(int cid, int uid, int quantityChange) {
        boolean isSuccess = false;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Fetch the current quantity and price
            String selectQuery = "SELECT price, copies FROM cart WHERE cid = ? AND uid = ?";
            ps = conn.prepareStatement(selectQuery);
            ps.setInt(1, cid);
            ps.setInt(2, uid);
            rs = ps.executeQuery();

            if (rs.next()) {
                double price = rs.getDouble("price");
                int currentCopies = rs.getInt("copies");

                int newCopies = currentCopies + quantityChange;

                // Ensure quantity does not go below 1
                if (newCopies < 1) {
                    newCopies = 1;
                }

                double newTotalPrice = price * newCopies;

                // Update the cart item
                String updateQuery = "UPDATE cart SET copies = ?, total_price = ? WHERE cid = ? AND uid = ?";
                ps = conn.prepareStatement(updateQuery);
                ps.setInt(1, newCopies);
                ps.setDouble(2, newTotalPrice);
                ps.setInt(3, cid);
                ps.setInt(4, uid);

                int rowsUpdated = ps.executeUpdate();
                isSuccess = rowsUpdated > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Ensure resources are closed
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return isSuccess;
    }

	@Override
	public boolean RemoveCart(int cid, int uid) {
	    String query = "DELETE FROM cart WHERE cid = ? and uid = ?";
	    try (PreparedStatement pstmt = conn.prepareStatement(query)) {
	        pstmt.setInt(1, cid);
	        pstmt.setInt(2, uid);
	        int rowsAffected = pstmt.executeUpdate();
	        return rowsAffected > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	}
}
