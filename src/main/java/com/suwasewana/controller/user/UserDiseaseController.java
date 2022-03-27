package com.suwasewana.controller.user;

import com.google.gson.Gson;
import com.suwasewana.dao.UserDAO;
import com.suwasewana.model.User;
import com.suwasewana.model.UserDiseaseDetailsModel;
import com.suwasewana.model.UserDiseaseModel;
import com.suwasewana.model.UserRegisterDiseaeseModel;

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

@WebServlet("/user-disease-controller/*")
public class UserDiseaseController extends HttpServlet {

    UserDAO userDAO;
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

                    case "check":
                        UserregisterCheckDiseasedetails(req,res);
                        break;

                    case "patientG":
                        patientG(req,res);
                        break;

                    case "patientTP":
                        patientTP(req,res);
                        break;

                    case "search":
                        searchDisease(req,res);
                        break;

                    default:
                        res.getWriter().println("404 Page not Found");
                        break;
            }


        }catch (Exception error){
            throw new ServletException(error);
        }
    }

    private void UserregisterCheckDiseasedetails(HttpServletRequest req, HttpServletResponse res) throws IOException, SQLException {

        String d_id = req.getParameter("d_id");
//        String UNic = "980930416v";
        String uNic = "199910910060";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("uDetails")) {
                    uNic = cookie.getValue().split("/")[1];
                }
            }
        }

        UserRegisterDiseaeseModel userdisease = new UserRegisterDiseaeseModel(
                "",
                "",
                ""
        );

//        System.out.println("User register disease");
//        System.out.println(uNic);
//        System.out.println("enough");

        ArrayList<UserRegisterDiseaeseModel> result = userDAO.usercheckregisterdisease(userdisease,d_id,uNic);
        res.getWriter().println(gson.toJson(result));

    }

    private void patientTP(HttpServletRequest req, HttpServletResponse res) throws IOException {
//        System.out.println("dta controllwe");
        String moh="1004";
        String disease=req.getParameter("name");
        ArrayList<User> result = userDAO.patientTP(moh,disease);
        res.getWriter().println(gson.toJson(result));
    }

    private void patientG(HttpServletRequest req, HttpServletResponse res) throws IOException {
//        System.out.println("dta controllwe");
        String moh="1004";
        ArrayList<User> result = userDAO.patientcount(moh);
        res.getWriter().println(gson.toJson(result));
    }

    private void UserregisterDiseasedetails(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String name = req.getParameter("name");
        String d_id = req.getParameter("d_id");
//        String UNic = "980930416v";
        String uNic = "";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("uDetails")) {
                    uNic = cookie.getValue().split("/")[1];
                }
            }
        }

//        System.out.println("User register disease");
//        System.out.println(uNic);
//        System.out.println("enough");

        String result = userDAO.userregisterdisease(name,uNic,d_id);
        res.getWriter().println(gson.toJson(result));
    }

    private void UserviewDiseasedetails(HttpServletRequest req, HttpServletResponse res) throws IOException {
//        System.out.println("dta controllwe");
        UserDiseaseDetailsModel userdisease = new UserDiseaseDetailsModel(
                "",
                "",
                ""
        );
        ArrayList<UserDiseaseDetailsModel> result = userDAO.UserViewDiseaseDetails(userdisease);
        res.getWriter().println(gson.toJson(result));

    }



    private void searchDisease(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, SQLException {
//        System.out.println("title"+req.getParameter("Title"));
        System.out.println("type"+req.getParameter("complaintype"));
        String title=req.getParameter("complaintype");

        ArrayList<UserDiseaseDetailsModel> result = userDAO.SearchDiseaseDetails(title);
        res.getWriter().println(gson.toJson(result));
    }




}
