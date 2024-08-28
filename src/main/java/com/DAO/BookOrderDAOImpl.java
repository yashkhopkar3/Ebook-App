package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Book_order;

public class BookOrderDAOImpl implements BookOrderDAO {

    private Connection conn;

    public BookOrderDAOImpl(Connection connection) {
        super();
        this.conn = connection;  // Corrected to use the parameter passed in the constructor
    }


    @Override
    public boolean saveOrder(List<Book_order> b) {
        boolean f = false;
        try {
            if (conn != null && b != null) {  // Null check for both connection and list
                String sql = "insert into book_order(order_id, user_name, email, address, phone, book_name, author, price, payment, copies) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                conn.setAutoCommit(false);
                PreparedStatement ps = conn.prepareStatement(sql);

                for (Book_order blist : b) {
                    if (blist != null) {  // Null check for each Book_order object in the list
                        ps.setString(1, blist.getOrderId());
                        ps.setString(2, blist.getUserName());
                        ps.setString(3, blist.getEmail());
                        ps.setString(4, blist.getFulladd());
                        ps.setString(5, blist.getPhno());
                        ps.setString(6, blist.getBookName());
                        ps.setString(7, blist.getAuthor());
                        ps.setString(8, blist.getPrice());
                        ps.setString(9, blist.getPaymentType());
                        ps.setInt(10, blist.getCopies());
                        ps.addBatch();
                    }
                }
                //System.out.println("Inserting book order: " + b.toString());

                int[] count = ps.executeBatch();
                conn.commit();
                f = true;
                conn.setAutoCommit(true);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    public List<Book_order> getOrdersByEmail(String email) {
        List<Book_order> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM book_order WHERE email=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Book_order order = new Book_order();
                order.setOrderId(rs.getString("order_id"));
                order.setUserName(rs.getString("user_name"));
                order.setAuthor(rs.getString("author"));
                order.setBookName(rs.getString("book_name"));
                order.setPrice(rs.getString("price"));
                order.setPaymentType(rs.getString("payment"));
                order.setCopies(rs.getInt("copies"));
                list.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Book_order> getOrdersAll() {
        List<Book_order> list = new ArrayList<>();
        Book_order order = null;

        try {
            String query = "SELECT order_id, user_name, email, address, phone, book_name, author, price, payment, copies FROM book_order";
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                order = new Book_order();
                order.setOrderId(rs.getString("order_id"));
                order.setUserName(rs.getString("user_name"));
                order.setEmail(rs.getString("email"));
                order.setFulladd(rs.getString("address")); // Set full address
                order.setPhno(rs.getString("phone")); // Set phone number
                order.setBookName(rs.getString("book_name"));
                order.setAuthor(rs.getString("author"));
                order.setPrice(rs.getString("price"));
                order.setPaymentType(rs.getString("payment"));
                order.setCopies(rs.getInt("copies"));

                list.add(order);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    
    public boolean isOrderIdExists(String orderId) {
        boolean exists = false;
        try {
            String query = "SELECT 1 FROM book_order WHERE order_id = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, orderId);
            ResultSet rs = pstmt.executeQuery();
            exists = rs.next();
            rs.close();
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return exists;
    }

}