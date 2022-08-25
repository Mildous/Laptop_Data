<%@page import="member.model.dto.MemberDTO"%>
<%@page import="member.model.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = request.getParameter("user_id");
	String userPw = request.getParameter("user_pw");
	
	MemberDAO dao = new MemberDAO(application);
	MemberDTO resultDto = dao.getLogin(userId, userPw);
	
	if(resultDto.getId() != null) {
		session.setAttribute("userNo", resultDto.getNo());
		session.setAttribute("userId", resultDto.getId());
		session.setAttribute("userPw", resultDto.getPasswd());
		session.setAttribute("userName", resultDto.getName());
		session.setAttribute("userGrade", resultDto.getGrade());
		session.setAttribute("userEmail", resultDto.getEmail());
		out.println("<script>");
		out.println("location.href='main.jsp?sep=login_loginPage';");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('등록된 정보가 없거나, 정보가 일치하지 않습니다.\\n확인 후 다시 로그인 바랍니다.');");
		out.println("location.href='main.jsp?sep=login_loginPage';");
		out.println("</script>");
	}
%>