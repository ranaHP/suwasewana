package com.suwasewana.controller.user;

import com.google.gson.Gson;
import com.suwasewana.dao.UserDAO;
import com.suwasewana.dao.clinicalAnnouncementsDAO;
import com.suwasewana.model.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/user-view-clinic-controller/*")
public class UserViewClinicsController extends HttpServlet {
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
                case "view":
                    userViewclinics(req, res);
                    break;
                case "registerview":
                    userViewregisteredclinics(req, res);
                    break;
                case "register":
                    userregister(req, res);
                    break;

                case "cancel":
                    usercancelclinic(req, res);
                    break;
                case "Numberslist":
                    Numberslist(req, res);
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
////        res.getWriter().println(uNic);
//        System.out.println(uNic);

    }

    private void Numberslist(HttpServletRequest req, HttpServletResponse res) throws IOException {
          UserViewClinicsModel Numberlist= new UserViewClinicsModel(
            req.getParameter("clinicID"),
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            ""
          );
        String result= userDAO.Numberlist(Numberlist);
        res.getWriter().println(gson.toJson(result));
    }

    private void usercancelclinic(HttpServletRequest req, HttpServletResponse res) throws IOException {
        System.out.println("data come to controller");
//        String Unic="199910910035";
        String uNic = "199910910060";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("uDetails")) {
                    uNic = cookie.getValue().split("/")[1];
                }
            }
        }

        UserViewClinicsModel cancelclinic = new UserViewClinicsModel(

                req.getParameter("ncs_id"),
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                ""

        );
        String result= userDAO.Usercancellinic(uNic,cancelclinic);
        res.getWriter().println(gson.toJson(result));
    }

    private void userregister(HttpServletRequest req, HttpServletResponse res) throws IOException {
        //        res.getWriter().println("announcement view");
        System.out.println("data come to controller");
        String UNic = "199910910060";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("uDetails")) {
                    UNic = cookie.getValue().split("/")[1];
                }
            }
        }
        String ncs_id = req.getParameter("clinic_id");
        UserViewRegisteredclinicsModel registerclinic = new UserViewRegisteredclinicsModel (

                UNic,
                "",
                "",
                "",
                "",
                req.getParameter("Date"),
                "",
                "",
                "",
                "",
                "",
                ""
        );
        String result= userDAO.Userregisterclinic(registerclinic,ncs_id);
        res.getWriter().println(gson.toJson(result));
    }

    private void  userViewclinics(HttpServletRequest req, HttpServletResponse res) throws IOException {
//        res.getWriter().println("announcement view");
        System.out.println("data come to controller");
        String uNic = "199910910060";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("uDetails")) {
                    uNic = cookie.getValue().split("/")[1];
                }
            }
        }


        String MOH = "1003";
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("uDetails")) {
                    MOH = cookie.getValue().split("/")[4];
                }
            }
        }




//        String Unic="199910910035";
        UserViewClinicsModel viewclinic = new UserViewClinicsModel(
                "",
                req.getParameter("disease"),
                req.getParameter("title"),
                req.getParameter("location"),
                MOH,
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
        ArrayList<UserViewClinicsModel> result= userDAO.UserViewclinic(uNic,viewclinic);
        res.getWriter().println(gson.toJson(result));
    }

    private void userViewregisteredclinics(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String UNic = "199910910060";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("uDetails")) {
                    UNic = cookie.getValue().split("/")[1];
                }
            }
        }
        UserViewRegisteredclinicsModel userviewregisterclinics  = new UserViewRegisteredclinicsModel(
                UNic,
                req.getParameter("disease"),
                req.getParameter("title"),
                req.getParameter("location"),
                req.getParameter("MOH"),
                req.getParameter("datetime"),
                "",
                "",
                req.getParameter("maxpatient"),
                req.getParameter("Target"),
                req.getParameter("conduct"),
                req.getParameter("description")

        );
//        String nic = "980936416v";
        ArrayList<UserViewRegisteredclinicsModel> result = userDAO.userViewregisteredclinics(userviewregisterclinics);
        res.getWriter().println(gson.toJson(result));
    }

}
