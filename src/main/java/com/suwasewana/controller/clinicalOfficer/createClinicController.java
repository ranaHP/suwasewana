package com.suwasewana.controller.clinicalOfficer;

import com.google.gson.Gson;
import com.suwasewana.dao.createClinicDAO;
import com.suwasewana.model.CreateClinicModel;
import com.suwasewana.model.MOHModel;
import com.suwasewana.model.vaccineClinicModel;

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
//                    res.getWriter().println("vaccineCLinic");
                    vaccineClinic(req, res);
                    break;
                case "deleteV":
//                    res.getWriter().println("VaccineClinicsView");
                    VaccineClinicsdelete(req, res);
                    break;
                case "VaccineClinicsView":
//                    res.getWriter().println("VaccineClinicsView");
                    VaccineClinicsView(req, res);
                    break;
                case "select-V-Clinics":
//                    res.getWriter().println("select-V-Clinics");
                    VaccineClinicsSelect(req, res);
                case "all-V-Clinics":
//                    res.getWriter().println("select-V-Clinics");
                    AllVaccineClinics(req, res);
                    break;
                case "all-Clinics":
//                    res.getWriter().println("select-V-Clinics");
                    AllClinics(req, res);
                    break;

                default:
                    res.getWriter().println("404 Page not Found");
                    break;
            }
        } catch (Exception error) {
            throw new ServletException(error);
        }
    }

    private void AllClinics(HttpServletRequest req, HttpServletResponse res) throws IOException {
        ArrayList<CreateClinicModel> result = createClinicDAO.allClinics();
        res.getWriter().println(gson.toJson(result));
    }

    private void AllVaccineClinics(HttpServletRequest req, HttpServletResponse res) throws IOException {

//        System.out.println("Come to view moh controller");
        ArrayList<vaccineClinicModel> result1 = createClinicDAO.allvClinics();
        res.getWriter().println(gson.toJson(result1));
        }

    private void VaccineClinicsdelete(HttpServletRequest req, HttpServletResponse res) throws IOException {
        System.out.println("Deleteeeeeeeeee");
        vaccineClinicModel deleteVClinic = new vaccineClinicModel(
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
        String result = createClinicDAO.deleteVClinic(deleteVClinic);
        res.getWriter().println(result);
        System.out.println(result);
    }


    private void VaccineClinicsSelect(HttpServletRequest req, HttpServletResponse res) throws IOException {
//            res.getWriter().println("came");
            vaccineClinicModel selectVaclinics= new vaccineClinicModel(
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

        ArrayList<vaccineClinicModel> result= createClinicDAO.selectVClinics(selectVaclinics);
        res.getWriter().println(gson.toJson(result));
        }

    private void VaccineClinicsView(HttpServletRequest req, HttpServletResponse res) throws IOException {
//            res.getWriter().println("vaccine");
            vaccineClinicModel vaccineClinicView = new vaccineClinicModel(
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
        ArrayList<vaccineClinicModel> result= createClinicDAO.ViewVaccineClinics(vaccineClinicView);
        res.getWriter().println(gson.toJson(result));
    }

    private void vaccineClinic(HttpServletRequest req, HttpServletResponse res) throws IOException {
            res.getWriter().println("vaccine");
        vaccineClinicModel vaccineclinic= new vaccineClinicModel(
                "",
                req.getParameter("clinictitle"),
                req.getParameter("datetime"),
                req.getParameter("duration"),
                req.getParameter("description"),
                req.getParameter("maxpatient"),
                req.getParameter("MArea"),
                req.getParameter("patient"),
                req.getParameter("Agelimit"),
                req.getParameter("12"),
                req.getParameter("vaccine"),
                req.getParameter("location"),
                req.getParameter("Dosecount")

        );

        String result = createClinicDAO.vaccineClinic(vaccineclinic);
        res.getWriter().println(result);

    }

    private void updateClinic(HttpServletRequest req, HttpServletResponse res) throws IOException {
        res.getWriter().println("update");
        CreateClinicModel updateClinic= new CreateClinicModel(

                req.getParameter("clinicID"),
                req.getParameter("title"),
                req.getParameter("datetime"),
                req.getParameter("duration"),
                req.getParameter("disease"),
                req.getParameter("description"),
                req.getParameter("maxpatient"),
                req.getParameter("conduct"),
                req.getParameter("targetMOH"),
                req.getParameter("patient"),
                req.getParameter("location"),
                "12"

        );
        System.out.println("updateeeeeeeeeee");
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
                    req.getParameter("title"),
                    req.getParameter("datetime"),
                    req.getParameter("duration"),
                    req.getParameter("disease"),
                    req.getParameter("description"),
                    req.getParameter("maxpatient"),
                    req.getParameter("conduct"),
                    req.getParameter("MOH"),
                    req.getParameter("Target"),
                    req.getParameter("location"),
                    "12"

       );
        String result= createClinicDAO.createClinic(createClinic);
        res.getWriter().println(result);
    }
    private void viewClinic(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        CreateClinicModel viewClinic = new CreateClinicModel(
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
        ArrayList<CreateClinicModel> result= createClinicDAO.ViewClinics(viewClinic);
        res.getWriter().println(gson.toJson(result));
    }

    private void selectClinic(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
            System.out.println("selettttttttttttttttt");
        CreateClinicModel selectClinic = new CreateClinicModel(
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
