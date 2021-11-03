package com.suwasewana.controller.user;

import com.google.gson.Gson;
import com.suwasewana.dao.UserDAO;
import com.suwasewana.model.AppointmentModel;
import com.suwasewana.model.UserHomeModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/user-home-controller")
public class UserHomeController extends HttpServlet {

        UserDAO userDAO;
        private Gson gson = new Gson();

        public void init() {
            userDAO = new UserDAO();
        }

        public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
            doGet(req, res);

        }

        public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
            System.out.println("data come to servtelet");
            userViewHome(req, res);
        }

    private void userViewHome(HttpServletRequest req, HttpServletResponse res) throws IOException {
//        String uNic = "";
//        Cookie[] cookies = req.getCookies();
//        if(cookies !=null){
//            for(Cookie cookie : cookies){
//                if(cookie.getName().equals("unic")) {
//                    uNic = cookie.getValue();
//                }
//            }
//        }
        UserHomeModel userhome = new UserHomeModel(

                "",
                req.getParameter("title"),
                "",
                "",
                req.getParameter("date"),
                req.getParameter("description"),
                req.getParameter("max_sheet"),
                req.getParameter("conduct_by"),
                req.getParameter("target_moh"),
                req.getParameter("target_people"),
                req.getParameter("location"),
                "",
                ""



        );
        ArrayList<UserHomeModel> result = userDAO.userGethome(userhome);
        res.getWriter().println(gson.toJson(result));
    }

}
