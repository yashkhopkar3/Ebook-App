package com.DAO;

import java.util.List;

import com.entity.Cart;

public interface CartDAO {

	public boolean addCart(Cart c,int uid,int bid);
	 public List<Cart> getCartItems(int uid);
	 public boolean RemoveCart(int cid,int uid);
	public boolean updateCartQuantity(int cid, int uid, int quantityChange);
	public int getCartItemCount(int uid);
}