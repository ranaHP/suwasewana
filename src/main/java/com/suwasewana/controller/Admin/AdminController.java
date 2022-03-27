package com.suwasewana.controller.Admin;

import com.google.gson.Gson;
import com.suwasewana.core.ResponseType;
import com.suwasewana.dao.*;
import com.suwasewana.model.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import com.suwasewana.core.SuwasewanaHashing;

@WebServlet("/admin-controller/*")
public class AdminController extends HttpServlet {
    ComplainDAO complainDAO;
    MOHDAO mohdao;
    PHIDAO phidao;
    UserDAO userDAO;
    DistictDAO distictDAO;
    ProvinceDAO provinceDAO;
    PublicAnnouncementsDAO publicAnnouncementsDAO;
    OfficerDAO officerDAO;
    private Gson gson = new Gson();

    public void init() {
        officerDAO= new OfficerDAO();
        complainDAO = new ComplainDAO();
        mohdao=new MOHDAO();
        phidao=new PHIDAO();
        userDAO = new UserDAO();
        distictDAO=new DistictDAO();
        provinceDAO=new ProvinceDAO();
        publicAnnouncementsDAO = new PublicAnnouncementsDAO();
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        doGet(req, res);

    }
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

        res.setCharacterEncoding("UTF-8");
        String getUrlData [] = req.getRequestURI().split("/");

