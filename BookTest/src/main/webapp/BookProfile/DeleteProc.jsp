<%@page import="model1.bookprofile.BookProfileDAO"%>
<%@page import="model1.bookprofile.BookProfileDTO"%>
<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 삭제할 profileNo 얻기
	String profileNo_ = request.getParameter("profileNo");
	int profileNo = Integer.parseInt(profileNo_);
	
	// 값을 DTO에 저장
	BookProfileDTO resultDto = new BookProfileDTO();
	resultDto.setProfileNo(profileNo);
	
	// DB에 반영
	BookProfileDAO dao = new BookProfileDAO(application);
	int result = dao.setDelete(resultDto);
	dao.close();
	
	// 결과값 반환
	if(result == 1) {
		JSFunction.alertLocation("삭제되었습니다.", "List.jsp", out);
	} else {
		JSFunction.alertBack("삭제에 실패하였습니다.", out);
	}
%>