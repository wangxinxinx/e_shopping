package com.wx.shopping.servlet;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;

import com.wx.shopping.dao.ShopDao;
import com.wx.shopping.dao.UserDao;
import com.wx.shopping.dao.impl.ShopDaoImpl;
import com.wx.shopping.dao.impl.UserDaoImpl;
import com.wx.shopping.model.Shop;
import com.wx.shopping.model.User;

/**
 * Servlet implementation class EditShopServlet
 */
@WebServlet("/EditShopServlet")
public class EditShopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditShopServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			DiskFileUpload upload = new DiskFileUpload();
			upload.setSizeThreshold(4096);
			upload.setRepositoryPath("e:/java/upload");
			upload.setSizeMax(10000000);

			List fileItems = upload.parseRequest(request);
			Iterator i = fileItems.iterator();
			Shop shop = new Shop();

			shop.setS_name(((FileItem) i.next()).getString());
			shop.setS_desc(((FileItem) i.next()).getString());

			FileItem fi = (FileItem) i.next();
			String fileName = fi.getName();
			System.out.println(fileName);
			if (!fileName.equals("")) {
				fileName = fileName.replace(':', '_');
				fileName = fileName.replace('\\', '_');
				System.out.println(fileName);

				File savedFile = new File("e:/java/projects/shopping/WebContent/images/shop/", fileName);
				// File savedFile = new File("e:/java/upload/", fileName);
				fi.write(savedFile);

				shop.setS_pic_path("/images/shop/" + fileName);
			} else {
				shop.setS_pic_path("");
			}

			shop.setSid(((FileItem) i.next()).getString());

			ShopDao shopDao = new ShopDaoImpl();
			shopDao.updateShopInfo(shop);

			response.sendRedirect(request.getContextPath() + "/myShop.jsp");
		} catch (FileUploadException e) {
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
