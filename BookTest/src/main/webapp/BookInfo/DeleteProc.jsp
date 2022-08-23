<%@page import="utils.JSFunction"%>
<%@page import="model1.bookinfo.BookInfoDTO"%>
<%@page import="model1.bookinfo.BookInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Login/IsLoggedIn.jsp" %>
<%
	// 삭제할 infoNo 얻기
	String infoNo_ = request.getParameter("infoNo");
	int infoNo = Integer.parseInt(infoNo_);
	
	// 값을 DTO에 저장
	BookInfoDTO resultDto = new BookInfoDTO();
	resultDto.setInfoNo(infoNo);
	
	// DB에 반영
	BookInfoDAO dao = new BookInfoDAO(application);
	int result = dao.setDelete(resultDto);
	dao.close();
	
	// 결과값 반환
	if(result == 1) {
		JSFunction.alertLocation("삭제되었습니다.", "List.jsp", out);
	} else {
		JSFunction.alertBack("삭제에 실패하였습니다.", out);
	}
%>