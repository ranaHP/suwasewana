package com.suwasewana.controller.clinicalOfficer;

import com.google.gson.Gson;
import com.suwasewana.dao.clinicalAnnouncementsDAO;
import com.suwasewana.dao.createClinicDAO;
import com.suwasewana.model.CreateClinicAnnouncementsModel;
import com.suwasewana.model.CreateClinicModel;

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
//                case "updateclinic":
////                    res.getWriter().println("updateclinics");
//                    updateClinic(req, res);
//                    break;
                default:
                    res.getWriter().println("404 Page not Found");
                    break;
            }
        } catch (Exception error) {
            throw new ServletException(error);
        }
    }



    private void createClinicA(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//        res.getWriter().println("announcement controller");
        System.out.println("came to controller");
        CreateClinicAnnouncementsModel createClinicAnnouncementsModel = new CreateClinicAnnouncementsModel(
                req.getParameter("clinicID"),
                req.getParameter("disease"),
                req.getParameter("title"),
                req.getParameter("location"),
                req.getParameter("targetMOH"),
                req.getParameter("datetime"),
                req.getParameter("duration"),
                req.getParameter("maxpatient"),
                req.getParameter("patient"),
                req.getParameter("conduct"),
                req.getParameter("description"),
                req.getParameter("image"),
                "12"
        );
        String result = clinicalAnnouncementsDAO.createClinicA(createClinicAnnouncementsModel);
        res.getWriter().println(result);
        System.out.println(result);
    }

}
