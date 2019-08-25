package com.wx.shopping.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.wx.shopping.dao.ProductDao;
import com.wx.shopping.factory.ConnectionFactory;
import com.wx.shopping.model.Product;
import com.wx.shopping.util.GetIdByTime;

public class ProductDaoImpl implements ProductDao {
	Connection conn = null;
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式

	public void insertOneProduct(Product product) throws Exception {

		String sql = "";
		PreparedStatement ps = null;

		try {
			conn = ConnectionFactory.getInstance().makeConnection();

			String pid = GetIdByTime.getPid();

			sql = "INSERT INTO product(pid,p_name,category,p_desc,price,discount,create_day,sid) VALUES(?,?,?,?,?,?,?,?);";
			ps = conn.prepareStatement(sql);
			ps.setString(1, pid);
			ps.setString(2, product.getP_name());
			ps.setString(3, product.getCategory());
			ps.setString(4, product.getP_desc());
			ps.setDouble(5, product.getPrice());
			ps.setDouble(6, product.getDiscount());
			ps.setString(7, df.format(new Date()));
			ps.setString(8, product.getSid());

			ps.executeUpdate();
			ps.close();

			if (product.getP_pic_path().length() != 0) {
				sql = "UPDATE product SET p_pic_path=? WHERE pid='" + pid + "';";
				ps = conn.prepareStatement(sql);
				ps.setString(1, product.getP_pic_path());
				ps.executeUpdate();
				ps.close();
			}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			conn.close();
		}
	}

	public void deleteByPid(String pid) throws Exception {

		String sql = "";
		PreparedStatement ps = null;

		try {
			conn = ConnectionFactory.getInstance().makeConnection();

			sql = "DELETE FROM product WHERE pid='" + pid + "';";
			ps = conn.prepareStatement(sql);
			System.out.println(ps);
			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			conn.rollback();

		} finally {

			ps.close();
			conn.close();
		}

	}

	public Product selectByPid(String pid) throws Exception {

		String sql = "";
		PreparedStatement ps = null;
		ResultSet rs = null;
		Product product = null;

		try {
			conn = ConnectionFactory.getInstance().makeConnection();

			sql = "SELECT * FROM product WHERE pid='" + pid + "';";
			ps = conn.prepareStatement(sql);
			System.out.println(ps);
			rs = ps.executeQuery();

			if (rs.next()) {
				product = new Product();

				product.setPid(rs.getString(1));
				product.setP_name(rs.getString(2));
				product.setCategory(rs.getString(3));
				product.setP_desc(rs.getString(4));
				product.setPrice(rs.getDouble(5));
				product.setDiscount(rs.getDouble(6));
				product.setP_pic_path(rs.getString(7));
				product.setCreate_day(rs.getString(8));
				product.setSalses(rs.getInt(9));
				product.setP_credit(rs.getInt(10));
				product.setSid(rs.getString(11));
			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;

		} finally {
			rs.close();
			ps.close();
			conn.close();
		}
		return product;
	}

	public void updateProductInfo(Product product) throws Exception {

		String sql = "";
		PreparedStatement ps = null;

		try {
			conn = ConnectionFactory.getInstance().makeConnection();

			if (product.getP_name().length() != 0) {
				sql = "UPDATE product SET p_name=? WHERE pid=?;";
				ps = conn.prepareStatement(sql);
				ps.setString(1, product.getP_name());
				ps.setString(2, product.getPid());
				ps.executeUpdate();
				ps.close();
			}

			if (product.getCategory().length() != 0) {
				sql = "UPDATE product SET category=? WHERE pid=?;";
				ps = conn.prepareStatement(sql);
				ps.setString(1, product.getCategory());
				ps.setString(2, product.getPid());
				ps.executeUpdate();
				ps.close();
			}

			sql = "UPDATE product SET p_desc=? WHERE pid=?;";
			ps = conn.prepareStatement(sql);
			ps.setString(1, product.getP_desc());
			ps.setString(2, product.getPid());
			ps.executeUpdate();
			ps.close();

			sql = "UPDATE product SET price=? WHERE pid=?;";
			ps = conn.prepareStatement(sql);
			ps.setDouble(1, product.getPrice());
			ps.setString(2, product.getPid());
			ps.executeUpdate();
			ps.close();

			sql = "UPDATE product SET discount=? WHERE pid=?;";
			ps = conn.prepareStatement(sql);
			ps.setDouble(1, product.getDiscount());
			ps.setString(2, product.getPid());
			ps.executeUpdate();
			ps.close();

			if (product.getP_pic_path().length() != 0) {
				sql = "UPDATE product SET p_pic_path=? WHERE pid=?;";
				ps = conn.prepareStatement(sql);
				ps.setString(1, product.getP_pic_path());
				ps.setString(2, product.getPid());
				ps.executeUpdate();
				ps.close();
			}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			conn.close();
		}
	}

	public void addProductCredit(Product product, int credit) throws Exception {

		String sql = "";
		PreparedStatement ps = null;

		try {
			conn = ConnectionFactory.getInstance().makeConnection();
			conn.setAutoCommit(false);

			
			// 改变商品积分
			sql = "UPDATE product SET p_credit =p_credit+? WHERE pid=?;";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, credit);
			ps.setString(2, product.getPid());
			System.out.println(ps);
			ps.executeUpdate();
			ps.close();

			// 改变商店积分
			/*
			sql = "UPDATE shop SET s_credit =(SELECT AVG(p_credit) FROM product WHERE product.sid=?) WHERE shop.sid=?;";
			ps = conn.prepareStatement(sql);
			ps.setString(1, product.getSid());
			ps.setString(2, product.getSid());
			System.out.println(ps);
			ps.executeUpdate();
			ps.close();
			*/
			
			conn.commit();
		} catch (Exception e) {
			conn.rollback();
			e.printStackTrace();

		} finally {

			conn.close();
		}
	}
}
