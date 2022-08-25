<%@page import="member.model.dto.MemberDTO"%>
<%@page import="member.model.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_daumApi.jsp" %>

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

<script>
function validateForm(form) {
	if(form.id.value == null || form.id.value == "") {
		alert("아이디를 입력하세요..");
		form.id.focus();
		return false;
	}
	if(form.passwd.value == null || form.passwd.value == "") {
		alert("비밀번호를 입력하세요..");
		form.passwd.focus();
		return false;
	}
	if(form.passwdChk.value == null || form.passwdChk.value == "") {
		alert("비밀번호 확인을 입력하세요..");
		form.passwdChk.focus();
		return false;
	}
	if(form.passwd.value != form.passwdChk.value) {
		alert("비밀번호가 다릅니다. 다시 확인하세요..");
		form.passwdChk.focus();
		return false;
	}
	if(form.name.value == null || form.name.value == "") {
		alert("이름을 입력하세요..");
		form.name.focus();
		return false;
	}
	if(form.email.value == null || form.email.value == "") {
		alert("이메일을 입력하세요..");
		form.email.focus();
		return false;
	}
	if(form.rrn_1.value == null || form.rrn_1.value == "") {
		alert("주민등록번호 앞자리를 입력하세요..");
		form.rrn_1.focus();
		return false;
	}
	if(form.rrn_2.value == null || form.rrn_2.value == "") {
		alert("주민등록번호 뒷자리를 입력하세요..");
		form.rrn_2.focus();
		return false;
	}

	if(form.postCode.value == null || form.postCode.value == "") {
		alert("주소를 입력하세요..");
		form.postCode.focus();
		return false;
	}
}
</script>

<h2>정보수정</h2>
<form name="regiForm" method="post" action="main.jsp?sep=member_editProc" onsubmit="return validateForm(this);">
<input type="hidden" name="no" value="<%= dto.getNo() %>">
<table border="1" align="center" style="margin-bottom: 10px;">
	<tr>
		<td>아이디</td>
		<td><input type="text" name="id" value="<%= dto.getId() %>" readonly></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="passwd"></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" name="name" value="<%= dto.getName() %>" readonly></td>
	</tr>
	<tr>
		<td>연락처</td>
		<td><input type="text" name="phone" value="<%= dto.getPhone() %>"></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type="text" name="email" value="<%= dto.getEmail() %>"></td>
	</tr>
	<tr>
		<td>주민등록번호</td>
		<td>
			<input type="text" name="rrn" value="<%= dto.getRrn().substring(0, 8) %>******" readonly>
		</td>
	</tr>
	<tr>
		<td>주소</td>
		<td>
			<input type="text" id="sample6_postcode" placeholder="우편번호" name="postCode" value="<%= dto.getPostCode() %>" readonly>
			<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" id="sample6_address" placeholder="주소" name="address"value="<%= dto.getAddress() %>" readonly><br>
			<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="detailAddr" value="<%= dto.getDetailAddr() %>">
			<input type="text" id="sample6_extraAddress" placeholder="참고항목" name="extraAddr" value="<%= dto.getExtraAddr() %>" readonly>
		</td>
	</tr>
	<tr>
		<td>회원등급</td>
		<td>
			<input type="radio" name="grade" value="최우수회원" <% if(dto.getGrade().equals("최우수회원")) { out.println("checked"); } %> >최우수회원 &nbsp;
			<input type="radio" name="grade" value="우수회원" <% if(dto.getGrade().equals("우수회원")) { out.println("checked"); } %> >우수회원 &nbsp;
			<input type="radio" name="grade" value="일반회원" <% if(dto.getGrade().equals("일반회원")) { out.println("checked"); } %> >일반회원 &nbsp;
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="submit">수정</button>
			<button type="button" onClick="location.href='main.jsp?sep=member_list';">목록으로</button>
		</td>
	</tr>
</table>
</form>
