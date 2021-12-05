package com.suwasewana.controller.user;

import com.google.gson.Gson;
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

@WebServlet("/Vaccine-controller/*")
public class VaccineController extends HttpServlet {
    UserDAO userDAO;
    private Gson gson = new Gson();

    public void init() {
        userDAO = new UserDAO();
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

                default:
                    res.getWriter().println("404 Page not Found");
                    break;
            }
        } catch (Exception error) {
            throw new ServletException(error);
        }

    }
    private void CancleVaccineClinic(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String regNo=req.getParameter("regNo");

        String result = userDAO.CancleRegisterdVaccineClinic(regNo);
        res.getWriter().println(result);
    }

    private void GetRegisterdVaccineClinicDetail(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String nic="199910910064";
        ArrayList<VaccineClinicAnnouncementsModelForUser> result = userDAO.GetRegisterdVaccineClinicDetail(nic);
        res.getWriter().println(gson.toJson(result));
    }
    private void ViewVaccineclinicForUser(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String mohid="1002";
        String nic="199910910064";
        ArrayList<VaccineClinicAnnouncementsModelForUser> result = userDAO.GetVaccineClinicDetail(mohid,nic);
        res.getWriter().println(gson.toJson(result));
    }
    private void updateVaccineNextSloat_Maxseet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String new_next_sloat=req.getParameter("new_next_sloat");
        String Set_sloat=req.getParameter("Set_sloat");
        String avalabel_seats=req.getParameter("avalabel_seats");
        String vaccine_clinic_id=req.getParameter("vaccine_clinic_id");
        String date=req.getParameter("Date");
        String vaccine_id=req.getParameter("vaccine_id");
        String nic="199910910064";
        String result = userDAO.UserRegisterForVaccineClinic(new_next_sloat,Set_sloat,
                avalabel_seats,
                vaccine_clinic_id,
                date,
                vaccine_id,
                nic);
        res.getWriter().println(result);
    }

    private void ViewVaccine(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

//        res.getWriter().println(result);
    }





}
