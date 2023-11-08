<%@page import="java.util.List"%>
<%@page import="vo.BoardVO"%>
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
	List<BoardVO> list = (List<BoardVO>)request.getAttribute("list");
	if(list != null) {
		for(int i=0; i<list.size(); i++){
%>
		 <tr>
	        <td><%=list.get(i).getSubject() %></td>
	        <td><%=list.get(i).getWriter() %></td>
	        <td><%=list.get(i).getWdate() %></td>
	        <td><%=list.get(i).getHit() %></td>
	      </tr>
	<%
			} // for end
		} else {// for end
%>
		<tr>
	        <td colspan="4" style="text-align: center;">게시물 없음</td>
	    </tr>	
<%
		} // if end
%>
     
    </tbody>
  </table>
  
<!--   페이지 영역 시작 -->
<%
if(list !=null) {
%>
<div id="pageArea">
	<ul class="pager">
	  <li class="prev"><a href="#">prev</a></li>
	</ul>
	<ul class="pagination pager"> <!-- 2가지 클래스 네임은 공백을 기준으로 나뉨 -->
	<%
		int sPage = (int)request.getAttribute("sPage");
		int ePage = (int)request.getAttribute("ePage");
		int cPage = (int)request.getAttribute("cPage");
		
		for(int i=sPage; i<=ePage; i++) {
			
			// 페이지 넘버 활성화
			if(cPage == i){
	%>	
	  <li class="active"><a href="#"><%=i %></a></li>
	  
	<%
			} else{
	%>	
	  <li><a href="#"><%=i %></a></li>
	  
	<%	
			}
		}
	}
	%>
	</ul>
	
	<ul class="pager">
	  <li class="next"><a href="#">Next</a></li>
	</ul>
</div>
</div>

<script type="text/javascript">

	// 페이지 next이벤트
	$('.next').on("click",function(){
// 		alert($('.pagination').children().last().text());
		let current = parseInt($('.pagination').children().last().text()) + 1;
		
		// 현재 페이지가 totalPage보다 클 때 페이지정보를 Main에 넘기지 않음
		if(<%=request.getAttribute("ttPage")%> < current) return; 
		location.href="/site/Main?page="+current;
	});
	
	// 페이지 prev이벤트
	$('.prev').on("click",function(){
		let current = parseInt($('.pagination').children().first().text()) - 1;
		
		// 현재 페이지가 0보다 작거나 같을 때
		if(0 >= current) return; 
		location.href="/site/Main?page="+current;
	});

	// 페이징 넘버링 이벤트
	$('.pagination li').on('click',function(){
// 		alert($(this).text());
		location.href="/site/Main?page="+$(this).text();
	});

</script>
</body>
