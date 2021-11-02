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
//                    res.getWriter().println("viewVAnnouncements");
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
        VaccineClinicAnnouncementsModel deleteVAnnouncements = new VaccineClinicAnnouncementsModel(
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
                req.getParameter("clinicID"),
                ""
        );
        System.out.println("delete");
        String result = clinicalAnnouncementsDAO.deleteVAnnouncements(deleteVAnnouncements);
        res.getWriter().println(result);
        System.out.println(result);
    }


    private void viewVAnnouncements(HttpServletRequest req, HttpServletResponse res) throws IOException {
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
        VaccineClinicAnnouncementsModel vaccineClinicAnnouncement= new VaccineClinicAnnouncementsModel(
                req.getParameter("title"),
                req.getParameter("description"),
                req.getParameter("image"),
                req.getParameter("Vaccinename"),
                req.getParameter("Maxlimit"),
                req.getParameter("Location"),
                req.getParameter("TargetPeoples"),
                req.getParameter("startdatetime"),
                req.getParameter("duration"),
                req.getParameter("age_limit"),
                req.getParameter("TargetMOH"),
                req.getParameter("CId"),
                req.getParameter("12")

        );
        String result = clinicalAnnouncementsDAO.createVClinicA(vaccineClinicAnnouncement);
        res.getWriter().println(result);
//        System.out.println(result);
    }

    private void viewAnnouncements(HttpServletRequest req, HttpServletResponse res) throws IOException {
//      res.getWriter().println("announcement view");
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
              ""
      );
        ArrayList<CreateClinicAnnouncementsModel> result= clinicalAnnouncementsDAO.ViewclinicAnnouncements(viewAnnouncement);
        res.getWriter().println(gson.toJson(result));
    }


    private void createClinicA(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//        res.getWriter().println("announcement controller");
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
                "12"
        );
        String result = clinicalAnnouncementsDAO.createClinicA(createClinicAnnouncementsModel);
        res.getWriter().println(result);
        System.out.println(result);
    }

    private void deleteAnnouncements(HttpServletRequest req,HttpServletResponse res) throws IOException {
        System.out.println("Deleteeeeeeeeee");
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
                ""
        );
        System.out.println("delete");
        String result = clinicalAnnouncementsDAO.deleteAnnouncements(deleteAnnouncements);
        res.getWriter().println(result);
        System.out.println(result);
    }
}


