<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();
	
	out.println("<script>");
	out.println("location.href='main.jsp?sep=member_list';");
	out.println("</script>");
%>