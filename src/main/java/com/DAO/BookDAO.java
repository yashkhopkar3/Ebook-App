package com.DAO;

import java.util.List;
import com.entity.BookDtls;

public interface BookDAO {

    public boolean addBooks(BookDtls b);
    public List<BookDtls> getALLBooks();
    public BookDtls getBookbyId(int id);
    public boolean UpdateEditBooks(BookDtls b);
    public boolean DeleteBooks(int id);
}
