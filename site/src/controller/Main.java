package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.BoardServiceImpl;
import service.IBoardService;
import vo.BoradVO;

@WebServlet("/Main")
public class Main extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Main() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage = 1; // 현재(기본 시작) 페이지
		
		// 전체 글 갯수 정보 가져오기
		// 서비스 객체
		IBoardService service = BoardServiceImpl.getInstance();
		int countList = service.countList();
		
		// 화면에 표시될 페이지 수
		int perPage = 2;
		
		// 한페이지 당 출력할 글 갯수
		int perList = 5;
		
		// 전체 페이지 수 => 전체 글갯수(countList/페이지당 글갯수(perList)
		int totalPage = (int)Math.ceil((double)(countList)/(double)perList);
		System.out.println("전체 페이지 수 => "+totalPage);
		
		// 페이지 당 출력할 게시글 범위(start~end)
		// start = (currentPage -1)*perList+1;
		// 1페이지일 때 : (1-1)*5+1 = 1 | 2페이지일 때 : (2-1)*5+1 = 6
		// 3페이지일 때 : (3-1)*5+1 = 11 | 4페이지일 때 : (4-1)*5+1 = 16
		int start = (currentPage-1)*perList+1;
		
		// end = start + perList -1;
		// 1페이지일 때 : 1+5-1 = 1 | 2페이지일 때 : 6+5-1 = 10
		// 3페이지일 때 : 11+5-1 = 15 | 4페이지일 때 : 16+5-1 = 20
		int end = start+perList-1;
		
		// 화면에 표시될 페이지 범위(startPage~endPage)
		// startPage = ((currentPage - 1) / perPage * perPage) + 1;
		int startPage = ((currentPage - 1) / perPage * perPage) + 1;
//		int startPage = 0;
		for(int i=1; i<10; i++) {
			startPage = ((i - 1) / perPage * perPage) + 1;
			System.out.println(i+"페이지일 때 시작범위 => "+startPage);
		}
		// endPage = startPage + perPage -1;
		int endPage = startPage + perPage -1;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		// start~end 범위 게시물 조회하기
		List<BoradVO> list = service.boardList(map);
		
		request.setAttribute("list", list); // 게시글 목록 정보
		request.setAttribute("sPage", startPage);
		request.setAttribute("ePage", endPage);
		request.setAttribute("ttPage", totalPage);
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("여기로 먼저 옴 POST");
		doGet(req, resp);
	}
}
