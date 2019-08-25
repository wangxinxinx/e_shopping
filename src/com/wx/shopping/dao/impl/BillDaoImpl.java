package com.wx.shopping.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.wx.shopping.dao.BillDao;
import com.wx.shopping.factory.ConnectionFactory;
import com.wx.shopping.model.Bill;

import com.wx.shopping.util.GetIdByTime;

public class BillDaoImpl implements BillDao{
	
	Connection conn=null;
	public void insertOneBill(Connection conn,Bill bill) throws Exception {

		String sql = "";
		PreparedStatement ps = null;
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式

		try {
			conn=ConnectionFactory.getInstance().makeConnection();
			
			sql="INSERT INTO bill VALUES(?,?,?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, GetIdByTime.getBid());
			ps.setDouble(2, bill.getB_money());
			ps.setString(3, bill.getDeal_type());
			ps.setString(4, bill.getRemark());
			ps.setString(5, df.format(new Date()));
			ps.setString(6, bill.getUid());
			ps.setString(7, bill.getDeal_object());
			System.out.println(ps);
			ps.executeUpdate();
			ps.close();
			
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			conn.close();
		}
	}
	
	public void deleteBillByBid(String bid) throws Exception {

		String sql = "";
		PreparedStatement ps = null;
		//SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式

		try {
			conn=ConnectionFactory.getInstance().makeConnection();
			
			sql="DELETE FROM bill WHERE bid='"+bid+"';";
			ps=conn.prepareStatement(sql);
			
			System.out.println(ps);
			ps.executeUpdate();
			ps.close();
			
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			conn.close();
		}
	}
}
