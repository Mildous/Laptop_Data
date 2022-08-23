<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	|
	<a href="../Login/Login.jsp">Home</a>
	|
<% if(session.getAttribute("UserId") == null) { %>
	<a href="../Login/Login.jsp">로그인</a>
<% } else { %>
	<a href="../Login/Logout.jsp">로그아웃</a>
<% } %>
	|
	<a href="../BookInfo/List.jsp">도서관리</a>
	|
	<a href="../BookAuthor/List.jsp">저자관리</a>
	|
	<a href="../BookProfile/List.jsp">분류관리</a>
	|
</body>
</html>