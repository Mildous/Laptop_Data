<%@page import="member.model.dao.MemberDAO"%>
<%@page import="member.model.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String rrn_1 = request.getParameter("rrn_1");
	String rrn_2 = request.getParameter("rrn_2");
	String postCode = request.getParameter("postCode");
	String address = request.getParameter("address");
	String detailAddr = request.getParameter("detailAddr");
	String extraAddr = request.getParameter("extraAddr");
	String grade = request.getParameter("grade");
	
	String rrn = rrn_1 + "-" + rrn_2;
	
	if(extraAddr == null || extraAddr.trim().equals("")) {
		extraAddr = "-";
	}
	
	MemberDTO resultDto = new MemberDTO();
	resultDto.setId(id);
	resultDto.setPasswd(passwd);
	resultDto.setName(name);
	resultDto.setPhone(phone);
	resultDto.setEmail(email);
	resultDto.setRrn(rrn);
	resultDto.setPostCode(postCode);
	resultDto.setAddress(address);
	resultDto.setDetailAddr(detailAddr);
	resultDto.setExtraAddr(extraAddr);
	resultDto.setGrade(grade);
	
	MemberDAO dao = new MemberDAO(application);
	int result = dao.setInsert(resultDto);
	
	if(result > 0) {
		out.println("<script>");
		out.println("location.href='main.jsp?sep=member_list';");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('등록에 실패하였습니다.');");
		out.println("location.href='main.jsp?sep=member_insert';");
		out.println("</script>");
	}

%>