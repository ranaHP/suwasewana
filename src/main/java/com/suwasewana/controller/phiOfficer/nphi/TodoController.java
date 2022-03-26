package com.suwasewana.controller.phiOfficer.nphi;

import com.google.gson.Gson;
import com.suwasewana.dao.*;
import com.suwasewana.model.AssignTaskModel;
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
//    System.out.println("url in controller : "+getUrlData[getUrlData.length-1]);

    try {
        RequestDispatcher rd;
        switch (getUrlData[getUrlData.length-1]) {
            case "TakeTaskList":
                TakeTaskList(req, res);
                break;
            case "TakeTaskListcount":
                TakeTaskListcount(req, res);
                break;
            case "TaskforClander":
                TaskforClander(req, res);
                break;
            case "delete":
                DeleteTask(req, res);
                break;
            case "Complete":
                SetComplete(req, res);
                break;
            case "editTask":
                EditTask(req, res);
                break;
            case "SetProgress":
                SetProgress(req, res);
                break;
            case "UpdateOverdueTaskList":
                UpdateOverdueTaskList(req, res);
                break;
            case "AddTask":
                AddTask(req, res);
                break;

            case "checkAssignTask":
                CheckAssignTask(req, res);
                break;
            case "assigntask":
                AssignTask(req, res);
                break;



            default:
                res.getWriter().println("404 Page not Found");
                break;
        }
    } catch (Exception error) {
        throw new ServletException(error);
    }

}

    private void AssignTask(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String title=req.getParameter("title");
        String exp_date=req.getParameter("exp_date");
        String note=req.getParameter("note");
        String PId=req.getParameter("PId");

        String result = todoDAO.AssignTask(title,exp_date,note,PId);
        res.getWriter().println(gson.toJson(result));
    }

    private void CheckAssignTask(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String moh="1003";
        ArrayList<AssignTaskModel> result = todoDAO.CheckAssignTask(moh);
        res.getWriter().println(gson.toJson(result));
    }

    private void AddTask(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String nic="199910910064";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("sDetails")) {
                    nic = cookie.getValue().split("/")[3];
                }
            }
        }
        String title=req.getParameter("title");
        String date=req.getParameter("date");

        String result = todoDAO.AddTask(nic,title,date);
        res.getWriter().println(gson.toJson(result));
    }
    private void UpdateOverdueTaskList(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String nic="199910910064";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("sDetails")) {
                    nic = cookie.getValue().split("/")[3];
                }
            }
        }
        String result = todoDAO.UpdateOverdueTaskList(nic);
        res.getWriter().println(gson.toJson(result));
    }

    private void DeleteTask(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String nic="199910910060";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("sDetails")) {
                    nic = cookie.getValue().split("/")[3];
                }
            }
        }

        String id=req.getParameter("taskid");
        String result = todoDAO.DeletTask(id);
        res.getWriter().println(gson.toJson(result));
    }
    private void SetComplete(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String nic="199910910064";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("sDetails")) {
                    nic = cookie.getValue().split("/")[3];
                }
            }
        }

        String id=req.getParameter("taskid");
        String result = todoDAO.SetComplete(id);
        res.getWriter().println(gson.toJson(result));
    }
    private void EditTask(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String nic="199910910060";
        String id=req.getParameter("taskid");
        String task=req.getParameter("newTask");
        String date=req.getParameter("newDate");
        String result = todoDAO.EditTask(id,task,date);
        res.getWriter().println(gson.toJson(result));
    }
    private void SetProgress(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String nic="199910910060";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("sDetails")) {
                    nic = cookie.getValue().split("/")[3];
                }
            }
        }
        String id=req.getParameter("taskid");
        String result = todoDAO.SetProgress(id);
        res.getWriter().println(gson.toJson(result));
    }


    private void TakeTaskList(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

    String nic="199910910064";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("sDetails")) {
                    nic = cookie.getValue().split("/")[3];
                }
            }
        }


        ArrayList<TaskModel> result = todoDAO.GetAllTask(nic);
        res.getWriter().println(gson.toJson(result));
    }
    private void TakeTaskListcount(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String nic="199910910064";

        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("sDetails")) {
                    nic = cookie.getValue().split("/")[3];
                }
            }
        }


        ArrayList<TaskModel> result = todoDAO.GetAllTaskCount(nic);
        res.getWriter().println(gson.toJson(result));
    }
    private void TaskforClander(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String nic="199910910064";

        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("sDetails")) {
                    nic = cookie.getValue().split("/")[3];
                }
            }
        }


        String date=req.getParameter("date");
        ArrayList<TaskModel> result = todoDAO.ViewTaskForCalander(nic,date);
        res.getWriter().println(gson.toJson(result));
    }





}
