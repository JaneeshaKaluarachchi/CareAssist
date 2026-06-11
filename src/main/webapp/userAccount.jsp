<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://fonts.googleapis.com/css?family=Righteous' rel='stylesheet'>
    <link href='https://fonts.googleapis.com/css?family=Saira' rel='stylesheet'>	
    <link rel="stylesheet"  href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
    
    <link rel="stylesheet" href="css/userAccount.css">
    
<title>User profile</title>
</head>
<body>
	
	<jsp:include page="navbarPatient.jsp" />
	
	<table>
	<c:forEach var="user" items="${sessionScope.userDetails}">
	
	<c:set var="id" value="${user.id}"></c:set>
	<c:set var="username" value="${user.username}"></c:set>
	<c:set var="email" value="${user.email}"></c:set>
	<c:set var="password" value="${user.password}"></c:set>
	
	<tr>
	<td>User ID : </td>
	<td>${user.id}</td>
	</tr>
	
	<tr>
	<td>User Name : </td>
	<td>${user.username}</td>
	</tr>
	
	<tr>
	<td>Email : </td>
	<td>${user.email}</td>
	</tr>
	
	<tr>
	<td>Password : </td>
	<td>${user.password}</td>
	</tr>
	
	</c:forEach>
	</table>
	
	<c:url value="userUpdate.jsp" var="updateU">
		<c:param name="uid" value="${id }"></c:param>
		<c:param name="username" value="${username }"></c:param>
		<c:param name="email" value="${email }"></c:param>
		<c:param name="password" value="${password }"></c:param>
	</c:url>
	
	<a href="${updateU}">
	<input type="button" name="update" value="Update My data">
	</a>
	
	<c:url value="userDelete.jsp" var="DeleteU">
		<c:param name="uid" value="${id }"></c:param>
		<c:param name="username" value="${username }"></c:param>
		<c:param name="email" value="${email }"></c:param>
		<c:param name="password" value="${password }"></c:param>
	</c:url>
	<a href="${DeleteU }">
	<input type="button" name="delete" value="Delete my Account">
	</a>
	
	
	
</body>
</html>