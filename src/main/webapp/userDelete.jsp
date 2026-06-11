<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	 	String id = request.getParameter("uid");
	 	String username = request.getParameter("username");
	 	String email = request.getParameter("email");
	 	String password = request.getParameter("password");
	 %>
	 
	 <h1>User Account Delete</h1>
	
	<form action="delete" method="post">
		User Id <input type="text" name="uid" value="<%=id %>" readonly><br>
		User Name <input type="text" name="username" value="<%=username %>" readonly><br>
		Email <input type="email" name="email" value="<%=email %>" readonly><br>
		Password <input type="text" name="password" value="<%=password %>" readonly><br>
		
		<input type="submit" name="delete" value="Delete Account">
	</form>


</body>
</html>