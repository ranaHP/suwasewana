package com.suwasewana.controller.user;

import com.google.gson.Gson;
import com.suwasewana.dao.UserDAO;
import com.suwasewana.model.UserHomeHealthAnnouncementModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/user-home-healthannouncement-controller")
public class UserHomeHealthAnnouncementController extends HttpServlet {

    UserDAO userDAO;
    private Gson gson = new Gson();

    public void init() {
        userDAO = new UserDAO();
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        doGet(req, res);

    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        System.out.println("data come to health servtelet");
        userViewHomeHealthAnnouncement(req, res);
    }

    private void userViewHomeHealthAnnouncement(HttpServletRequest req, HttpServletResponse res) throws IOException {
//        String uNic = "";
//        Cookie[] cookies = req.getCookies();
//        if(cookies !=null){
//            for(Cookie cookie : cookies){
//                if(cookie.getName().equals("unic")) {
//                    uNic = cookie.getValue();
//                }
//            }
//        }
        UserHomeHealthAnnouncementModel userhomehealthannouncement = new UserHomeHealthAnnouncementModel(

                "",
                req.getParameter("title"),
                req.getParameter("description"),
                req.getParameter("banner"),
                "",
                "",
                ""


        );
        ArrayList<UserHomeHealthAnnouncementModel> result = userDAO.userGethomehealthannouncement(userhomehealthannouncement);
        res.getWriter().println(gson.toJson(result));
    }

}
