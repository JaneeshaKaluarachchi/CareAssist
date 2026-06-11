package com.lab;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/InsertAppointmentServlet")
public class InsertAppointmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
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
        
        // Validate appointment date (cannot be in the past)
        LocalDate today = LocalDate.now();
        LocalDate requestedDate = LocalDate.parse(appointmentDate);
        
        if (requestedDate.isBefore(today)) {
            String alertMessage = "Cannot book appointments for past dates";
            response.getWriter().println("<script> alert('" + alertMessage + 
                                        "');window.location.href='appointment.jsp'</script>");
            return;
        }
        
        boolean isSuccess = AppointmentController.insertAppointment(fullName, age, gender, phone, email, address,
                                                                  appointmentDate, appointmentTime, testType, note,uid);
        
        if(isSuccess) {
            String alertMessage = "Appointment Booked Successfully";
            response.getWriter().println("<script> alert('" + alertMessage + 
                                        "');window.location.href='userAppointments.jsp?email=" + email + "'</script>");
        } else {
            RequestDispatcher dis = request.getRequestDispatcher("error.jsp");
            dis.forward(request, response);
        }
    }
}
