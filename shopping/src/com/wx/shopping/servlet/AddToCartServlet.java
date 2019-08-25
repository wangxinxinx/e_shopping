package com.wx.shopping.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wx.shopping.dao.CartDao;
import com.wx.shopping.dao.ProductDao;
import com.wx.shopping.dao.UserDao;
import com.wx.shopping.dao.impl.CartDaoImpl;
import com.wx.shopping.dao.impl.ProductDaoImpl;
import com.wx.shopping.dao.impl.UserDaoImpl;
import com.wx.shopping.model.Cart;
import com.wx.shopping.model.Product;
import com.wx.shopping.model.User;

/**
 * Servlet implementation class addToCartServlet
 */
@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String pid=request.getParameter("pid");
			int num=Integer.parseInt(request.getParameter("num"));
			
			ProductDao productDao=new ProductDaoImpl();
			Product product=productDao.selectByPid(pid);
			double totalPrice=product.getPrice()*product.getDiscount()*num;
			productDao.addProductCredit(product, 1);
			
			Cart cart=new Cart();			
			cart.setPid(pid);
			cart.setUid(request.getParameter("uid"));
			cart.setC_num(num);
			cart.setC_total_price(totalPrice);
			
			CartDao cartDao=new CartDaoImpl();
			cartDao.insertOneCart(cart);
			
			
			
			response.sendRedirect(request.getContextPath()+"/myCart.jsp");
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
