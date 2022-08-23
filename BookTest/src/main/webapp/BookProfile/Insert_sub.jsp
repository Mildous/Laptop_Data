<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Login/IsLoggedIn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>저자관리</title>
<script type="text/javascript">
//폼 내용 검증
function validateForm(form) {
	if(form.profileName.value == null || form.profileName.value == "") {
		alert("분류명을 입력하세요.");
		return false;
	}
}
</script>
</head>
<body>
<h2>분류등록</h2>
<form name="DirForm" method="post" action="InsertProc.jsp" onsubmit="return validateForm(this);">
<table border="1" width="50%">
	<tr>
		<th>분류명</th>
		<td><input type="text" name="profileName" id="profileName"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="submit">등록</button>
			<button type="button" onClick="location.href='List.jsp';">목록</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>