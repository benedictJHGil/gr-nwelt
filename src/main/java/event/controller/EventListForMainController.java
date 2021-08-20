package event.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class MemberController
 */
@WebServlet("/EventListForMainController")
public class EventListForMainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	EventDAO eventDAO;

	public void init() throws ServletException {
		eventDAO = new EventDAO();
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		// response.addHeader("Access-Control-Allow-Origin", "*");
		// response.setHeader("Access-Control-Allow-Headers", "origin, x-requested-with, content-type, accept");
		
		List<EventVO> eventList = eventDAO.listEventsForMain();

	    Gson gson = new Gson();
	    String jsonString = gson.toJson(eventList);
	    response.getWriter().write(jsonString);
	}

}