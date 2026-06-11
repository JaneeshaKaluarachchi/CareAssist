package com.lab;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateAppointmentServlet")
public class UpdateAppointmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        int appointment_id = Integer.parseInt(request.getParameter("appointment_id"));
        String fullName = request.getParameter("fullName");
        int age = Integer.parseInt(request.getParameter("age"));
        String gender = request.getParameter("gender");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String appointmentDate = request.getParameter("appointmentDate");
        String appointmentTime = request.getParameter("appointmentTime");
        String testType = request.getParameter("testType");
        String note = request.getParameter("note");
        
        // Verify user can only edit their own appointments
        boolean isUserAppointment = AppointmentController.isUserAppointment(appointment_id, email);
        
        if (!isUserAppointment) {
            String alertMessage = "You can only edit your own appointments";
            response.getWriter().println("<script> alert('" + alertMessage + 
                                        "');window.location.href='userAppointments.jsp?email=" + email + "'</script>");
            return;
        }
        
        // Validate appointment date (cannot be in the past)
        LocalDate today = LocalDate.now();
        LocalDate requestedDate = LocalDate.parse(appointmentDate);
        
        if (requestedDate.isBefore(today)) {
            String alertMessage = "Cannot update to past dates";
            response.getWriter().println("<script> alert('" + alertMessage + 
                                        "');window.location.href='editAppointment.jsp?id=" + appointment_id + "'</script>");
            return;
        }
        
        boolean isSuccess = AppointmentController.updateAppointment(appointment_id, fullName, age, gender, phone, 
                                                                  email, address, appointmentDate, appointmentTime, testType, note);
        
        if(isSuccess) {
            String alertMessage = "Appointment Updated Successfully";
            response.getWriter().println("<script> alert('" + alertMessage + 
                                        "');window.location.href='userAppointments.jsp?email=" + email + "'</script>");
        } else {
            RequestDispatcher dis = request.getRequestDispatcher("error.jsp");
            dis.forward(request, response);
        }
    }
}
