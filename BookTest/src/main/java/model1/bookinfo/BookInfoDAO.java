package model1.bookinfo;

import java.util.*;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class BookInfoDAO extends JDBConnect {

	String table_1 = "bookInfo";
	String table_2 = "bookAuthor";
	String table_3 = "bookProfile";
	
	public BookInfoDAO(ServletContext application) {
		super(application);
	}
	
	// 검색 조건에 맞는 레코드 개수 반환
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		
		// 게시물 개수를 얻어옴
		String sql = "select count(*) from " + table_1 + " i ";
		if(map.get("searchWord") != null) {
			if(map.get("searchField").equals("subject")) {
				sql += " where " + map.get("searchField") + " "
						 + " like '%" + map.get("searchWord") + "%'";
			} else if(map.get("searchField").equals("authorName")) {
				sql += " , " + table_2 + " a where a.authorNo = i.authorNo and a." + map.get("searchField") + " "
					 + " like '%" + map.get("searchWord") + "%' ";
			} else if(map.get("searchField").equals("profileName")) {
				sql += " , " + table_3 + " p where p.profileNo = i.profileNo and p." + map.get("searchField") + " "
					 + " like '%" + map.get("searchWord") + "%' ";
			}
		}
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			rs.next();
			totalCount = rs.getInt(1);
		} catch(Exception e) {
			System.out.println("카운트 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}
	
	// 검색 조건에 맞는 목록을 반환(페이징)
	public ArrayList<BookInfoDTO> getSelectAll(Map<String, Object> map) {
		ArrayList<BookInfoDTO> list = new ArrayList<BookInfoDTO>();
		
		String sql = "select * from ( "
				   + "	select Tb.*, ( "
				   + "		select authorName from bookAuthor a where a.authorNo = Tb.authorNo) authorName, ( "
				   + " 		select profileName from bookProfile p where p.profileNo = Tb.profileNo) profileName, "
				   + "		rownum rNum from ( select i.infoNo, i.subject, i.created, i.regiDate, i.authorNo, i.profileNo from " + table_1 + " i ";
		
		// 검색조건 추가
		if(map.get("searchWord") != null) {
			if(map.get("searchField").equals("subject")) {
				sql += " where " + map.get("searchField")
					 + " like '%" + map.get("searchWord") + "%' ";
			} else if(map.get("searchField").equals("authorName")) {
				sql += " , " + table_2 + " a where i.authorNo = a.authorNo and a." + map.get("searchField")
					 + " like '%" + map.get("searchWord") + "%' ";
			} else if(map.get("searchField").equals("profileName")) {
				sql += " , " + table_3 + " p where i.profileNo = p.profileNo and p." + map.get("searchField")
				 + " like '%" + map.get("searchWord") + "%' ";
			}
		}
		
		sql += "	 order by infoNo desc "
			 + "	 ) Tb "
			 + " ) "
			 + " where rNum between ? and ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, map.get("start").toString());
			pstmt.setString(2, map.get("end").toString());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BookInfoDTO dto = new BookInfoDTO();
				dto.setInfoNo(rs.getInt("infoNo"));
				dto.setSubject(rs.getString("subject"));
				dto.setCreated(rs.getDate("created"));
				dto.setAuthorNo(rs.getInt("authorNo"));
				dto.setProfileNo(rs.getInt("profileNo"));
				dto.setAuthorName(rs.getString("authorName"));
				dto.setProfileName(rs.getString("profileName"));
				dto.setRegiDate(rs.getDate("regiDate"));
				
				list.add(dto);
			}
		} catch(Exception e) {
			System.out.println("목록 조회 중 예외 발생");
			e.printStackTrace();
		}
		return list;
	}
	
	public BookInfoDTO getSelectOne(int infoNo) {
		BookInfoDTO dto = new BookInfoDTO();
		
		String sql = "select i.*, ( "
				   + "	select authorName from bookAuthor a where a.authorNo = i.authorNo) authorName, ( "
				   + "	select profileName from bookProfile p where p.profileNo = i.profileNo) profileName "
				   + "from " + table_1 + " i where infoNo = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, infoNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setInfoNo(rs.getInt("infoNo"));
				dto.setSubject(rs.getString("subject"));
				dto.setCreated(rs.getDate("created"));
				dto.setAuthorNo(rs.getInt("authorNo"));
				dto.setProfileNo(rs.getInt("profileNo"));
				dto.setAuthorName(rs.getString("authorName"));
				dto.setProfileName(rs.getString("profileName"));
			}
		} catch(Exception e) {
			System.out.println("조회 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}
	
	public int setInsert(BookInfoDTO dto) {
		int result = 0;
		
		try {
			String sql = "insert into " + table_1;
			sql += " values (seq_bookInfo.nextval, ?, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getSubject());
			pstmt.setDate(2, dto.getCreated());
			pstmt.setInt(3, dto.getAuthorNo());
			pstmt.setInt(4, dto.getProfileNo());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("등록 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public int setUpdate(BookInfoDTO dto) {
		int result = 0;
		try {
			String sql = "update " + table_1 + " set ";
			sql += " subject = ?, created = ?, authorNo = ?, profileNo = ? where infoNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getSubject());
			pstmt.setDate(2, dto.getCreated());
			pstmt.setInt(3, dto.getAuthorNo());
			pstmt.setInt(4, dto.getProfileNo());
			pstmt.setInt(5, dto.getInfoNo());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("수정 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public int setDelete(BookInfoDTO dto) {
		int result = 0;
		try {
			String sql = "delete from " + table_1 + " where infoNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getInfoNo());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("삭제 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
}
