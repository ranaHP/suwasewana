package com.suwasewana.controller.user;

import com.google.gson.Gson;
import com.suwasewana.dao.UserDAO;
import com.suwasewana.model.UserGovermentAnnouncementModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/user-goverment-announcement/*")
public class UserGovermentAnnouncementController extends HttpServlet {

    UserDAO userDAO;
    private Gson gson = new Gson();

    public void init() {
        userDAO = new UserDAO();
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
                case "view":
                    userGovermentAnnouncement(req, res);
                    break;
//            case "register":
//                    userregister(req, res);
//                    break;
//
                default:
                    res.getWriter().println("404 Page not Found");
                    break;
            }
        } catch (Exception error) {
            throw new ServletException(error);
        }

    }

    private void userGovermentAnnouncement(HttpServletRequest req, HttpServletResponse res) throws IOException {

        String uNic = "199910910060";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("uDetails")) {
                    uNic = cookie.getValue().split("/")[1];
                }
            }
        }


        String district_id = "123";
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("uDetails")) {
                    district_id= cookie.getValue().split("/")[6];
                }
            }
        }


//        System.out.println("data come to goverment controller");
//        System.out.println(uNic);

//        String district_id="123";
        UserGovermentAnnouncementModel govermentAnnouncement = new UserGovermentAnnouncementModel(

                "",
                "",
                "",
                "",
                "",
                 uNic
        );
        ArrayList<UserGovermentAnnouncementModel> result= userDAO.UserGovermentannouncement(district_id,govermentAnnouncement);
        res.getWriter().println(gson.toJson(result));

    }


}
