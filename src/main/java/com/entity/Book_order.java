package com.entity;

public class Book_order {

    private int id;
    private String orderId;
    private String userName;
    private String email;
    private String phno;
    private String fulladd;
    private String paymentType;
    private int bookId;        // Added bookId to match the database schema
    private String bookName;
    private String author;
    private double price;       // Changed price type to double to match the database schema
    private int copies;

    public Book_order() {
        super();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhno() {
        return phno;
    }

    public void setPhno(String phno) {
        this.phno = phno;
    }

    public String getFulladd() {
        return fulladd;
    }

    public void setFulladd(String fulladd) {
        this.fulladd = fulladd;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    public int getBookId() {    // Getter for bookId
        return bookId;
    }

    public void setBookId(int bookId) {    // Setter for bookId
        this.bookId = bookId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public double getPrice() {   // Changed to double
        return price;
    }

    public void setPrice(double price) {  // Changed to double
        this.price = price;
    }

    public int getCopies() {
        return copies;
    }

    public void setCopies(int copies) {
        this.copies = copies;
    }

    @Override
    public String toString() {
        return "Book_order [id=" + id + ", orderId=" + orderId + ", userName=" + userName + ", email=" + email
                + ", phno=" + phno + ", fulladd=" + fulladd + ", paymentType=" + paymentType + ", bookId=" + bookId
                + ", bookName=" + bookName + ", author=" + author + ", price=" + price + ", copies=" + copies + "]";
    }
}
