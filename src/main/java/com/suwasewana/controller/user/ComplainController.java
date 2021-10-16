package com.suwasewana.controller.user;

import com.google.gson.Gson;
import com.suwasewana.core.ResponseType;
import com.suwasewana.dao.ComplainDAO;
import com.suwasewana.model.ComplainModel;
import com.suwasewana.model.OfficerLoginModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.NetworkInterface;

@WebServlet("/complain-controller")
public class ComplainController extends  HttpServlet{

    ComplainDAO complainDAO;
    private Gson gson = new Gson();
    public void init() {
        complainDAO = new ComplainDAO();
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        System.out.println("inside post");
        doGet(req, res);
    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        System.out.println("inside get");
        AddComplain(req,res);
    }

    private void AddComplain(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        System.out.println("inside controller");
        String Title = req.getParameter("Title");
        String CType = req.getParameter("ComplainType");
        String UType = req.getParameter("UserType");
        String phi = req.getParameter("PHI");
        String reason = req.getParameter("Reason");
        System.out.println("Status: "+reason);
        ComplainModel complainModel=new ComplainModel(Title,CType,UType,phi,reason);

        String status = complainDAO.AddComplain(complainModel);
        System.out.println("Status: "+reason);

    }

}
