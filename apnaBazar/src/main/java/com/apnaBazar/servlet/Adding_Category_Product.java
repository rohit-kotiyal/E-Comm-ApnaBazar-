package com.apnaBazar.servlet;

import java.io.IOException;
import java.io.InputStream;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.apnaBazar.database.CategoryData;
import com.apnaBazar.database.ProductData;
import com.apnaBazar.db_conn.FactoryProvider;
import com.apnaBazar.entities.Category;
import com.apnaBazar.entities.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/Add_Category_Product")
@MultipartConfig
public class Adding_Category_Product extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// Fetching Data 
		String operation = req.getParameter("operation");
		
		// Fetching Data --> Category
		if(operation.trim().equals("category")) {
			
			String title = req.getParameter("catTitle");
			String description = req.getParameter("catDesc");
			
			Category category = new Category();
			category.setCategoryTitle(title);
			category.setCategoryDescripion(description);
			
			CategoryData categoryData = new CategoryData(FactoryProvider.getFactory());
			categoryData.saveCategory(category);
		}
		// Fetching Data --> Product
		else if(operation.trim().equals("product")){
			
			int price = Integer.parseInt(req.getParameter("price"));
			int discount = Integer.parseInt(req.getParameter("discount"));
			int quantity = Integer.parseInt(req.getParameter("quantity"));
			String name = req.getParameter("name");
			String description = req.getParameter("proDesc");
			int catId =  Integer.parseInt(req.getParameter("catId")); 
			
			// Getting image data
			Part filePart = req.getPart("pic");
				        
			// Get the input stream from the file part
			InputStream inputStream = filePart.getInputStream();
				        
			// Read the input stream and store it in a byte array
			byte[] imgBytes = inputStream.readAllBytes();
			
			Product product = new Product();
			product.setProductPrice(price);
			product.setProductDiscount(discount);
			product.setProductQuantity(quantity);
			product.setProductName(name);
			product.setProductDescription(description);
			product.setProductPhoto(imgBytes);
			
			// getting category by Id
			CategoryData categoryData = new CategoryData(FactoryProvider.getFactory());
			Category category = categoryData.getCategorybyId(catId);
			
			product.setCategory(category);
			
			// save product
			
			ProductData productData = new ProductData(FactoryProvider.getFactory());
			boolean res = productData.saveProduct(product);
			HttpSession httpsession = req.getSession();
			if(res) {
		        httpsession.setAttribute("message", "Product Added Successfully");
				resp.sendRedirect("AdminLogin.jsp");
				return;
			}else {
				httpsession.setAttribute("message", "Failed to Add Product");
				resp.sendRedirect("AdminLogin.jsp");
				return;
			}
			
		}else {
			return;
		}
		
		
		HttpSession httpSession = req.getSession();
		httpSession.setAttribute("message", "Category Successfully Added");
		resp.sendRedirect("AdminLogin.jsp");
		return;
	}
}
