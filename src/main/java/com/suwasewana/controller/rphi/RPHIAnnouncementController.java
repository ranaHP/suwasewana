package com.suwasewana.controller.rphi;

import com.google.gson.Gson;
import com.suwasewana.dao.RPHIAnnouncementsDAO;
import com.suwasewana.model.CreateClinicModel;
import com.suwasewana.model.RPHIAnnouncementsModel;
import com.suwasewana.model.vaccineClinicModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/createRPHI_Annoncements/*")
public class RPHIAnnouncementController extends HttpServlet {
    RPHIAnnouncementsDAO rphiAnnouncementsDAO;
    private Gson gson = new Gson();
    public void init(){
        RPHIAnnouncementsDAO rphiAnnouncementsDAO=new RPHIAnnouncementsDAO();
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        doGet(req, res);
    }
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
//          createClinic(req, res);
        res.setCharacterEncoding("UTF-8");
        String getUrlData [] = req.getRequestURI().split("/");
//        res.getWriter().println(" request uri"  + req.getRequestURI() + "  data -: " +  getUrlData[getUrlData.length-1] );
        try {
            RequestDispatcher rd;
            switch (getUrlData[getUrlData.length-1]) {
                case "createA":
//                    res.getWriter().println("create");
                    createA(req,res);
                    break;
                default:
                    res.getWriter().println("404 Page not Found");
                    break;
            }
        } catch (Exception error) {
            throw new ServletException(error);
        }
    }

    private void createA(HttpServletRequest req, HttpServletResponse res) throws IOException {

        System.out.println("came to controller");
        RPHIAnnouncementsModel rphiAnnouncements=new RPHIAnnouncementsModel(
                "",
                req.getParameter("title"),
                req.getParameter("description"),
                req.getParameter("image"),
                req.getParameter("moh"),
                "",
                ""
        );
        String result = rphiAnnouncementsDAO.createA(rphiAnnouncements);
        res.getWriter().println(result);
        System.out.println(result);
    }
}