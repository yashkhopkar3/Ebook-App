package com.DAO;

import java.util.List;
import com.entity.BookDtls;

public interface BookDAO {

    public boolean addBooks(BookDtls b);
    public List<BookDtls> getALLBooks();
    public BookDtls getBookbyId(int id);
    public boolean UpdateEditBooks(BookDtls b);
    public boolean DeleteBooks(int id);
    public List<BookDtls> getNewBook(); 
    public List<BookDtls> getOldBooks();
    public boolean addRecentBook(BookDtls book);
    public List<BookDtls> getRecentBooks();
    public List<BookDtls> getBookByOld(String email, String status);
    public boolean oldBookDelete(String email, int id);
    public List<BookDtls> searchBooks(String query);
    public List<BookDtls> getNotApprovedBooks();
    public boolean updateBookStatus(int bookId, String status);
    public List<BookDtls> getRelatedBooksByCategoryOrAuthorForCart(int userId);
    
}