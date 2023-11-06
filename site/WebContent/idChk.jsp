<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String uId = request.getParameter("uId");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = DriverManager.getConnection(url,"pc17","java");
	Statement stmt = conn.createStatement();
	String sql = "SELECT mem_id from member"+
			" where mem_id = '"+uId+"'";
	ResultSet rs = stmt.executeQuery(sql);
	
	if(rs.next()) {
// 		System.out.println(rs.getString(1));
%>
	{
	"rst":"fail",
	"msg":"사용불가"
	}
<%
	} else { // if end

%>
	{
	"rst":"ok",
	"msg":"사용가능"
	}
<%
	} // else end
%>
