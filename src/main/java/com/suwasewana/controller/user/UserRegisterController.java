package com.suwasewana.controller.user;

import com.google.gson.Gson;
import com.suwasewana.dao.UserDAO;
import com.suwasewana.model.UserRegistrationModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

@WebServlet("/user-register-controller")
public class UserRegisterController extends HttpServlet {
    UserDAO userDAO;
    private Gson gson = new Gson();

    public void init() {
        userDAO = new UserDAO();
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        doGet(req, res);

    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        uerRegistration(req, res);
    }


    private void uerRegistration(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        UserRegistrationModel userRegisterDetails = new UserRegistrationModel(
                req.getParameter("umobiel"),
                req.getParameter("uname"),
                req.getParameter("pass"),
                req.getParameter("nic"),
                req.getParameter("province"),
                req.getParameter("district"),
                req.getParameter("city"),
                req.getParameter("moh"),
                req.getParameter("address"),
                req.getParameter("location"),
                ""
        );
        Integer result = userDAO.UserRegistration(userRegisterDetails);
        res.getWriter().println(result);
        res.getWriter().println("result");
    }

    public void handleRequest(HttpServletRequest req, HttpServletResponse res) throws IOException {

        PrintWriter out = res.getWriter();
        res.setContentType("text/plain");

        Enumeration<String> parameterNames = req.getParameterNames();

        while (parameterNames.hasMoreElements()) {

            String paramName = parameterNames.nextElement();
            out.write(paramName);
            out.write("  -   ");

            String[] paramValues = req.getParameterValues(paramName);
            for (int i = 0; i < paramValues.length; i++) {
                String paramValue = paramValues[i];
                out.write( paramValue);
                out.write(" - ");
            }

        }

        out.close();

    }
//    private void checkUserLogin(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//        String mobile = req.getParameter("user-mobile");
//        String password = req.getParameter("user-password");
//
//        UserLoginModel userLoginDetails = new UserLoginModel(mobile, password);
//        UserLoginModel userLoginDetailsResponse = userLoginDAO.CheckLoginValidation(userLoginDetails);
//
//        PrintWriter out = res.getWriter();
//        res.setContentType("application/json");
//        res.setCharacterEncoding("UTF-8");
//
//        String responseJsonString = "";
//        if (userLoginDetailsResponse.getMobile().equals("") || userLoginDetailsResponse.getPassword().equals("")) {
//            ResponseType suwasewanaRespose = new ResponseType("error", "invalid mobile number password");
//            responseJsonString = this.gson.toJson(suwasewanaRespose);
//
//        } else {
//            ResponseType suwasewanaRespose = new ResponseType("success", "success");
//            responseJsonString = this.gson.toJson(suwasewanaRespose);
//        }
//        out.print(responseJsonString);
//        out.flush();
//
//    }
}
