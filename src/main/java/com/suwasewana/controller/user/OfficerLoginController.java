package com.suwasewana.controller.user;


import com.google.gson.Gson;
import com.suwasewana.core.ResponseType;
import com.suwasewana.dao.OfficerDAO;
import com.suwasewana.dao.UserLoginDAO;
import com.suwasewana.model.OfficerLoginModel;
import com.suwasewana.model.UserLoginModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;

@WebServlet("/officer-login-controller")
public class OfficerLoginController extends HttpServlet {
    OfficerDAO officerDAO;
    public void init() {
        officerDAO = new OfficerDAO();
    }
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        doGet(req, res);
    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        checkUserLogin(req,res);

    }

    private void checkUserLogin(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String mobile = req.getParameter("user-mobile");
        String password = req.getParameter("user-password");
        String mac="";
//        res.getWriter().println("Mobile "+mobile);
//        res.getWriter().println("Pass "+password);
        mac=GetMaC();
        OfficerLoginModel officerLoginModel=new OfficerLoginModel(mobile,password,mac);

//        res.getWriter().println("Mobile "+officerLoginModel.getMobile());
//        res.getWriter().println("Pass "+officerLoginModel.getPassword());
//        res.getWriter().println("mac "+officerLoginModel.getMAC());
        OfficerLoginModel officerLoginresponse = officerDAO.CheckLoginValidation(officerLoginModel);
        res.getWriter().println("ControllerMobile "+officerLoginresponse.getMobile());
        res.getWriter().println("ControllerMobilePass "+officerLoginresponse.getPassword());
        res.getWriter().println("ControllerMobilemac "+officerLoginresponse.getMAC());

    }

    private String GetMaC() throws IOException {
        InetAddress localHost = InetAddress.getLocalHost();
        NetworkInterface ni = NetworkInterface.getByInetAddress(localHost);
        byte[] hardwareAddress = ni.getHardwareAddress();
        String[] hexadecimal = new String[hardwareAddress.length];
        for (int i = 0; i < hardwareAddress.length; i++) {
            hexadecimal[i] = String.format("%02X", hardwareAddress[i]);
        }
        String macAddress = String.join("-", hexadecimal);
        return macAddress;
    }

}
