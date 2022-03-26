package com.suwasewana.controller.clinicalOfficer;

import com.google.gson.Gson;
import com.suwasewana.dao.createClinicDAO;
import com.suwasewana.model.ClinicCalenderEventModel;
import com.suwasewana.model.CreateClinicModel;
import com.suwasewana.model.vaccineClinicModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;

@WebServlet("/create-clinic-controller/*")
    public class createClinicController extends HttpServlet {
        createClinicDAO createClinicDAO;
        private Gson gson = new Gson();
        public void init() {
            createClinicDAO = new createClinicDAO();
        }
        public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
             doGet(req, res);
        }
        public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
//          createClinic(req, res);
        res.setCharacterEncoding("UTF-8");
        String getUrlData [] = req.getRequestURI().split("/");
//        res.getWriter().println(" request uri"  + req.getRequestURI() + "  data -: " +  getUrlData[getUrlData.length-1] );
        try {
            RequestDispatcher rd;
            switch (getUrlData[getUrlData.length-1]) {
                case "create":
//                    res.getWriter().println("create");
                    createClinic(req,res);
                    break;
                case "view":
//                    res.getWriter().println("view");
                    viewClinic(req,res);
                    break;
                case "select":
//                    res.getWriter().println("select");
                      selectClinic(req,res);
                    break;
                case "delete":
                    res.getWriter().println("delete");
                      deleteClinic(req,res);
                    break;
                case "updateclinic":
                    res.getWriter().println("updateclinics");
                    updateClinic(req, res);
                    break;
                case "updatevclinic":
//                    res.getWriter().println("updatevclinics");
                    updatevClinic(req, res);
                    break;
                case "vaccineCLinic":
//                    res.getWriter().println("vaccineCLinic");
                    vaccineClinic(req, res);
                    break;
                case "deleteV":
//                    res.getWriter().println("VaccineClinicsView");
                    VaccineClinicsdelete(req, res);
                    break;
                case "VaccineClinicsView":
//                    res.getWriter().println("VaccineClinicsView");
                    VaccineClinicsView(req, res);
                    break;
                case "select-V-Clinics":
//                    res.getWriter().println("select-V-Clinics");
                    VaccineClinicsSelect(req, res);
                    break;
                case "viewdisease":
//                    res.getWriter().println("select-V-Clinics");
                    viewdisease(req, res);
                    break;
                case "choose":
//                    res.getWriter().println("select-V-Clinics");
                    choose(req, res);
                    break;
                case "viewcount":
//                    res.getWriter().println("select-V-Clinics");
                    viewcount(req, res);
                    break;
                case "clinicsEvents":
//                    res.getWriter().println("select-V-Clinics");
                    clinicsEvents(req, res);
                    break;
                case "updateAvailSheats":
//                    res.getWriter().println("select-V-Clinics");
                    updateAvailSheats(req, res);
                    break;
                case "message":
//                    res.getWriter().println("select-V-Clinics");
                    selectFormsg(req, res);
                    break;
                case "resheduleclinic":
//                    res.getWriter().println("select-V-Clinics");
                    resheduleclinic(req, res);
                    break;
                case "ResheduleVClinics":
//                    res.getWriter().println("select-V-Clinics");
                    ResheduleVClinics(req, res);
                    break;
                case "Numberslist":
//                    res.getWriter().println("select-V-Clinics");
                    numberslist(req, res);
                    break;
                case "searchFromDate":
//                    res.getWriter().println("select-V-Clinics");
                    searchFromDate(req, res);
                    break;
                case "vaccinecount":
//                    res.getWriter().println("select-V-Clinics");
                    vaccinecount(req, res);
                    break;
                case "VclinicRegisterNumList":
//                    res.getWriter().println("select-V-Clinics");
                    VclinicRegisterNumList(req, res);
                    break;


                default:
                    res.getWriter().println("404 Page not Found");
                    break;
            }
        } catch (Exception error) {
            throw new ServletException(error);
        }
    }

    private void VclinicRegisterNumList(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String nic="199910910061";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("sDetails")) {
                    nic = cookie.getValue().split("/")[3];
                }
            }
        }
            vaccineClinicModel VclinicRegisterNumList= new vaccineClinicModel(

                req.getParameter("clinicID"),
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                nic,
                "",
                "",
                "",
                ""

        );
        ArrayList<vaccineClinicModel> result= createClinicDAO.VclinicRegisterNumList(VclinicRegisterNumList);
        res.getWriter().println(gson.toJson(result));
        }

    private void vaccinecount(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String Cnic="199910910061";
        String nic="199910910061";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("sDetails")) {
                    nic = cookie.getValue().split("/")[3];
                }
            }
        }
        ArrayList<CreateClinicModel> result=createClinicDAO.vaccineCount(nic);
        res.getWriter().println(gson.toJson(result));
        }

    private void searchFromDate(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String start=req.getParameter("sdate");
        String end = req.getParameter("edate");
        String Cnic = "12";
        String nic="199910910061";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("sDetails")) {
                    nic = cookie.getValue().split("/")[3];
                }
            }
        }
        ArrayList<CreateClinicModel> result= createClinicDAO.ViewFromdate(start,end,nic);
        res.getWriter().println(gson.toJson(result));
        }

    private void numberslist(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String nic="199910910061";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("sDetails")) {
                    nic = cookie.getValue().split("/")[3];
                }
            }
        }
            CreateClinicModel numberslist= new CreateClinicModel(

                req.getParameter("clinicID"),
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
                "",
                nic

        );
        ArrayList<CreateClinicModel> result= createClinicDAO.numberslist(numberslist);
        res.getWriter().println(gson.toJson(result));
        }

    private void ResheduleVClinics(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String nic="199910910061";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("sDetails")) {
                    nic = cookie.getValue().split("/")[3];
                }
            }
        }
            vaccineClinicModel ResheduleVClinics= new vaccineClinicModel(
                req.getParameter("clinicID"),
                "",
                req.getParameter("datetime"),
               "",
                "",
                "",
                "",
                "",
                "",
                nic,
                "",
                "",
                "",
                ""

        ) ;
        System.out.println("updateeeeeeeeeee");
        String result= createClinicDAO.ResheduleVClinics(ResheduleVClinics);
        res.getWriter().println(result);
    }

    private void resheduleclinic(HttpServletRequest req, HttpServletResponse res) throws IOException {
        res.getWriter().println("update");
        String nic="199910910061";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("sDetails")) {
                    nic = cookie.getValue().split("/")[3];
                }
            }
        }
        CreateClinicModel resheduleclinic= new CreateClinicModel(

                req.getParameter("clinicID"),
                "",
                req.getParameter("date"),
                req.getParameter("time"),
                req.getParameter("duration"),
                "",
                "",
                "",
                "",
               "",
                "",
                "",
                "",
                nic

        );
