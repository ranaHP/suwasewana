
package com.suwasewana.core;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/s/*")
public class Router extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//        String action = request.getServletPath();
//        String requestURI = request.getContextPath();
//        response.getWriter().println(" request uri" + request.getRequestURI() + " - context path- " + request.getContextPath()
//        + " - path info - " + request.getServletPath() + " Query string - " + request.getRequestURL() + " "
//        );

        response.setCharacterEncoding("UTF-8");
        String getUrlData [] = request.getRequestURI().split("/");
        response.getWriter().println(" request uri"  + request.getRequestURI() + "  data -: " +  getUrlData[getUrlData.length-1] );
        try {
            RequestDispatcher rd;
            switch (getUrlData[getUrlData.length-1]) {
                case "s":
                    rd = request.getRequestDispatcher("/view/user/user-home.jsp");
                    rd.forward(request,response);
                    break;
                case "login":
                    rd = request.getRequestDispatcher("/view/user/Login.jsp");
                    rd.forward(request,response);
                    break;
                case "register":
                    rd = request.getRequestDispatcher("/view/user/user-registration.jsp");
                    rd.forward(request,response);
                    break;
                case "login_officer":
                    rd = request.getRequestDispatcher("/view/admin/officerLogin/OfficerLogin.jsp");
                    rd.forward(request,response);
                    break;
                case "appointment":
                    rd = request.getRequestDispatcher("/view/user/user-appointment.jsp");
                    rd.forward(request,response);
                    break;
                case "clinic":
                    rd = request.getRequestDispatcher("/view/user/user-clinics.jsp");
                    rd.forward(request,response);
                    break;
                case "diseases":
                    rd = request.getRequestDispatcher("/view/user/user-diseases-details.jsp");
                    rd.forward(request,response);
                    break;
                case "complain":
                    rd = request.getRequestDispatcher("/view/user/user-complain.jsp");
                    rd.forward(request,response);
                    break;
                case "clinic-dashboard":
                    rd = request.getRequestDispatcher("/view/admin/clinicalOfficer/dashBoard/dashboard.jsp");
                    rd.forward(request,response);
                    break;
                case "announcement":
                    rd = request.getRequestDispatcher("/view/user/user-announcement.jsp");
                    rd.forward(request,response);
                    break;
                case "create-clinic":
                    rd = request.getRequestDispatcher("/view/admin/clinicalOfficer/dashBoard/dashboard_crateClinics.jsp");
                    rd.forward(request,response);
                    break;
                case "view-clinics":
                    rd = request.getRequestDispatcher("/view/admin/clinicalOfficer/dashBoard/dashboard_viewClinics.jsp");
                    rd.forward(request,response);
                    break;

                case "Add-vaccine":
                    rd = request.getRequestDispatcher("/view/admin/SuperAdmin/Add-vaccin.jsp");
                    rd.forward(request,response);
                    break;


                case "vaccinated-users-view":
                    rd = request.getRequestDispatcher("/view/admin/Hospital/HospitalVaccinationDetailView.jsp");
                    rd.forward(request,response);
                    break;

                case "vaccine_clinics":
                    rd = request.getRequestDispatcher("/view/admin/clinicalOfficer/dashBoard/dashboard_createVaccineClinics.jsp");
                    rd.forward(request,response);
                    break;
                case "view_vaccine_clinics":
                    rd = request.getRequestDispatcher("/view/admin/clinicalOfficer/dashBoard/dashboard_viewVaccineClinics.jsp");
                    rd.forward(request,response);
                    break;
                case "vaccine_announcements":
                    rd = request.getRequestDispatcher("/view/admin/clinicalOfficer/ClinicAnnouncement1.jsp");
                    rd.forward(request,response);
                    break;
                case "view_vaccine_announcements":
                    rd = request.getRequestDispatcher("/view/admin/clinicalOfficer/dashBoard/dashboard_viewVaccineAnnouncements.jsp");
                    rd.forward(request,response);
                    break;
                case "select-announcements":
                    rd = request.getRequestDispatcher("/view/admin/clinicalOfficer/ClinicAnnouncement2.jsp");
                    rd.forward(request,response);
                    break;

                case "viewClinic-announcements":
                    rd = request.getRequestDispatcher("/view/admin/clinicalOfficer/dashBoard/dashboard_viewAnnouncements.jsp");
                    rd.forward(request,response);
                    break;

                case "viewClinic-reports":
                    rd = request.getRequestDispatcher("/view/admin/clinicalOfficer/dashBoard/dashboard_clinicReports.jsp");
                    rd.forward(request,response);
                    break;
                case "viewDisease-reports":
                    rd = request.getRequestDispatcher("/view/admin/clinicalOfficer/dashBoard/dashboard_view_diseaseReport.jsp");
                    rd.forward(request,response);
                    break;

                case "verify-patients":
                    rd = request.getRequestDispatcher("/view/admin/phiOfficer/dashBoard/dashboard_verifyPatients.jsp");
                    rd.forward(request,response);
                    break;
                case "Register-patients":
                    rd = request.getRequestDispatcher("/view/admin/phiOfficer/dashBoard/RegisterUser.jsp");
                    rd.forward(request,response);
                    break;
                case "view-RPHI-announcement":
                    rd = request.getRequestDispatcher("/view/admin/phiOfficer/dashBoard/dashboard_view_RPHI_announcement.jsp");
                    rd.forward(request,response);
                    break;
                case "PHI-dashboard":
                    rd = request.getRequestDispatcher("/view/admin/phiOfficer/dashBoard/phi-dashboard.jsp");
                    rd.forward(request,response);
                    break;
                case "view-complaints":
                    rd = request.getRequestDispatcher("/view/admin/phiOfficer/dashBoard/dashboard_viewComplaints.jsp");
                    rd.forward(request,response);
                    break;
                case "view-appointments":
                    rd = request.getRequestDispatcher("/view/admin/phiOfficer/dashBoard/dashboard_viewAppointments.jsp");
                    rd.forward(request,response);
                    break;
                case "manage-toDO":
                    rd = request.getRequestDispatcher("/view/admin/phiOfficer/dashBoard/dashboard_todolist.jsp");
                    rd.forward(request,response);
                    break;
                case "PHI-view-report":
                    rd = request.getRequestDispatcher("/view/admin/phiOfficer/dashBoard/dashboard_view_report.jsp");
                    rd.forward(request,response);
                    break;

                case "admin-dashboard":
                    rd = request.getRequestDispatcher("/view/admin/SuperAdmin/Dashboard-Home.jsp");
                    rd.forward(request,response);
                    break;

                case "view_PHI":
                    rd = request.getRequestDispatcher("/view/admin/SuperAdmin/View-PHI.jsp");
                    rd.forward(request,response);
                    break;
                case "view_MOH":
                    rd = request.getRequestDispatcher("/view/admin/SuperAdmin/View-MOH.jsp");
                    rd.forward(request,response);
                    break;
                case "view_ClinicalOfficers":
                    rd = request.getRequestDispatcher("/view/admin/SuperAdmin/View-ClinicalOfficers.jsp");
                    rd.forward(request,response);
                    break;
                case "register_PHI":
                    rd = request.getRequestDispatcher("/view/admin/SuperAdmin/Register-PHI.jsp");
                    rd.forward(request,response);
                    break;
                case "register_C-officer":
                    rd = request.getRequestDispatcher("/view/admin/SuperAdmin/Register-ClinicalOfficer.jsp");
                    rd.forward(request,response);
                    break;
                case "register_MOH":
                    rd = request.getRequestDispatcher("/view/admin/SuperAdmin/Register-MOH.jsp");
                    rd.forward(request,response);
                    break;

                case "public_announcements":
                    rd = request.getRequestDispatcher("/view/admin/SuperAdmin/Public-Announcements.jsp");
                    rd.forward(request,response);
                    break;
                case "public_announcements_list":
                    System.out.println("Hi awa ansana");
                    rd = request.getRequestDispatcher("/view/admin/SuperAdmin/Public-Announcements-List.jsp");
                    rd.forward(request,response);
                    break;
                case "RPHI-Dashboard":
                    rd = request.getRequestDispatcher("/view/admin/RPHI/rphi-dashboard.jsp");
                    rd.forward(request,response);
                    break;

                case "MakAnnouncementsForPHI":
                    rd = request.getRequestDispatcher("/view/admin/RPHI/make_AnnouncementForRPHI.jsp");
                    rd.forward(request,response);
                    break;
                case "RPHI-viewReports":
                    rd = request.getRequestDispatcher("/view/admin/RPHI/RPHIdashboard_view_report.jsp");
                    rd.forward(request,response);
                    break;
                case "AssignTask":
                    rd = request.getRequestDispatcher("/view/admin/RPHI/assign_TasksAndManage.jsp");
                    rd.forward(request,response);
                    break;
                case "RPHI-todoList":
                    rd = request.getRequestDispatcher("/view/admin/RPHI/RPHIdashboard_todolist.jsp");
                    rd.forward(request,response);
                    break;
                case "RPHI-appointments":
                    rd = request.getRequestDispatcher("/view/admin/RPHI/RPHIdashboard_viewAppointments.jsp");
                    rd.forward(request,response);
                    break;
                case "RPHI-complaints":
                    rd = request.getRequestDispatcher("/view/admin/RPHI/RPHIdashboard_viewComplaints.jsp");
                    rd.forward(request,response);
                    break;
                case "MOHAnnouncements":
                    rd = request.getRequestDispatcher("/view/admin/RPHI/make_AnnouncementForPublic.jsp");
                    rd.forward(request,response);
                    break;

                case "View-Todo-list":
                    rd = request.getRequestDispatcher("/view/admin/phiOfficer/dashBoard/dashboard_todolist.jsp");
                    rd.forward(request,response);
                    break;
                case "Assign-task-for-phi":
                    rd = request.getRequestDispatcher("/view/admin/RPHI/assign_TasksForPHI.jsp");
                    rd.forward(request,response);
                    break;
                case "AddvaccineType":
                    rd = request.getRequestDispatcher("/view/admin/SuperAdmin/Add-vaccin.jsp");
                    rd.forward(request,response);
                    break;
                case "editvaccineType":
                    rd = request.getRequestDispatcher("/view/admin/SuperAdmin/edit-vaccin.jsp");
                    rd.forward(request,response);
                    break;
                case "ViewVaccinesForUser":
                    rd = request.getRequestDispatcher("/view/user/user-Vaccine_types_view.jsp");
                    rd.forward(request,response);
                    break;
                case "vaccine-details":
                    rd = request.getRequestDispatcher("/view/user/user-Vaccine_detail_view.jsp");
                    rd.forward(request,response);
                    break;
                case "Register-for-vaccine":
                    rd = request.getRequestDispatcher("/view/user/user-Vaccine_Register.jsp");
                    rd.forward(request,response);
                    break;
                case "HospitalView":
                    rd = request.getRequestDispatcher("/view/admin/Hospital/HospitalVaccinationDetailView.jsp");
                    rd.forward(request,response);
                    break;
                case "add-disease":
                    rd = request.getRequestDispatcher("/view/admin/SuperAdmin/Add-Disease.jsp");
                    rd.forward(request,response);
                    break;

                case "manage-disease":
                    System.out.println("Hi Hansana");
                    rd = request.getRequestDispatcher("/view/admin/SuperAdmin/Manage-Disease.jsp");
                    rd.forward(request,response);
                    break;
                default:
                    response.getWriter().println("404 Page not Found");
                    break;
            }
        } catch (Exception error) {
            throw new ServletException(error);
        }
    }
}