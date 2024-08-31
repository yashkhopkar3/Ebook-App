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
        this.conn = connection;
    }

    @Override
    public boolean saveOrder(List<Book_order> b) {
        boolean f = false;
        try {
            if (conn != null && b != null) {
                String sql = "INSERT INTO book_order(order_id, user_name, email, address, phone, book_id, book_name, author, price, payment, copies) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                conn.setAutoCommit(false);
                PreparedStatement ps = conn.prepareStatement(sql);

                for (Book_order blist : b) {
                    if (blist != null) {
                        ps.setString(1, blist.getOrderId());
                        ps.setString(2, blist.getUserName());
                        ps.setString(3, blist.getEmail());
                        ps.setString(4, blist.getFulladd());
                        ps.setString(5, blist.getPhno());
                        ps.setInt(6, blist.getBookId());  // Set book_id
                        ps.setString(7, blist.getBookName());
                        ps.setString(8, blist.getAuthor());
                        ps.setDouble(9, blist.getPrice());
                        ps.setString(10, blist.getPaymentType());
                        ps.setInt(11, blist.getCopies());
                        ps.addBatch();
                    }
                }

                int[] count = ps.executeBatch();
                conn.commit();
                f = true;
                conn.setAutoCommit(true);
            }
        } catch (Exception e) {
            try {
                conn.rollback(); // Rollback in case of error
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
            e.printStackTrace();
        }
        return f;
    }

    @Override
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
                order.setEmail(rs.getString("email"));
                order.setFulladd(rs.getString("address"));
                order.setPhno(rs.getString("phone"));
                order.setBookId(rs.getInt("book_id"));  // Set book_id
                order.setBookName(rs.getString("book_name"));
                order.setAuthor(rs.getString("author"));
                order.setPrice(rs.getDouble("price"));  // Use getDouble for price
                order.setPaymentType(rs.getString("payment"));
                order.setCopies(rs.getInt("copies"));
                list.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Book_order> getOrdersAll() {
        List<Book_order> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM book_order";
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Book_order order = new Book_order();
                order.setOrderId(rs.getString("order_id"));
                order.setUserName(rs.getString("user_name"));
                order.setEmail(rs.getString("email"));
                order.setFulladd(rs.getString("address"));
                order.setPhno(rs.getString("phone"));
                order.setBookId(rs.getInt("book_id"));  // Set book_id
                order.setBookName(rs.getString("book_name"));
                order.setAuthor(rs.getString("author"));
                order.setPrice(rs.getDouble("price"));  // Use getDouble for price
                order.setPaymentType(rs.getString("payment"));
                order.setCopies(rs.getInt("copies"));
                list.add(order);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
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
