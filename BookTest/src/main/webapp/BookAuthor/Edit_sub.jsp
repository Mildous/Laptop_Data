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

<script type="text/javascript">
//폼 내용 검증
function validateForm(form) {
	if(form.authorName.value == null || form.authorName.value == "") {
		alert("저자명을 입력하세요.");
		return false;
	}
}
</script>

<h2>저자수정</h2>
<form name="DirForm" method="post" action="EditProc.jsp" onsubmit="return validateForm(this);">
<input type="hidden" name="authorNo" value="<%= resultDto.getAuthorNo() %>">
<table border="1" width="50%">
	<tr>
		<th>저자명</th>
		<td><input type="text" name="authorName" id="authorName" value="<%= resultDto.getAuthorName() %>"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="submit">수정</button>
			<button type="button" onClick="location.href='List.jsp';">목록</button>
		</td>
	</tr>
</table>
</form>
