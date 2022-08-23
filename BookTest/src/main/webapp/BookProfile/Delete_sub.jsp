<%@page import="model1.bookprofile.BookProfileDTO"%>
<%@page import="model1.bookprofile.BookProfileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Login/IsLoggedIn.jsp" %>
<%
	String profileNo_ = request.getParameter("profileNo");
	int profileNo = Integer.parseInt(profileNo_);
	
	BookProfileDAO dao = new BookProfileDAO(application);
	BookProfileDTO resultDto = dao.getSelectOne(profileNo);
	
	dao.close();
%>
<script>
function deleteProfile() {
	var confirmed = confirm("정말로 삭제하시겠습니까?");
	if(confirmed) {
		var form = document.deleteForm;
		form.method = "post";
		form.action = "DeleteProc.jsp";
		form.submit();
	}
}
</script>

<h2>분류 삭제</h2>
<form name="deleteForm">
<input type="hidden" name="profileNo" value="<%= resultDto.getProfileNo() %>">
<table border="1" width="50%">
	<tr>
		<th>분류명</th>
		<td align="center"><%= resultDto.getProfileName() %></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="button" onClick="deleteProfile();">삭제</button>
			<button type="button" onClick="location.href='List.jsp';">목록</button>
		</td>
	</tr>
</table>
</form>