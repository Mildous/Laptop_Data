<%@page import="model1.bookinfo.BookInfoDTO"%>
<%@page import="model1.bookinfo.BookInfoDAO"%>
<%@page import="model1.bookprofile.BookProfileDTO"%>
<%@page import="model1.bookprofile.BookProfileDAO"%>
<%@page import="java.util.*"%>
<%@page import="model1.bookauthor.BookAuthorDTO"%>
<%@page import="model1.bookauthor.BookAuthorDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String infoNo_ = request.getParameter("infoNo");
	int infoNo = Integer.parseInt(infoNo_);
	
	BookInfoDAO dao = new BookInfoDAO(application);
	BookInfoDTO resultDto = dao.getSelectOne(infoNo);
	dao.close();
%>

<h2>상세조회</h2>
<form name="deleteFrom">
<input type="hidden" name="infoNo" value="<%= resultDto.getInfoNo() %>">
<table border="1" width="50%">
	<tr>
		<th>도서명</th>
		<td><%= resultDto.getSubject() %></td>
	</tr>
	<tr>
		<th>저자</th>
		<td><%= resultDto.getAuthorName() %></td>
	</tr>
	<tr>
		<th>발행일</th>
		<td><%= resultDto.getCreated() %></td>
	</tr>
	<tr>
		<th>분류</th>
		<td><%= resultDto.getProfileName() %></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="button" onClick="location.href='Edit.jsp?infoNo=<%= resultDto.getInfoNo() %>';">수정</button>
			<button type="button" onClick="deleteInfo();">삭제</button>
		</td>
	</tr>
</table>
</form>

<script>
function deleteInfo() {
	var confirmed = confirm("정말로 삭제하시겠습니까?");
	if(confirmed) {
		var form = document.deleteFrom;
		form.method = "post";
		form.action = "DeleteProc.jsp";
		form.submit();
	}
}
</script>

<div style="width: 50%; margin-top: 10px; margin-bottom: 10px;">
	<div align="right">
		|
		<a href="#" onClick="location.href='List.jsp';">목록</a>
		|
	</div>
</div>
