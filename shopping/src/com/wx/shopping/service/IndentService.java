package com.wx.shopping.service;

import java.sql.Connection;
import java.sql.PreparedStatement;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.wx.shopping.factory.ConnectionFactory;
import com.wx.shopping.model.Indent;
import com.wx.shopping.model.Shop;
import com.wx.shopping.util.GetIdByTime;

public class IndentService {
	Connection conn = null;
	PreparedStatement ps = null;
	// ResultSet rs=null;
	String sql = "";
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式

	// 取消未成功的订单
	public void cancelIndent(Indent indent) throws Exception {

		try {
			conn = ConnectionFactory.getInstance().makeConnection();
			conn.setAutoCommit(false);

			// 增加买家的金额
			sql = "UPDATE user SET u_money=u_money+? WHERE uid=\'" + indent.getUid() + "\';";
			ps = conn.prepareStatement(sql);
			ps.setDouble(1, indent.getI_total_price());
			ps.executeUpdate();
			ps.close();

			// 删除该订单
			sql = "DELETE FROM indent WHERE iid='" + indent.getIid() + "';";
			ps = conn.prepareStatement(sql);
			System.out.println(ps);
			ps.executeUpdate();

			conn.commit();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			conn.rollback();

			e.printStackTrace();

		} finally {
			conn.close();
		}

	}

	// 确认收货
	public void assureRecvProduct(Shop shop, Indent indent) throws Exception {

		try {
			conn = ConnectionFactory.getInstance().makeConnection();
			conn.setAutoCommit(false);

			// 改变订单状态
			sql = "UPDATE indent SET state =?,success_time=? WHERE iid=?;";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "交易成功");
			ps.setString(2, df.format(new Date()));
			ps.setString(3, indent.getIid());
			System.out.println(ps);
			ps.executeUpdate();
			ps.close();

			// 增加卖家金额
			sql = "UPDATE user SET u_money =u_money+? WHERE uid=?;";
			ps = conn.prepareStatement(sql);
			ps.setDouble(1, indent.getI_total_price());
			ps.setString(2, shop.getUid());
			System.out.println(ps);
			ps.executeUpdate();
			ps.close();

			// 写买家的账单
			sql = "INSERT INTO bill VALUES(?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, GetIdByTime.getBid());
			ps.setDouble(2, -indent.getI_total_price());
			ps.setString(3, "购物");
			ps.setString(4, "");
			ps.setString(5, df.format(new Date()));
			ps.setString(6, indent.getUid());
			ps.setString(7, shop.getUid());
			System.out.println(ps);
			ps.executeUpdate();
			ps.close();

			// 写卖家的账单
			sql = "INSERT INTO bill VALUES(?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, GetIdByTime.getBid());
			ps.setDouble(2, indent.getI_total_price());
			ps.setString(3, "货款");
			ps.setString(4, "");
			ps.setString(5, df.format(new Date()));
			ps.setString(6, shop.getUid());
			ps.setString(7, indent.getUid());
			System.out.println(ps);
			ps.executeUpdate();
			ps.close();

			// 增加买家积分
			sql = "UPDATE user SET u_credit =u_credit+? WHERE uid=?;";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, (int) indent.getI_total_price());
			ps.setString(2, indent.getUid());
			System.out.println(ps);
			ps.executeUpdate();
			ps.close();

			// 增加商品积分和商品销量
			sql = "UPDATE product SET p_credit =p_credit+2,salses=salses+1 WHERE pid=?;";
			ps = conn.prepareStatement(sql);
			ps.setString(1, indent.getPid());
			System.out.println(ps);
			ps.executeUpdate();
			ps.close();

			// 改变商店积分
			/*
			sql = "UPDATE shop SET s_credit =(SELECT AVG(p_credit) FROM product WHERE product.sid=?) WHERE shop.sid=?;";
			ps = conn.prepareStatement(sql);
			ps.setString(1, shop.getSid());
			ps.setString(2, shop.getSid());
			System.out.println(ps);
			ps.executeUpdate();
			ps.close();*/

			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			conn.rollback();

