package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.IMemberService;
import service.MemberServiceImpl;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Login() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		RequestDispatcher disp = request.getRequestDispatcher("이동경로");
//		disp.forward(request, response);
//		더 간단하게 하는 방법
		request.getRequestDispatcher("WEB-INF/private.html").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		
//		System.out.println("드루와"+userId+userPw);
		
		// MVC패턴으로 각 역할을 나누어 유지보수성을 높임
		// 요청보냄 -> Controller <-> Service <-> Dao <-> DB
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("uId",userId);
		map.put("uPw",userPw);
		
		// 서비스 객체 얻기
		IMemberService service = MemberServiceImpl.getInstance();
		String memId = service.loginChk(map);
		
		System.out.println("반환받은 정보 => "+memId);
		
		// session - 하나의 브라우저 내에서 정보/값을 공유(주로 로그인정보/로그인상태를 유지할 때 사용)
		HttpSession session = request.getSession();
		session.setAttribute("loginCode", memId);
		
//		request.getRequestDispatcher("index.jsp").forward(request, response);
		request.getRequestDispatcher("/Main").forward(request, response);
	}
}
