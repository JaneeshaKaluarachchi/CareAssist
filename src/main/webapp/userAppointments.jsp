<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.lab.AppointmentModel" %>
<%@ page import="com.lab.AppointmentController" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Lab Appointments</title>
    <link href='https://fonts.googleapis.com/css?family=Saira' rel='stylesheet'>
    <link rel="stylesheet" href="css/userAppointment.css">
</head>
<body>
    <%
        // Session validation
        HttpSession userSession = request.getSession(false);
        if (userSession == null || userSession.getAttribute("uid") == null) {
            response.sendRedirect("userLogin.jsp");
            return;
        }

        int uid = (int) userSession.getAttribute("uid");
    %>
    <div class="container">
        <h2>MY LAB APPOINTMENTS</h2>
        
        <%
            List<AppointmentModel> appointments = AppointmentController.getAppointmentsByUserId(uid);
            
            if (appointments.size() > 0) {
        %>
            <div class="table-container">
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Age</th>
                        <th>Gender</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Address</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Test Type</th>
                        <th>Note</th>
                        <th>Actions</th>
                    </tr>
                    <% for (AppointmentModel appointment : appointments) { %>
                    <tr>
                        <td title="<%= appointment.getAppointment_id() %>"><%= appointment.getAppointment_id() %></td>
                        <td title="<%= appointment.getFullName() %>"><%= appointment.getFullName() %></td>
                        <td title="<%= appointment.getAge() %>"><%= appointment.getAge() %></td>
                        <td title="<%= appointment.getGender() != null ? appointment.getGender() : "N/A" %>">
                            <%= appointment.getGender() != null ? appointment.getGender() : "N/A" %>
                        </td>
                        <td title="<%= appointment.getPhone() %>"><%= appointment.getPhone() %></td>
                        <td title="<%= appointment.getEmail() %>"><%= appointment.getEmail() %></td>
                        <td title="<%= appointment.getAddress() != null ? appointment.getAddress() : "N/A" %>">
                            <%= appointment.getAddress() != null ? appointment.getAddress() : "N/A" %>
                        </td>
                        <td title="<%= appointment.getAppointmentDate() %>"><%= appointment.getAppointmentDate() %></td>
                        <td title="<%= appointment.getAppointmentTime() %>"><%= appointment.getAppointmentTime() %></td>
                        <td title="<%= appointment.getTestType() %>"><%= appointment.getTestType() %></td>
                        <td title="<%= appointment.getNote() != null ? appointment.getNote() : "N/A" %>">
                            <%= appointment.getNote() != null ? appointment.getNote() : "N/A" %>
                        </td>
                        <td>
                            <a href="editAppointment.jsp?id=<%= appointment.getAppointment_id() %>" class="action-btn edit-btn">Edit</a>
                            <a href="DeleteAppointmentServlet?id=<%= appointment.getAppointment_id() %>&uid=<%= uid %>" 
                               class="action-btn delete-btn"
                               onclick="return confirm('Are you sure you want to delete this appointment?')">Delete</a>
                        </td>
                    </tr>
                    <% } %>
                </table>
            </div>
        <%
            } else {
        %>
                <p>No appointments found.</p>
        <%
            }
        %>
        
        <div class="button-container">
            <p><a href="appointment.jsp" class="action-button">Book New Appointment</a></p>
            <p><a href="dashboardPatient.jsp" class="back-button">Back to Dashboard</a></p>
        </div>
    </div>
</body>
</html>
