package com.suwasewana.controller.clinicalOfficer;

import com.google.gson.Gson;
import com.suwasewana.dao.createClinicDAO;
import com.suwasewana.model.CreateClinicModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/create-clinic-controller")
public class createClinicController extends HttpServlet {
    createClinicDAO createClinicDAO;
    private Gson gson = new Gson();
    public void init() {
        createClinicDAO = new createClinicDAO();
    }
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
         doGet(req, res);
    }
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
          createClinic(req, res);
    }

    private void createClinic(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
       CreateClinicModel createClinic = new CreateClinicModel(
               req.getParameter("disease"),
               req.getParameter("title"),
               req.getParameter("location"),
               req.getParameter("MOH"),
               req.getParameter("datetime"),
               req.getParameter("duration"),
               req.getParameter("maxpatient"),
               req.getParameter("conduct"),
               req.getParameter("description")
       );
        String result= createClinicDAO.createClinic(createClinic);
        res.getWriter().println(result);
    }
}
