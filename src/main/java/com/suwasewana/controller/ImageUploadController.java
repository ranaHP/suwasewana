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
        Part filePart = req.getPart("file");
        String fileName = filePart.getSubmittedFileName();
        int i = 1;
        for (Part part : req.getParts()) {
            System.out.println(part.toString());
            System.out.println("ImageName"+ (i +3));
            System.out.println(req.getParameter("ImageName"+(i)));
            if( i <=3){
                String imageName = req.getParameter("ImageName"+ (i));
                System.out.println(imageName);
                if(imageName != null  ){
                    part.write("D:/java/java projects/suwasewana1/src/main/webapp/public/images/uploadimage/"+imageName);
                    System.out.println("D:/java/java projects/suwasewana1/src/main/webapp/public/images/uploadimage/"+imageName);
                }

            }
            i++;
        }

        res.getWriter().print("The file uploaded sucessfully.");
    }


}

//<form method="post" action="http://localhost:8093/test_war_exploded/fileuploadservlet" enctype="multipart/form-data">
//<input type="file" name="file" />
//<input type="submit" value="Upload" />
//</form>