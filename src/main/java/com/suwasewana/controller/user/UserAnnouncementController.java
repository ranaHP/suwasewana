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

        System.out.println("clinic");

        UserVIewClinicAnnouncementModel clinicannouncement= new UserVIewClinicAnnouncementModel(
                "",
                "",
                "",
                "",
                "1004"
        );
        ArrayList<UserVIewClinicAnnouncementModel> result= userDAO.UserviewrclinicAnnouncemet(clinicannouncement);
        res.getWriter().println(gson.toJson(result));
    }

    private void  UserviewrphiAnnouncemet(HttpServletRequest req, HttpServletResponse res) throws IOException {
        System.out.println("select");
        UserVIewRPHIAnnouncementModel selectA= new UserVIewRPHIAnnouncementModel(
                "",
                "",
                "",
                "",
                "1002",
                "",
                "",
                ""
        );
        ArrayList<UserVIewRPHIAnnouncementModel> result= rphiAnnouncementsDAO.UserviewrphiAnnouncemet(selectA);
        res.getWriter().println(gson.toJson(result));
    }
}








