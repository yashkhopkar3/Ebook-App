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
        String checkSql = "SELECT COUNT(*) FROM book_dtls WHERE bookname = ?";
        String insertSql = "INSERT INTO book_dtls (bookname, author, price, bookCategory, status, photo, email, copies) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement checkPs = conn.prepareStatement(checkSql)) {
            checkPs.setString(1, b.getBookName());
            try (ResultSet rs = checkPs.executeQuery()) {
                if (rs.next() && rs.getInt(1) > 0) {
                    // Book name already exists, do not insert
                    return false;
                }
            }

            // If book does not exist, proceed with the insert
            try (PreparedStatement insertPs = conn.prepareStatement(insertSql)) {
                insertPs.setString(1, b.getBookName());
                insertPs.setString(2, b.getAuthor());
                insertPs.setString(3, b.getPrice());
                insertPs.setString(4, b.getBookCategory());
                insertPs.setString(5, b.getStatus());
                insertPs.setString(6, b.getPhotoName());
                insertPs.setString(7, b.getEmail());
                insertPs.setInt(8, b.getCopies()); // Adding copies

                int rowsAffected = insertPs.executeUpdate();
                if (rowsAffected > 0) {
                    result = true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }


    @Override
    public List<BookDtls> getALLBooks() {
        List<BookDtls> list = new ArrayList<>();
        BookDtls b;

        try {
            String sql = "SELECT * FROM book_dtls";
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new BookDtls();
                b.setBookId(rs.getInt("bookId"));
                b.setBookName(rs.getString("bookname"));
                b.setAuthor(rs.getString("author"));
                b.setPrice(rs.getString("price"));
                b.setBookCategory(rs.getString("bookCategory"));
                b.setStatus(rs.getString("status"));
                b.setPhotoName(rs.getString("photo"));
                b.setEmail(rs.getString("email"));
                b.setCopies(rs.getInt("copies"));
                list.add(b);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public BookDtls getBookbyId(int id) {
        BookDtls b = null;
        try {
            String sql = "SELECT * FROM book_dtls WHERE bookId = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                b = new BookDtls();
                b.setBookId(rs.getInt("bookId"));
                b.setBookName(rs.getString("bookname"));
                b.setAuthor(rs.getString("author"));
                b.setPrice(rs.getString("price"));
                b.setBookCategory(rs.getString("bookCategory"));
                b.setStatus(rs.getString("status"));
                b.setPhotoName(rs.getString("photo"));
                b.setEmail(rs.getString("email"));
                b.setCopies(rs.getInt("copies"));
                
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return b;
    }

    @Override
    public boolean UpdateEditBooks(BookDtls b) {
        boolean result = false;
        if (b.getCopies() == 0) {
            b.setStatus("Unavailable");
        }
        String sql = "UPDATE book_dtls SET bookname = ?, author = ?, price = ?, bookCategory = ?, status = ?, copies=? WHERE bookId = ?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, b.getBookName());
            ps.setString(2, b.getAuthor());
            ps.setString(3, b.getPrice());
            ps.setString(4, b.getBookCategory());
            ps.setString(5, b.getStatus());
            ps.setInt(6, b.getCopies());
            ps.setInt(7, b.getBookId());
            

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                result = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        
        
        String sq = "UPDATE recent_books SET bookname = ?, author = ?, price = ?, bookCategory = ?, status = ?, copies=? WHERE bookId = ?";

        try (PreparedStatement ps = conn.prepareStatement(sq)) {
            ps.setString(1, b.getBookName());
            ps.setString(2, b.getAuthor());
            ps.setString(3, b.getPrice());
            ps.setString(4, b.getBookCategory());
            ps.setString(5, b.getStatus());
            ps.setInt(6, b.getCopies());
            ps.setInt(7, b.getBookId());
            

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
    public boolean DeleteBooks(int id) {
        boolean result = false;
        String sql = "DELETE FROM book_dtls WHERE bookId = ?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                result = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }
    
    public List<BookDtls> getNewBook() {
        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {
            String sql = "WITH ranked_books AS (" +
                         "    SELECT bookId, bookname, author, price, bookCategory, status, photo, email, " +
                         "           ROW_NUMBER() OVER (PARTITION BY bookCategory ORDER BY bookId DESC) as rn " +
                         "    FROM book_dtls " +
                         "    WHERE status = ?" +
                         ") " +
                         "SELECT bookId, bookname, author, price, bookCategory, status, photo, email " +
                         "FROM ranked_books " +
                         "WHERE rn = 1 " +
                         "ORDER BY RAND() " +
                         "LIMIT 4";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Available");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new BookDtls();
                b.setBookId(rs.getInt("bookId"));
                b.setBookName(rs.getString("bookname"));
                b.setAuthor(rs.getString("author"));
                b.setPrice(rs.getString("price"));
                b.setBookCategory(rs.getString("bookCategory"));
                b.setStatus(rs.getString("status"));
                b.setPhotoName(rs.getString("photo"));
                b.setEmail(rs.getString("email"));
                list.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<BookDtls> getOldBooks() {
        List<BookDtls> list = new ArrayList<>();
        BookDtls b = null;
        try {
        	String updateStatusSql = "UPDATE book_dtls SET status = 'Unavailable' WHERE copies = 0";
            PreparedStatement updatePs = conn.prepareStatement(updateStatusSql);
            updatePs.executeUpdate();
            String updateStatusSql2 = "UPDATE book_dtls SET status = 'Available' WHERE CAST(copies AS UNSIGNED)> 0";
            PreparedStatement upPs = conn.prepareStatement(updateStatusSql2);
            upPs.executeUpdate();
            // SQL query to fetch the oldest books in each category
            String sql = "WITH unavailable_books AS ( SELECT bookId, bookname, author, price, bookCategory, status, photo, email FROM book_dtls WHERE status = 'Unavailable' ), ranked_books AS ( SELECT bookId, bookname, author, price, bookCategory, status, photo, email, ROW_NUMBER() OVER (PARTITION BY bookCategory ORDER BY bookId DESC) as rn FROM unavailable_books ) SELECT bookId, bookname, author, price, bookCategory, status, photo, email FROM ranked_books WHERE rn = 1 ORDER BY RAND() LIMIT 4;";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new BookDtls();
                b.setBookId(rs.getInt("bookId"));
                b.setBookName(rs.getString("bookname"));
                b.setAuthor(rs.getString("author"));
                b.setPrice(rs.getString("price"));
                b.setBookCategory(rs.getString("bookCategory"));
                b.setStatus(rs.getString("status"));
                b.setPhotoName(rs.getString("photo"));
                b.setEmail(rs.getString("email"));
                list.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
	@Override
	public boolean addRecentBook(BookDtls book) {
	    boolean f = false;
	    PreparedStatement ps = null;
	    
	    try {
	        // Delete the existing record if the bookId is already present
	        String deleteQuery = "DELETE FROM recent_books WHERE bookId = ?";
	        ps = conn.prepareStatement(deleteQuery);
	        ps.setInt(1, book.getBookId());
	        ps.executeUpdate();
	        
	        // Insert the new record
	        String query = "INSERT INTO recent_books (bookId, bookname, author, price, bookCategory, status, photo, email, copies) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
	        ps = conn.prepareStatement(query);
	        ps.setInt(1, book.getBookId());
	        ps.setString(2, book.getBookName());
	        ps.setString(3, book.getAuthor());
	        ps.setString(4, book.getPrice());
	        ps.setString(5, book.getBookCategory());
	        ps.setString(6, book.getStatus());
	        ps.setString(7, book.getPhotoName());
	        ps.setString(8, book.getEmail());
	        ps.setInt(9, book.getCopies());
	        int i = ps.executeUpdate();
	        
	        if (i == 1) {
	            f = true;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        // Ensure resources are closed
	        try {
	            if (ps != null) ps.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return f;
	}



	@Override
	public List<BookDtls> getRecentBooks() {
		
	    List<BookDtls> list = new ArrayList<>();
	    try {
	    	
	    	String updateStatusSql = "UPDATE recent_books SET status = 'Unavailable' WHERE copies = 0";
            PreparedStatement updatePs = conn.prepareStatement(updateStatusSql);
            updatePs.executeUpdate();
            String updateStatusSql2 = "UPDATE recent_books SET status = 'Available' WHERE CAST(copies AS UNSIGNED)> 0";
            PreparedStatement upPs = conn.prepareStatement(updateStatusSql2);
            upPs.executeUpdate();
	        // Check and manage the recent books limit
	        String countQuery = "SELECT COUNT(*) FROM recent_books";
	        PreparedStatement psCount = conn.prepareStatement(countQuery);
	        ResultSet rsCount = psCount.executeQuery();
	        if (rsCount.next() && rsCount.getInt(1) > 25) {
	            String deleteQuery = "DELETE FROM recent_books WHERE bId IN (SELECT bId FROM (SELECT bId FROM recent_books ORDER BY bId ASC LIMIT 5) subquery)";
	            PreparedStatement psDelete = conn.prepareStatement(deleteQuery);
	            psDelete.executeUpdate();
	        }

	        // Fetch recent books
	        String query = "SELECT * FROM recent_books rb WHERE rb.bId IN (SELECT MAX(rb2.bId) FROM recent_books rb2 GROUP BY rb2.bookname, rb2.author, rb2.price, rb2.bookCategory, rb2.status, rb2.photo, rb2.email, rb2.copies) ORDER BY rb.bId DESC LIMIT 4";
	        PreparedStatement ps = conn.prepareStatement(query);
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            BookDtls b = new BookDtls();
	            b.setBookId(rs.getInt("bookId"));
	            b.setBookName(rs.getString("bookname"));
	            b.setAuthor(rs.getString("author"));
	            b.setPrice(rs.getString("price"));
	            b.setBookCategory(rs.getString("bookCategory"));
	            b.setStatus(rs.getString("status"));
	            b.setPhotoName(rs.getString("photo"));
	            b.setEmail(rs.getString("email"));
	            b.setCopies(rs.getInt("copies")); // Setting the copies field
	            list.add(b);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}



    
}
