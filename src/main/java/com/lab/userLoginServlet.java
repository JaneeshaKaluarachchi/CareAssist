package com.lab;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/userLoginServlet")
public class userLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		boolean isTrue;
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		
		isTrue = UserDBUtil.validate(username, password);
		
		
		
		if(isTrue == true) {
			List<User> uDetails = UserDBUtil.getUser(username, password);
			
			HttpSession session = request.getSession();
			session.setAttribute("userDetails", uDetails);
			
			if (uDetails != null && !uDetails.isEmpty()) {
		        User user = uDetails.get(0);
		        session.setAttribute("uid", user.getId());
		    }
			
			RequestDispatcher dis = request.getRequestDispatcher("dashboardPatient.jsp");
			dis.forward(request, response);
			
		}
		else {
			out.println("<script type='text/javascript'>");
			out.println("alert('your username or password is incorrect.');");
			out.println("location ='userLogin.jsp'");
			out.println("</script>");
			
		}
		
	}

}