package log.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
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
		//List<EventVO> eventList = eventDAO.listEventsForMain();
		//request.setAttribute("eventList", eventList);
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		//RequestDispatcher dispatch = request.getRequestDispatcher("/LogController");
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		 
		String id = request.getParameter("id");
		int pwd = Integer.parseInt(request.getParameter("pwd"));
		LoginMemberVO logmemVO = new LoginMemberVO();
		logmemVO.setId(id);
		logmemVO.setPwd(pwd);
		LoginMemberDAO logmemDAO = new LoginMemberDAO();
		LoginMemberVO result = logmemDAO.isExisted(logmemVO);
		
		if(result.getUserNo() != 0) {
			//String userName = logmemDAO.getUserName(result);
			//System.out.println("logged-in user name: " + userName);
			session.setAttribute("user_no", result.getUserNo());
			session.setAttribute("user_name", result.getName());
			RequestDispatcher dispatch = request.getRequestDispatcher("/main.um");
			dispatch.forward(request, response);
			
		}
		else {
			RequestDispatcher dispatch = request.getRequestDispatcher("/LogController?id=none");
			dispatch.forward(request, response);
		}
		
	}
}
