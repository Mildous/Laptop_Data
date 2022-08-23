<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 로그인 폼에서 받은 id, passwd
	String userId = request.getParameter("user_id");
	String userPw = request.getParameter("user_pw");
	
	// web.xml에서 가져온 데이터베이스 연결 정보
	String oracleDriver = application.getInitParameter("OracleDriver");
	String oracleUrl = application.getInitParameter("OracleUrl");
	String oracleId = application.getInitParameter("OracleId");
	String oraclePw = application.getInitParameter("OraclePw");
	
	// MemberDAO를 통해 회원 정보 DTO 얻어오기
	MemberDAO dao = new MemberDAO(oracleDriver, oracleUrl, oracleId, oraclePw);
	MemberDTO resultDto = dao.getMemberDTO(userId, userPw);
	dao.close();
	
	// 로그인 성공 여부 처리
	if(resultDto.getId() != null) {
		// 로그인 성공
		session.setAttribute("UserId", resultDto.getId());
		session.setAttribute("UserName", resultDto.getName());
		response.sendRedirect("Login.jsp");	
	} else {
		// 로그인 실패
		request.setAttribute("LoginErrMsg", "로그인 오류");
		request.getRequestDispatcher("Login.jsp").forward(request, response);
	}
%>