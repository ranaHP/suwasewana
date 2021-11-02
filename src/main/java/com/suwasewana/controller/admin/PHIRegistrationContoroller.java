////package com.suwasewana.controller.admin;
//
//import com.google.gson.Gson;
//import com.suwasewana.dao.AdminDAO;
//import com.suwasewana.model.PHIModel;
//import com.suwasewana.model.PHIRegisterModel;
//import com.suwasewana.model.UserRegistrationModel;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//
//@WebServlet("/phi-register-controller")
//public class PHIRegistrationContoroller extends HttpServlet {
//
//    AdminDAO adminDAO;
//    private Gson gson = new Gson();
//
//    public void init() {
//        adminDAO = new AdminDAO();
//    }
//
//    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
//        doGet(req, res);
//
//    }
//    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
//        System.out.println("data come to servtelet");
//        phiRegistration(req, res);
//    }
//
//    private void phiRegistration(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//        PHIRegisterModel phiRegisterDetails = new PHIRegisterModel(
//                req.getParameter("full_name"),
//                req.getParameter("NIC"),
//                req.getParameter("c_officer_no"),
//                "",
//                req.getParameter("mobile"),
//                req.getParameter("street_no"),
//                req.getParameter("state"),
//                req.getParameter("city"),
//                req.getParameter("password"),
//                "",
//                req.getParameter("phi_post")
//        );
////        String result = adminDAO.phiRegistration(phiRegisterDetails);
////        res.getWriter().println(result);
//    }
//
//}
