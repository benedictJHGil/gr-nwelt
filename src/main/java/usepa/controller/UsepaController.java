package usepa.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/UsepaController")
public class UsepaController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    UsepaDAO udao;

    public void init() throws ServletException {
        udao = new UsepaDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doHandler(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doHandler(request, response);
    }

    protected void doHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html,charset=utf-8");

        List<UsepaVO> list = udao.getAllList();
        request.setAttribute("list", list);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/d/usepa.jsp");
        dispatcher.include(request, response);

    }
}
