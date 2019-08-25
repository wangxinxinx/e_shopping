package com.wx.shopping.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wx.shopping.dao.CartDao;
import com.wx.shopping.dao.IndentDao;
import com.wx.shopping.dao.ProductDao;
import com.wx.shopping.dao.UserDao;
import com.wx.shopping.dao.impl.CartDaoImpl;
import com.wx.shopping.dao.impl.IndentDaoImpl;
import com.wx.shopping.dao.impl.ProductDaoImpl;
import com.wx.shopping.dao.impl.UserDaoImpl;
import com.wx.shopping.model.Cart;
import com.wx.shopping.model.Indent;
import com.wx.shopping.model.Product;
import com.wx.shopping.model.User;

/**
 * Servlet implementation class BuyCartProductsServlet
 */
@WebServlet("/BuyCartProductsServlet")
public class BuyCartProductsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BuyCartProductsServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String[] cids = (String[])request.getSession().getAttribute("cids");
		try {
			ProductDao productDao = new ProductDaoImpl();
			CartDao cartDao = new CartDaoImpl();
			Indent indent = new Indent();
			IndentDao indentDao = new IndentDaoImpl();
			
			Cart cart;
			Product product;
			double totalPrice;
			
			for (int i = 0; i < cids.length; i++) {
				
				cart = cartDao.selectByCid(cids[i]);
				product = productDao.selectByPid(cart.getPid());
				totalPrice= product.getPrice() * product.getDiscount() * cart.getC_num();	
				
				//插入新订单
				indent.setI_num(cart.getC_num());
				indent.setI_total_price(totalPrice);
				indent.setPid(cart.getPid());
				indent.setUid(cart.getUid());
				indentDao.insertOneIndent(indent);
				
				//删除购物车里的东西
				cartDao.deleteCartByCid(cids[i]);
			}
			UserDao userDao = new UserDaoImpl();
			User userNew = userDao.selectByUid(request.getParameter("uid"));
			request.getSession().setAttribute("loginuser", userNew);

			response.sendRedirect(request.getContextPath() + "/buyOk.jsp");
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
