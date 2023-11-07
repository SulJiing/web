<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- header 영역 -->
<%@include file="./include/header.jsp" %>

<%@include file="./include/aside1.jsp" %>

<!--본문 -->
    <div class="col-sm-8 text-left">
    
    조인코드[<%=request.getAttribute("joinCode") %>]
    로긴코드[<%=session.getAttribute("loginCode") %>]

<%
	if(request.getAttribute("joinCode") == "yes") {
		// 회원가입 화면
%>
		<%@include file="./join.jsp" %>
<%
	} else {
		// 메인화면 또는 게시판화면이 보여지게 처리
		if(session.getAttribute("loginCode") != null){
			// 게시판 화면
%>
		<%@include file="./board.jsp" %>
<%
		} else {
			// 메인화면
%>
		<h1>Welcome</h1>
	      <p>여어~</p>
	      <hr>
	      <h3>Test</h3>
	      <p>Lorem ipsum...</p>
	    </div>
<%			
		} // 로그인코드로 분기처리end
	} // 조인코드로 분기처리end
%>
    
<%@include file="./include/aside2.jsp" %>
    
<%@include file="./include/footer.jsp"%>