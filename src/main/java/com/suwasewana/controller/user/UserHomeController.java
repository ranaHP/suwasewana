package com.suwasewana.controller.user;

import com.google.gson.Gson;
import com.suwasewana.dao.UserDAO;
import com.suwasewana.dao.clinicalAnnouncementsDAO;
import com.suwasewana.model.UserHomeViewClinicModel;
import com.suwasewana.model.UserViewClinicsModel;
import com.suwasewana.model.UserViewRegisteredclinicsModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
@WebServlet("/user-view-home-controller/*")

public class UserHomeController extends HttpServlet {
    UserDAO userDAO;
    clinicalAnnouncementsDAO cilinicalannouncementsDAO;
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
                case "clinic":
                    userHomeViewclinics(req, res);
                    break;
//                case "registerview":
//                    userViewregisteredclinics(req, res);
//                    break;
//                case "register":
//                    userregister(req, res);
//                    break;

//                case "cancel":
//                    usercancelclinic(req, res);
//                    break;

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
////        res.getWriter().println(uNic);
//        System.out.println(uNic);

    }



    private void  userHomeViewclinics(HttpServletRequest req, HttpServletResponse res) throws IOException {
//        res.getWriter().println("announcement view");
        System.out.println("data come to controller");
        String Unic="199910910035";
        UserHomeViewClinicModel viewhomeclinic = new UserHomeViewClinicModel(
                "",
                req.getParameter("disease"),
                req.getParameter("title"),
                req.getParameter("location"),
                "1004",
                req.getParameter("datetime"),
                "",
                "",
                req.getParameter("maxpatient"),
                "",
                req.getParameter("Target"),
                req.getParameter("conduct"),
                req.getParameter("description"),
                ""
        );
        ArrayList<UserHomeViewClinicModel> result= userDAO.UserHomeViewclinic(Unic,viewhomeclinic);
        res.getWriter().println(gson.toJson(result));
    }


}
