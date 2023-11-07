<%@page import="java.util.List"%>
<%@page import="vo.BoradVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<br><br>
	<table class="table table-hover">
    <thead>
      <tr>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회수</th>
      </tr>
    </thead>
    <tbody>
<%
	List<BoradVO> list = (List<BoradVO>)request.getAttribute("list");
%>
	<%=list.get(0).getWriter() %>
      <tr>
        <td>John</td>
        <td>John</td>
        <td>Doe</td>
        <td>john@example.com</td>
      </tr>
    </tbody>
  </table>
</div>

</body>
