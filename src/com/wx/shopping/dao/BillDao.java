package com.wx.shopping.dao;

import java.sql.Connection;


import com.wx.shopping.model.Bill;

public interface BillDao {
	public void insertOneBill(Connection conn,Bill bill) throws Exception ;
	public void deleteBillByBid(String bid) throws Exception ;

}