			e.printStackTrace();

		} finally {
			conn.close();
		}

	}
	
	// 接受退款
		public void acceptRefund(Shop shop, Indent indent) throws Exception {

			try {
				conn = ConnectionFactory.getInstance().makeConnection();
				conn.setAutoCommit(false);

				// 改变订单状态
				sql = "UPDATE indent SET state =?,cancel_time=? WHERE iid=?;";
				ps = conn.prepareStatement(sql);
				ps.setString(1, "交易取消");
				ps.setString(2, df.format(new Date()));
				ps.setString(3, indent.getIid());
				System.out.println(ps);
				ps.executeUpdate();
				ps.close();

				// 减少卖家金额
				sql = "UPDATE user SET u_money =u_money-? WHERE uid=?;";
				ps = conn.prepareStatement(sql);
				ps.setDouble(1, indent.getI_total_price());
				ps.setString(2, shop.getUid());
				System.out.println(ps);
				ps.executeUpdate();
				ps.close();
				
				// 增加买家金额
				sql = "UPDATE user SET u_money =u_money+? WHERE uid=?;";
				ps = conn.prepareStatement(sql);
				ps.setDouble(1, indent.getI_total_price());
				ps.setString(2, indent.getUid());
				System.out.println(ps);
				ps.executeUpdate();
				ps.close();

				// 写买家的账单
				sql = "INSERT INTO bill VALUES(?,?,?,?,?,?,?)";
				ps = conn.prepareStatement(sql);
				ps.setString(1, GetIdByTime.getBid());
				ps.setDouble(2, indent.getI_total_price());
				ps.setString(3, "退款");
				ps.setString(4, "");
				ps.setString(5, df.format(new Date()));
				ps.setString(6, indent.getUid());
				ps.setString(7, shop.getUid());
				System.out.println(ps);
				ps.executeUpdate();
				ps.close();

				// 写卖家的账单
				sql = "INSERT INTO bill VALUES(?,?,?,?,?,?,?)";
				ps = conn.prepareStatement(sql);
				ps.setString(1, GetIdByTime.getBid());
				ps.setDouble(2, -indent.getI_total_price());
				ps.setString(3, "退款");
				ps.setString(4, "");
				ps.setString(5, df.format(new Date()));
				ps.setString(6, shop.getUid());
				ps.setString(7, indent.getUid());
				System.out.println(ps);
				ps.executeUpdate();
				ps.close();

				// 减少买家积分
				sql = "UPDATE user SET u_credit =u_credit-? WHERE uid=?;";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, (int) indent.getI_total_price());
				ps.setString(2, indent.getUid());
				System.out.println(ps);
				ps.executeUpdate();
				ps.close();

				// 减少商品积分和商品销量
				sql = "UPDATE product SET p_credit =p_credit-3,salses=salses-1 WHERE pid=?;";
				ps = conn.prepareStatement(sql);
				ps.setString(1, indent.getPid());
				System.out.println(ps);
				ps.executeUpdate();
				ps.close();

				// 改变商店积分
				/*
				sql = "UPDATE shop SET s_credit =(SELECT AVG(p_credit) FROM product WHERE product.sid=?) WHERE shop.sid=?;";
				ps = conn.prepareStatement(sql);
				ps.setString(1, shop.getSid());
				ps.setString(2, shop.getSid());
				System.out.println(ps);
				ps.executeUpdate();
				ps.close();
*/
				conn.commit();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				conn.rollback();

				e.printStackTrace();

			} finally {
				conn.close();
			}

		}

		// 请求退款
		public void requestRefund(Indent indent) throws Exception {

			try {
				conn = ConnectionFactory.getInstance().makeConnection();
				
				// 改变订单状态
				sql = "UPDATE indent SET state =?,refund_time=? WHERE iid=?;";
				ps = conn.prepareStatement(sql);
				ps.setString(1, "退款中");
				ps.setString(2, df.format(new Date()));
				ps.setString(3, indent.getIid());
				System.out.println(ps);
				ps.executeUpdate();
				ps.close();


			} catch (SQLException e) {

				e.printStackTrace();

			} finally {
				conn.close();
			}
		}
		
		// 发货
		public void sendOut(Indent indent) throws Exception {

			try {
				conn = ConnectionFactory.getInstance().makeConnection();
				
				// 改变订单状态
				sql = "UPDATE indent SET state =?,send_time=? WHERE iid=?;";
				ps = conn.prepareStatement(sql);
				ps.setString(1, "已发货");
				ps.setString(2, df.format(new Date()));
				ps.setString(3, indent.getIid());
				System.out.println(ps);
				ps.executeUpdate();
				ps.close();


			} catch (SQLException e) {

				e.printStackTrace();

			} finally {
				conn.close();
			}
		}
	
	
	
}
