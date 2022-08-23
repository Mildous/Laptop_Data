<%@page import="utils.BookPage"%>
<%@page import="model1.bookauthor.BookAuthorDTO"%>
<%@page import="java.util.*"%>
<%@page import="model1.bookauthor.BookAuthorDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BookAuthorDAO dao = new BookAuthorDAO(application);
	
	// 입력한 검색 조건을 Map에 저장
	Map<String, Object> param = new HashMap<String, Object>();
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	if(searchWord != null) {
		param.put("searchField", searchField);
		param.put("searchWord", searchWord);
	}
	
	int totalCount = dao.selectCount(param);
	
//	--------------- 페이지 처리 start ---------------
	// 전체 페이지 수 계산
	int pageSize = Integer.parseInt(application.getInitParameter("LIST_PER_PAGE"));
	int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
	int totalPage = (int)Math.ceil((double)totalCount / pageSize);	// 전체 페이지 수
	
	// 현재 페이지 확인
	int pageNum = 1;	// 기본값
	String pageTemp = request.getParameter("pageNum");
	if(pageTemp != null && !pageTemp.equals("")) {
		pageNum = Integer.parseInt(pageTemp);	// 요청받은 페이지로 수정
	}
	
	// 목록에 출력할 게시물 범위 계산
	int start = (pageNum - 1) * pageSize + 1;	// 첫 게시물의 번호
	int end = pageNum * pageSize;	// 마지막 게시물의 번호
	param.put("start", start);
	param.put("end", end);
//	---------------- 페이지 처리 end ----------------

	ArrayList<BookAuthorDTO> list = dao.getSelectAll(param);
	dao.close();
%>

<h2>저자목록</h2>
<!-- 검색 폼 -->
<form method="get">
<table border="1" width="80%">
	<tr>
		<td align="center">
			<select name="searchField">
				<option value="authorName">저자명</option>
			</select>
			<input type="text" name="searchWord">
			<input type="submit" value="검색">
		</td>
	</tr>
</table>
</form>
<!-- 목록 -->
<table border="1" width="80%">
	<tr>
		<th>순번</th>
		<th>저자명</th>
		<th>등록일</th>
		<th>비고</th>
	</tr>
<% if(list.isEmpty()) { %>
	<tr>
		<td colspan="4" align="center">
		등록된 저자가 없습니다..
		</td>
	</tr>
<% } else { 
	int num = 0;	// 화면상의 게시물 번호
	int countNum = 0;
	for(BookAuthorDTO dto : list) {
		//num = totalCount--;
		num = totalCount - (((pageNum - 1) * pageSize) + countNum++);
%>
	<tr align="center">
		<td><%= num %></td>
		<td align="center"><%= dto.getAuthorName() %></td>
		<td align="center"><%= dto.getRegiDate() %></td>
		<td align="center">
			<a href="Edit.jsp?authorNo=<%= dto.getAuthorNo() %>">[수정]</a>&nbsp;
			<a href="Delete.jsp?authorNo=<%= dto.getAuthorNo() %>">[삭제]</a>
		</td>
	</tr>
<%
	}
}
%>
</table>
<div style="width: 80%; margin-top: 10px; margin-bottom: 10px;">
	<!-- 페이징 처리 -->
	<div align="center">
		<%= BookPage.pagingStr(totalCount, pageSize, blockPage, pageNum, request.getRequestURI()) %>
	</div>

	<div align="right">
		|
		<a href="#" onClick="location.href='Insert.jsp';">등록</a>
		|
	</div>

</div>
