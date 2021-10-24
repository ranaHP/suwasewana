package com.suwasewana.controller.user;

import com.google.gson.Gson;
import com.suwasewana.dao.ComplainDAO;
import com.suwasewana.dao.MOHDAO;
import com.suwasewana.dao.PHIDAO;
import com.suwasewana.dao.UserDAO;
import com.suwasewana.model.ComplainModel;
import com.suwasewana.model.ComplainTypeModel;
import com.suwasewana.model.MOHModel;
import com.suwasewana.model.PHIModel;

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

@WebServlet("/user-complain-controller/*")
public class UserComplainController extends HttpServlet {
    ComplainDAO complainDAO;
    MOHDAO mohdao;
    PHIDAO phidao;
    UserDAO userDAO;
    private Gson gson = new Gson();

    public void init() {
        complainDAO = new ComplainDAO();
        mohdao=new MOHDAO();
        phidao=new PHIDAO();
        userDAO = new UserDAO();
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        doGet(req, res);

    }
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

        res.setCharacterEncoding("UTF-8");
        String getUrlData [] = req.getRequestURI().split("/");

        try {
            RequestDispatcher rd;
            switch (getUrlData[getUrlData.length-1]) {
                case "user-complain-controller":
                    userViewComplainType(req, res);
                    break;
                case "moh":
//                    res.getWriter().println("moh view");
                    ViewMOH(req,res);
                    break;
                case "create":
                    uerMakeComplain(req, res);
                    break;
                case "search":
                    searchComplain(req, res);
                    break;
                case "view":
                    userViewComplain(req, res);
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

    }
//    search complain
    private void searchComplain(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, SQLException {
//        System.out.println("title"+req.getParameter("Title"));
//        System.out.println("type"+req.getParameter("complaintype"));
        String title=req.getParameter("Title");
        String type=req.getParameter("complaintype");
        ArrayList<ComplainModel> result = userDAO.SearchComplainDetails(title,type);
        res.getWriter().println(gson.toJson(result));
    }


    private void userViewPHI(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
        ArrayList<PHIModel> result = phidao.GetPHIDetails();
        res.getWriter().println(gson.toJson(result));
    }
    private void ViewMOH(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
        System.out.println("Come to view moh controller");
        ArrayList<MOHModel> result = mohdao.GetMOHDetails();
        res.getWriter().println(gson.toJson(result));
    }
    private void userViewComplainType(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        ArrayList<ComplainTypeModel> result = complainDAO.GetComplainTypeDetails();
        res.getWriter().println(gson.toJson(result));
    }
    private void uerMakeComplain(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String uNic = "";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("unic")) {
                    uNic = cookie.getValue();
                }
            }
        }
        ComplainModel usercomplainDetails = new ComplainModel(
                req.getParameter("cTitle"),
                req.getParameter("cType"),
                req.getParameter("uType"),
                req.getParameter("cPhi"),
                req.getParameter("cReason"),
                "1234fr5",
                "199910920064",
                "",
                "pending",
                req.getParameter("img1"),
                req.getParameter("img2"),
                req.getParameter("img3")
        );
        System.out.println("Title "+usercomplainDetails.getCTitle());
        System.out.println("cType "+usercomplainDetails.getCType() );
        System.out.println("uType "+usercomplainDetails.getUType());
        System.out.println("phiid "+usercomplainDetails.getPHIId());
        System.out.println("reason "+usercomplainDetails.getCMessage());

        String result = userDAO.UserMakeComplain(usercomplainDetails);
        res.getWriter().println(result);
    }

    private void userViewComplain(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
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
                "pending",
                "",
                "",
                ""

        );

        ArrayList<ComplainModel> result = userDAO.userGetComplainDetails(complainModeldetail);
        res.getWriter().println(gson.toJson(result));
    }



}
