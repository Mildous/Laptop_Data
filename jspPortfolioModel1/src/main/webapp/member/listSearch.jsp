<%@page import="utils.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	
	Util util = new Util();
	searchField = util.getNullBlankCheck(searchField, "");
	searchWord = util.getNullBlankCheck(searchWord, "");
	
	if(searchField.equals("") || searchWord.equals("")) {
		searchField = "";
		searchWord = "";
	}
	
%>
<script>
function move() {
	location.href='main.jsp?sep=member_list&searchField=<%= searchField %>&searchWord=<%= searchWord %>';
}
move();
</script>