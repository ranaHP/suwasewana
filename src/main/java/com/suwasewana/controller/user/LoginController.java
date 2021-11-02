package com.suwasewana.controller.user;

import com.google.gson.Gson;
import com.suwasewana.core.ResponseType;
import com.suwasewana.dao.UserDAO;
import com.suwasewana.model.UserLoginModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
@WebServlet("/user-login-controller/*")
public class LoginController extends HttpServlet {
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
                case "user-login-controller":
                    checkUserLogin(req, res);
                    break;
                case "logout":
                    userLogout(req, res);
                    break;
                default:
                    res.getWriter().println("404 Page not Found");
                    break;
            }
        } catch (Exception error) {
            throw new ServletException(error);
        }

    }

    private void checkUserLogin(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String mobile = req.getParameter("user-mobile");
        String password = req.getParameter("user-password");

        UserLoginModel userLoginDetails = new UserLoginModel(mobile, password, "");
        UserLoginModel userLoginDetailsResponse = userDAO.CheckLoginValidationStatus(userLoginDetails);

        PrintWriter out = res.getWriter();
        res.setContentType("application/json");
        res.setCharacterEncoding("UTF-8");

        String responseJsonString = "";
        if (userLoginDetailsResponse.getMobile().equals("") || userLoginDetailsResponse.getPassword().equals("")) {
            if(!userLoginDetailsResponse.getMessage().equals("")){
                ResponseType suwasewanaRespose = new ResponseType("error", userLoginDetailsResponse.getMessage());
                responseJsonString = this.gson.toJson(suwasewanaRespose);
            }else{
                ResponseType suwasewanaRespose = new ResponseType("error", "invalid mobile number password");
                responseJsonString = this.gson.toJson(suwasewanaRespose);
            }
        } else {
            ResponseType suwasewanaRespose = new ResponseType("success", this.gson.toJson(userLoginDetailsResponse));
            responseJsonString = this.gson.toJson(suwasewanaRespose);
            String temp = userLoginDetailsResponse.getUname().split(" ")[0] +"/" + userLoginDetailsResponse.getUnic() + '/' + userLoginDetailsResponse.getMobile()+ '/' + userLoginDetailsResponse.getuMoh() + '/' + userLoginDetailsResponse.getuProvince() + '/' + userLoginDetailsResponse.getuDistrict() + '/' + userLoginDetailsResponse.getuCity();
            Cookie loginCookie = new Cookie("uDetails", temp);
            loginCookie.setMaxAge(300*60);
            res.addCookie(loginCookie);
        }
        out.print(responseJsonString);
        out.flush();

    }

    private void userLogout(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String unic = req.getParameter("unic");
        UserLoginModel userLoginDetails = new UserLoginModel("", "", unic);
        Integer userLoginDetailsResponse = userDAO.UserLogout(userLoginDetails);

        PrintWriter out = res.getWriter();
        res.setContentType("application/json");
        res.setCharacterEncoding("UTF-8");
        out.print(userLoginDetailsResponse);
        out.flush();

    }
}
