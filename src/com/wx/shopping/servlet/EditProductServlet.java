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

import com.wx.shopping.dao.ProductDao;
import com.wx.shopping.dao.ShopDao;
import com.wx.shopping.dao.impl.ProductDaoImpl;
import com.wx.shopping.dao.impl.ShopDaoImpl;
import com.wx.shopping.model.Product;
import com.wx.shopping.model.Shop;

/**
 * Servlet implementation class EditProductServlet
 */
@WebServlet("/EditProductServlet")
public class EditProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			DiskFileUpload upload = new DiskFileUpload();
			upload.setSizeThreshold(4096);
			upload.setRepositoryPath("e:/java/upload");
			upload.setSizeMax(10000000);

			List fileItems = upload.parseRequest(request);
			Iterator i = fileItems.iterator();
			Product product = new Product();

			product.setP_name(((FileItem) i.next()).getString());
			product.setCategory(((FileItem) i.next()).getString());
			product.setP_desc(((FileItem) i.next()).getString());
			product.setPrice(Double.parseDouble(((FileItem) i.next()).getString()));
			product.setDiscount(Double.parseDouble(((FileItem) i.next()).getString()));

			FileItem fi = (FileItem) i.next();
			String fileName = fi.getName();
			System.out.println(fileName);
			if (!fileName.equals("")) {
				fileName = fileName.replace(':', '_');
				fileName = fileName.replace('\\', '_');
				System.out.println(fileName);

				File savedFile = new File("e:/java/projects/shopping/WebContent/images/product/", fileName);
				// File savedFile = new File("e:/java/upload/", fileName);
				fi.write(savedFile);

				product.setP_pic_path("/images/product/" + fileName);
			} else {
				product.setP_pic_path("");
			}

			product.setPid(((FileItem) i.next()).getString());

			ProductDao productDao = new ProductDaoImpl();
			productDao.updateProductInfo(product);

			response.sendRedirect(request.getContextPath() + "/enterShop.jsp?sid="+((FileItem) i.next()).getString());
		} catch (FileUploadException e) {
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
