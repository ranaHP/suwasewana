package com.suwasewana.controller;

import com.google.gson.Gson;
import com.suwasewana.core.ResponseType;
import com.suwasewana.dao.UserDAO;
import com.suwasewana.model.UserLoginModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "FileUploadServlet", urlPatterns = { "/fileuploadservlet" })
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10,      // 10 MB
        maxRequestSize = 1024 * 1024 * 100   // 100 MB
)
public class ImageUploadController extends HttpServlet {
    UserDAO userDAO;
    private Gson gson = new Gson();

    public void init() {
        userDAO = new UserDAO();
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        doGet(req, res);
    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        System.out.println("add picture");
        System.out.println("img 1 "+req.getParameter("img1"));
        System.out.println("img 2 "+req.getParameter("img2"));
        System.out.println("img 3 "+req.getParameter("img3"));
        Part filePart = req.getPart("file");
        String fileName = filePart.getSubmittedFileName();
        int i = 1;
        for (Part part : req.getParts()) {
            if(part.getSize() > 100){
                part.write("D:/java/java projects/suwasewana/src/main/webapp/public/images/upload/"+ req.getParameter("img"+i)+".png");
            }
            i++;
        }
        res.getWriter().print("The file uploaded sucessfully.");
    }


}
