package com.suwasewana.controller.user;

import com.google.gson.Gson;
import com.suwasewana.core.ResponseType;
import com.suwasewana.dao.UserDAO;
import com.suwasewana.model.UserLoginModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/user-login-controller")
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
        checkUserLogin(req, res);
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
            ResponseType suwasewanaRespose = new ResponseType("success", "success");
            responseJsonString = this.gson.toJson(suwasewanaRespose);

//            Cookie loginCookie = new Cookie("unic",userLoginDetailsResponse.getUnic());
            //setting cookie to expiry in 30 mins
//            loginCookie.setMaxAge(300*60);
//            res.addCookie(loginCookie);
//            System.out.println(loginCookie.getValue());
        }
        out.print(responseJsonString);
        out.flush();

    }
}
