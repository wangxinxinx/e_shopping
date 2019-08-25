package com.wx.shopping.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.wx.shopping.factory.ConnectionFactory;
import com.wx.shopping.model.Bill;

public class BillService {
	Connection conn = null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	
	public List queryBillById(String uid) {
	
		try {
			List bills = new ArrayList();
			conn = ConnectionFactory.getInstance().makeConnection();
			
			ps = conn.prepareStatement("SELECT * FROM bill WHERE uid=\'"+uid+"\';");
			System.out.println(ps);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				Bill bill = new Bill();
				bill.setBid(rs.getString(1));
				bill.setB_money(rs.getDouble(2));
				bill.setDeal_type(rs.getString(3));
				bill.setRemark(rs.getString(4));
				bill.setTime(rs.getString(5));
				bill.setUid(rs.getString(6));
				bill.setDeal_object(rs.getString(7));
				
				bills.add(bill);

			}
			conn.close();
			ps.close();
			rs.close();
			return bills;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
			return null;
		}

	}

}
