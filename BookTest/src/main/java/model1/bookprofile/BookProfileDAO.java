package model1.bookprofile;

import java.util.*;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class BookProfileDAO extends JDBConnect {

	String table_1 = "bookProfile";
	
	public BookProfileDAO(ServletContext application) {
		super(application);
	}
	
	// 검색 조건에 맞는 레코드의 개수를 반환
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		
		// 게시물 개수를 얻어오는 쿼리문
		String sql = "select count(*) from " + table_1;
		if(map.get("searchWord") != null) {
			sql += " where " + map.get("searchField") + " "
				 + " like '%" + map.get("searchWord") + "%'";
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
	public ArrayList<BookProfileDTO> getSelectAll(Map<String, Object> map) {
		ArrayList<BookProfileDTO> list = new ArrayList<BookProfileDTO>();
		
		String sql = "select * from ( " 
				   + "	select Tb.*, rownum rNum from ( "
				   + "		select * from " + table_1;
		
		// 검색조건 추가
		if(map.get("searchWord") != null) {
			sql += " where " + map.get("searchField")
				 + " like '%" + map.get("searchWord") + "%' ";
		}
		
		sql += " 	order by profileNo desc "
			 + "	) Tb "
			 + " ) "
			 + " where rNum between ? and ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, map.get("start").toString());
			pstmt.setString(2, map.get("end").toString());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BookProfileDTO dto = new BookProfileDTO();
				dto.setProfileNo(rs.getInt("profileNo"));
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
	
	// 데이터 입력
	public int setInsert(BookProfileDTO dto) {
		int result = 0;
		
		try {
			// insert 쿼리문 작성
			String sql = "insert into " + table_1;
			sql += " values (seq_bookProfile.nextval, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getProfileName());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("등록 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public BookProfileDTO getSelectOne(int profileNo) {
		BookProfileDTO dto = new BookProfileDTO();
		
		String sql = "select * from " + table_1 + " where profileNo = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, profileNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setProfileNo(rs.getInt("profileNo"));
				dto.setProfileName(rs.getString("profileName"));
				dto.setRegiDate(rs.getDate("regiDate"));
			}
		} catch(Exception e) {
			System.out.println("조회 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}
	
	public int setUpdate(BookProfileDTO dto) {
		int result = 0;
		try {
			String sql = "update " + table_1 + " set profileName = ? where profileNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getProfileName());
			pstmt.setInt(2, dto.getProfileNo());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("수정 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public int setDelete(BookProfileDTO dto) {
		int result = 0;
		try {
			String sql = "delete from " + table_1 + " where profileNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getProfileNo());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("삭제 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
}
