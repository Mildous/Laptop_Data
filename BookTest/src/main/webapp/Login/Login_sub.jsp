<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<h2>로그인</h2>
<span style="color: red; font-size: 1.2em;">
	<%= request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg") %>
</span>
<%
	if(session.getAttribute("UserId") == null) {
	// 로그아웃 상태일 때
%>
<script>
function validateForm(form) {
	if(!form.user_id.value) {
		alert("아이디를 입력하세요");
		return false;
	}
	if(form.user_pw.value == "") {
		alert("비밀번호를 입력하세요");
		return false;
	}
} 
</script>
<form action="LoginProc.jsp" method="post" name="loginFrm" onsubmit="return validateForm(this);">
<table border="1" width="40%">
	<tr>
		<th>아이디</th>
		<td><input type="text" name="user_id"></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="user_pw"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="로그인">
		</td>
	</tr>
</table>
</form>
<%	
	} else {
	// 로그인 상태일 때
%>
	<%= session.getAttribute("UserName") %> 회원님, 정상적으로 로그인 되었습니다.<br>
	<a href="Logout.jsp">[로그아웃]</a>
<%		
	}
%>