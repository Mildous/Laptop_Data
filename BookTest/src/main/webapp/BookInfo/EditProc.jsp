<%@page import="java.sql.Date"%>
<%@page import="model1.bookinfo.BookInfoDAO"%>
<%@page import="model1.bookinfo.BookInfoDTO"%>
<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 폼값 받기;
	String infoNo_ = request.getParameter("infoNo");
	String subject = request.getParameter("subject");
	String created_ = request.getParameter("created");
	String authorNo_ = request.getParameter("authorNo");
	String profileNo_ = request.getParameter("profileNo");
	
	int infoNo = Integer.parseInt(infoNo_);
	Date created = Date.valueOf(created_);
	int authorNo = Integer.parseInt(authorNo_);
	int profileNo = Integer.parseInt(profileNo_);
	
	// 폼값을 DTO 객체에 저장
	BookInfoDTO resultDto = new BookInfoDTO();
	resultDto.setInfoNo(infoNo);
	resultDto.setSubject(subject);
	resultDto.setCreated(created);
	resultDto.setAuthorNo(authorNo);
	resultDto.setProfileNo(profileNo);
	
	// DAO 객체를 통해 DB에 DTO 저장
	BookInfoDAO dao = new BookInfoDAO(application);
	int result = dao.setUpdate(resultDto);
	dao.close();
	
	// 결과값 반환
	if(result == 1) {
		response.sendRedirect("View.jsp?infoNo=" + resultDto.getInfoNo());
	} else {
		JSFunction.alertBack("수정에 실패하였습니다.", out);
	}
%>