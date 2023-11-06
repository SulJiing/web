package woong;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@WebServlet("/Ajax") // url 위치경로
public class Ajax extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Ajax() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String param = request.getParameter("nameKey"); // ctrl+1 누르면 반환타입 변수명 자동으로 만들어줌

		System.out.println("넘어온 정보>> " + param);

		// 한글에 대한 인코딩
		response.setCharacterEncoding("UTF-8"); // 한글깨짐 방지

		// 서블릿으로 들어온 요청을 처리하고 결과를 텍스트 형태로 응답하기 위한 출력 스트림 사용하기
		PrintWriter writer = response.getWriter();

		//writer.write("<em> 응답결과 >> " + param + "</em>"); // em : 기울임꼴, text형태의 데이터를 응답결과로 전달
		writer.write("{\"abcd\":\"" + param + "\"}"); // JSON형태의 데이터를 응답으로 전달
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// String postParam = request.getParameter("uNm"); // key정보로 value를 얻는 방식
		String postParam = request.getParameter("postData");
		System.out.println("post로 넘어온 데이터 >>" + postParam);
		
		// BufferedReader의 readLine()을 이용해 Enter로 데이터의 경계를 인식하고 string으로 반환받음
		BufferedReader rd = request.getReader();
		String jsonData = rd.readLine();
		
		System.out.println(jsonData); // 문자열 데이터
		// 자바에서 사용가능한 형태로 변경 => gson 라이브러리 사용하기(MVNREPOSITORY에서 다운로드) => (갖다 lib에다가 집어넣기)
		JsonParser jsonParser = new JsonParser();
		JsonObject jsonObj = (JsonObject) jsonParser.parse(jsonData);
		
		String param = jsonObj.get("postData").toString();
		System.out.println("json>obj 변환 후 key로 접근 - "+param);
		String param1 = jsonObj.get("postData").getAsString();
		System.out.println("json>obj 변환 후 key로 접근 - "+param1);
		
		
		response.setCharacterEncoding("utf-8");
		PrintWriter wrt = response.getWriter();
		wrt.print(param1);
	}
}