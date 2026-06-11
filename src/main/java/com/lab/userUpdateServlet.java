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

@WebServlet("/userUpdateServlet")
public class userUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id= request.getParameter("id");
		String uname = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		boolean isTrue;
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		
		isTrue = UserDBUtil.updateUser(id, uname, email, password);
		
		if(isTrue == true) {
			List<User> userDetails = UserDBUtil.getUserDeatails(id);
			
			//request.setAttribute("userDetails", userDetails);
			request.getSession().setAttribute("userDetails", userDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("userAccount.jsp");
			dis.forward(request, response);
		}
		else {
//			out.println("<script type='text/javascript'>");
//			out.println("alert('Update unsuccessful. Please try again.');");
//			out.println("location ='userUpdate.jsp'");
//			out.println("</script>");
			
			out.println("<script type='text/javascript'>");
			out.println("alert('Update unsuccessful. Please try again.');");
			out.println("location='userUpdate.jsp?uid=" + id + "&username=" + uname + "&email=" + email + "&password=" + password + "';");
			out.println("</script>");
		}
		
	}

}