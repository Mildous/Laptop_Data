<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath();
	
	String sep = request.getParameter("sep");
	
	if(sep == null || sep.trim().equals("")) {
		sep = "member_list";
		
		return;
	}
	
	String[] sepArray = sep.split("_");
	String folderName = sepArray[0];
	String fileName = sepArray[1];
	String includePage = "../" + folderName + "/" + fileName + ".jsp";
%>