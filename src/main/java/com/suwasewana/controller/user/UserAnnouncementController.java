package com.suwasewana.controller.user;

import com.google.gson.Gson;
import com.suwasewana.dao.*;
import com.suwasewana.model.CreateClinicModel;
import com.suwasewana.model.RPHIAnnouncementsModel;
import com.suwasewana.model.UserVIewClinicAnnouncementModel;
import com.suwasewana.model.UserVIewRPHIAnnouncementModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/user-announcement-controller/*")
public class UserAnnouncementController extends HttpServlet {

        RPHIAnnouncementsDAO rphiAnnouncementsDAO;
        UserDAO userDAO;
        private Gson gson = new Gson();
        public void init(){

            rphiAnnouncementsDAO =new RPHIAnnouncementsDAO();
            userDAO = new UserDAO();
        }

        public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
            doGet(req, res);
        }

        public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException {
//          createClinic(req, res);
            res.setCharacterEncoding("UTF-8");
            String getUrlData [] = req.getRequestURI().split("/");
//        res.getWriter().println(" request uri"  + req.getRequestURI() + "  data -: " +  getUrlData[getUrlData.length-1] );
            try {
                RequestDispatcher rd;
                switch (getUrlData[getUrlData.length-1]) {
                    case "createMA":
                        UserviewrphiAnnouncemet(req,res);
                        break;

                    case "clinic":
                        UserviewclinicAnnouncemet(req,res);
                        break;

                    default:
                        res.getWriter().println("404 Page not Found");
                        break;
                }
            } catch (Exception error) {
                throw new ServletException(error);
            }
        }

    private void UserviewclinicAnnouncemet(HttpServletRequest req, HttpServletResponse res) throws IOException {

//        System.out.println("clinic");
        String moh_id = "1003";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("uDetails")) {
                    moh_id  = cookie.getValue().split("/")[4];
                }
            }
        }
//        System.out.println("mohid ");
//        System.out.println(moh_id);

        UserVIewClinicAnnouncementModel clinicannouncement= new UserVIewClinicAnnouncementModel(
                "",
                "",
                "",
                "",
                ""
        );
        ArrayList<UserVIewClinicAnnouncementModel> result= userDAO.UserviewrclinicAnnouncemet(moh_id,clinicannouncement);
        res.getWriter().println(gson.toJson(result));
    }



    private void  UserviewrphiAnnouncemet(HttpServletRequest req, HttpServletResponse res) throws IOException {

        String target_moh = "1003";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("uDetails")) {
                    target_moh = cookie.getValue().split("/")[4];
                }
            }
        }



        System.out.println("select");
        System.out.println(target_moh);
        UserVIewRPHIAnnouncementModel selectA= new UserVIewRPHIAnnouncementModel(
                "",
                "",
                "",
                "",
                 target_moh,
                "",
                "",
                ""
        );
        ArrayList<UserVIewRPHIAnnouncementModel> result= rphiAnnouncementsDAO.UserviewrphiAnnouncemet(selectA);
        res.getWriter().println(gson.toJson(result));
    }
}








