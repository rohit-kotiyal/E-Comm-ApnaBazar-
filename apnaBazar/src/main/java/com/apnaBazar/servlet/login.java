package com.apnaBazar.servlet;

import java.io.IOException;

import com.apnaBazar.database.UserData;
import com.apnaBazar.db_conn.FactoryProvider;
import com.apnaBazar.entities.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class login extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String email = req.getParameter("email");
			String pass = req.getParameter("pass");
			
			// Authenticating User
			
			UserData data = new UserData(FactoryProvider.getFactory());
			User user = data.getData(email, pass);
			
			HttpSession httpsession = req.getSession();
	        
			if(user != null) {
				
				httpsession.setAttribute("current-user", user);
				
				// Admin Login
				if(user.getUserType().equals("admin")) {
					resp.sendRedirect("AdminLogin.jsp");
					return;
				}
			
				// User Login	
				/* httpsession.setAttribute("message", "Login Successfull"); */
				 resp.sendRedirect("index.jsp"); 
				 return;
				 
			}else {
				httpsession.setAttribute("message", "Login Failed, wrong email or password");
				resp.sendRedirect("login.jsp");
				return;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
