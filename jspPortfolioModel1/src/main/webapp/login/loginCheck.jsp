<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int userNo = 0;
	String userId = "";
	String userName = "";
	String userGrade = "";
	String userEmail = "";
	
	if(session.getAttribute("userNo") != null) {
		userNo = (Integer) session.getAttribute("userNo");
		userId = (String) session.getAttribute("userId");
		userName = (String) session.getAttribute("userName");
		userGrade = (String) session.getAttribute("userGrade");
		userEmail = (String) session.getAttribute("userEmail");
	}
%>