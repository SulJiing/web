<%@page import="vo.MemberVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mId = request.getParameter("mem_id");
	System.out.print("멤버아이디: "+mId);
	
	// BeanUtils
// 	BeanUtils.populate(넘어온 정보를 담을 공간, 넘어오는 데이터들)
	MemberVO vo = new MemberVO();
	BeanUtils.populate(vo,request.getParameterMap());
	
	// JDBC - DB연결
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = DriverManager.getConnection(url,"pc17","java");
	Statement stmt = conn.createStatement();
	
	String sql = "insert into member ("
			+"mem_id, mem_pass, mem_name, mem_bir,"
			+"mem_hp, mem_mail, mem_zip, mem_add1, mem_add2"
			+") values("
				+"'"+vo.getMem_id()+"',"
				+"'"+vo.getMem_pass()+"',"
				+"'"+vo.getMem_name()+"',"
				+"'"+vo.getMem_bir()+"',"
				+"'"+vo.getMem_hp()+"',"
				+"'"+vo.getMem_mail()+"',"
				+"'"+vo.getMem_zip()+"',"
				+"'"+vo.getMem_add1()+"',"
				+"'"+vo.getMem_add2()+"')";
	
	// 변경(insert)된 결과에 대한 행 반환
	int result = stmt.executeUpdate(sql);
	// 응답결과 생성하기
%>
	<%=result %>
	