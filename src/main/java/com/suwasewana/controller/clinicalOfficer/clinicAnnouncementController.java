package com.suwasewana.controller.clinicalOfficer;

import com.google.gson.Gson;
import com.suwasewana.dao.clinicalAnnouncementsDAO;
import com.suwasewana.dao.createClinicDAO;
import com.suwasewana.model.CreateClinicAnnouncementsModel;
import com.suwasewana.model.CreateClinicModel;
import com.suwasewana.model.VaccineClinicAnnouncementsModel;
import com.suwasewana.model.vaccineClinicModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/clinicAnnouncementController/*")
    public class clinicAnnouncementController extends HttpServlet {
    private Gson gson = new Gson();
    clinicalAnnouncementsDAO clinicalAnnouncementsDAO;
    public void init() {
           clinicalAnnouncementsDAO= new clinicalAnnouncementsDAO();
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        doGet(req, res);
    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        res.setCharacterEncoding("UTF-8");
        String getUrlData[] = req.getRequestURI().split("/");
//        res.getWriter().println(" request uri"  + req.getRequestURI() + "  data -: " +  getUrlData[getUrlData.length-1] );
        try {
            RequestDispatcher rd;
            switch (getUrlData[getUrlData.length - 1]) {
                case "createA":
//                    res.getWriter().println("createA");
                    createClinicA(req, res);
                    break;
                case "viewAnnouncements":
//                    res.getWriter().println("view announcements");
                    viewAnnouncements(req, res);
                    break;
                case "deleteA":
                    res.getWriter().println("delete announcements");
                    deleteAnnouncements(req, res);
                    break;
                case "createVA":
//                    res.getWriter().println("createA");
                    createVClinicA(req, res);
                    break;
                case "viewVAnnouncements":
//                    res.getWriter().println("viewallVVAnnouncements");
                    viewVAnnouncements(req, res);
                    break;
                case "deleteVA":
//                    res.getWriter().println("viewVAnnouncements");
                    deleteVAnnouncements(req, res);
                    break;
                default:
                    res.getWriter().println("404 Page not Found");
                    break;
            }
        } catch (Exception error) {
            throw new ServletException(error);
        }
    }

    private void deleteVAnnouncements(HttpServletRequest req, HttpServletResponse res) throws IOException {
        System.out.println("Deleteeeeeeeeee");
        String nic="199910910061";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("sDetails")) {
                    nic = cookie.getValue().split("/")[3];
                }
            }
        }
        VaccineClinicAnnouncementsModel deleteVAnnouncements = new VaccineClinicAnnouncementsModel(
                "",
                req.getParameter("clinicID"),
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                nic,
                "",
                "",
                "",
                ""
        );
        System.out.println("delete");
        String result = clinicalAnnouncementsDAO.deleteVAnnouncements(deleteVAnnouncements);
        res.getWriter().println(result);
        System.out.println(result);
    }


    private void viewVAnnouncements(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String nic="199910910061";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("sDetails")) {
                    nic = cookie.getValue().split("/")[3];
                }
            }
        }
        VaccineClinicAnnouncementsModel viewVAnnouncements= new VaccineClinicAnnouncementsModel(
                 "",
                   "",
                   "",
                   "",
                   "",
                   "",
                   "",
                   "",
                   "",
                   nic,
                   "",
                   "",
                   "",
                   ""

           );
        ArrayList<VaccineClinicAnnouncementsModel> result= clinicalAnnouncementsDAO.ViewVAnnouncements(viewVAnnouncements);
        res.getWriter().println(gson.toJson(result));
    }

    private void createVClinicA(HttpServletRequest req, HttpServletResponse res) throws IOException {
//       res.getWriter().println("vaccine announcement");
        String nic="199910910061";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("sDetails")) {
                    nic = cookie.getValue().split("/")[3];
                }
            }
        }
        VaccineClinicAnnouncementsModel vaccineClinicAnnouncement= new VaccineClinicAnnouncementsModel(
                req.getParameter("image"),
                req.getParameter("CId"),
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                nic,
                "",
                "",
                "",
                ""

        );
        String result = clinicalAnnouncementsDAO.createVClinicA(vaccineClinicAnnouncement);
        res.getWriter().println(result);
//        System.out.println(result);
    }

    private void viewAnnouncements(HttpServletRequest req, HttpServletResponse res) throws IOException {
//      res.getWriter().println("announcement view");
        String nic="199910910061";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("sDetails")) {
                    nic = cookie.getValue().split("/")[3];
                }
            }
        }
        CreateClinicAnnouncementsModel viewAnnouncement=new CreateClinicAnnouncementsModel(
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
              "",
              nic
      );
        ArrayList<CreateClinicAnnouncementsModel> result= clinicalAnnouncementsDAO.ViewclinicAnnouncements(viewAnnouncement);
        res.getWriter().println(gson.toJson(result));
    }


    private void createClinicA(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//        res.getWriter().println("announcement controller");
        String nic="199910910061";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("sDetails")) {
                    nic = cookie.getValue().split("/")[3];
                }
            }
        }
        System.out.println("came to controller");
        CreateClinicAnnouncementsModel createClinicAnnouncementsModel = new CreateClinicAnnouncementsModel(
                "",
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
                req.getParameter("image"),
                nic
        );
        String result = clinicalAnnouncementsDAO.createClinicA(createClinicAnnouncementsModel);
        res.getWriter().println(result);
        System.out.println(result);
    }

    private void deleteAnnouncements(HttpServletRequest req,HttpServletResponse res) throws IOException {
        System.out.println("Deleteeeeeeeeee");
        String nic="199910910061";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("sDetails")) {
                    nic = cookie.getValue().split("/")[3];
                }
            }
        }
        CreateClinicAnnouncementsModel deleteAnnouncements = new CreateClinicAnnouncementsModel(
                "",
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
                nic
        );
        System.out.println("delete");
        String result = clinicalAnnouncementsDAO.deleteAnnouncements(deleteAnnouncements);
        res.getWriter().println(result);
        System.out.println(result);
    }
}


