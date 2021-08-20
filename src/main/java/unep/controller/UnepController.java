package unep.controller;

import java.io.IOException;
import java.util.List;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UnepController")
public class UnepController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	UnepDAO udao;

	public void init() throws ServletException
	{
		udao = new UnepDAO();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doHandle(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		List<UnepVO> list = udao.getAllList();
		request.setAttribute("list", list);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/b/unep.jsp");
		dispatcher.include(request, response);
	}
}
