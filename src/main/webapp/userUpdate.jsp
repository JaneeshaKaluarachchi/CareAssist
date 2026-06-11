<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update user details</title>
</head>
<body>
	 <%
	 	String id = request.getParameter("uid");
	 	String username = request.getParameter("username");
	 	String email = request.getParameter("email");
	 	String password = request.getParameter("password");
	 %>
	
	<form action="update" method="post">
		User Id <input type="text" name="id" value="<%=id %>" readonly>
		User Name <input type="text" name="username" value="<%=username %>">
		Email <input type="email" name="email" value="<%=email %>">
		Password <input type="text" name="password" value="<%=password %>">
		
		<input type="submit" name="submit" value="Update my data">
	</form>
	
</body>
</html>