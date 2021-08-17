package eea.controller;

import com.google.gson.Gson;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class EeaController
 */
@WebServlet("/EeaController")
public class EeaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	EeaDAO eeaDAO;
	
	public void init() throws ServletException {
		eeaDAO = new EeaDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		List<EeaVO> list = eeaDAO.getAllList();
		request.setAttribute("list", list);

		RequestDispatcher dispatch = request.getRequestDispatcher("/f/eea.jsp");
		dispatch.include(request, response);

	}


}
