package com.lab;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DeleteAppointmentServlet")
public class DeleteAppointmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        int appointment_id = Integer.parseInt(request.getParameter("id"));
        String email = request.getParameter("email");
        
        // Verify user can only delete their own appointments
        boolean isUserAppointment = AppointmentController.isUserAppointment(appointment_id, email);
        
        if (!isUserAppointment) {
            String alertMessage = "You can only delete your own appointments";
            response.getWriter().println("<script> alert('" + alertMessage + 
                                        "');window.location.href='userAppointments.jsp?email=" + email + "'</script>");
            return;
        }
        
        boolean isSuccess = AppointmentController.deleteAppointment(appointment_id);
        
        if(isSuccess) {
            String alertMessage = "Appointment Deleted Successfully";
            response.getWriter().println("<script> alert('" + alertMessage + 
                                        "');window.location.href='userAppointments.jsp?email=" + email + "'</script>");
        } else {
            RequestDispatcher dis = request.getRequestDispatcher("error.jsp");
            dis.forward(request, response);
        }
    }
}
