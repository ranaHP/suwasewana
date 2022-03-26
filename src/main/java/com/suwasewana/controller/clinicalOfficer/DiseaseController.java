package com.suwasewana.controller.clinicalOfficer;

import com.google.gson.Gson;
import com.suwasewana.dao.DiseaseDAO;
import com.suwasewana.dao.DiseaselistDAO;
import com.suwasewana.dao.createClinicDAO;
import com.suwasewana.model.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;

@WebServlet("/disease-controller/*")
    public class DiseaseController extends HttpServlet {
        createClinicDAO createClinicDAO;
        DiseaseDAO diseaseDAO;
        DiseaselistDAO diseaselistDAO;
        private Gson gson = new Gson();


    public void init() {
            createClinicDAO = new createClinicDAO();
            diseaseDAO=new DiseaseDAO();
            diseaselistDAO = new DiseaselistDAO();
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

                case "Getmaxdiseasecount":
//                    res.getWriter().println("select-V-Clinics");
                    Getmaxdiseasecount(req, res);
                    break;
                case "disease":
                    disease_list(req,res);
                    break;    


                default:
                    res.getWriter().println("404 Page not Found");
                    break;
            }
        } catch (Exception error) {
            throw new ServletException(error);
        }
    }

    private void disease_list(HttpServletRequest req, HttpServletResponse res) throws IOException {
      System.out.println("came");
        ArrayList<UserDiseaseModel> result = diseaselistDAO.diseaseLists();
        res.getWriter().println(gson.toJson(result));
    }

    private void searchFromDate(HttpServletRequest req, HttpServletResponse res) {
    }




    private void Getmaxdiseasecount(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String moh="1003";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("sDetails")) {
                    moh = cookie.getValue().split("/")[4];
                }
            }
        }
        String m1date1 =req.getParameter("m1date1");
        String m1date2 =req.getParameter("m1date2");
        String m2date1 =req.getParameter("m2date1");
        String m2date2 =req.getParameter("m2date2");
        String m3date1 =req.getParameter("m3date1");
        String m3date2 =req.getParameter("m3date2");
        String m4date1 =req.getParameter("m4date1");
        String m4date2 =req.getParameter("m4date2");
        String m5date1 =req.getParameter("m5date1");
        String m5date2 =req.getParameter("m5date2");
        String m6date1 =req.getParameter("m6date1");
        String m6date2 =req.getParameter("m6date2");

        DiseaseReportModel diseaseReportModel=new DiseaseReportModel(
                "",
                m1date1+"/"+m1date2,
                m2date1+"/"+m2date2,
                m3date1+"/"+m3date2,
                m4date1+"/"+m4date2,
                m5date1+"/"+m5date2,
                m6date1+"/"+m6date2,
                moh,
                m1date1,
                m1date2
        );



        DiseaseReportModel result = diseaseDAO.Getmaxdiseasecount(diseaseReportModel);
        res.getWriter().println(gson.toJson(result));
    }

}
