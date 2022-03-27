package com.suwasewana.controller.user;


import com.google.gson.Gson;
import com.suwasewana.core.ResponseType;
import com.suwasewana.dao.OfficerDAO;
import com.suwasewana.model.OfficerLoginModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.NetworkInterface;

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
        String mobile = req.getParameter("user_mobile");
        String password = req.getParameter("user_password");
        String post = req.getParameter("Post");

        System.out.println("mobile "+mobile);
        System.out.println("password "+password);
        System.out.println("post "+post);


        String mac="";
        mac=GetMaC();
        OfficerLoginModel officerLoginModel=new OfficerLoginModel(mobile,password,mac ,post);
        OfficerLoginModel officerLoginresponse = officerDAO.CheckLoginValidation(officerLoginModel,post);
        PrintWriter out = res.getWriter();
        res.setContentType("application/json");
        res.setCharacterEncoding("UTF-8");

        System.out.println("########officerLoginresponse.getPostalCode() "+officerLoginresponse.getPostalCode());

        String responseJsonString = "";
        if (officerLoginresponse.getMobile().equals("") || officerLoginresponse.getPassword().equals("") || officerLoginresponse.getMAC().equals("") ) {
            ResponseType suwasewanaRespose = new ResponseType("error", "invalid mobile number password");
            responseJsonString = this.gson.toJson(suwasewanaRespose);
        } else if (
                !officerLoginresponse.getMobile().equals("") && !officerLoginresponse.getPassword().equals("")
                 && officerLoginresponse.getMessage().equals("mac is wrong") ) {
            ResponseType suwasewanaRespose = new ResponseType("error", "your mac is not match");
            responseJsonString = this.gson.toJson(suwasewanaRespose);

        }
        else if(officerLoginresponse.getPostalCode().equals("1")){
            ResponseType suwasewanaRespose = new ResponseType("error", "your Account is temporary Block");
            responseJsonString = this.gson.toJson(suwasewanaRespose);
        }
        else {
            ResponseType suwasewanaRespose = new ResponseType("success", "success");
//            System.out.println("Loging success come to controller");
            responseJsonString = this.gson.toJson(suwasewanaRespose);
            String temp = officerLoginresponse.getFull_name().split(" ")[0] +"/"
                    + officerLoginresponse.getMAC().replaceAll("-" ,"_")  + '/'
                    + officerLoginresponse.getPost()+ '/'
                    + officerLoginresponse.getNIC()+ '/'
                    + officerLoginresponse.getMohId()+ '/'
                    + officerLoginresponse.getMobile() ;
//            System.out.println(temp);
            Cookie loginCookie = new Cookie("sDetails",temp);
            loginCookie.setMaxAge(300*60);
            res.addCookie(loginCookie);
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
