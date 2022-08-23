<%@page import="utils.JSFunction"%>
<%@page import="model1.bookauthor.BookAuthorDAO"%>
<%@page import="model1.bookauthor.BookAuthorDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 폼값 받기
	String authorName = request.getParameter("authorName");
	
	// 폼값을 DTO 객체에 저장
	BookAuthorDTO resultDto = new BookAuthorDTO();
	resultDto.setAuthorName(authorName);
	
	// DAO 객체를 통해 DB에 DTO 저장
	BookAuthorDAO dao = new BookAuthorDAO(application);
	int result = dao.setInsert(resultDto);
	dao.close();
	
	// 결과값 반환
	if(result == 1) {
		response.sendRedirect("List.jsp");
	} else {
		JSFunction.alertBack("등록에 실패하였습니다.", out);
	}
%>