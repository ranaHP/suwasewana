package com.suwasewana.controller.Admin;

import com.google.gson.Gson;
import com.suwasewana.dao.AdminDAO;
import com.suwasewana.dao.UserDAO;
import com.suwasewana.model.*;

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

@WebServlet("/admin-register-controller/*")
public class RegisterController extends HttpServlet {
    UserDAO userDAO;
    AdminDAO adminDAO;
    private Gson gson = new Gson();

    public void init() {
        adminDAO= new AdminDAO();
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        doGet(req, res);

    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        res.setCharacterEncoding("UTF-8");
        String getUrlData [] = req.getRequestURI().split("/");
//        res.getWriter().println(" request uri"  + req.getRequestURI() + "  data -: " +  getUrlData[getUrlData.length-1] );
        try {
            RequestDispatcher rd;
            switch (getUrlData[getUrlData.length-1]) {
                case "clinical_officer":
                    RegClinicalOfficer(req, res);
                    break;
                case "phi":
                    RegPHI(req, res);
                    break;
                case "moh":
                    RegMOH(req, res);
                    break;
                case "vaccine":
                    AddVaccine(req, res);
                    break;
                case "All_vaccine_details":
                    AllVaccineDetails(req, res);
                    break;
                case "delvaccine":
                    DelVaccine(req, res);
                    break;
                case "updatevaccine":
                    UpdateVaccine(req, res);
                    break;
                case "updatevaccinewithoutimg":
                    UpdateVaccinewithoutimg(req, res);
                    break;
                case "vaccinehide":
                    vaccinehide(req, res);
                    break;
                case "vaccineunhide":
                    vaccineunhide(req, res);
                    break;

                default:
                    res.getWriter().println("404 Page not Found");
                    break;
            }
        } catch (Exception error) {
            throw new ServletException(error);
        }

    }
    private void AllVaccineDetails(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        ArrayList<VaccineModel> result = adminDAO.GetVaccineDetail();
        res.getWriter().println(gson.toJson(result));
    }

    private void DelVaccine(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String result = adminDAO.DelVaccine(req.getParameter("V_Type")) ;
        res.getWriter().println(result);
    }
    private void vaccinehide(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String result = adminDAO.HideVaccine( req.getParameter("V_Type")) ;
        res.getWriter().println(result);
    }
    private void vaccineunhide(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String result = adminDAO.UnHideVaccine( req.getParameter("V_Type")) ;
        res.getWriter().println(result);
    }
    private void UpdateVaccine(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        System.out.println("co,e to controller");
        VaccineModel vaccineModel=new VaccineModel(
                req.getParameter("id"),
                req.getParameter("Name"),
                req.getParameter("Country"),
                req.getParameter("Recommended_for"),
                req.getParameter("Date"),
                req.getParameter("image"),
                req.getParameter("status"),
                req.getParameter("dosage"),
                req.getParameter("side_effects"),
                req.getParameter("how_work"),
                req.getParameter("How_Well_work"),
                ""
        );

        String result = adminDAO.UpdateVaccine(vaccineModel) ;
        res.getWriter().println(result);
    }
    private void UpdateVaccinewithoutimg(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        System.out.println("co,e to controller");
        VaccineModel vaccineModel=new VaccineModel(
                req.getParameter("id"),
                req.getParameter("Name"),
                req.getParameter("Country"),
                req.getParameter("Recommended_for"),
                req.getParameter("Date"),
                req.getParameter("image"),
                req.getParameter("status"),
                req.getParameter("dosage"),
                req.getParameter("side_effects"),
                req.getParameter("how_work"),
                req.getParameter("How_Well_work"),
                ""
        );

        String result = adminDAO.UpdateVaccinewithoutimg(vaccineModel) ;
        res.getWriter().println(result);
    }

