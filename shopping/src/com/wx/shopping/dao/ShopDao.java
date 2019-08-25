package com.wx.shopping.dao;

import com.wx.shopping.model.Shop;


public interface ShopDao {
	public void insertOneShop(Shop shop) throws Exception ;
	public Shop selectBySid(String sid) throws Exception;
	public void deleteBySid(String sid) throws Exception;
	public void updateShopInfo(Shop shop) throws Exception;
}
