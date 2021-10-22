package com.suwasewana.controller.PHI;

import com.google.gson.Gson;
import com.suwasewana.dao.PHIDAO;
import com.suwasewana.dao.UserDAO;
import com.suwasewana.model.AppointmentModel;
import com.suwasewana.model.CreateClinicModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/view-appoinment-controller/*")
public class PHIAppoinmentController extends HttpServlet {

    PHIDAO phiDAO;
    private Gson gson = new Gson();

    public void init() {
        phiDAO = new PHIDAO();
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
//                    phiViewAppointment(req, res);
                    res.getWriter().println("create");
                    break;

                case "view":

                    phiViewAppointment(req, res);
                    break;

                default:
                    res.getWriter().println("404 Page not Found");
                    break;
            }
        } catch (Exception error) {
            throw new ServletException(error);
        }


    }


    private void  phiViewAppointment(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        AppointmentModel viewAppoinment = new  AppointmentModel(
                req.getParameter("aTitle"),
                req.getParameter("aType"),
                " ",
                req.getParameter("reason"),
                "",
                "",
                "",
                req.getParameter("location"),
                "",
                "",
                "",
                ""

        );
        ArrayList<AppointmentModel> result = phiDAO.phiViewAppointmentDetails(viewAppoinment);
        res.getWriter().println(gson.toJson(result));

//        res.getWriter().println(result);
    }

}
