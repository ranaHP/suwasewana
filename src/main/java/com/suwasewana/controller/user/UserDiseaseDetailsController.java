package com.suwasewana.controller.user;

import com.google.gson.Gson;
import com.suwasewana.dao.AppointmentDAO;
import com.suwasewana.dao.UserDAO;
import com.suwasewana.model.ComplainModel;
import com.suwasewana.model.UserDiseasedetailsModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/user-diseasedetails-controller/*")
public class UserDiseaseDetailsController extends HttpServlet {

    UserDAO userDAO;
//    AppointmentDAO appointmentDAO;
    private Gson gson = new Gson();

    public void init() {
        userDAO = new UserDAO();
//        appointmentDAO = new AppointmentDAO();
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        doGet(req, res);

    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        res.setCharacterEncoding("UTF-8");
        String getUrlData[] = req.getRequestURI().split("/");
//        res.getWriter().println(" request uri"  + req.getRequestURI() + "  data -: " +  getUrlData[getUrlData.length-1] );
        try {
            RequestDispatcher rd;
            switch (getUrlData[getUrlData.length - 1]) {
                case "name":
                    userGetdisease(req, res);
                    break;
                case "view":
//                    userViewAppointment(req, res);
                    break;
                case "delete":
//                    userDeleteAppointment(req, res);
                    break;
                case "type":
//                    userViewAppointmentType(req, res);
                    break;
                case "selectTimeSlot":
//                    selectTimeSlot(req, res);
                    break;
                default:
                    res.getWriter().println("404 Page not Found");
                    break;
            }
        } catch (Exception error) {
            throw new ServletException(error);
        }
    }
    private void userGetdisease(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, SQLException {

        UserDiseasedetailsModel userdiseasedetails =  new UserDiseasedetailsModel(
                "",
                req.getParameter("name"),
                req.getParameter("description"),
                req.getParameter("active_cases"),
                req.getParameter("death_cases"),
                req.getParameter("recovered_cases")

        );

        ArrayList<UserDiseasedetailsModel> result = userDAO.userGetdiseasedetails(userdiseasedetails);
        res.getWriter().println(gson.toJson(result));
    }
}