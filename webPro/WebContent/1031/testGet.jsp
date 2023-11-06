<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
// 	JSP ( Java Server Page)
// 	- HTML문서 안에 자바코드가 삽입된 구조를 갖는 웹 어플리케이션 프로그래밍 기술
// 	- JAVAEE에 포함된 하위기술로 동적 컨텐츠를 생성하여 응답해주는 기술
	
// 	*JAVASE - 대중적 자바 플랫폼, 자바언어의 핵심기능(네트워크, 보안, DB처리 등) 제공
// 	*JAVAEE - SE기반으로 웹 프로그래밍에 필요한 기능(JSP, Servlet, JDBC 등)을 포함한 플랫폼
	
// 	JSP탄생 배경
// 	- 과거의 웹 개발 환경 중 규모있는 프로젝트에서의 협업이 필요한 상황에서 발생한 유지보수건을 빠르게 대처할 수 있도록 만들어진 기술
// 	  >> 많은 양의 두 소스(JAVA, HTML)가 뒤섞인 상태에서 수정에 어려움이 발생 >> 잘못 수정할 경우 에러
	  
// 	이전에는 Servlet과 같이 요청에 대한 처리(Controller)의 역할로 사용되었으나, 최근의 개발에서는 대부분 처리결과를 보여주는 view의 열할을 담당함
 String myName = request.getParameter("name");
 %>
<%--  <%=myName %> --%>

{"name":"<%=myName %>"}
