package com.suwasewana.controller.clinicalOfficer;

import com.google.gson.Gson;
import com.suwasewana.dao.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;

@WebServlet(name = "FileUploadServlet1", urlPatterns = { "/fileuploadservlet1" })
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10,      // 10 MB
        maxRequestSize = 1024 * 1024 * 100   // 100 MB
)
public class CImageUploadController extends HttpServlet {
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
                    part.write("G:/suwasewana 2022/src/main/webapp/public/images/uploadimage/"+imageName);
                    System.out.println("C:/Users/Chathuranga/IdeaProjects/suwasewana8/src/main/webapp/public/images/uploadimage/"+imageName);
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