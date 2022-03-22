package com.suwasewana.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/test1")
    public class test extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//        String action = request.getServletPath();
//        String requestURI = request.getContextPath();
//        response.getWriter().println(" request uri" + request.getRequestURI() + " - context path- " + request.getContextPath()
//        + " - path info - " + request.getServletPath() + " Query string - " + request.getRequestURL() + " "
//        );

//        response.setCharacterEncoding("UTF-8");
//        String getUrlData[] = request.getRequestURI().split("/");
//        response.getWriter().println(" request uri" + request.getRequestURI() + "  data -: " + getUrlData[getUrlData.length - 1]);
        System.out.print("asdasd");
        response.getWriter().println("Hii hansana");
    }
}