        try {
            RequestDispatcher rd;
            switch (getUrlData[getUrlData.length-1]) {

                case "mohall":
                    ViewMOHAll(req,res);
                    break;
                case "newUser":
                    newUser(req,res);
                    break;
                case "updateToOld":
                    updateToOld(req,res);
                    break;
                case "blockUser":
                    blockUser(req,res);
                    break;
                case "phiall":
                    Allphi(req,res);
                    break;
                case "C_all":
                    C_all(req,res);
                    break;
                case "allAnnouncement":
                    Allannouncement(req,res);
                    break;
                case "block":
                    block(req,res);
                    break;
                case "blockClinicalO":
                    blockClinicalO(req,res);
                    break;
                case "renew":
                    renew(req,res);
                    break;
                case "renewC":
                    renewC(req,res);
                    break;
                case "removeP":
                    removeP(req,res);
                    break;
                case "removeC":
                    removeC(req,res);
                    break;
                case "districtsSelect":
                    ViewSelectDisctirct(req,res);
                    break;
                case "districtsIdSelect":
                    SelectDisctirct(req,res);
                    break;
                case "provinceIdSelect":
                    SelectProvince(req,res);
                    break;
                case "provinceAll":
                    ViewProvinceAll(req,res);
                    break;
                case "districtsAll":
                    ViewDistrictAll(req,res);
                    break;
                case "PublicAnnouncement":
                    PublicAnnouncement(req,res);
                    break;
                case "AddProvince":
                    AddTargetprovince(req,res);
                    break;
                case "AddDistrict":
                    addTargetdistrict(req,res);
                    break;
                case "Announcement_update":
                    announcement_update(req,res);
                    break;
                case "Announcement_block":
                    announcement_block(req,res);
                    break;

                default:
                    res.getWriter().println("404 Page not Found");
                    break;
            }
        } catch (Exception error) {
            throw new ServletException(error);
        }

    }

    private void removeP(HttpServletRequest req, HttpServletResponse res) throws IOException {
        PHIModel removeP=new PHIModel(
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                req.getParameter("id"),
                "",
                "",
                "",
                "",
                "",
                "",
                ""
        );
        String result = phidao.removephi(removeP);
        res.getWriter().println(result);
    }

    private void renewC(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String nic= req.getParameter("id");
        String result = mohdao.renewC(nic);
        res.getWriter().println(result);

    }

    private void removeC(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String nic= req.getParameter("id");
        String result = mohdao.removeC(nic);
        res.getWriter().println(result);

    }

    private void blockClinicalO(HttpServletRequest req, HttpServletResponse res) throws IOException {
       String nic= req.getParameter("id");
        String result = mohdao.blockclinical(nic);
        res.getWriter().println(result);

    }

    private void C_all(HttpServletRequest req, HttpServletResponse res) throws IOException {

        ClinicalOfficerModel clinicalOfficerModel=new ClinicalOfficerModel(
                "",
                "",
                "",
                "",
                "",
                "",
                ""
        );
        ArrayList<ClinicalOfficerModel> result = mohdao.C_all_view(clinicalOfficerModel);
        res.getWriter().println(gson.toJson(result));
    }

    private void renew(HttpServletRequest req, HttpServletResponse res) throws IOException {
        PHIModel renew=new PHIModel(
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                req.getParameter("id"),
                "",
                "",
                "",
                "",
                "",
                "",
                ""
        );
        String result = phidao.renewphi(renew);
        res.getWriter().println(result);
    }

    private void block(HttpServletRequest req, HttpServletResponse res) throws IOException {
        PHIModel block=new PHIModel(
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                req.getParameter("id"),
                "",
                "",
                "",
                "",
                "",
                "",
                ""
        );
        String result = phidao.blockphi(block);
        res.getWriter().println(result);
    }

    private void Allphi(HttpServletRequest req, HttpServletResponse res) throws IOException {
        ArrayList<PHIModel> result = phidao.getphiALL();
        res.getWriter().println(gson.toJson(result));
    }

    private void announcement_block(HttpServletRequest req, HttpServletResponse res) throws IOException {
        ResponseType result = publicAnnouncementsDAO.block_announcement(req.getParameter("id"),req.getParameter("status"));
        res.getWriter().println(gson.toJson(result));
    }
    private void announcement_update(HttpServletRequest req, HttpServletResponse res) throws IOException {
//        ArrayList<PHIModel> result = publicAnnouncementsDAO.getphiALL();
//        res.getWriter().println(gson.toJson(result));
    }

    private void Allannouncement(HttpServletRequest req, HttpServletResponse res) throws IOException {
        ArrayList<PublicAnnouncementModel> result = publicAnnouncementsDAO.GetAllPublicAnnouncement();
        res.getWriter().println(gson.toJson(result));
    }

    private void ViewDistrictAll(HttpServletRequest req, HttpServletResponse res) throws IOException {
        System.out.println("district");
        ArrayList<DistrictModel> result =distictDAO.getDistrictList();
        res.getWriter().println(gson.toJson(result));
    }

    private void addTargetdistrict(HttpServletRequest req, HttpServletResponse res) throws IOException {
      HealthAnnouncementTargetDistrictModel district=new HealthAnnouncementTargetDistrictModel(
                      req.getParameter("id"),
                      req.getParameter("district_id")
                );
        String result = publicAnnouncementsDAO.addTargetDistricts(district);
        res.getWriter().println(result);

    }

    private void AddTargetprovince(HttpServletRequest req, HttpServletResponse res) throws IOException {
    HealthAnnouncementTargetProvinceModel targetProvince=new HealthAnnouncementTargetProvinceModel(
              req.getParameter("id"),
              req.getParameter("province_id")
    );
    String result= publicAnnouncementsDAO.addTargetProvince(targetProvince);
    res.getWriter().println(result);
    }

    private void SelectProvince(HttpServletRequest req, HttpServletResponse res) throws IOException {
      ProvinceModel provinceS= new ProvinceModel(
              "",
               req.getParameter("PName")
      );
        ArrayList<ProvinceModel> result = provinceDAO.ProvinceNames(provinceS);
        res.getWriter().println(gson.toJson(result));
    }

    private void SelectDisctirct(HttpServletRequest req, HttpServletResponse res) throws IOException {
          DistrictModel districtS=new DistrictModel(
            "",
             req.getParameter("DName"),
             ""
          );
        ArrayList<DistrictModel> result = distictDAO.DistrictsNames(districtS);
        res.getWriter().println(gson.toJson(result));

    }

    private void PublicAnnouncement(HttpServletRequest req, HttpServletResponse res) throws IOException {
            PublicAnnouncementModel publicAnnouncement= new PublicAnnouncementModel(
                    "",
                 req.getParameter("title"),
                 req.getParameter("description")  ,
                 req.getParameter("image"),
                    req.getParameter("expire_date"),
                    ""
            );
        int result = publicAnnouncementsDAO.PublicAnnouncement(publicAnnouncement);
        res.getWriter().println(result);
    }

    private void ViewSelectDisctirct(HttpServletRequest req, HttpServletResponse res) throws IOException {
         DistrictModel districts=new DistrictModel(
                 req.getParameter("province_id"),
                 "",
                 ""
         );
         ArrayList<DistrictModel> result = distictDAO.selectDistricts(districts);
          res.getWriter().println(gson.toJson(result));
    }


    private void ViewProvinceAll(HttpServletRequest req, HttpServletResponse res) throws IOException {
        System.out.println("provice");
        ArrayList<ProvinceModel> result = provinceDAO.getProvinceList();
        res.getWriter().println(gson.toJson(result));
    }




    private void ViewMOHAll(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
        System.out.println("Come to view moh controller all");
        ArrayList<MOHRegModel> result = mohdao.GetallMOHDetails();
        res.getWriter().println(gson.toJson(result));
    }
    private void newUser(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
//        System.out.println("Come to view moh controller all");

        SuwasewanaHashing hashing = new SuwasewanaHashing(req.getParameter("password"));
        String result = officerDAO.CheckNewOrOld(req.getParameter("mobile"),hashing.getHashValue());
        res.getWriter().println(gson.toJson(result));
    }
    private void updateToOld(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
//        System.out.println("Come to view moh controller all");
        String u=req.getParameter("uname");
        String op=req.getParameter("oldpassword");
        String np=req.getParameter("newpassword");
        SuwasewanaHashing hashing = new SuwasewanaHashing(req.getParameter("password"));
        String result = officerDAO.updateToOld(u,op,np);
        res.getWriter().println(gson.toJson(result));
    }
    private void blockUser(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
//        System.out.println("Come to view moh controller all");
        String mobile=req.getParameter("uname");

        String result = officerDAO.blockUser(mobile);
        res.getWriter().println(gson.toJson(result));
//        comment for push
    }





}
