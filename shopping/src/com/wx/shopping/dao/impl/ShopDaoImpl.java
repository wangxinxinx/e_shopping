package com.wx.shopping.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.wx.shopping.dao.ShopDao;
import com.wx.shopping.factory.ConnectionFactory;
import com.wx.shopping.model.Shop;
import com.wx.shopping.util.GetIdByTime;

public class ShopDaoImpl implements ShopDao {
	Connection conn = null;
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式

	public void insertOneShop(Shop shop) throws Exception {

		String sql = "";
		PreparedStatement ps = null;

		try {
			conn = ConnectionFactory.getInstance().makeConnection();

			String sid = GetIdByTime.getSid();
			sql = "INSERT INTO shop(sid,s_name,s_desc,s_reg_day,uid) VALUES(?,?,?,?,?);";
			ps = conn.prepareStatement(sql);
			ps.setString(1, sid);
			ps.setString(2, shop.getS_name());
			ps.setString(3, shop.getS_desc());
			ps.setString(4, df.format(new Date()));
			ps.setString(5, shop.getUid());

			ps.executeUpdate();
			ps.close();

			if (shop.getS_pic_path().length() != 0) {
				sql = "UPDATE shop SET s_pic_path=? WHERE sid='" + sid + "';";
				ps = conn.prepareStatement(sql);
				ps.setString(1, shop.getS_pic_path());
				ps.executeUpdate();
				ps.close();
			}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			conn.close();
		}
	}

	public Shop selectBySid(String sid) throws Exception {

		String sql = "";
		PreparedStatement ps = null;
		ResultSet rs = null;
		Shop shop = null;

		try {
			conn = ConnectionFactory.getInstance().makeConnection();

			sql = "SELECT * FROM shop WHERE sid='" + sid + "';";
			ps = conn.prepareStatement(sql);
			System.out.println(ps);
			rs = ps.executeQuery();

			if (rs.next()) {
				shop = new Shop();

				shop.setSid(rs.getString(1));
				shop.setS_name(rs.getString(2));
				shop.setS_desc(rs.getString(3));
				shop.setS_pic_path(rs.getString(4));
				shop.setS_credit(rs.getDouble(5));
				shop.setS_reg_day(rs.getString(6));
				shop.setUid(rs.getString(7));
			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;

		} finally {
			rs.close();
			ps.close();
			conn.close();
		}
		return shop;
	}

	public void deleteBySid(String sid) throws Exception {

		String sql = "";
		PreparedStatement ps = null;

		try {
			conn = ConnectionFactory.getInstance().makeConnection();
			conn.setAutoCommit(false);

			sql = "DELETE FROM product WHERE sid='" + sid + "';";
			ps = conn.prepareStatement(sql);
			System.out.println(ps);
			ps.executeUpdate();
			
			sql = "DELETE FROM shop WHERE sid='" + sid + "';";
			ps = conn.prepareStatement(sql);
			System.out.println(ps);
			ps.executeUpdate();

			conn.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			conn.rollback();

		} finally {
		
			ps.close();
			conn.close();
		}

	}
	
	public void updateShopInfo(Shop shop) throws Exception {

		String sql = "";
		PreparedStatement ps = null;

		try {
			conn = ConnectionFactory.getInstance().makeConnection();

			if (shop.getS_name().length() != 0) {
				sql = "UPDATE shop SET s_name=? WHERE sid=?;";
				ps = conn.prepareStatement(sql);
				ps.setString(1, shop.getS_name());
				ps.setString(2, shop.getSid());
				ps.executeUpdate();
				ps.close();
			}

		
			sql = "UPDATE shop SET s_desc=? WHERE sid=?;";
			ps = conn.prepareStatement(sql);
			ps.setString(1, shop.getS_desc());
			ps.setString(2, shop.getSid());
			ps.executeUpdate();
			ps.close();
		

			if (shop.getS_pic_path().length() != 0) {
				sql = "UPDATE shop SET s_pic_path=? WHERE sid=?;";
				ps = conn.prepareStatement(sql);
				ps.setString(1, shop.getS_pic_path());
				ps.setString(2, shop.getSid());
				ps.executeUpdate();
				ps.close();
			}

		
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			conn.close();
		}

	}
}
