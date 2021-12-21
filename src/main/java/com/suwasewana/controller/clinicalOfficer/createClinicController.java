package com.suwasewana.controller.clinicalOfficer;

import com.google.gson.Gson;
import com.suwasewana.dao.createClinicDAO;
import com.suwasewana.model.ClinicCalenderEventModel;
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
import java.text.ParseException;
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
                case "updatevclinic":
//                    res.getWriter().println("updatevclinics");
                    updatevClinic(req, res);
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
                    break;
                case "viewdisease":
//                    res.getWriter().println("select-V-Clinics");
                    viewdisease(req, res);
                    break;
                case "choose":
//                    res.getWriter().println("select-V-Clinics");
                    choose(req, res);
                    break;
                case "viewcount":
//                    res.getWriter().println("select-V-Clinics");
                    viewcount(req, res);
                    break;
                case "clinicsEvents":
//                    res.getWriter().println("select-V-Clinics");
                    clinicsEvents(req, res);
                    break;
                case "updateAvailSheats":
//                    res.getWriter().println("select-V-Clinics");
                    updateAvailSheats(req, res);
                    break;

                default:
                    res.getWriter().println("404 Page not Found");
                    break;
            }
        } catch (Exception error) {
            throw new ServletException(error);
        }
    }

    private void updateAvailSheats(HttpServletRequest req, HttpServletResponse res) throws IOException {
        CreateClinicModel updateAvailSheats =new CreateClinicModel(
                req.getParameter("clinic_id"),
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                req.getParameter("Avail_seats"),
                "",
                "",
                "",
                "",
                "12"
        );
        String result= createClinicDAO.updateAvailSheats(updateAvailSheats);
        res.getWriter().println(gson.toJson(result));
        }

    private void clinicsEvents(HttpServletRequest req, HttpServletResponse res) throws IOException {
        CreateClinicModel cEvents =new CreateClinicModel(
                "",
                "",
                req.getParameter("date"),
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
                "12"
        );
        ArrayList<CreateClinicModel> result= createClinicDAO.Viewevents(cEvents);
        res.getWriter().println(gson.toJson(result));
        }

    private void viewcount(HttpServletRequest req, HttpServletResponse res) throws IOException {
        CreateClinicModel viewC = new CreateClinicModel(
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
                "12"

        );
        ArrayList<CreateClinicModel> result= createClinicDAO.ViewCount(viewC);
        res.getWriter().println(gson.toJson(result));
    }

    private void choose(HttpServletRequest req, HttpServletResponse res) throws IOException {
            String date=req.getParameter("datetime");
        ArrayList<ClinicCalenderEventModel> result=createClinicDAO.chooseClinic(date);
        res.getWriter().println(gson.toJson(result));

        }

    private void updatevClinic(HttpServletRequest req, HttpServletResponse res) throws IOException {
          vaccineClinicModel Updatevclinic= new vaccineClinicModel(
                req.getParameter("clinicID"),
                  req.getParameter("title"),
                  req.getParameter("datetime"),
                  req.getParameter("duration"),
                  "",
                  req.getParameter("maxpatient"),
                  "",
                  req.getParameter("Lage"),
                  req.getParameter("Uage"),
                  "",
                  "",
                  "",
                  req.getParameter("location"),
                  req.getParameter("dose")

          ) ;
        System.out.println("updateeeeeeeeeee");
        String result= createClinicDAO.updatevClinic(Updatevclinic);
        res.getWriter().println(result);
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
                    "199910910064",
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
                "",
                req.getParameter("maxpatient"),
                req.getParameter("MArea"),
                req.getParameter("LAgelimit"),
                req.getParameter("UAgelimit"),
                "199910910064",
                req.getParameter("vaccine"),
                "",
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
                req.getParameter("date"),
                req.getParameter("time"),
                req.getParameter("duration"),
                req.getParameter("disease"),
                req.getParameter("description"),
                req.getParameter("maxpatient"),
                "",
                req.getParameter("conduct"),
                "",
                req.getParameter("patient"),
                req.getParameter("location"),
                ""

        );
//        System.out.println("updateeeeeeeeeee");
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
                    req.getParameter("date"),
                    req.getParameter("time"),
                    req.getParameter("duration"),
                    req.getParameter("disease"),
                    req.getParameter("description"),
                    req.getParameter("maxpatient"),
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
    private void viewClinic(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, ParseException {
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
                "",
                "",
                "12"
        );
        ArrayList<CreateClinicModel> result= createClinicDAO.ViewClinics(viewClinic);
        res.getWriter().println(gson.toJson(result));
    }
    private void viewdisease(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, ParseException {
        CreateClinicModel viewdisease = new CreateClinicModel(
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
                "12"

        );
        ArrayList<CreateClinicModel> result= createClinicDAO.Viewdisease(viewdisease);
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
                "",
                "",
                "",
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
                  "",
                  "",
                  "",
                  "12"
          );
          System.out.println("delete");
          String result = createClinicDAO.deleteClinic(deleteClinic);
         res.getWriter().println(result);
          System.out.println(result);
    }
}
