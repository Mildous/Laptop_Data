<%@page import="model1.bookauthor.BookAuthorDTO"%>
<%@page import="model1.bookauthor.BookAuthorDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Login/IsLoggedIn.jsp" %>
<%
	String authorNo_ = request.getParameter("authorNo");
	int authorNo = Integer.parseInt(authorNo_);
	
	BookAuthorDAO dao = new BookAuthorDAO(application);
	BookAuthorDTO resultDto = dao.getSelectOne(authorNo);
	
	dao.close();
%>
<script>
function deleteAuthor() {
	var confirmed = confirm("정말로 삭제하시겠습니까?");
	if(confirmed) {
		var form = document.deleteForm;
		form.method = "post";
		form.action = "DeleteProc.jsp";
		form.submit();
	}
}
</script>

<h2>저자정보 삭제</h2>
<form name="deleteForm">
<input type="hidden" name="authorNo" value="<%= resultDto.getAuthorNo() %>">
<table border="1" width="50%">
	<tr>
		<th>저자명</th>
		<td align="center"><%= resultDto.getAuthorName() %></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="button" onClick="deleteAuthor();">삭제</button>
			<button type="button" onClick="location.href='List.jsp';">목록</button>
		</td>
	</tr>
</table>
</form>