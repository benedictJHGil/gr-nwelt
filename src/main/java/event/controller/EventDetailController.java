package event.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EventDetailController
 */
@WebServlet("/EventDetailController")
public class EventDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	EventDAO eventDAO;

    /**
     * @see HttpServlet#HttpServlet()
     */
	public void init() throws ServletException {
		eventDAO = new EventDAO();
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
		response.setContentType("text/html;charset=utf-8");
		int eventsNo = Integer.parseInt(request.getParameter("no")); //주소창에서 no값을이 들어있는 주소창을엔터쳤다고 생각할때 (request) no뒤에 값을 가져오는것
		System.out.println("no" + eventsNo);

		EventVO getDetailedE = eventDAO.getDetailedEvent(eventsNo);
		System.out.println("getdetailedE" + getDetailedE);
//		System.out.println("action article : " + article);
		// 게시물 정보(BoardBean 객체), 페이지번호(page) 를 request 객체에 저장
		//if(getDetailedE != null) {
			//boardDetailService.plusReadCount(board_num);
		//}
		//System.out.println("<%=detailedEvent.getWriter() %>" + eventsNo);
		request.setAttribute("detailedEvent", getDetailedE);
		//System.out.println("detailedEvent" + getDetailedE);
		request.setAttribute("eventsNo", eventsNo);
		//System.out.println("eventsNo" + eventsNo);
		//RequestDispatcher dispatch = request.getRequestDispatcher("EventDetailController?no="+ eventsNo);
		RequestDispatcher dispatch = request.getRequestDispatcher("/event/eventDetail2.jsp");
		dispatch.forward(request, response);
	}
}
