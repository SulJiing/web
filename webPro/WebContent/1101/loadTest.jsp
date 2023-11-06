<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* 	
		JDBC(Java DataBase Connectivity)를 이용해서 DB정보 얻어오기
		: 자바에서 db에 접속할 수 있도록 하는 JAVA API
		pool방식을 이용하지 않고 정보를 얻을 때마다 항상 db를 연결하고 해제하는 방식
		
		작업 순서
		JDBC드라이버 로드 -> 드라이버 매니저 생성 -> 커넥션 객체 생성(DB연결) -> SQL실행 -> DB연결 종료
		
		1. 연결할 DB가 설치되어야 함
		2. 자바와 DB를 연결하기 위한 라이브러리가 필요(ojdbc.jar)
		3. Class.forName("JDBC Driver명")으로 드라이버 로딩
		4. DriverManager를 통해 Connection객체 생성
		5. sql구문 실행을 위한 Statement객체 생성
	*/
	String uId = request.getParameter("userId");
	String uPw = request.getParameter("userPw");
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = DriverManager.getConnection(url,"pc17","java");
	Statement stmt = conn.createStatement();
	String sql = "SELECT mem_id from member"+
			" where mem_id = '"+uId+"' and mem_pass= '"+uPw+"'";
	ResultSet rs = stmt.executeQuery(sql);
	
	if(rs.next()) {
// 		System.out.println(rs.getString(1));
%>
	{"rst":"ok"}
<%
	} else { // if end

%>
	{"rst":"fail"}
<%
	} // else end
%>
