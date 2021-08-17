package article.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ArticleBoardController
 */ 
@WebServlet("/ArticleBoardController")
public class ArticleBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ArticleBoardController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doHandle(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json"); //Json형태의 컨테스트 타입 사용
		String keyword = request.getParameter("keyword"); //주소창에서 keyword값을이 들어있는 주소창을엔터쳤다고 생각할때 (request) keyword뒤에 값을 가져오는것
		request.setAttribute("key", keyword); //위에서 가져온 keyword값을 jsp페이지에서 사용할수있도록 정의한것
		RequestDispatcher dispatch = request.getRequestDispatcher("article/article.jsp"); // ArticleBoardController주소를 쳤을때 실제로 찾아가는 JSp페이지 (top.jsp:72)
		dispatch.forward(request, response);
	}

}
