package com.lab;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/userInsertServlet")
public class userInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		boolean isTrue;
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		
		isTrue = UserDBUtil.insertUser(username, email, password);
		
		if(isTrue == true) {
			RequestDispatcher dis = request.getRequestDispatcher("userLogin.jsp");
			dis.forward(request, response);
		}
		else {
			out.println("<script type='text/javascript'>");
			out.println("alert('Registration unsuccessful. Please try again.');");
			out.println("location ='HomePage.jsp'");
			out.println("</script>");
		}
	}

}