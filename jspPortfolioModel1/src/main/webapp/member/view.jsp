<%@page import="member.model.dao.MemberDAO"%>
<%@page import="member.model.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../login/isLoggedIn.jsp" %>

<%
	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);

	MemberDAO dao = new MemberDAO(application);
	MemberDTO dto = dao.getSelectOne(no);
	
	if(dto.getNo() <= 0) {
		out.println("<script>alert('존재하지 않는 회원입니다.'); location.href='main.jsp?sep=member_list';</script>");
		return;
	}
%>

<h2>회원정보</h2>
<table border="1" align="center" style="margin-bottom: 10px;">
	<tr>
		<th>아이디</th>
		<td><%= dto.getId() %></td>
		<th>회원등급</th>
		<td><%= dto.getGrade() %></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><%= dto.getName() %></td>
		<th>주민등록번호</th>
		<td><%= dto.getRrn().substring(0, 8) %>******</td>
	</tr>
	<tr>
		<th>연락처</th>
		<td><%= dto.getPhone() %></td>
		<th>이메일</th>
		<td><%= dto.getEmail() %></td>
	</tr>
	<tr>
		<th>주소</th>
		<td colspan="3">(<%= dto.getPostCode() %>) <%= dto.getAddress() %> <%= dto.getDetailAddr() %> <%= dto.getExtraAddr() %></td>
	</tr>
	<tr>
		<td colspan="4" align="center">
			<button type="button" onClick="move('member_edit', '<%= dto.getNo() %>');">수정</button>
			<button type="button" onClick="move('member_delete', '<%= dto.getNo() %>');">삭제</button>
		</td>
	</tr>
</table>

<div style="padding-top: 20px; width: 80%; " align="right">
	|
	<a href="#" onClick="move('member_list', '');">목록</a>
	|
</div>

<script>
function move(value1, value2) {
	location.href='main.jsp?sep=' + value1 + '&no=' + value2;
}
</script>