//        System.out.println("updateeeeeeeeeee");
        String result= createClinicDAO.resheduleclinic(resheduleclinic);
        res.getWriter().println(result);
        }

    private void selectFormsg(HttpServletRequest req, HttpServletResponse res) throws IOException {
        System.out.println("message");
        String nic="199910910061";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("sDetails")) {
                    nic = cookie.getValue().split("/")[3];
                }
            }
        }
        CreateClinicModel selectFormsg = new CreateClinicModel(
                req.getParameter("clinicID"),
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
                "",
                nic


        );
        System.out.println("select");
        ArrayList<CreateClinicModel> result= createClinicDAO.selectFormsgsend(selectFormsg);
        res.getWriter().println(gson.toJson(result));
    }

    private void updateAvailSheats(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String nic="199910910061";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("sDetails")) {
                    nic = cookie.getValue().split("/")[3];
                }
            }
        }
            CreateClinicModel updateAvailSheats =new CreateClinicModel(
                req.getParameter("clinic_id"),
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                req.getParameter("avalabel_seats"),
                "",
                "",
                "",
                "",
                nic
        );
        String result= createClinicDAO.updateAvailSheats(updateAvailSheats);
        res.getWriter().println(gson.toJson(result));
        }

    private void clinicsEvents(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String nic="199910910061";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("sDetails")) {
                    nic = cookie.getValue().split("/")[3];
                }
            }
        }
            CreateClinicModel cEvents =new CreateClinicModel(
                "",
                "",
                req.getParameter("date"),
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
                nic
        );
        ArrayList<CreateClinicModel> result= createClinicDAO.Viewevents(cEvents);
        res.getWriter().println(gson.toJson(result));
        }

    private void viewcount(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String nic="199910910061";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("sDetails")) {
                    nic = cookie.getValue().split("/")[3];
                }
            }
        }
        CreateClinicModel viewC = new CreateClinicModel(
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
                "",
                "",
                nic

        );
        ArrayList<CreateClinicModel> result= createClinicDAO.ViewCount(viewC);
        res.getWriter().println(gson.toJson(result));
    }

    private void choose(HttpServletRequest req, HttpServletResponse res) throws IOException {
            String date=req.getParameter("datetime");
        ArrayList<ClinicCalenderEventModel> result=createClinicDAO.chooseClinic(date);
        res.getWriter().println(gson.toJson(result));

        }

    private void updatevClinic(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String nic="199910910061";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("sDetails")) {
                    nic = cookie.getValue().split("/")[3];
                }
            }
        }
            vaccineClinicModel Updatevclinic= new vaccineClinicModel(
                  req.getParameter("clinicID"),
                  req.getParameter("title"),
                  "",
                  "",
                  req.getParameter("max_patient"),
                  req.getParameter("Limitsheats"),
                  "",
                  "",
                  "",
                  nic,
                  "",
                  "",
                  "",
                  req.getParameter("dose")

          ) ;
        System.out.println("updateeeeeeeeeee");
        String result= createClinicDAO.updatevClinic(Updatevclinic);
        res.getWriter().println(result);
        }

    private void VaccineClinicsdelete(HttpServletRequest req, HttpServletResponse res) throws IOException {
        System.out.println("Deleteeeeeeeeee");
        String nic="199910910061";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("sDetails")) {
                    nic = cookie.getValue().split("/")[3];
                }
            }
        }
        vaccineClinicModel deleteVClinic = new vaccineClinicModel(
                req.getParameter("clinicID"),
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                nic,
                "",
                "",
                "",
                ""
        );
        System.out.println("delete");
        String result = createClinicDAO.deleteVClinic(deleteVClinic);
        res.getWriter().println(result);
        System.out.println(result);
    }


    private void VaccineClinicsSelect(HttpServletRequest req, HttpServletResponse res) throws IOException {
//            res.getWriter().println("came");
        String nic="199910910061";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("sDetails")) {
                    nic = cookie.getValue().split("/")[3];
                }
            }
        }
        vaccineClinicModel selectVaclinics= new vaccineClinicModel(
                    req.getParameter("clinicID"),
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    nic,
                    "",
                    "",
                    "",
                    ""
            );

        ArrayList<vaccineClinicModel> result= createClinicDAO.selectVClinics(selectVaclinics);
        res.getWriter().println(gson.toJson(result));
        }

    private void VaccineClinicsView(HttpServletRequest req, HttpServletResponse res) throws IOException {
//            res.getWriter().println("vaccine");
        String nic="199910910061";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("sDetails")) {
                    nic = cookie.getValue().split("/")[3];
                }
            }
        }
        vaccineClinicModel vaccineClinicView = new vaccineClinicModel(
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                     nic,
                    "",
                    "",
                    "",
                    ""
            );
        ArrayList<vaccineClinicModel> result= createClinicDAO.ViewVaccineClinics(vaccineClinicView);
        res.getWriter().println(gson.toJson(result));
    }

    private void vaccineClinic(HttpServletRequest req, HttpServletResponse res) throws IOException {
            res.getWriter().println("vaccine");
        String nic="199910910061";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("sDetails")) {
                    nic = cookie.getValue().split("/")[3];
                }
            }
        }

        String timeN=req.getParameter("timeN");
            vaccineClinicModel vaccineclinic= new vaccineClinicModel(
                "",
                req.getParameter("clinictitle"),
                req.getParameter("datetime"),
                req.getParameter("duration"),
                "",
                req.getParameter("maxpatient"),
                req.getParameter("MArea"),
                req.getParameter("LAgelimit"),
                req.getParameter("UAgelimit"),
                nic,
                req.getParameter("vaccine"),
                "",
                req.getParameter("location"),
                req.getParameter("Dosecount")

        );

        String result = createClinicDAO.vaccineClinic(vaccineclinic,timeN);
        res.getWriter().println(result);

    }

    private void updateClinic(HttpServletRequest req, HttpServletResponse res) throws IOException {
        res.getWriter().println("update");
        String nic="199910910061";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("sDetails")) {
                    nic = cookie.getValue().split("/")[3];
                }
            }
        }
        CreateClinicModel updateClinic= new CreateClinicModel(

                req.getParameter("clinicID"),
                req.getParameter("title"),
                "",
                "",
                "",
                "",
                req.getParameter("description"),
                req.getParameter("maxpatient"),
                "",
                "",
                "",
                req.getParameter("patient"),
                "",
                nic

        );
