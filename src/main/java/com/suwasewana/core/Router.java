package com.suwasewana.core;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/asd")
public class Router extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String action = request.getServletPath();
        try {
            switch (action) {
                case "/":
                    response.getWriter().println("Home Page");
                    break;
                case "/login":
                    RequestDispatcher rd = request.getRequestDispatcher("view/Login.jsp");
                    rd.forward(request,response);
                    break;
                case "/dashboard":
                	response.getWriter().println("Dashboard Page akila + lula");
                    break;
                default:
                    response.getWriter().println("404 Page not Found");
                    break;
            }
        } catch (Exception error) {
            throw new ServletException(error);
        }
    }
}
