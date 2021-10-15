package com.suwasewana.core;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/s/*")
public class Router extends HttpServlet {
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

        response.setCharacterEncoding("UTF-8");
        String getUrlData [] = request.getRequestURI().split("/");
        response.getWriter().println(" request uri"  + request.getRequestURI() + "  data -: " +  getUrlData[getUrlData.length-1] );
        try {
            RequestDispatcher rd;
            switch (getUrlData[getUrlData.length-1]) {
                case "s":
                    rd = request.getRequestDispatcher("/view/user/user-home.jsp");
                    rd.forward(request,response);
                    break;
                case "login":
                    rd = request.getRequestDispatcher("/view/user/Login.jsp");
                    rd.forward(request,response);
                    break;
                case "register":
                    rd = request.getRequestDispatcher("/view/user/user-registration.jsp");
                    rd.forward(request,response);
                    break;
                case "login_officer":
                    rd = request.getRequestDispatcher("view/OfficerLogin/OfficerLogin.jsp ");
                    rd.forward(request,response);
                    break;
                case "appointment":
                    rd = request.getRequestDispatcher("/view/user/user-appointment.jsp");
                    rd.forward(request,response);
                    break;
                case "complain":
                    rd = request.getRequestDispatcher("/view/user/user-complain.jsp");
                    rd.forward(request,response);
                    break;
                case "view-clinics":
                    rd = request.getRequestDispatcher("/view/admin/clinicalOfficer/dashBoard/dashboard_viewClinics.jsp");
                    rd.forward(request,response);
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
