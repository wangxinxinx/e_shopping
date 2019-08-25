package com.wx.shopping.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.wx.shopping.dao.CartDao;
import com.wx.shopping.factory.ConnectionFactory;
import com.wx.shopping.model.Cart;
import com.wx.shopping.model.Product;
import com.wx.shopping.util.GetIdByTime;


public class CartDaoImpl implements CartDao {
	Connection conn = null;
	//SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式

	public void insertOneCart(Cart cart) throws Exception {

		String sql = "";
		PreparedStatement ps = null;

		try {
			conn = ConnectionFactory.getInstance().makeConnection();
			
			sql = "INSERT INTO cart(cid,c_num,c_total_price,pid,uid) VALUES(?,?,?,?,?);";
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, GetIdByTime.getCid());
			ps.setInt(2, cart.getC_num());
			ps.setDouble(3, cart.getC_total_price());
			ps.setString(4, cart.getPid());
			ps.setString(5, cart.getUid());
			ps.executeUpdate();
			ps.close();
	
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			conn.close();
		}
	}
	
	public void deleteCartByCid(String cid) throws Exception {

		String sql = "";
		PreparedStatement ps = null;

		try {
			conn = ConnectionFactory.getInstance().makeConnection();
			
			sql = "DELETE FROM cart WHERE cid=?;";
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, cid);
			ps.executeUpdate();
			ps.close();
	
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			conn.close();
		}
	}
	
	public Cart selectByCid(String cid) throws Exception {

		String sql = "";
		PreparedStatement ps = null;
		ResultSet rs = null;
		Cart cart = null;

		try {
			conn = ConnectionFactory.getInstance().makeConnection();

			sql = "SELECT * FROM cart WHERE cid=?;";
			ps = conn.prepareStatement(sql);
			ps.setString(1, cid);
			System.out.println(ps);
			rs = ps.executeQuery();

			if (rs.next()) {
				cart = new Cart();

				cart.setCid(rs.getString("cid"));
				cart.setC_num(rs.getInt("c_num"));
				cart.setC_total_price(rs.getDouble("c_total_price"));
				cart.setPid(rs.getString("pid"));
				cart.setUid(rs.getString("uid"));
			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;

		} finally {
			rs.close();
			ps.close();
			conn.close();
		}
		return cart;
	}
}
