package com.suwasewana.controller.user;

import com.google.gson.Gson;
import com.suwasewana.dao.UserDAO;
import com.suwasewana.dao.VaccineDAO;
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

@WebServlet("/Vaccine-controller/*")
public class VaccineController extends HttpServlet {
    UserDAO userDAO;
    VaccineDAO vaccineDAO;
    private Gson gson = new Gson();

    public void init() {

        userDAO = new UserDAO();
        vaccineDAO= new VaccineDAO();
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        doGet(req, res);

    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        res.setCharacterEncoding("UTF-8");
        String getUrlData [] = req.getRequestURI().split("/");
        try {
            RequestDispatcher rd;
            switch (getUrlData[getUrlData.length-1]) {
                case "viewVaccinedetail":
                    ViewVaccine(req, res);
                    break;
                case "viewVaccineClinicdetail":
                    ViewVaccineclinicForUser(req, res);
                    break;
                case "updateVaccineNextSloat_Maxseet":
                    updateVaccineNextSloat_Maxseet(req, res);
                    break;
                case "GetRegisterdVaccineClinicDetail":
                    GetRegisterdVaccineClinicDetail(req, res);
                    break;
                case "CancleVaccineClinic":
                    CancleVaccineClinic(req, res);
                    break;
                case "GetuserVaccineDetail":
                    GetuserVaccineDetail(req, res);
                    break;
                case "GetVaccineClinicDetailForReschdule":
                    GetVaccineClinicDetailForReschdule(req, res);
                    break;
                case "updateTimeSlotsOfUsers":
                    updateTimeSlotsOfUsers(req, res);
                    break;
                case "updateTimeSlotsOfClinicTable":
                    updateTimeSlotsOfClinicTable(req, res);
                    break;

                default:
                    res.getWriter().println("404 Page not Found");
                    break;
            }
        } catch (Exception error) {
            throw new ServletException(error);
        }

    }
    private void GetuserVaccineDetail(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        ArrayList<VaccineForHospitalModel> result = vaccineDAO.GetuserVaccineDetail();
        res.getWriter().println(gson.toJson(result));
    }
    private void GetVaccineClinicDetailForReschdule(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        //String clinicid=(req.getParameter("clinicid"));
        String clinicid="18";
        ArrayList<ReschduleVaccineUserSlotmodel> result = userDAO.GetRegisterdVaccineClinicTpAndDate(clinicid);
        res.getWriter().println(gson.toJson(result));
    }
    private void CancleVaccineClinic(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String regNo=req.getParameter("regNo");
        String availableDose=req.getParameter("availableDose");
        String clinicid=req.getParameter("clinicid");
//        System.out.println("data in controller");
//        System.out.println("regNo : "+regNo);
//        System.out.println("availableDose : "+availableDose);

        String result = userDAO.CancleRegisterdVaccineClinic(regNo,availableDose,clinicid);
        res.getWriter().println(result);
    }

    private void GetRegisterdVaccineClinicDetail(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String nic = "199910910060";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("uDetails")) {
                    nic = cookie.getValue().split("/")[1];
                }
            }
        }


//        String nic="199910910064";
        ArrayList<VaccineClinicAnnouncementsModelForUser> result = userDAO.GetRegisterdVaccineClinicDetail(nic);
        res.getWriter().println(gson.toJson(result));
    }
    private void ViewVaccineclinicForUser(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String uNic = "199910910060";
        String UMoh= "1003";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("uDetails")) {
                    uNic = cookie.getValue().split("/")[1];
                    UMoh= cookie.getValue().split("/")[4];
                }
            }
        }
        //String mohid="1002";
        //String nic="199910910064";
        String mohid=UMoh;
        String nic=uNic;
//        System.out.println("1UNic- "+uNic);
//        System.out.println("1UMoh - "+UMoh);
        ArrayList<VaccineClinicAnnouncementsModelForUser> result = userDAO.GetVaccineClinicDetail(mohid,nic);
        res.getWriter().println(gson.toJson(result));
    }
    private void updateVaccineNextSloat_Maxseet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String uNic = "199910910060";
        String UTp= "0713806000";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("uDetails")) {
                    uNic = cookie.getValue().split("/")[1];
                    UTp= cookie.getValue().split("/")[3];
                }
            }
        }
//        System.out.println("2UNic- "+uNic);
//        System.out.println("2UTp - "+UTp);
        //uNic ="199910910064";
               // UTp="0713805000";
        String new_next_sloat=req.getParameter("new_next_sloat");
        String Set_sloat=req.getParameter("Set_sloat");
        String avalabel_seats=req.getParameter("avalabel_seats");
        String vaccine_clinic_id=req.getParameter("vaccine_clinic_id");
        String date=req.getParameter("Date");
        String vaccine_id=req.getParameter("vaccine_id");
        String Que_No=req.getParameter("Next_Que_no");
        String nic=uNic;
        String Tp=UTp;
        String result = userDAO.UserRegisterForVaccineClinic(new_next_sloat,Set_sloat,
                avalabel_seats,
                vaccine_clinic_id,
                date,
                vaccine_id,
                nic,
                Tp,
                Que_No);
        res.getWriter().println(result);
    }
    private void updateTimeSlotsOfUsers(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {


        String clinic_id=req.getParameter("clinic_id");
        String newslot_Date=req.getParameter("newslot_Date");
        String newslot_time=req.getParameter("newslot_time");


        String result = userDAO.updateTimeSlotsOfUsers(clinic_id,newslot_Date,newslot_time);
        res.getWriter().println(result);
    }
    private void updateTimeSlotsOfClinicTable(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {


        String clinic_id=req.getParameter("clinic_id");
        String newslot_Date=req.getParameter("newslot_Date");


        String result = userDAO.updateTimeSlotsInClinicTable(clinic_id,newslot_Date);
        res.getWriter().println(result);
    }


    private void UserMOHIdTpno(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String uNic = "";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("uDetails")) {
                    uNic = cookie.getValue().split("/")[1];
                }
            }
        }

        String nic=uNic;
        ArrayList<User> result = userDAO.GetUserMOHIdTpno(nic);
        res.getWriter().println(gson.toJson(result));
    }
    private void ViewVaccine(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

    }


}