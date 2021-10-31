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
import java.lang.annotation.Target;
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
                case "delete":
                    res.getWriter().println("delete");
                      deleteClinic(req,res);
                    break;
                case "updateclinic":
                    res.getWriter().println("updateclinics");
                    updateClinic(req, res);
                    break;
                case "vaccineCLinic":
                    res.getWriter().println("vaccineCLinic");
                    updateClinic(req, res);
                    break;

                default:
                    res.getWriter().println("404 Page not Found");
                    break;
            }
        } catch (Exception error) {
            throw new ServletException(error);
        }
    }

    private void updateClinic(HttpServletRequest req, HttpServletResponse res) throws IOException {
        res.getWriter().println("update");
        CreateClinicModel updateClinic= new CreateClinicModel(

                req.getParameter("disease"),
                req.getParameter("title"),
                req.getParameter("location"),
                req.getParameter("MOH"),
                req.getParameter("datetime"),
                req.getParameter("duration"),
                req.getParameter("maxpatient"),
                req.getParameter("Target"),
                req.getParameter("conduct"),
                req.getParameter("description"),
                req.getParameter("clinicID"),
                "12"

        );
        System.out.println("update");
        String result= createClinicDAO.updateClinic(updateClinic);
        res.getWriter().println(result);
    }

    private void createClinic(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String CNic = "12";
//        Cookie[] cookies = req.getCookies();
//        if(cookies !=null){
//            for(Cookie cookie : cookies){
//                if(cookie.getName().equals("unic")) {
//                    cNic = cookie.getValue();
//                }
//            }
//        }
            CreateClinicModel createClinic = new CreateClinicModel(
               req.getParameter(""),
               req.getParameter("disease"),
               req.getParameter("title"),
               req.getParameter("location"),
               req.getParameter("MOH"),
               req.getParameter("datetime"),
               req.getParameter("duration"),
               req.getParameter("maxpatient"),
                    req.getParameter("Target"),
               req.getParameter("conduct"),
               req.getParameter("description"),
               "12"

       );
        String result= createClinicDAO.createClinic(createClinic);
        res.getWriter().println(result);
    }
    private void viewClinic(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        CreateClinicModel viewClinic = new CreateClinicModel(
                "",
                req.getParameter("disease"),
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "12",
                ""

        );
        ArrayList<CreateClinicModel> result= createClinicDAO.ViewClinics(viewClinic);
        res.getWriter().println(gson.toJson(result));
    }

    private void selectClinic(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
            System.out.println("selettttttttttttttttt");
        CreateClinicModel selectClinic = new CreateClinicModel(
                req.getParameter("clinicID"),
                req.getParameter("disease"),
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "12",
                ""


        );
        System.out.println("select");
        ArrayList<CreateClinicModel> result= createClinicDAO.selectClinics(selectClinic);
        res.getWriter().println(gson.toJson(result));
    }
    private void deleteClinic(HttpServletRequest req,HttpServletResponse res) throws IOException {
          System.out.println("Deleteeeeeeeeee");
          CreateClinicModel deleteClinic = new CreateClinicModel(
                  req.getParameter("clinicID"),
                  req.getParameter("title"),
                  "",
                  "",
                  "",
                  "",
                  "",
                  "",
                  "",
                  "",
                  "12",
                  ""
          );
          System.out.println("delete");
          String result = createClinicDAO.deleteClinic(deleteClinic);
         res.getWriter().println(result);
          System.out.println(result);
    }
}
