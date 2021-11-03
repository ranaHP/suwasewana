package com.suwasewana.controller.user;

import com.google.gson.Gson;
import com.suwasewana.dao.UserDAO;
import com.suwasewana.model.UserHomeDiseaseModel;
import com.suwasewana.model.UserHomeModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
@WebServlet("/user-home-disease-controller")
public class UserHomeDiseaseController extends HttpServlet {

    UserDAO userDAO;
    private Gson gson = new Gson();

    public void init() {
        userDAO = new UserDAO();
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        doGet(req, res);

    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        System.out.println("data come to disease servtelet");
        userViewHomeDisease(req, res);
    }

    private void userViewHomeDisease(HttpServletRequest req, HttpServletResponse res) throws IOException {
//        String uNic = "";
//        Cookie[] cookies = req.getCookies();
//        if(cookies !=null){
//            for(Cookie cookie : cookies){
//                if(cookie.getName().equals("unic")) {
//                    uNic = cookie.getValue();
//                }
//            }
//        }
        UserHomeDiseaseModel userhomedisease = new UserHomeDiseaseModel(

                "",
                "",
                "",
                "",
                req.getParameter("active_cases"),
                req.getParameter("death_cases"),
                req.getParameter("recovered_cases"),
                "",
                ""

        );
        ArrayList<UserHomeDiseaseModel> result = userDAO.userGethomedisease(userhomedisease);
        res.getWriter().println(gson.toJson(result));
    }
}
