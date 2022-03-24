package com.suwasewana.controller.rphi;

import com.google.gson.Gson;
import com.suwasewana.dao.RPHIAnnouncementsDAO;
import com.suwasewana.model.CreateClinicAnnouncementsModel;
import com.suwasewana.model.CreateClinicModel;
import com.suwasewana.model.RPHIAnnouncementsModel;
import com.suwasewana.model.vaccineClinicModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/createRPHI_Announcements/*")
public class RPHIAnnouncementController extends HttpServlet {
    RPHIAnnouncementsDAO rphiAnnouncementsDAO;
    private Gson gson = new Gson();
    public void init(){
        rphiAnnouncementsDAO =new RPHIAnnouncementsDAO();
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        doGet(req, res);
    }
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
//          createClinic(req, res);
        res.setCharacterEncoding("UTF-8");
        String getUrlData [] = req.getRequestURI().split("/");
//        res.getWriter().println(" request uri"  + req.getRequestURI() + "  data -: " +  getUrlData[getUrlData.length-1] );
        try {
            RequestDispatcher rd;
            switch (getUrlData[getUrlData.length-1]) {
                case "createA":
//                    res.getWriter().println("create");
                    createA(req,res);
                    break;
                case "selectA":
//                    res.getWriter().println("selectA");
                    selectA(req,res);
                    break;
                case "selectmohAnnouncemnt":
                    selectmohAnnouncemnt(req,res);
                    break;
                case "updateAStatus":
                    updateAStatus(req,res);
                    break;
                default:
                    res.getWriter().println("404 Page not Found");
                    break;
            }
        } catch (Exception error) {
            throw new ServletException(error);
        }
    }

    private void updateAStatus(HttpServletRequest req, HttpServletResponse res) throws IOException {
        System.out.println("came to controller 1");
        String nic="199910910064";
        String  moh = "1003";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("sDetails")) {
                    nic = cookie.getValue().split("/")[3];
                    moh = cookie.getValue().split("/")[4];
                }
            }
        }
        RPHIAnnouncementsModel updateAstatus = new RPHIAnnouncementsModel(
                "",
                "",
                "",
                "",
                moh,
                "",
                nic,
                ""
        );
        String result = rphiAnnouncementsDAO.updateAnnstatus(updateAstatus);
        res.getWriter().println(gson.toJson(result));
    }

    private void selectmohAnnouncemnt(HttpServletRequest req, HttpServletResponse res) throws IOException {
//        System.out.println("select");
        String moh="1004";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("sDetails")) {
                    moh = cookie.getValue().split("/")[4];
                    System.out.println("select moh= "+moh);
                }
            }
        }
        RPHIAnnouncementsModel selectA= new RPHIAnnouncementsModel(
                "",
                "",
                "",
                "",
                moh,
                "",
                "",
                ""
        );
        ArrayList<RPHIAnnouncementsModel> result= rphiAnnouncementsDAO.ViewMOHAnnouncement(selectA);
        res.getWriter().println(gson.toJson(result));
    }
    private void selectA(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String nic="199910910064";
        String  moh = "1003";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("sDetails")) {
                    nic = cookie.getValue().split("/")[3];
                    moh = cookie.getValue().split("/")[4];
                }
            }
        }
        RPHIAnnouncementsModel selectA= new RPHIAnnouncementsModel(
               "",
                "",
                "",
                "",
                "",
                "",
                nic,
                ""
        );
        ArrayList<RPHIAnnouncementsModel> result= rphiAnnouncementsDAO.ViewA(selectA);
        res.getWriter().println(gson.toJson(result));
    }

    private void createA(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String nic="199910910064";
        String  moh = "1003";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("sDetails")) {
                    nic = cookie.getValue().split("/")[3];
                    moh = cookie.getValue().split("/")[4];
                }
            }
        }
        System.out.println("came to controller 1");
        RPHIAnnouncementsModel RPHIAnnouncements = new RPHIAnnouncementsModel(
                "",
                req.getParameter("title"),
                req.getParameter("description"),
                req.getParameter("image"),
                req.getParameter("moh"),
                "",
                nic,
                req.getParameter("expire_date")
        );
        System.out.println("before");
        String result= rphiAnnouncementsDAO.createA(RPHIAnnouncements);
        res.getWriter().println(result);
        System.out.println(result);
    }
}
