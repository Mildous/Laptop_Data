package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;

public class JDBConnect {

	public Connection conn;
	public Statement stmt;
	public PreparedStatement pstmt;
	public ResultSet rs;
	
	// 기본 생성자
	public JDBConnect() {
		try {
			// JDBC 드라이버 로드
			Class.forName("oracle.jdbc.OracleDriver");
			
			// DB에 연결
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "bookTest";
			String pw = "1234";
			conn = DriverManager.getConnection(url, id, pw);
			
			System.out.println("DB 연결 성공");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 두 번째 생성자
	public JDBConnect(String driver, String url, String id, String pw) {
		try {
			// JDBC 드라이버 로드
			Class.forName(driver);
				
			// DB에 연결
			conn = DriverManager.getConnection(url, id, pw);
				
			System.out.println("DB 연결 성공(인수 생성자 1)");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 세 번째 생성자
	public JDBConnect(ServletContext application) {
		try {
			// JDBC 드라이버 로드
			String driver = application.getInitParameter("OracleDriver");
			Class.forName(driver);
			
			// DB에 연결
			String url = application.getInitParameter("OracleUrl");
			String id = application.getInitParameter("OracleId");
			String pw = application.getInitParameter("OraclePw");
			conn = DriverManager.getConnection(url, id, pw);
			
			System.out.println("DB 연결 성공(인수 생성자 2)");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 연결 해제
	public void close() {
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
