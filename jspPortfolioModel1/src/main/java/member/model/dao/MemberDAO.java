package member.model.dao;

import java.util.*;

import javax.servlet.ServletContext;

import common.JDBConnect;
import member.model.dto.MemberDTO;

public class MemberDAO extends JDBConnect {
	public MemberDAO(ServletContext application) {
		super(application);
	}
	
	public MemberDTO getLogin(String id, String passwd) {
		MemberDTO dto = new MemberDTO();
		try {
			String query = "select no, id, passwd, name, grade, email from member where id = ? and passwd = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setName(rs.getString("name"));
				dto.setGrade(rs.getString("grade"));
				dto.setEmail(rs.getString("email"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBClose();
		}
		return dto;
	}
	
	public ArrayList<MemberDTO> getSelectAll(String searchField, String searchWord) {
		ArrayList<MemberDTO> list = new ArrayList<>();
		
		try {
			String query = "select * from member where 1 = 1 ";
			if(searchField.equals("id")) {
				query += " and id like ? ";
			} else if(searchField.equals("name")) {
				query += " and name like ? ";
			} else if(searchField.equals("grade")) {
				query += " and grade like ? ";
			}
			query += " order by no desc ";
			pstmt = conn.prepareStatement(query);
			
			if(searchField.equals("id")) {
				pstmt.setString(1, '%' + searchWord + '%');
			} else if(searchField.equals("name")) {
				pstmt.setString(1, '%' + searchWord + '%');
			} else if(searchField.equals("grade")) {
				pstmt.setString(1, '%' + searchWord + '%');
			}
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setEmail(rs.getString("email"));
				dto.setRrn(rs.getString("rrn"));
				dto.setPostCode(rs.getString("postCode"));
				dto.setAddress(rs.getString("address"));
				dto.setDetailAddr(rs.getString("detailAddr"));
				dto.setExtraAddr(rs.getString("extraAddr"));
				dto.setGrade(rs.getString("grade"));
				dto.setRegiDate(rs.getDate("regiDate"));
				list.add(dto);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBClose();
		}
		return list;
	}
	
	public MemberDTO getSelectOne(int no) {
		MemberDTO dto = new MemberDTO();
		try {
			String query = "select * from member where no = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setEmail(rs.getString("email"));
				dto.setRrn(rs.getString("rrn"));
				dto.setPostCode(rs.getString("postCode"));
				dto.setAddress(rs.getString("address"));
				dto.setDetailAddr(rs.getString("detailAddr"));
				dto.setExtraAddr(rs.getString("extraAddr"));
				dto.setGrade(rs.getString("grade"));
				dto.setRegiDate(rs.getDate("regiDate"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBClose();
		}
		return dto;
	}
	
	public int setInsert(MemberDTO dto) {
		int result = 0;
		
		try {
			String query = "insert into member values (seq_member.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getPhone());
			pstmt.setString(5, dto.getEmail());
			pstmt.setString(6, dto.getRrn());
			pstmt.setString(7, dto.getPostCode());
			pstmt.setString(8, dto.getAddress());
			pstmt.setString(9, dto.getDetailAddr());
			pstmt.setString(10, dto.getExtraAddr());
			pstmt.setString(11, dto.getGrade());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBClose();
		}
		return result;
	}
}

