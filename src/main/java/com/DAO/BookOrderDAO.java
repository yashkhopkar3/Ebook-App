package com.DAO;

import java.util.List;

import com.entity.Book_order;

public interface BookOrderDAO {
	public boolean saveOrder(List<Book_order> b);
	public List<Book_order> getOrdersByEmail(String email);
	public List<Book_order> getOrdersAll();
	public boolean isOrderIdExists(String orderId);
}