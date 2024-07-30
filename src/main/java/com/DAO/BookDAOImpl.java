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
        String sql = "INSERT INTO book_dtls (bookname, author, price, bookCategory, status, photo, email) VALUES (?, ?, ?, ?, ?, ?, ?)";

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
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return b;
    }

    @Override
    public boolean UpdateEditBooks(BookDtls b) {
        boolean result = false;
        String sql = "UPDATE book_dtls SET bookname = ?, author = ?, price = ?, bookCategory = ?, status = ? WHERE bookId = ?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, b.getBookName());
            ps.setString(2, b.getAuthor());
            ps.setString(3, b.getPrice());
            ps.setString(4, b.getBookCategory());
            ps.setString(5, b.getStatus());
            ps.setInt(6, b.getBookId());

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
            // SQL query to fetch the oldest books in each category
            String sql = "WITH ranked_books AS (" +
                         "    SELECT bookId, bookname, author, price, bookCategory, status, photo, email, " +
                         "           ROW_NUMBER() OVER (PARTITION BY bookCategory ORDER BY bookId ASC) as rn " +
                         "    FROM book_dtls " +
                         "    WHERE status = ?" +
                         ") " +
                         "SELECT bookId, bookname, author, price, bookCategory, status, photo, email " +
                         "FROM ranked_books " +
                         "WHERE rn = 1 " +
                         "ORDER BY RAND() " +
                         "LIMIT 4";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Unavailable");
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

    
}
