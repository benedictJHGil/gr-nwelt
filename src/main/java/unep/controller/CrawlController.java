// package unep.controller;
//
// import java.io.IOException;
// import java.util.List;
//
// import javax.servlet.RequestDispatcher;
// import javax.servlet.ServletException;
// import javax.servlet.annotation.WebServlet;
// import javax.servlet.http.*;
//
// import com.google.gson.Gson;
//
// @WebServlet("/CrawlController")
// public class CrawlController extends HttpServlet {
//
// 	private static final long serialVersionUID = 1L;
// 	UnepDAO unepDAO;
// 	UnepCrawlerDAO unepCrawler;
//
// 	public void init() throws ServletException
// 	{
// 		unepDAO = new UnepDAO();
// 		unepCrawler = new UnepCrawlerDAO();
// 	}
//
// 	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
// 	{
// 		doHandle(request, response);
// 	}
//
// 	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
// 	{
// 		doHandle(request, response);
// 	}
//
// 	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
// 	{
// 		response.setCharacterEncoding("utf-8");
// 		response.setContentType("application/json");
//
// 		List<UnepVO> unepList = unepCrawler.listTitleAndLink();
// 		request.setAttribute("titlesAndlinkslist", unepList);
// 		String gson = new Gson().toJson(unepList);
// 	    response.getWriter().write(gson);
// 	}
// }