    private void AddVaccine(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        VaccineModel vaccineModel=new VaccineModel(
                "",
                req.getParameter("Name"),
                req.getParameter("Country"),
                req.getParameter("Recommended_for"),
                req.getParameter("Date"),
                req.getParameter("image"),
                req.getParameter("status"),
                req.getParameter("dosage"),
                req.getParameter("side_effects"),
                req.getParameter("how_work"),
                req.getParameter("How_Well_work"),
                ""
        );

        String result = adminDAO.AddnewVaccine(vaccineModel) ;
        res.getWriter().println(result);
    }
    private void RegMOH(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        MOHRegModel mohRegModel= new MOHRegModel(
                req.getParameter("uname"),
                req.getParameter("Mobiel"),
                req.getParameter("MOHHead"),
                "",
                "",
                req.getParameter("district"),
                req.getParameter("city"),
                req.getParameter("x"),
                req.getParameter("y")
        );


        String result = adminDAO.mohRegistration(mohRegModel);
        res.getWriter().println(result);
    }





    private void RegPHI(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//        PHIModel phiModel= new PHIModel(
//                req.getParameter("full_name"),
//                req.getParameter("NIC"),
//                req.getParameter("mobile"),
//                req.getParameter("Address"),
//                req.getParameter("city"),
//                req.getParameter("District"),
//                req.getParameter("phi_post"),
//                req.getParameter("postalCode"),
//                req.getParameter("MOHArea"),
//                req.getParameter("DP")
//        );
        PHIModel phiModel= new PHIModel(
                req.getParameter("MOHArea"),
                req.getParameter("postalCode"),
          "",
                "",
                req.getParameter("phi_post"),
                "",
                req.getParameter("District"),
                req.getParameter("city"),
                req.getParameter("Address"),
                "",
                req.getParameter("mobile"),
                req.getParameter("NIC"),
                req.getParameter("full_name"),
                req.getParameter("DP"),
                "",
                "",
                "",
                "",
                ""

        );



        String result = adminDAO.phiRegistration(phiModel);
        res.getWriter().println(result);
    }






    private void RegClinicalOfficer(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        ClinicalOfficerModel clinicalOfficerModel=new ClinicalOfficerModel(
                req.getParameter("full_name"),
                req.getParameter("NIC"),
                req.getParameter("mobile"),
                req.getParameter("city"),
                req.getParameter("District"),
                req.getParameter("DP"),
                req.getParameter("MOHArea")
        );
        String result = adminDAO.ClinicalOfficerRegistration(clinicalOfficerModel);
        res.getWriter().println(result);
    }







    private void uerMakeAppointment(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String uNic = "";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("unic")) {
                    uNic = cookie.getValue();
                }
            }
        }
        AppointmentModel userAppointmentDetails = new AppointmentModel(
                req.getParameter("aTitle"),
                req.getParameter("aType"),
                req.getParameter("aPhi"),
                req.getParameter("aReason"),
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                uNic,
                "",
                ""
        );
        String result = userDAO.UserMakeAppointment(userAppointmentDetails);
        res.getWriter().println(result);
    }

    private void userViewAppointment(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String uNic = "";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("unic")) {
                    uNic = cookie.getValue();
                }
            }
        }
        AppointmentModel userAppointmentDetails = new AppointmentModel(
                req.getParameter("aTitle"),
                req.getParameter("aType"),
                " ",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                uNic,
                "",
                ""
        );
        ArrayList<AppointmentModel> result = userDAO.userGetAppointmentDetails(userAppointmentDetails);
        res.getWriter().println(gson.toJson(result));
    }

    private void userViewAppointmentType(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String uNic = "";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("unic")) {
                    uNic = cookie.getValue();
                }
            }
        }
        ArrayList<AppointmentTypeModel> result = userDAO.userGetAppointmentTypes();
        res.getWriter().println(gson.toJson(result));
    }

    private void userDeleteAppointment(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, SQLException {

        String result = userDAO.UserDeleteAppointment(req.getParameter("appointmentId"));
        System.out.println(req.getParameter("appointmentId"));
        System.out.println(gson.toJson(result));
        res.getWriter().println(gson.toJson(result));
    }

}
