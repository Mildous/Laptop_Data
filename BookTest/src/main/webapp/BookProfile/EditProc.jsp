<%@page import="model1.bookprofile.BookProfileDTO"%>
<%@page import="model1.bookprofile.BookProfileDAO"%>
<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 수정 내용 얻기
	String profileNo_ = request.getParameter("profileNo");
	String profileName = request.getParameter("profileName");
	
	int profileNo = Integer.parseInt(profileNo_);
	
	// 값을 DTO에 저장
	BookProfileDTO resultDto = new BookProfileDTO();
	resultDto.setProfileNo(profileNo);
	resultDto.setProfileName(profileName);
	
	// DB에 반영
	BookProfileDAO dao = new BookProfileDAO(application);
	int result = dao.setUpdate(resultDto);
	dao.close();
	
	// 결과값 반환
	if(result == 1) {
		response.sendRedirect("List.jsp");
	} else {
		JSFunction.alertBack("수정에 실패하였습니다.", out);
	}
%>