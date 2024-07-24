package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDtls;

public class BookDAOImpl implements BookDAO {

    private Connection conn;

    public BookDAOImpl(Connection conn) {
        this.conn = conn;
    }

    @Override
    public boolean addBooks(BookDtls b) {
        boolean result = false;
        String sql = "INSERT INTO book_dtls (bookname, author, price, bookCategory, status, photo,email) VALUES (?, ?, ?, ?, ?, ?,?)";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, b.getBookName());
            ps.setString(2, b.getAuthor());
            ps.setString(3, b.getPrice());
            ps.setString(4, b.getBookCategory());
            ps.setString(5, b.getStatus());
            ps.setString(6, b.getPhotoName());
            ps.setString(7, b.getEmail());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                result = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

	@Override
	public List<BookDtls> getALLBooks() {
		// TODO Auto-generated method stub
		List<BookDtls> list = new ArrayList<BookDtls>();
	    BookDtls b = null;

	    try {
	        String sql = "select * from book_dtls";
	        PreparedStatement ps = conn.prepareStatement(sql);

	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            b = new BookDtls();
	            b.setBookId(rs.getInt(1));
	            b.setBookName(rs.getString(2));
	            b.setAuthor(rs.getString(3));
	            b.setPrice(rs.getString(4));
	            b.setBookCategory(rs.getString(5));
	            b.setStatus(rs.getString(6));
	            b.setPhotoName(rs.getString(7));
	            b.setEmail(rs.getString(8));
	            list.add(b);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        }
	    
		return list;
	}
}
