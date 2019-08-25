package com.wx.shopping.servlet;

import java.io.*;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.*;

import com.wx.shopping.dao.UserDao;
import com.wx.shopping.dao.impl.UserDaoImpl;
import com.wx.shopping.model.User;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterServlet() {
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
			User user = new User();

			user.setUsername(((FileItem) i.next()).getString());
			user.setPassword(((FileItem) i.next()).getString());
			i.next();
			user.setRecv_name(((FileItem) i.next()).getString());
			user.setTel(((FileItem) i.next()).getString());
			user.setPostcode(((FileItem) i.next()).getString());
			user.setAddress(((FileItem) i.next()).getString());

			FileItem fi = (FileItem) i.next();
			String fileName = fi.getName();
			System.out.println(fileName);
			if (!fileName.equals("")) {
				fileName = fileName.replace(':', '_');
				fileName = fileName.replace('\\', '_');
				System.out.println(fileName);

				File savedFile = new File("e:/java/projects/shopping/WebContent/images/user/", fileName);
				// File savedFile = new File("e:/java/upload/", fileName);
				fi.write(savedFile);

				user.setU_pic_path("/images/user/" + fileName);
			}
			else
			{
				user.setU_pic_path("");
			}
			
			user.setEmail(((FileItem) i.next()).getString());
			user.setSex(((FileItem) i.next()).getString());
			user.setBirthday(((FileItem) i.next()).getString());

			UserDao userDao = new UserDaoImpl();
			userDao.insertOneUser(user);
			
			response.sendRedirect(request.getContextPath()+"/regok.jsp");
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
