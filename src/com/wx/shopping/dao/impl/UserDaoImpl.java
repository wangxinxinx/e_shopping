package com.wx.shopping.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.wx.shopping.dao.UserDao;
import com.wx.shopping.factory.ConnectionFactory;
import com.wx.shopping.model.User;
import com.wx.shopping.util.GetIdByTime;

public class UserDaoImpl implements UserDao {

	Connection conn = null;

	public User selectByNamePassword(String username, String password) throws Exception {

		String sql = "SELECT * FROM user WHERE username=? and password=?";
		PreparedStatement pstmt = null;

		ResultSet rs = null;
		User user = null;

		try {
			/*
			 * pstmt.execute(); pstmt.executeQuery(); pstmt.executeUpdate();
			 */

			conn = ConnectionFactory.getInstance().makeConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, username);
			pstmt.setString(2, password);
			System.out.println(pstmt);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				user = new User();
				user.setUid(rs.getString(1));
				user.setUsername(rs.getString(2));
				user.setPassword(rs.getString(3));
				user.setRecv_name(rs.getString(4));
				user.setTel(rs.getString(5));
				user.setPostcode(rs.getString(6));
				user.setAddress(rs.getString(7));
				user.setU_pic_path(rs.getString(8));
				user.setEmail(rs.getString(9));
				user.setSex(rs.getString(10));
				user.setBirthday(rs.getString(11));
				user.setU_money(rs.getDouble(12));
				user.setU_credit(rs.getInt(13));
				user.setReg_day(rs.getString(14));
			}
		} catch (Exception e) {
			// throw new Exception("selectByNamePassword函数异常");
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
			conn.close();
		}
		// System.out.println(user.getUsername());
		return user;
	}

	public User selectByUid(String uid) throws Exception {

		String sql = "SELECT * FROM user WHERE uid=?";
		PreparedStatement pstmt = null;

		ResultSet rs = null;
		User user = null;

		try {
			/*
			 * pstmt.execute(); pstmt.executeQuery(); pstmt.executeUpdate();
			 */

			conn = ConnectionFactory.getInstance().makeConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, uid);
			System.out.println(pstmt);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				user = new User();
				user.setUid(rs.getString(1));
				user.setUsername(rs.getString(2));
				user.setPassword(rs.getString(3));
				user.setRecv_name(rs.getString(4));
				user.setTel(rs.getString(5));
				user.setPostcode(rs.getString(6));
				user.setAddress(rs.getString(7));
				user.setU_pic_path(rs.getString(8));
				user.setEmail(rs.getString(9));
				user.setSex(rs.getString(10));
				user.setBirthday(rs.getString(11));
				user.setU_money(rs.getDouble(12));
				user.setU_credit(rs.getInt(13));
				user.setReg_day(rs.getString(14));
			}
		} catch (Exception e) {
			// throw new Exception("selectByNamePassword函数异常");
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
			conn.close();
		}
		// System.out.println(user.getUsername());
		return user;
	}

	public void insertOneUser(User user) throws Exception {

		String sql = "";
		PreparedStatement ps = null;

		try {
			conn = ConnectionFactory.getInstance().makeConnection();

			sql = "INSERT INTO user(uid,username,password,recv_name,tel,postcode,address,sex,reg_day) VALUES(?,?,?,?,?,?,?,?,?);";
			ps = conn.prepareStatement(sql);
			ps.setString(1, GetIdByTime.getUid());
			ps.setString(2, user.getUsername());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getRecv_name());
			ps.setString(5, user.getTel());
			ps.setString(6, user.getPostcode());
			ps.setString(7, user.getAddress());

			ps.setString(8, user.getSex());

			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
			// System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
			ps.setString(9, df.format(new Date()));
			ps.executeUpdate();
			ps.close();

			if (user.getU_pic_path().length() != 0) {
				sql = "UPDATE user SET u_pic_path=? WHERE username=\'" + user.getUsername() + "\';";
				ps = conn.prepareStatement(sql);
				ps.setString(1, user.getU_pic_path());
				ps.executeUpdate();
				ps.close();
			}

			if (user.getEmail().length() != 0) {
				sql = "UPDATE user SET email=?  WHERE username=\'" + user.getUsername() + "\';";
				ps = conn.prepareStatement(sql);
				ps.setString(1, user.getEmail());
				ps.executeUpdate();
				ps.close();
			}

			if (user.getBirthday().length() != 0) {
				sql = "UPDATE user SET birthday=?  WHERE username=\'" + user.getUsername() + "\';";
				ps = conn.prepareStatement(sql);
				ps.setString(1, user.getBirthday());
				ps.executeUpdate();
				ps.close();
			}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			conn.close();
		}
	}

	public void updatePersonalInfo(User user) throws Exception {

		String sql = "";
		PreparedStatement ps = null;

		try {
			conn = ConnectionFactory.getInstance().makeConnection();

			if (user.getRecv_name().length() != 0) {
				sql = "UPDATE user SET recv_name=? WHERE uid=\'" + user.getUid() + "\';";
				ps = conn.prepareStatement(sql);
				ps.setString(1, user.getRecv_name());
				ps.executeUpdate();
				ps.close();
			}

			if (user.getTel().length() != 0) {
				sql = "UPDATE user SET tel=?  WHERE uid=\'" + user.getUid() + "\';";
				ps = conn.prepareStatement(sql);
				ps.setString(1, user.getTel());
				ps.executeUpdate();
				ps.close();
			}
			if (user.getPostcode().length() != 0) {
				sql = "UPDATE user SET postcode=?  WHERE uid=\'" + user.getUid() + "\';";
				ps = conn.prepareStatement(sql);
				ps.setString(1, user.getPostcode());
				ps.executeUpdate();
				ps.close();
			}

			if (user.getAddress().length() != 0) {
				sql = "UPDATE user SET address=?  WHERE uid=\'" + user.getUid() + "\';";
				ps = conn.prepareStatement(sql);
				ps.setString(1, user.getAddress());
				ps.executeUpdate();
				ps.close();
			}

			if (user.getU_pic_path().length() != 0) {
				sql = "UPDATE user SET u_pic_path=? WHERE uid=\'" + user.getUid() + "\';";
				ps = conn.prepareStatement(sql);
				ps.setString(1, user.getU_pic_path());
				ps.executeUpdate();
				ps.close();
			}

			//if (user.getEmail().length() != 0) {
				sql = "UPDATE user SET email=?  WHERE uid=\'" + user.getUid() + "\';";
				ps = conn.prepareStatement(sql);
				ps.setString(1, user.getEmail());
				ps.executeUpdate();
				ps.close();
			//}
			//if (user.getSex().length() != 0) {
				sql = "UPDATE user SET sex=?  WHERE uid=\'" + user.getUid() + "\';";
				ps = conn.prepareStatement(sql);
				ps.setString(1, user.getSex());
				ps.executeUpdate();
				ps.close();
			//}

			//if (user.getBirthday().length() != 0) {
				sql = "UPDATE user SET birthday=?  WHERE uid=\'" + user.getUid() + "\';";
				ps = conn.prepareStatement(sql);
				ps.setString(1, user.getBirthday());
				ps.executeUpdate();
				ps.close();
			//}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			conn.close();
		}

	}

	public void updatePsw(String uid, String newPsw) throws Exception {

		String sql = "";
		PreparedStatement ps = null;

		try {
			conn = ConnectionFactory.getInstance().makeConnection();

			sql = "UPDATE user SET password=? WHERE uid=\'" + uid + "\';";
			ps = conn.prepareStatement(sql);
			ps.setString(1, newPsw);
			ps.executeUpdate();
			ps.close();

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			conn.close();
		}

	}
	
	public void updateMoney(String uid,double changeMoney) throws Exception {

		String sql = "";
		PreparedStatement ps = null;

		try {
			conn = ConnectionFactory.getInstance().makeConnection();

			sql = "UPDATE user SET u_money=u_money+? WHERE uid=\'" + uid + "\';";
			ps = conn.prepareStatement(sql);
			ps.setDouble(1, changeMoney);
			ps.executeUpdate();
			ps.close();

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			conn.close();
		}

	}

	public void addMoney(String uid, double money) throws Exception {

		String sql = "";
		PreparedStatement ps = null;
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式

		try {
			conn = ConnectionFactory.getInstance().makeConnection();
			conn.setAutoCommit(false);

			//修改金额和信誉
			sql = "UPDATE user SET u_money=u_money+?,u_credit=u_credit+? WHERE uid=\'" + uid + "\';";
			ps = conn.prepareStatement(sql);
			ps.setDouble(1, money);
			ps.setInt(2, (int)money);
			System.out.println(ps);
			ps.executeUpdate();
			ps.close();
			
			//写账单
			sql = "INSERT INTO bill VALUES(?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, GetIdByTime.getBid());
			ps.setDouble(2, money);
			ps.setString(3, "充值");
			ps.setString(4, "");

			ps.setString(5, df.format(new Date()));
			ps.setString(6, uid);
			ps.setString(7, "");
			System.out.println(ps);
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

	public boolean moneyTransfer(String uid, String receiver, String money, String remark) throws Exception {

		String sql = "";
		PreparedStatement ps = null;
		ResultSet rs = null;
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式

		try {
			int flag = -1;
			conn = ConnectionFactory.getInstance().makeConnection();

			sql = "SELECT * FROM user WHERE uid=\'" + receiver + "\';";
			PreparedStatement ps1 = conn.prepareStatement(sql);
			System.out.println(ps1);
			rs = ps1.executeQuery();
			if (rs.next()) {
				flag = 1;
			} else {
				sql = "SELECT * FROM user WHERE username=\'" + receiver + "\';";
				ps1 = conn.prepareStatement(sql);
				System.out.println(ps1);
				rs = ps1.executeQuery();
				if (rs.next()) {
					flag = 2;
				} else {
					sql = "SELECT * FROM user WHERE tel=\'" + receiver + "\';";
					ps1 = conn.prepareStatement(sql);
					System.out.println(ps1);
					rs = ps1.executeQuery();
					if (rs.next()) {
						flag = 3;
					}
				}

			}

			if (flag != -1) {
				conn.setAutoCommit(false);

				// 增加收款人的金额
				if (flag == 1)
					sql = "UPDATE user SET u_money=u_money+" + money + " WHERE uid=\'" + receiver + "\';";
				else if (flag == 2)
					sql = "UPDATE user SET u_money=u_money+" + money + " WHERE username=\'" + receiver + "\';";
				else if (flag == 3)
					sql = "UPDATE user SET u_money=u_money+" + money + " WHERE tel=\'" + receiver + "\';";
				ps = conn.prepareStatement(sql);
				ps.executeUpdate();
				ps.close();

				// 减少付款人的金额
				sql = "UPDATE user SET u_money=u_money-" + money + " WHERE uid=\'" + uid + "\';";
				ps = conn.prepareStatement(sql);
				ps.executeUpdate();
				ps.close();

				// 写收款人的账单
				/*
				 * BillDao billDao=new BillDaoImpl(); Bill bill=new Bill();
				 * 
				 * bill.setB_money(Double.parseDouble(money));
				 * bill.setDeal_type("收款"); bill.setRemark(remark);
				 * bill.setUid(rs.getString("uid")); bill.setDeal_object(uid);
				 * 
				 * billDao.insertOneBill(conn,bill);
				 */

				sql = "INSERT INTO bill VALUES(?,?,?,?,?,?,?)";
				ps = conn.prepareStatement(sql);
				ps.setString(1, GetIdByTime.getBid());
				ps.setDouble(2, Double.parseDouble(money));
				ps.setString(3, "收款");
				ps.setString(4, remark);

				ps.setString(5, df.format(new Date()));
				ps.setString(6, rs.getString("uid"));
				ps.setString(7, uid);
				System.out.println(ps);
				ps.executeUpdate();
				ps.close();

				// 写付款人的账单
				/*
				 * bill.setB_money(-Double.parseDouble(money));
				 * bill.setDeal_type("转账"); bill.setRemark(remark);
				 * bill.setUid(uid); bill.setDeal_object(rs.getString("uid"));
				 * 
				 * billDao.insertOneBill(conn,bill);
				 */

				sql = "INSERT INTO bill VALUES(?,?,?,?,?,?,?)";
				ps = conn.prepareStatement(sql);
				ps.setString(1, GetIdByTime.getBid());
				ps.setDouble(2, -Double.parseDouble(money));
				ps.setString(3, "转账");
				ps.setString(4, remark);
				ps.setString(5, df.format(new Date()));
				ps.setString(6, uid);
				ps.setString(7, rs.getString("uid"));
				System.out.println(ps);
				ps.executeUpdate();
				ps.close();

				ps1.close();			
				conn.commit();		
				return true;
			} else {
				ps1.close();
				return false;
			}

		} catch (Exception e) {
			
			conn.rollback();
			e.printStackTrace();
			return false;
		} finally {
			rs.close();
			conn.close();
		}
	}
}
