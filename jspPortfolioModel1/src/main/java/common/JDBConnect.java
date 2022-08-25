package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletContext;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class JDBConnect {
	
	public Connection conn;
	public Statement stmt;
	public PreparedStatement pstmt;
	public ResultSet rs;
	
	public JDBConnect(ServletContext application) {
		try {
			//JDBC 드라이버 로드
			String driver = application.getInitParameter("OracleDriver");
			Class.forName(driver);
			
			//DB에 연결
			String url = application.getInitParameter("OracleUrl");
			String id = application.getInitParameter("OracleId");
			String pw = application.getInitParameter("OraclePw");
			conn = DriverManager.getConnection(url, id, pw);
			
			System.out.println("DB 연결 성공");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void JDBClose() {
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
			
			System.out.println("DB 연결 해제");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
