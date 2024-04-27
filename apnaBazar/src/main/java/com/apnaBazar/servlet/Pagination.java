package com.apnaBazar.servlet;

import java.io.IOException;
import java.util.List;

import com.apnaBazar.database.ProductData;
import com.apnaBazar.db_conn.FactoryProvider;
import com.apnaBazar.entities.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class Pagination extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

	ProductData pdata = new ProductData(FactoryProvider.getFactory());
		
		List<Product> pList = pdata.getAllProducts();
		
		// Total number of pages
		int totalProducts = pList.size();
		int productPerPage = 9;
		int totalPages = (int) Math.ceil((double) totalProducts / productPerPage);

		
		// Calculate starting index and ending index for the subset of products
		int currentPage = 1; // Assuming the default page is 1
		int startIndex = (currentPage - 1) * productPerPage;
		int endIndex = Math.min(startIndex + productPerPage, totalProducts);
		
		// Get the subset of products for the current page
		List<Product> subsetProducts = pList.subList(startIndex, endIndex);

		// Set attributes to pass to the JSP
		req.setAttribute("subsetProducts", subsetProducts);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("totalPages", totalPages);
		
	}
}
