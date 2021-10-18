package com.suwasewana.controller.user;

import com.google.gson.Gson;
import com.suwasewana.dao.UserDAO;
import com.suwasewana.dao.ComplainDAO;
import com.suwasewana.model.AppointmentModel;
import com.suwasewana.model.UserRegistrationModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;

@WebServlet("/user-appointment-controller/*")
public class UserAppointmentController extends HttpServlet {
    UserDAO userDAO;
    private Gson gson = new Gson();

    public void init() {
        userDAO = new UserDAO();
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        doGet(req, res);

    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        res.setCharacterEncoding("UTF-8");
        String getUrlData [] = req.getRequestURI().split("/");
//        res.getWriter().println(" request uri"  + req.getRequestURI() + "  data -: " +  getUrlData[getUrlData.length-1] );
        try {
            RequestDispatcher rd;
            switch (getUrlData[getUrlData.length-1]) {
                case "create":
                    uerMakeAppointment(req, res);
                    break;
                case "view":
                    userViewAppointment(req, res);
                    break;
                default:
                    res.getWriter().println("404 Page not Found");
                    break;
            }
        } catch (Exception error) {
            throw new ServletException(error);
        }

//        String uNic = "";
//        Cookie[] cookies = req.getCookies();
//        if(cookies !=null){
//            for(Cookie cookie : cookies){
//                if(cookie.getName().equals("unic")) uNic = cookie.getValue();
//            }
//        }
//        if(uNic == null) res.sendRedirect("login.html");
//        res.getWriter().println(uNic);

    }
    private void uerMakeAppointment(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String uNic = "";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("unic")) {
                    uNic = cookie.getValue();
                }
            }
        }
        AppointmentModel userAppointmentDetails = new AppointmentModel(
                req.getParameter("aTitle"),
                req.getParameter("aType"),
                req.getParameter("aPhi"),
                req.getParameter("aReason"),
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                uNic
        );
        String result = userDAO.UserMakeAppointment(userAppointmentDetails);
        res.getWriter().println(result);
    }

    private void userViewAppointment(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String uNic = "";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("unic")) {
                    uNic = cookie.getValue();
                }
            }
        }
        AppointmentModel userAppointmentDetails = new AppointmentModel(
                req.getParameter("aTitle"),
                req.getParameter("aType"),
                " ",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                uNic
        );
        ArrayList<AppointmentModel> result = userDAO.userGetAppointmentDetails(userAppointmentDetails);
        res.getWriter().println(gson.toJson(result));
    }

}