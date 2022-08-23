<%@page import="utils.JSFunction"%>
<%@page import="model1.bookauthor.BookAuthorDAO"%>
<%@page import="model1.bookauthor.BookAuthorDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 삭제할 authorNo 얻기
	String authorNo_ = request.getParameter("authorNo");
	int authorNo = Integer.parseInt(authorNo_);
	
	// 값을 DTO에 저장
	BookAuthorDTO resultDto = new BookAuthorDTO();
	resultDto.setAuthorNo(authorNo);
	
	// DB에 반영
	BookAuthorDAO dao = new BookAuthorDAO(application);
	int result = dao.setDelete(resultDto);
	dao.close();
	
	// 결과값 반환
	if(result == 1) {
		JSFunction.alertLocation("삭제되었습니다.", "List.jsp", out);
	} else {
		JSFunction.alertBack("삭제에 실패하였습니다.", out);
	}
%>