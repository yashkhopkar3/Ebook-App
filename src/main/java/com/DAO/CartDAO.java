package com.DAO;

import java.util.List;

import com.entity.Cart;

public interface CartDAO {

	public boolean addCart(Cart c);
	 public List<Cart> getCartItems(int uid);
	 public boolean RemoveCart(int cid,int uid);
}