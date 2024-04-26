package com.apnaBazar.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.apnaBazar.db_conn.FactoryProvider;
import com.apnaBazar.entities.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/submitForm")
@MultipartConfig
public class register extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String password = req.getParameter("pass");
			String phone = req.getParameter("phone");
			String address = req.getParameter("address");
			
			// Getting image data
			Part filePart = req.getPart("pic");
	        
	        // Get the input stream from the file part
	        InputStream inputStream = filePart.getInputStream();
	        
	        // Read the input stream and store it in a byte array
	        byte[] imgBytes = inputStream.readAllBytes();
	        
	        // Creating user object
	        
	        User user = new User(name, email, password, phone, imgBytes, address, "user");
	        
	        Session session = FactoryProvider.getFactory().openSession();
	        Transaction transaction = session.beginTransaction();
	        
	        session.persist(user);
	        
	        transaction.commit();
	        session.close();
	        
			/*
			 * PrintWriter out = resp.getWriter();
			 * out.println("<h2>User Data Saved...!</h2>"); int id = user.getUserId();
			 * out.print(id);
			 */
	        
	        HttpSession httpsession = req.getSession();
	        httpsession.setAttribute("message", "Registration Successfull.!");
	        resp.sendRedirect("login.jsp");
	        return;
	        
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
