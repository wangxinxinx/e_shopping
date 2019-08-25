package com.wx.shopping.dao;

import com.wx.shopping.model.Product;

public interface ProductDao {
	public void insertOneProduct(Product product) throws Exception;
	public void deleteByPid(String pid) throws Exception ;
	public Product selectByPid(String pid) throws Exception;
	public void updateProductInfo(Product product) throws Exception;
	public void addProductCredit(Product product, int credit) throws Exception;
}
