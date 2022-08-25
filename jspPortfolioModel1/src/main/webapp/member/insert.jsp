<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_daumApi.jsp" %>

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

<h2>회원등록</h2>

<form name="regiForm" method="post" action="main.jsp?sep=member_insertProc" onsubmit="return validateForm(this);">
<table border="1" align="center" style="margin-bottom: 10px;">
	<tr>
		<td>아이디</td>
		<td><input type="text" name="id"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="passwd"></td>
	</tr>
	<tr>
		<td>비밀번호 확인</td>
		<td><input type="password" name="passwdChk"></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td>연락처</td>
		<td><input type="text" name="phone"></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type="text" name="email"></td>
	</tr>
	<tr>
		<td>주민등록번호</td>
		<td>
			<input type="text" name="rrn_1" style="width: 60px;">
			-
			<input type="password" name="rrn_2" style="width: 60px;">
		</td>
	</tr>
	<tr>
		<td>주소</td>
		<td>
			<input type="text" id="sample6_postcode" placeholder="우편번호" name="postCode" readonly>
			<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" id="sample6_address" placeholder="주소" name="address" readonly><br>
			<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="detailAddr">
			<input type="text" id="sample6_extraAddress" placeholder="참고항목" name="extraAddr" readonly>
		</td>
	</tr>
	<tr>
		<td>회원등급</td>
		<td>
			<input type="radio" name="grade" value="최우수회원">최우수회원 &nbsp;
			<input type="radio" name="grade" value="우수회원">우수회원 &nbsp;
			<input type="radio" name="grade" value="일반회원" checked>일반회원 &nbsp;
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="submit">등록</button>
			<button type="button" onClick="location.href='main.jsp?sep=member_list';">목록으로</button>
		</td>
	</tr>
</table>
</form>