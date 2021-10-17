package com.suwasewana.controller.clinicalOfficer;

import com.google.gson.Gson;
import com.suwasewana.dao.createClinicDAO;
import com.suwasewana.model.CreateClinicModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/create-clinic-controller/*")
    public class createClinicController extends HttpServlet {
        createClinicDAO createClinicDAO;
        private Gson gson = new Gson();
        public void init() {
            createClinicDAO = new createClinicDAO();
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
                case "create":
//                    res.getWriter().println("create");
                    createClinic(req,res);
                    break;
                case "view":
//                    res.getWriter().println("view");
                    viewClinic(req,res);
                    break;
                case "select":
//                    res.getWriter().println("select");
                      selectClinic(req,res);
                    break;
                default:
                    res.getWriter().println("404 Page not Found");
                    break;
            }
        } catch (Exception error) {
            throw new ServletException(error);
        }
    }

    private void createClinic(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
       CreateClinicModel createClinic = new CreateClinicModel(
               req.getParameter("disease"),
               req.getParameter("title"),
               req.getParameter("location"),
               req.getParameter("MOH"),
               req.getParameter("datetime"),
               req.getParameter("duration"),
               req.getParameter("maxpatient"),
               req.getParameter("conduct"),
               req.getParameter("description")
       );
        String result= createClinicDAO.createClinic(createClinic);
        res.getWriter().println(result);
    }
    private void viewClinic(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        CreateClinicModel viewClinic = new CreateClinicModel(
                "",
                req.getParameter("title"),
                "",
                "",
                "",
                "",
                "",
                "",
                ""
        );
        ArrayList<CreateClinicModel> result= createClinicDAO.ViewClinics(viewClinic);
        res.getWriter().println(gson.toJson(result));
    }

    private void selectClinic(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        CreateClinicModel selectClinic = new CreateClinicModel(
                "",
                req.getParameter("title"),
                "",
                "",
                "",
                "",
                "",
                "",
                ""
        );
        System.out.println("select");
        ArrayList<CreateClinicModel> result= createClinicDAO.selectClinics(selectClinic);
        res.getWriter().println(gson.toJson(result));
    }
}
