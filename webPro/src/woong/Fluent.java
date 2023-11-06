package woong;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.hc.client5.http.fluent.Request;

@WebServlet("/Fluent")
public class Fluent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Fluent() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String result = Request.get("https://news.google.com/rss/search?hl=ko&gl=KR&ceid=KR%3Ako&oc=11&q=%EC%8A%88%ED%8D%BC%EB%A7%88%EB%A6%AC%EC%98%A4")
	    .execute().returnContent().toString();
	    
		response.setCharacterEncoding("utf-8");
	    PrintWriter wrt = response.getWriter();
	    wrt.write(result);
	}
}
