package com.suwasewana.controller.phiOfficer.nphi;

import com.google.gson.Gson;
import com.suwasewana.dao.*;
import com.suwasewana.model.CommanForCompalinAndUser;
import com.suwasewana.model.ComplainModel;
import com.suwasewana.model.TaskModel;

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

@WebServlet("/phi-Todo-controller/*")
public class TodoController extends HttpServlet {
ComplainDAO complainDAO;
MOHDAO mohdao;
PHIDAO phidao;
UserDAO userDAO;
    TodoDAO todoDAO;
private Gson gson = new Gson();

public void init() {
    complainDAO = new ComplainDAO();
    phidao=new PHIDAO();
    userDAO = new UserDAO();
    todoDAO= new TodoDAO();
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
            case "TakeTaskList":
                TakeTaskList(req, res);
                break;

            default:
                res.getWriter().println("404 Page not Found");
                break;
        }
    } catch (Exception error) {
        throw new ServletException(error);
    }

}




    private void TakeTaskList(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String uNic = "";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("unic")) {
                    uNic = cookie.getValue();
                }
            }
        }

        String nic="199910910060";
        ArrayList<TaskModel> result = todoDAO.GetAllTask(nic);
        res.getWriter().println(gson.toJson(result));
    }





}