//        System.out.println("updateeeeeeeeeee");
        String result= createClinicDAO.updateClinic(updateClinic);
        res.getWriter().println(result);
    }

    private void createClinic(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String CNic = "12";
//        Cookie[] cookies = req.getCookies();
//        if(cookies !=null){
//            for(Cookie cookie : cookies){
//                if(cookie.getName().equals("unic")) {
//                    cNic = cookie.getValue();
//                }
//            }
//        }
        String nic="199910910061";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("sDetails")) {
                    nic = cookie.getValue().split("/")[3];
                }
            }
        }
            CreateClinicModel createClinic = new CreateClinicModel(
                    req.getParameter(""),
                    req.getParameter("title"),
                    req.getParameter("date"),
                    req.getParameter("time"),
                    req.getParameter("duration"),
                    req.getParameter("disease"),
                    req.getParameter("description"),
                    req.getParameter("maxpatient"),
                    req.getParameter("maxpatient"),
                    req.getParameter("conduct"),
                    req.getParameter("MOH"),
                    req.getParameter("Target"),
                    req.getParameter("location"),
                    nic

       );
        String result= createClinicDAO.createClinic(createClinic);
        res.getWriter().println(result);
    }
    private void viewClinic(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, ParseException {
        String nic="199910910061";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("sDetails")) {
                    nic = cookie.getValue().split("/")[3];
                }
            }
        }
            CreateClinicModel viewClinic = new CreateClinicModel(
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
                "",
                "",
                nic
        );
        ArrayList<CreateClinicModel> result= createClinicDAO.ViewClinics(viewClinic);
        res.getWriter().println(gson.toJson(result));
    }
    private void viewdisease(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, ParseException {
        String nic="199910910061";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("sDetails")) {
                    nic = cookie.getValue().split("/")[3];
                }
            }
        }
            CreateClinicModel viewdisease = new CreateClinicModel(
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
                "",
                "",
                nic

        );
        ArrayList<CreateClinicModel> result= createClinicDAO.Viewdisease(viewdisease);
        res.getWriter().println(gson.toJson(result));
    }

    private void selectClinic(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
            System.out.println("selettttttttttttttttt");
        String nic="199910910061";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("sDetails")) {
                    nic = cookie.getValue().split("/")[3];
                }
            }
        }
            CreateClinicModel selectClinic = new CreateClinicModel(
                req.getParameter("clinicID"),
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
                "",
                nic


        );
        System.out.println("select");
        ArrayList<CreateClinicModel> result= createClinicDAO.selectClinics(selectClinic);
        res.getWriter().println(gson.toJson(result));
    }
    private void deleteClinic(HttpServletRequest req,HttpServletResponse res) throws IOException {
          System.out.println("Deleteeeeeeeeee");
        String nic="199910910061";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("sDetails")) {
                    nic = cookie.getValue().split("/")[3];
                }
            }
        }
          CreateClinicModel deleteClinic = new CreateClinicModel(
                  req.getParameter("clinicID"),
                  req.getParameter("title"),
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
                  nic
          );
          System.out.println("delete");
          String result = createClinicDAO.deleteClinic(deleteClinic);
         res.getWriter().println(result);
          System.out.println(result);
    }
}
