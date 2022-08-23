<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("UserId") == null) {
		JSFunction.alertLocation("로그인 후 이용바랍니다.", "../Login/Login.jsp", out);
		return;
	}
%>