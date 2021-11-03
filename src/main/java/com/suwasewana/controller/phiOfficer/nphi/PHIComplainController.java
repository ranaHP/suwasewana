package com.suwasewana.controller.phiOfficer.nphi;

import com.google.gson.Gson;
import com.suwasewana.dao.ComplainDAO;
import com.suwasewana.dao.MOHDAO;
import com.suwasewana.dao.PHIDAO;
import com.suwasewana.dao.UserDAO;
import com.suwasewana.model.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

    @WebServlet("/phi-complain-controller1/*")
public class PHIComplainController extends HttpServlet {
    ComplainDAO complainDAO;
    MOHDAO mohdao;
    PHIDAO phidao;
    UserDAO userDAO;
    private Gson gson = new Gson();

    public void init() {
        complainDAO = new ComplainDAO();
        phidao=new PHIDAO();
        userDAO = new UserDAO();
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        doGet(req, res);

    }
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

        res.setCharacterEncoding("UTF-8");
        String getUrlData [] = req.getRequestURI().split("/");
        System.out.println("url in controller : "+getUrlData[getUrlData.length-1]);

        try {
            RequestDispatcher rd;
            switch (getUrlData[getUrlData.length-1]) {
                case "ViewComplainForPHI":
                    ComplainForPHI(req, res);
                    break;
                case "search":
                    SearchComplain(req, res);
                    break;
                case "searchbydate":
                    SearchComplainbydate(req, res);
                    break;
                case "set_as_done":
                    SetAsDone(req, res);
                    break;
                case "SetAsProgress":
                    SetAsProgress(req, res);
                    break;
                case "setResponse":
                    setResponse(req, res);
                    break;
                default:
                    res.getWriter().println("404 Page not Found");
                    break;
            }
        } catch (Exception error) {
            throw new ServletException(error);
        }

    }


        private void setResponse(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

            String uNic = "";
            Cookie[] cookies = req.getCookies();
            if(cookies !=null){
                for(Cookie cookie : cookies){
                    if(cookie.getName().equals("unic")) {
                        uNic = cookie.getValue();
                    }
                }
            }
            String complainId=req.getParameter("cid");
            String message=req.getParameter("message");
            String result = complainDAO.setResponse(complainId,message);
            res.getWriter().println(gson.toJson(result));
        }

        private void SetAsProgress(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

            String uNic = "";
            Cookie[] cookies = req.getCookies();
            if(cookies !=null){
                for(Cookie cookie : cookies){
                    if(cookie.getName().equals("unic")) {
                        uNic = cookie.getValue();
                    }
                }
            }
            String complainId=req.getParameter("complainId");
            String result = complainDAO.ChangeStatustpProgress(complainId);
            res.getWriter().println(gson.toJson(result));
        }

        private void SetAsDone(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

            String uNic = "";
            Cookie[] cookies = req.getCookies();
            if(cookies !=null){
                for(Cookie cookie : cookies){
                    if(cookie.getName().equals("unic")) {
                        uNic = cookie.getValue();
                    }
                }
            }
            String complainId=req.getParameter("complainId");
            String result = complainDAO.ChangeStatus(complainId);
            res.getWriter().println(gson.toJson(result));
        }


        private void SearchComplainbydate(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, SQLException {
            System.out.println("date1"+req.getParameter("date1"));
            System.out.println("date1"+req.getParameter("date2"));
            String date1=req.getParameter("date1");
            String date2=req.getParameter("date2");
            String nic=req.getParameter("PHINic");
            ArrayList<CommanForCompalinAndUser> result = complainDAO.SearchComplainBydate(date1,date2,nic);
            res.getWriter().println(gson.toJson(result));
        }

        private void SearchComplain(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, SQLException {
        System.out.println("title"+req.getParameter("title"));
        System.out.println("type"+req.getParameter("Type"));
        System.out.println("phi"+req.getParameter("PHINic"));
            String title=req.getParameter("title");
            String type=req.getParameter("Type");
            String nic=req.getParameter("PHINic");
            ArrayList<CommanForCompalinAndUser> result = complainDAO.SearchComplainDetailsPHI(title,type,nic);
            res.getWriter().println(gson.toJson(result));
        }

    private void ComplainForPHI(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String uNic = "";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("unic")) {
                    uNic = cookie.getValue();
                }
            }
        }
        ComplainModel complainModeldetail = new ComplainModel(
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                ""

        );
        String nic="199910910062";
        ArrayList<CommanForCompalinAndUser> result = complainDAO.userGetComplainDetailsForPHI(nic);
        res.getWriter().println(gson.toJson(result));
    }





}