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
    public class clinicAnnouncementController extends HttpServlet {
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
                case "createA":
                    res.getWriter().println("createA");
                    createClinicA(req,res);
                    break;

                default:
                    res.getWriter().println("404 Page not Found");
                    break;
            }
        } catch (Exception error) {
            throw new ServletException(error);
        }
    }

    private void createClinicA(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String CNic = "12";
//        Cookie[] cookies = req.getCookies();
//        if(cookies !=null){
//            for(Cookie cookie : cookies){
//                if(cookie.getName().equals("unic")) {
//                    cNic = cookie.getValue();
//                }
//            }
//        }A
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
       res.getWriter().println("awooooo");
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
