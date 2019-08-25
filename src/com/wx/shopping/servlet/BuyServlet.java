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
import com.wx.shopping.model.Indent;
import com.wx.shopping.model.Product;
import com.wx.shopping.model.User;

/**
 * Servlet implementation class BuyServlet
 */
@WebServlet("/BuyServlet")
public class BuyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pid=request.getParameter("pid");
		int num=Integer.parseInt(request.getParameter("num"));
		String cid=(String)request.getSession().getAttribute("cid");
		
		try {
			ProductDao productDao = new ProductDaoImpl();
			Product product = productDao.selectByPid(pid);
			double totalPrice = product.getPrice() * product.getDiscount() * num;
			
			CartDao cartDao=new CartDaoImpl();
			
			Indent indent=new Indent();
			indent.setI_num(num);
			indent.setI_total_price(totalPrice);
			indent.setPid(pid);
			indent.setUid(request.getParameter("uid"));
			
			IndentDao indentDao=new IndentDaoImpl();
			indentDao.insertOneIndent(indent);
			
			if(!cid.equals("no"))
			{
				cartDao.deleteCartByCid(cid);
			}
			UserDao userDao = new UserDaoImpl();
			User userNew = userDao.selectByUid(request.getParameter("uid"));
			request.getSession().setAttribute("loginuser", userNew);
			
			response.sendRedirect(request.getContextPath()+"/buyOk.jsp");
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
