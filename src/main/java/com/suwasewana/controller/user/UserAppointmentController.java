package com.suwasewana.controller.user;

import com.google.gson.Gson;
import com.suwasewana.core.ResponseType;
import com.suwasewana.dao.AppointmentDAO;
import com.suwasewana.dao.PHIDAO;
import com.suwasewana.dao.UserDAO;
import com.suwasewana.dao.ComplainDAO;
import com.suwasewana.model.AppointmentModel;
import com.suwasewana.model.AppointmentTypeModel;
import com.suwasewana.model.PHIModel;
import com.suwasewana.model.UserRegistrationModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Enumeration;

@WebServlet("/user-appointment-controller/*")
public class UserAppointmentController extends HttpServlet {
    UserDAO userDAO;
    PHIDAO phiDAO;
    AppointmentDAO appointmentDAO;
    private Gson gson = new Gson();

    public void init() {
        phiDAO = new PHIDAO();
        userDAO = new UserDAO();
        appointmentDAO = new AppointmentDAO();
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
                case "create":
                    uerMakeAppointment(req, res);
                    break;
                case "view":
                    userViewAppointment(req, res);
                    break;
                case "delete":
                    userDeleteAppointment(req, res);
                    break;
                case "type":
                    userViewAppointmentType(req, res);
                    break;
                case "selectTimeSlot":
                    selectTimeSlot(req, res);
                    break;
                case "reRequestTimeSlot":
                    reRequestTimeSlot(req, res);
                    break;
                case "phi":
                    userViewPHI(req, res);
                    break;
                default:
                    res.getWriter().println("404 Page not Found");
                    break;
            }
        } catch (Exception error) {
            throw new ServletException(error);
        }

//        String uNic = "";
//        Cookie[] cookies = req.getCookies();
//        if(cookies !=null){
//            for(Cookie cookie : cookies){
//                if(cookie.getName().equals("unic")) uNic = cookie.getValue();
//            }
//        }
//        if(uNic == null) res.sendRedirect("login.html");
//        res.getWriter().println(uNic);

    }
    private void uerMakeAppointment(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String uNic = "";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("uDetails")) {
                    uNic = cookie.getValue().split("/")[1];
                }
            }
        }
        AppointmentModel userAppointmentDetails = new AppointmentModel(
                req.getParameter("aTitle"),
                req.getParameter("aType"),
                req.getParameter("aPhi"),
                req.getParameter("aReason"),
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                uNic,
                "",
                ""
        );
        String result = userDAO.UserMakeAppointment(userAppointmentDetails);
        res.getWriter().println(result);
    }

    private void userViewAppointment(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String uNic = "";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("uDetails")) {
                    uNic = cookie.getValue().split("/")[1];
                }
            }
        }
        AppointmentModel userAppointmentDetails = new AppointmentModel(
                "",
                "",
                " ",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                uNic,
                "",
                ""
        );
        System.out.println(" user nic is " + uNic);
        ArrayList<AppointmentModel> result = userDAO.userGetAppointmentDetails(userAppointmentDetails);
        res.getWriter().println(gson.toJson(result));
    }

    private void userViewAppointmentType(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String uNic = "";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("unic")) {
                    uNic = cookie.getValue();
                }
            }
        }
        ArrayList<AppointmentTypeModel> result = userDAO.userGetAppointmentTypes();
        res.getWriter().println(gson.toJson(result));
    }
    private void userViewPHI(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        ArrayList<PHIModel> result = phiDAO.getAllPhiData();
        res.getWriter().println(gson.toJson(result));
    }
    private void userDeleteAppointment(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, SQLException {

        String result = userDAO.UserDeleteAppointment(req.getParameter("appointmentId"));
        System.out.println(req.getParameter("appointmentId"));
        System.out.println(gson.toJson(result));
        res.getWriter().println(gson.toJson(result));
    }
    private void selectTimeSlot(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, ParseException {
        AppointmentModel appointment = new AppointmentModel(
                "",
                "",
                "",
                "",
                req.getParameter("app_id"),
                "",
                "",
                "",
                "",
                "",
                "",
                req.getParameter("status"),
                "",
                "",
                "");
//        res.getWriter().println(gson.toJson(appointment));
        ResponseType result = appointmentDAO.chooseTimeSlot(appointment);
        res.getWriter().println(gson.toJson(result));
    }
    private void reRequestTimeSlot(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, ParseException {
        AppointmentModel appointment = new AppointmentModel(
                "",
                "",
                "",
                "",
                req.getParameter("app_id"),
                "",
                req.getParameter("round"),
                "",
                "",
                "",
                "",
                req.getParameter("status"),
                "",
                "",
                "");
//        res.getWriter().println(gson.toJson(appointment));
        ResponseType result = appointmentDAO.requestTimeSlotAgain(appointment);
        res.getWriter().println(gson.toJson(result));
    }
}
