package com.wx.shopping.servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wx.shopping.dao.IndentDao;
import com.wx.shopping.dao.ProductDao;
import com.wx.shopping.dao.ShopDao;
import com.wx.shopping.dao.UserDao;
import com.wx.shopping.dao.impl.IndentDaoImpl;
import com.wx.shopping.dao.impl.ProductDaoImpl;
import com.wx.shopping.dao.impl.ShopDaoImpl;
import com.wx.shopping.dao.impl.UserDaoImpl;
import com.wx.shopping.model.Indent;
import com.wx.shopping.model.Product;
import com.wx.shopping.model.Shop;
import com.wx.shopping.model.User;
import com.wx.shopping.service.IndentService;

/**
 * Servlet implementation class IndentBuyerServlet
 */
@WebServlet("/IndentBuyerServlet")
public class IndentBuyerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public IndentBuyerServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String iid = request.getParameter("iid");
		String op = request.getParameter("op");

		
		try {
			UserDao userDao = new UserDaoImpl();
			IndentDao indentDao = new IndentDaoImpl();
			Indent indent = indentDao.selectByIid(iid);
			ProductDao productDao = new ProductDaoImpl();
			Product product = productDao.selectByPid(indent.getPid());
			ShopDao shopDao=new ShopDaoImpl();
			Shop shop=shopDao.selectBySid(product.getSid());
			
			
			IndentService indentService=new IndentService();
			
			switch (op) {
			case "取消订单":
				indentService.cancelIndent(indent);

				break;
			case "确认收货":
				indentService.assureRecvProduct(shop, indent);

				break;
			case "请求退款":
				indentService.requestRefund(indent);
				break;
			case "删除success":
				indentDao.deleteByIid(iid);
				break;
			case "取消退款":
				indentDao.updateStateByIid(iid, "交易成功");
				break;
			case "删除cancel":
				indentDao.deleteByIid(iid);
				break;

			default:
				break;
			}
			
			User userNew = userDao.selectByUid(indent.getUid());
			request.getSession().setAttribute("loginuser", userNew);

			response.sendRedirect(request.getContextPath() + "/indentBuyer.jsp");
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
