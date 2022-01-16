package com.suwasewana.controller.user;

import com.google.gson.Gson;
import com.suwasewana.core.ResponseType;
import com.suwasewana.dao.UserDAO;
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
                default:
                    res.getWriter().println("404 Page not Found");
                    break;
            }


        }catch (Exception error){
            throw new ServletException(error);
        }
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