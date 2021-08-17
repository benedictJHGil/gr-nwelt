package faq.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.google.gson.Gson;

@WebServlet("/FAQController")
public class FAQController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	FAQDAO faqDAO;
	
	public void init() throws ServletException 
	{
		faqDAO = new FAQDAO();
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
		response.setContentType("application/json");
		List<FAQVO> faqsList = faqDAO.listFaq();
		request.setAttribute("faqsList", faqsList);
		
		String gson = new Gson().toJson(faqsList);
	    response.getWriter().write(gson);
	}
	
}
