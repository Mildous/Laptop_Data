<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("userNo") == null || session.getAttribute("userNo").equals("")) {
		JSFunction.alertLocation("로그인 후 이용바랍니다.", "main.jsp?sep=login_loginPage", out);
	}
%>