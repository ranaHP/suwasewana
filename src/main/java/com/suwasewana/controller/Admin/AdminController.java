package com.suwasewana.controller.Admin;

import com.google.gson.Gson;
import com.suwasewana.dao.*;
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

@WebServlet("/admin-controller/*")
public class AdminController extends HttpServlet {
    ComplainDAO complainDAO;
    MOHDAO mohdao;
    PHIDAO phidao;
    UserDAO userDAO;
    DistictDAO distictDAO;
    ProvinceDAO provinceDAO;
    PublicAnnouncementsDAO publicAnnouncementsDAO;
    private Gson gson = new Gson();

    public void init() {
        complainDAO = new ComplainDAO();
        mohdao=new MOHDAO();
        phidao=new PHIDAO();
        userDAO = new UserDAO();
        distictDAO=new DistictDAO();
        provinceDAO=new ProvinceDAO();
        publicAnnouncementsDAO = new PublicAnnouncementsDAO();
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

                case "mohall":
                    ViewMOHAll(req,res);
                    break;
                case "districtsSelect":
                    ViewSelectDisctirct(req,res);
                    break;
                case "districtsIdSelect":
                    SelectDisctirct(req,res);
                    break;
                case "provinceIdSelect":
                    SelectProvince(req,res);
                    break;
                case "provinceAll":
                    ViewProvinceAll(req,res);
                    break;
                case "PublicAnnouncement":
                    PublicAnnouncement(req,res);
                    break;
                    
                default:
                    res.getWriter().println("404 Page not Found");
                    break;
            }
        } catch (Exception error) {
            throw new ServletException(error);
        }

    }

    private void SelectProvince(HttpServletRequest req, HttpServletResponse res) throws IOException {
      ProvinceModel provinceS= new ProvinceModel(
              "",
               req.getParameter("PName")
      );
        ArrayList<ProvinceModel> result = provinceDAO.ProvinceNames(provinceS);
        res.getWriter().println(gson.toJson(result));
    }

    private void SelectDisctirct(HttpServletRequest req, HttpServletResponse res) throws IOException {
          DistrictModel districtS=new DistrictModel(
            "",
             req.getParameter("DName"),
             ""
          );
        ArrayList<DistrictModel> result = distictDAO.DistrictsNames(districtS);
        res.getWriter().println(gson.toJson(result));

    }

    private void PublicAnnouncement(HttpServletRequest req, HttpServletResponse res) throws IOException {
            PublicAnnouncementModel publicAnnouncement= new PublicAnnouncementModel(
                    "",
                 req.getParameter("title"),
                 req.getParameter("description")  ,
                 req.getParameter("image")
            );
        int result = publicAnnouncementsDAO.PublicAnnouncement(publicAnnouncement);
        res.getWriter().println(result);
    }

    private void ViewSelectDisctirct(HttpServletRequest req, HttpServletResponse res) throws IOException {
         DistrictModel districts=new DistrictModel(
                 req.getParameter("province_id"),
                 "",
                 ""
         );
         ArrayList<DistrictModel> result = distictDAO.selectDistricts(districts);
          res.getWriter().println(gson.toJson(result));
    }


    private void ViewProvinceAll(HttpServletRequest req, HttpServletResponse res) throws IOException {
        System.out.println("provice");
        ArrayList<ProvinceModel> result = provinceDAO.getProvinceList();
        res.getWriter().println(gson.toJson(result));
    }




    private void ViewMOHAll(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
        System.out.println("Come to view moh controller all");
        ArrayList<MOHRegModel> result = mohdao.GetallMOHDetails();
        res.getWriter().println(gson.toJson(result));
    }





}
