package com.wx.shopping.dao;

import com.wx.shopping.model.Cart;

public interface CartDao {
	public void insertOneCart(Cart cart) throws Exception;
	public void deleteCartByCid(String cid) throws Exception;
	public Cart selectByCid(String cid) throws Exception;
}
