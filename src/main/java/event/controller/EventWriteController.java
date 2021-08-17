package event.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/** 
 * Servlet implementation class EventWriteController
 */
@WebServlet("/EventWriteController")
public class EventWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	EventDAO eventDAO;
	EventVO eventVO;
	String numOfMaxMembers;

    /**
     * @see HttpServlet#HttpServlet()
     */
	public void init() throws ServletException {
		eventDAO = new EventDAO();
		eventVO = new EventVO();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		if(request.getParameter("startTime") == null) {
			doHandle(request, response);
		}
		else {
			doHandle2(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);		
		doHandle2(request, response);
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");		
		RequestDispatcher dispatch = request.getRequestDispatcher("/event/eventForm2.jsp");
		dispatch.forward(request, response);
		
	}
	
	private void doHandle2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String passwd = request.getParameter("password");
		int password = passwd != ""? Integer.parseInt(passwd) : 0;
		HttpSession session = request.getSession();
		
		eventVO.setStartTime(request.getParameter("startTime"));
		eventVO.setEndTime(request.getParameter("endTime"));
		eventVO.setIsOpened(request.getParameter("isOpened").equals("Opened") ? 1 : 0);
		eventVO.setNumOfMaxMembers(Integer.parseInt(request.getParameter("numOfMaxMembers")));
		eventVO.setWriterNo((int)session.getAttribute("user_no"));
		eventVO.setPassword(password);
		eventVO.setEventPlace(request.getParameter("eventPlace"));
		eventVO.setTitle(request.getParameter("title"));
		eventVO.setContents(request.getParameter("contents"));
		int insertCount = eventDAO.insertEvent(eventVO);
		System.out.println(insertCount + " event DB inserted");
		
		RequestDispatcher dispatch = request.getRequestDispatcher("/EventListController");
		dispatch.forward(request, response);
		
	}

}
