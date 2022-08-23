<%@page import="utils.JSFunction"%>
<%@page import="model1.bookauthor.BookAuthorDAO"%>
<%@page import="model1.bookauthor.BookAuthorDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 수정 내용 얻기
	String authorNo_ = request.getParameter("authorNo");
	String authorName = request.getParameter("authorName");
	
	int authorNo = Integer.parseInt(authorNo_);
	
	// 값을 DTO에 저장
	BookAuthorDTO resultDto = new BookAuthorDTO();
	resultDto.setAuthorNo(authorNo);
	resultDto.setAuthorName(authorName);
	
	// DB에 반영
	BookAuthorDAO dao = new BookAuthorDAO(application);
	int result = dao.setUpdate(resultDto);
	dao.close();
	
	// 결과값 반환
	if(result == 1) {
		response.sendRedirect("List.jsp");
	} else {
		JSFunction.alertBack("수정에 실패하였습니다.", out);
	}
%>