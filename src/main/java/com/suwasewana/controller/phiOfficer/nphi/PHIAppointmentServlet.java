package com.suwasewana.controller.phiOfficer.nphi;

import com.google.gson.Gson;
import com.suwasewana.core.ResponseType;
import com.suwasewana.dao.AppointmentDAO;
import com.suwasewana.dao.OfficerDAO;
import com.suwasewana.model.AppointmentForPHIModel;
import com.suwasewana.model.AppointmentModel;
import com.suwasewana.model.AppointmentTypeModel;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
                    case "giveTimeForAppointment":
                        giveTimeSlotForAppointment(request, response);
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
        doGet(request,response);
    }


    private void getAppointmentType(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        ArrayList<AppointmentTypeModel> result = appointmentDAO.getAppointmentTypes();
        res.getWriter().println(gson.toJson(result));
    }
    private void getAppointmentForPHI(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        ArrayList<AppointmentForPHIModel> result = appointmentDAO.getAppointmentForPHI();
        res.getWriter().println(gson.toJson(result));
    }
    private void giveTimeSlotForAppointment(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, ParseException {
        AppointmentModel appointment = new AppointmentModel(
                "",
                "",
                "",
                "",
                req.getParameter("app_id"),
                "",
                "",
                req.getParameter("alocation"),
                req.getParameter("time_slot_1"),
                req.getParameter("time_slot_2"),
                req.getParameter("phi_message"),
                req.getParameter("status"),
                "",
                req.getParameter("time_slot_2_end"),
                req.getParameter("time_slot_1_end"));

        ResponseType result = appointmentDAO.appointmentChangeTimeSlot(appointment);
        res.getWriter().println(gson.toJson(result));
    }
}
