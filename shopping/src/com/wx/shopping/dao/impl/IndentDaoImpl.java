package com.wx.shopping.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.wx.shopping.dao.IndentDao;
import com.wx.shopping.dao.ProductDao;
import com.wx.shopping.factory.ConnectionFactory;
import com.wx.shopping.model.Indent;
import com.wx.shopping.model.Product;
import com.wx.shopping.util.GetIdByTime;

public class IndentDaoImpl implements IndentDao {
	Connection conn = null;
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式

	public void insertOneIndent(Indent indent) throws Exception {

		String sql = "";
		PreparedStatement ps = null;

		try {
			conn = ConnectionFactory.getInstance().makeConnection();
			conn.setAutoCommit(false);
			
			//插入一条订单信息
			sql = "INSERT INTO indent(iid,i_num,i_total_price,state,create_time,pid,uid) VALUES(?,?,?,?,?,?,?);";
			ps = conn.prepareStatement(sql);
			ps.setString(1, GetIdByTime.getIid());
			ps.setInt(2, indent.getI_num());
			ps.setDouble(3, indent.getI_total_price());
			ps.setString(4, "待发货");
			ps.setString(5, df.format(new Date()));
			ps.setString(6, indent.getPid());
			ps.setString(7, indent.getUid());
			ps.executeUpdate();
			ps.close();
			
			//减少购买人的金额
			ProductDao productdao=new ProductDaoImpl();
			Product product=productdao.selectByPid(indent.getPid());	
			double totalPrice=product.getPrice()*product.getDiscount()*indent.getI_num();
			sql="UPDATE user SET u_money=u_money-? WHERE uid=?";
			ps = conn.prepareStatement(sql);
			ps.setDouble(1, totalPrice);
			ps.setString(2, indent.getUid());
			ps.executeUpdate();
			ps.close();
			
			conn.commit();
	
		} catch (Exception e) {
			conn.rollback();
			e.printStackTrace();

		} finally {
			conn.close();
		}
	}
	
	public Indent selectByIid(String iid) throws Exception {

		String sql = "";
		PreparedStatement ps = null;
		ResultSet rs = null;
		Indent indent = null;

		try {
			conn = ConnectionFactory.getInstance().makeConnection();

			sql = "SELECT * FROM indent WHERE iid='" + iid + "';";
			ps = conn.prepareStatement(sql);
			System.out.println(ps);
			rs = ps.executeQuery();

			if (rs.next()) {
				indent = new Indent();

				indent.setIid(rs.getString(1));
				indent.setI_num(rs.getInt(2));
				indent.setI_total_price(rs.getDouble(3));
				indent.setState(rs.getString(4));
				indent.setCreate_time(rs.getString(5));
				indent.setSend_time(rs.getString(6));
				indent.setSuccess_time(rs.getString(7));
				indent.setRefund_time(rs.getString(8));
				indent.setCancel_time(rs.getString(9));
				indent.setPid(rs.getString(10));
				indent.setUid(rs.getString(11));
			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;

		} finally {
			rs.close();
			ps.close();
			conn.close();
		}
		return indent;
	}
	public void deleteByIid(String iid) throws Exception {

		String sql = "";
		PreparedStatement ps = null;

		try {
			conn = ConnectionFactory.getInstance().makeConnection();

			sql = "DELETE FROM indent WHERE iid='" + iid + "';";
			ps = conn.prepareStatement(sql);
			System.out.println(ps);
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
		
			ps.close();
			conn.close();
		}

	}
	
	public void updateStateByIid(String iid,String state) throws Exception {

		String sql = "";
		PreparedStatement ps = null;

		try {
			conn = ConnectionFactory.getInstance().makeConnection();

			sql = "UPDATE indent SET state =? WHERE iid=?;";
			ps = conn.prepareStatement(sql);
			ps.setString(1, state);
			ps.setString(2, iid);
			System.out.println(ps);
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
		
			ps.close();
			conn.close();
		}

	}
}
