<%@page import="model1.bookprofile.BookProfileDTO"%>
<%@page import="model1.bookprofile.BookProfileDAO"%>
<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 폼값 받기
	String profileName = request.getParameter("profileName");
	
	// 폼값을 DTO 객체에 저장
	BookProfileDTO resultDto = new BookProfileDTO();
	resultDto.setProfileName(profileName);
	
	// DAO 객체를 통해 DB에 DTO 저장
	BookProfileDAO dao = new BookProfileDAO(application);
	int result = dao.setInsert(resultDto);
	dao.close();
	
	// 결과값 반환
	if(result == 1) {
		response.sendRedirect("List.jsp");
	} else {
		JSFunction.alertBack("등록에 실패하였습니다.", out);
	}
%>