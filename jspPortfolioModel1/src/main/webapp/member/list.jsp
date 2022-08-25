<%@page import="utils.Util"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.model.dto.MemberDTO"%>
<%@page import="member.model.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../login/isLoggedIn.jsp" %>

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
	
	MemberDAO dao = new MemberDAO(application);
	ArrayList<MemberDTO> list = dao.getSelectAll(searchField, searchWord);
	int totalCount = list.size();
%>

<h2>회원목록</h2>
<div style="width: 80%;" align="left">
<%	if(searchField.equals("") || searchWord.equals("")) { %>
		* 전체목록 (<%= list.size() %>건)
<%	} else { %>
		* "<%= searchWord %>"으/로 검색된 목록 (<%= list.size() %>건)
<%	} %>
</div>
<form name="searchForm">
<table border="1" width="80%" height="40px;">
	<tr>
		<td align="center">
			<select name="searchField">
				<option value="" <% if(searchField.equals("")) { out.println("selected"); } %>>-- 선택 --</option>
				<option value="id" <% if(searchField.equals("id")) { out.println("selected"); } %>>아이디</option>
				<option value="name" <% if(searchField.equals("name")) { out.println("selected"); } %>>이름</option>
				<option value="grade" <% if(searchField.equals("grade")) { out.println("selected"); } %>>회원등급</option>
			</select>
			<input type="text" name="searchWord" value="<%= searchWord %>">
			<button type="button" onClick="search();">검색</button>
		</td>
	</tr>
</table>
</form>

<table border="1" width="80%">
	<tr>
		<th>순번</th>
		<th>아이디</th>
		<th>이름</th>
		<th>회원등급</th>
		<th>등록일</th>
	</tr>
<%	if(list.isEmpty()) { %>
	<tr>
		<td colspan="5" align="center" height="200px">
		등록된 내용이 없습니다..
		</td>
	</tr>
<%	} else {
		int num = 0;
		for(MemberDTO dto : list) {
			num = totalCount--;
%>	
	<tr align="center">
		<td align="center"><%= num %></td>
		<td><a href="#" onClick="move('member_view', '<%= dto.getNo() %>');"><%= dto.getId() %></a></td>
		<td><%= dto.getName() %></td>
		<td align="center"><%= dto.getGrade() %></td>
		<td align="center"><%= dto.getRegiDate() %></td>
	</tr>
<%
		}
	}
%>
</table>

<div style="width: 80%; margin: 10px 0px;" align="right">
	|
	<a href="#" onClick="location.href='main.jsp?sep=member_list';">목록</a>
	|
	<a href="#" onClick="location.href='main.jsp?sep=member_insert';">등록</a>
	|
</div>

<script>
function move(value1, value2) {
	location.href='main.jsp?sep=' + value1 + '&no=' + value2;
}
function search() {
	document.searchForm.action = "mainProc.jsp?sep=member_listSearch";
	document.searchForm.method = "post";
	document.searchForm.submit();
}
</script>
