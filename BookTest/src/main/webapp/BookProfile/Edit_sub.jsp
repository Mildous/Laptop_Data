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

<script type="text/javascript">
//폼 내용 검증
function validateForm(form) {
	if(form.profileName.value == null || form.profileName.value == "") {
		alert("분류명을 입력하세요.");
		return false;
	}
}
</script>

<h2>저자수정</h2>
<form name="DirForm" method="post" action="EditProc.jsp" onsubmit="return validateForm(this);">
<input type="hidden" name="profileNo" value="<%= resultDto.getProfileNo() %>">
<table border="1" width="50%">
	<tr>
		<th>저자명</th>
		<td><input type="text" name="profileName" id="profileName" value="<%= resultDto.getProfileName() %>"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="submit">수정</button>
			<button type="button" onClick="location.href='List.jsp';">목록</button>
		</td>
	</tr>
</table>
</form>
