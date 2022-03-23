package com.suwasewana.controller.user;

import com.google.gson.Gson;
import com.suwasewana.dao.DiseaselistDAO;
import com.suwasewana.dao.UserDAO;
import com.suwasewana.model.User;
import com.suwasewana.model.UserDiseaseModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/user-disease-controller/*")
public class UserDiseaseController extends HttpServlet {

    UserDAO userDAO;
    DiseaselistDAO diseaselistDAO;
    private Gson gson = new Gson();

    public void init() throws ServletException {
        userDAO = new UserDAO();
    }

    public void doPost (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doGet(req,res);
    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        res.setCharacterEncoding("UTF-8");
        String getUrlData [] = req.getRequestURI().split("/");
        try{
            RequestDispatcher rd;
            switch (getUrlData[getUrlData.length-1]){

                    case "view":
                        UserviewDiseasedetails(req,res);
                        break;

                    case "register":
                        UserregisterDiseasedetails(req,res);
                        break;

                    case "patientG":
                        patientG(req,res);
                        break;

                    case "patientTP":
                        patientTP(req,res);
                        break;

                    case "disease":
                        diseaselist(req,res);
                        break;

                    default:
                        res.getWriter().println("404 Page not Found");
                        break;
            }


        }catch (Exception error){
            throw new ServletException(error);
        }
    }

    private void diseaselist(HttpServletRequest req, HttpServletResponse res) throws IOException {
        System.out.println("dta controllwe");
        ArrayList<UserDiseaseModel> result = diseaselistDAO.diseaseList();
        res.getWriter().println(gson.toJson(result));
    }

    private void patientTP(HttpServletRequest req, HttpServletResponse res) throws IOException {
        System.out.println("dta controllwe");
        String moh="1004";
        String disease=req.getParameter("name");
        ArrayList<User> result = userDAO.patientTP(moh,disease);
        res.getWriter().println(gson.toJson(result));
    }

    private void patientG(HttpServletRequest req, HttpServletResponse res) throws IOException {
        System.out.println("dta controllwe");
        String moh="1004";
        ArrayList<User> result = userDAO.patientcount(moh);
        res.getWriter().println(gson.toJson(result));
    }

    private void UserregisterDiseasedetails(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String name = req.getParameter("name");
        String UNic = "980930416v";

        String result = userDAO.userregisterdisease(name,UNic);
        res.getWriter().println(gson.toJson(result));
    }

    private void UserviewDiseasedetails(HttpServletRequest req, HttpServletResponse res) throws IOException {
        System.out.println("dta controllwe");
        UserDiseaseModel userdisease = new UserDiseaseModel(
                "",
                ""
        );
        ArrayList<UserDiseaseModel> result = userDAO.UserViewDiseaseDetails(userdisease);
        res.getWriter().println(gson.toJson(result));

    }




}
