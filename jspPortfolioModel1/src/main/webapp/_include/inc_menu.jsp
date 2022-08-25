<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../_include/inc_header.jsp" %>
<%@ include file="../login/loginCheck.jsp" %>

<table align="center" width="80%">
	<tr>
		<td colspan="7" align="right" style="padding: 0px 10px 10px 0px;">
		<%	if(userNo == 0) { %>
			<a href="main.jsp?sep=login_loginPage">[로그인]</a>
		<%	} else { %>
			<%= userGrade %> <%= userName %>님, 환영합니다.
			<a href="main.jsp?sep=login_logout">[로그아웃]</a>
		<%	} %>
		</td>
	</tr>
	<tr>
		<td align="center" style="padding: 10px;" id="home">
			<a href="<%= path %>">HOME</a>
		</td>
		<td align="center" style="padding: 10px;" id="member">
			<a href="<%= path %>/main/main.jsp?sep=member_list">회원관리</a>
		</td>
		<td align="center" style="padding: 10px;" id="">
			<a href="<%= path %>/main/main.jsp?sep=">메뉴2</a>
		</td>
		<td align="center" style="padding: 10px;" id="">
			<a href="<%= path %>/main/main.jsp?sep=">메뉴3</a>
		</td>
		<td align="center" style="padding: 10px;" id="">
			<a href="<%= path %>/main/main.jsp?sep=">메뉴4</a>
		</td>
		<td align="center" style="padding: 10px;" id="">
			<a href="<%= path %>/main/main.jsp?sep=">메뉴5</a>
		</td>
	</tr>
</table>

<script>
function applyMenuId() {
	$("#<%= folderName %>").css("background-color", "lightgray");
}
applyMenuId();
</script>