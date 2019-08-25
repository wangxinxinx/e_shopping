package com.wx.shopping.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wx.shopping.dao.UserDao;
import com.wx.shopping.dao.impl.UserDaoImpl;
import com.wx.shopping.model.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");// 客户端网页我们控制为UTF-8
		response.setCharacterEncoding("UTF-8");// 通知服务器发送数据时查阅的码表
		response.setContentType("text/html;charset=UTF-8");// 通知浏览器以何种码表打开

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		// String returnUri = request.getParameter("return_uri");
		System.out.println("用户名 ==》 " + username);
		System.out.println("密码 ==》 " + password);
		// System.out.println("return uri ==> " + returnUri);

		RequestDispatcher rd = null;

		if (username.equals("") || password.equals("")) {
			/*
			 * request.setAttribute("msg", "用户名或密码为空"); rd =
			 * request.getRequestDispatcher(request.getContextPath()+"login.jsp"
			 * ); rd.forward(request, response);
			 */
			request.getSession().setAttribute("msg", "用户名或密码为空！");
			// request.setAttribute("msg", "用户名或密码错误！");
			response.sendRedirect(request.getContextPath() + "/login.jsp");
		} else {
			try {
				UserDao userDao = new UserDaoImpl();
				User user = userDao.selectByNamePassword(username, password);
				if (user != null) {
					// request.getSession().setAttribute("flag",
					// "login_success");
					request.getSession().setAttribute("loginuser", user);
					response.sendRedirect(request.getContextPath() + "/index.jsp");
				} else {
					// request.getSession().setAttribute("flag", "login_error");
					request.getSession().setAttribute("msg", "用户名或密码错误,请重新登录！");
					// request.setAttribute("msg", "用户名或密码错误！");
					response.sendRedirect(request.getContextPath() + "/login.jsp");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

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
