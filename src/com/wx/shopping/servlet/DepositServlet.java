package com.wx.shopping.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wx.shopping.dao.UserDao;
import com.wx.shopping.dao.impl.UserDaoImpl;
import com.wx.shopping.model.User;

/**
 * Servlet implementation class DepositServlet
 */
@WebServlet("/DepositServlet")
public class DepositServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DepositServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");// 客户端网页我们控制为UTF-8
			response.setCharacterEncoding("UTF-8");// 通知服务器发送数据时查阅的码表
			response.setContentType("text/html;charset=UTF-8");// 通知浏览器以何种码表打开
			
			UserDao userDao = new UserDaoImpl();
			User user=(User)request.getSession().getAttribute("loginuser");
			double money=Double.parseDouble(request.getParameter("addmoney"));
			
			userDao.addMoney(request.getParameter("uid"), money);
			
			User userNew = userDao.selectByUid(user.getUid());
			request.getSession().setAttribute("loginuser", userNew);
			
			response.sendRedirect(request.getContextPath()+"/depositok.jsp");
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
