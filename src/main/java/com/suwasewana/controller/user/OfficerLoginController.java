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
    private Gson gson = new Gson();
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
//        System.out.println("Mobile "+mobile);
//        System.out.println("Pass "+password);
        mac=GetMaC();
        OfficerLoginModel officerLoginModel=new OfficerLoginModel(mobile,password,mac);

//        res.getWriter().println("Mobile "+officerLoginModel.getMobile());
//        res.getWriter().println("Pass "+officerLoginModel.getPassword());
//        res.getWriter().println("mac "+officerLoginModel.getMAC());
        OfficerLoginModel officerLoginresponse = officerDAO.CheckLoginValidation(officerLoginModel);
//        System.out.println("ControllerMobile "+officerLoginresponse.getMobile());
//        System.out.println("ControllerMobilePass "+officerLoginresponse.getPassword());
//        System.out.println("ControllerMobilemac "+officerLoginresponse.getMAC());

        PrintWriter out = res.getWriter();
        res.setContentType("application/json");
        res.setCharacterEncoding("UTF-8");

        String responseJsonString = "";
        if (officerLoginresponse.getMobile().equals("") || officerLoginresponse.getPassword().equals("") || officerLoginresponse.getMAC().equals("") ) {
            ResponseType suwasewanaRespose = new ResponseType("error", "invalid mobile number password");
            responseJsonString = this.gson.toJson(suwasewanaRespose);
//            res.getWriter().println("Response unsuecc");
        } else {
            ResponseType suwasewanaRespose = new ResponseType("success", "success");
            responseJsonString = this.gson.toJson(suwasewanaRespose);
//            res.getWriter().println("Response suecc");
        }

        out.print(responseJsonString);
        out.flush();
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