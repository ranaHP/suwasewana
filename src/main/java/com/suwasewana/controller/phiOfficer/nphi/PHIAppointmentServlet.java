package com.suwasewana.controller.phiOfficer.nphi;

import com.google.gson.Gson;
import com.suwasewana.dao.AppointmentDAO;
import com.suwasewana.dao.OfficerDAO;
import com.suwasewana.model.AppointmentForPHIModel;
import com.suwasewana.model.AppointmentModel;
import com.suwasewana.model.AppointmentTypeModel;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "PHIAppointmentServlet", value = "/PHIAppointmentServlet/*")
public class PHIAppointmentServlet extends HttpServlet {
    AppointmentDAO appointmentDAO;
    private Gson gson = new Gson();
    public void init() {
        appointmentDAO = new AppointmentDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        String getUrlData [] = request.getRequestURI().split("/");
//        response.getWriter().println(" request uri"  + request.getRequestURI() + "  data -: " +  getUrlData[getUrlData.length-1] );
        try {
            RequestDispatcher rd;
            switch (getUrlData[getUrlData.length-1]) {
                    case "appointment_type":
                        getAppointmentType(request, response);
                        break;
                    case "appointment_for_phi":
                        getAppointmentForPHI(request, response);
                        break;
                default:
                    response.getWriter().println("404 Page not Found");
                    break;
            }
        } catch (Exception error) {
            throw new ServletException(error);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


    private void getAppointmentType(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        ArrayList<AppointmentTypeModel> result = appointmentDAO.getAppointmentTypes();
        res.getWriter().println(gson.toJson(result));
    }
    private void getAppointmentForPHI(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        ArrayList<AppointmentForPHIModel> result = appointmentDAO.getAppointmentForPHI();
        res.getWriter().println(gson.toJson(result));
    }

}
