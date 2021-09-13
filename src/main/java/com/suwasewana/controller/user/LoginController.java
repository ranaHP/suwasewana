package com.suwasewana.controller.user;

import com.suwasewana.dao.UserLoginDAO;
import com.suwasewana.model.UserLoginModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/user-login-controller")
public class LoginController extends HttpServlet {
    UserLoginDAO userLoginDAO;

    public void init() {
        userLoginDAO = new UserLoginDAO();
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

        UserLoginModel userLoginDetails = new UserLoginModel(mobile, password);
        UserLoginModel userLoginDetailsResponse = userLoginDAO.CheckLoginValidation(userLoginDetails);
        if (userLoginDetailsResponse.getMobile().equals("") || userLoginDetailsResponse.getPassword().equals("")){
//            RequestDispatcher rd = req.getRequestDispatcher("/view/Login.jsp");
//            req.setAttribute("status" , "Invalid login details! Please try again.");
//            rd.forward(req,res);
            res.getWriter().println("invalid");
        }else {
//            RequestDispatcher rd = req.getRequestDispatcher("user-form.jsp");
//            rd.forward(req,res);
            res.getWriter().println("success");
        }

    }
}
