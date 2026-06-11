package com.lab;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/userDeleteServlet")
public class userDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("uid");
		
		boolean isTrue;
		
		isTrue = UserDBUtil.DeleteUser(id);
		
		if(isTrue == true) {
			RequestDispatcher dis = request.getRequestDispatcher("HomePage.jsp");
			dis.forward(request, response);
			
		}
		else {
			
			List<User> userDetails = UserDBUtil.getUserDeatails(id);
			request.getSession().setAttribute("userDetails", userDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("userAccount.jsp");
			dis.forward(request, response);
		}
	}

}
