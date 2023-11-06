<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    // 한글 깨짐 방지 - post로 데이터 전송시 필수적으로 입력해야 함
    request.setCharacterEncoding("utf-8");
    // 스크립트릿 공간안에서 자바코드 입력가능
    String uNm = request.getParameter("userNm");
    String uPw = request.getParameter("userPw");
    
    String [] chks = request.getParameterValues("chk");
    String chkValue = "";
    for(int i = 0; i<chks.length; i++){
    	if(i>0) chkValue+=", ";
    	chkValue+=chks[i];
    }
//     System.out.print(uNm);
    %>
    <style>
    span{
    color : red;
    }
    </style>
취미는 <%=chkValue %> <br>
그냥 텍스트도 표현해주고, <br>
<span>
<%=uNm +" : "+uPw%>
</span><br>
<%=uNm +" : "+uPw%>