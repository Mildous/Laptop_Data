<%@page import="model1.bookinfo.BookInfoDTO"%>
<%@page import="model1.bookinfo.BookInfoDAO"%>
<%@page import="model1.bookprofile.BookProfileDTO"%>
<%@page import="model1.bookprofile.BookProfileDAO"%>
<%@page import="java.util.*"%>
<%@page import="model1.bookauthor.BookAuthorDTO"%>
<%@page import="model1.bookauthor.BookAuthorDAO"%>
<%@ include file="../Login/IsLoggedIn.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//BookAuthor.. Map
	BookAuthorDAO authorDao = new BookAuthorDAO(application);
	Map<String, Object> authorParam = new HashMap<String, Object>();
	authorParam.put("searchField", null);
	authorParam.put("searchWord",  null);
	authorParam.put("start", 1);
	authorParam.put("end", 100);
	
	//BookProfile.. Map
	BookProfileDAO profileDao = new BookProfileDAO(application);
	Map<String, Object> profileParam = new HashMap<String, Object>();
	profileParam.put("searchField", null);
	profileParam.put("searchWord", null);
	profileParam.put("start", 1);
	profileParam.put("end", 100);
	
	String infoNo_ = request.getParameter("infoNo");
	int infoNo = Integer.parseInt(infoNo_);
	
	BookInfoDAO dao = new BookInfoDAO(application);
	BookInfoDTO resultDto = dao.getSelectOne(infoNo);
	dao.close();
%>

<script type="text/javascript">
//폼 내용 검증
function validateForm(form) {
	if(form.subject.value == null || form.subject.value == "") {
		alert("도서이름을 입력하세요");
		return false;
	}
	if(form.authorNo.value == null || form.authorNo.value == "") {
		alert("저자를 선택하세요.");
		return false;
	}
	if(form.profileNo.value == null || form.profileNo.value == "") {
		alert("분류를 선택하세요.");
		return false;
	}
	if(form.created.value == null || form.created.value == "") {
		alert("발행일을 선택하세요.");
		return false;
	}
}
</script>

<h2>도서정보 수정</h2>
<form name="DirForm" method="post" action="EditProc.jsp" onsubmit="return validateForm(this);">
<input type="hidden" name="infoNo" value="<%= resultDto.getInfoNo() %>">
<table border="1" width="50%">
	<tr>
		<th>도서명</th>
		<td><input type="text" name="subject" id="subject" value="<%= resultDto.getSubject() %>"></td>
	</tr>
	<tr>
		<th>저자</th>
		<td>
			<%
				ArrayList<BookAuthorDTO> aList = authorDao.getSelectAll(authorParam);
			%>
			<select name="authorNo">
				<option value="<%= resultDto.getAuthorNo() %>" selected><%= resultDto.getAuthorName() %></option>
				<%
					for(int i=0; i<aList.size(); i++) {
						BookAuthorDTO dto = aList.get(i);
						String selectedValue = "";
						if(dto.getAuthorNo() == 0) {
							selectedValue = "selected";
						}
				%>
				<option value="<%= dto.getAuthorNo() %>"><%= dto.getAuthorName() %></option>
				<%	
					}
				%>
			</select>
		</td>
	</tr>
	<tr>
		<th>분류</th>
		<td>
			<%
				ArrayList<BookProfileDTO> pList = profileDao.getSelectAll(profileParam);
			%>
			<select name="profileNo">
				<option value="<%= resultDto.getProfileNo() %>" selected><%= resultDto.getProfileName() %></option>
				<%
					for(int i=0; i<pList.size(); i++) {
						BookProfileDTO dto = pList.get(i);
						String selectedValue = "";
						if(dto.getProfileNo() == 0) {
							selectedValue = "selected";
						}
				%>
				<option value="<%= dto.getProfileNo() %>"><%= dto.getProfileName() %></option>
				<%	
					}
				%>
			</select>
		</td>
	</tr>
	<tr>
		<th>발행일</th>
		<td><input type="date" name="created" id="created" value="<%= resultDto.getCreated() %>"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="submit">등록</button>
			<button type="button" onClick="location.href='List.jsp';">목록</button>
		</td>
	</tr>
</table>
</form>
