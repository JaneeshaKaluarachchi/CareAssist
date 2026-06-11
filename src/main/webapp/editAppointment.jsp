<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.lab.AppointmentModel" %>
<%@ page import="com.lab.AppointmentController" %>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Appointment</title>
    <link rel="stylesheet" href="css/appointment.css">
    <script>
        // Function to validate appointment date (cannot be in the past)
        function validateDate() {
            var today = new Date();
            today.setHours(0, 0, 0, 0);
            
            var appointmentDate = new Date(document.getElementById("appointmentDate").value);
            
            if (appointmentDate < today) {
                alert("Cannot update to past dates");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>EDIT APPOINTMENT</h2>
        
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            AppointmentModel appointment = AppointmentController.getAppointmentById(id);
            
            if (appointment != null) {
        %>
        <form action="UpdateAppointmentServlet" method="post" onsubmit="return validateDate()">
            <input type="hidden" name="appointment_id" value="<%= appointment.getAppointment_id() %>">
            
            <!-- Full Name -->
            <label for="fullName">Full Name:</label><br>
            <input type="text" id="fullName" name="fullName" value="<%= appointment.getFullName() %>" required><br><br>
            
            <!-- Age -->
            <label for="age">Age:</label><br>
            <input type="number" id="age" name="age" value="<%= appointment.getAge() %>" required><br><br>
            
            <!-- Gender (Optional) -->
            <label for="gender">Gender (Optional):</label><br>
            <select id="gender" name="gender">
                <option value="" <%= appointment.getGender() == null || appointment.getGender().isEmpty() ? "selected" : "" %>>--Select Gender--</option>
                <option value="Male" <%= "Male".equals(appointment.getGender()) ? "selected" : "" %>>Male</option>
                <option value="Female" <%= "Female".equals(appointment.getGender()) ? "selected" : "" %>>Female</option>
                <option value="Other" <%= "Other".equals(appointment.getGender()) ? "selected" : "" %>>Other</option>
            </select><br><br>
            
            <!-- Phone -->
            <label for="phone">Phone:</label><br>
            <input type="tel" id="phone" name="phone" value="<%= appointment.getPhone() %>" required><br><br>
            
            <!-- Email (Read-only to prevent changing ownership) -->
            <label for="email">Email:</label><br>
            <input type="email" id="email" name="email" value="<%= appointment.getEmail() %>" readonly><br><br>
            
            <!-- Address -->
			<label for="address">Address:</label><br>
			<textarea id="address" name="address" rows="4" cols="30" required><%= appointment.getAddress() != null ? appointment.getAddress() : "" %></textarea><br><br>

            <!-- Appointment Date -->
            <label for="appointmentDate">Appointment Date:</label><br>
            <input type="date" id="appointmentDate" name="appointmentDate" 
                   value="<%= appointment.getAppointmentDate() %>" 
                   min="<%= LocalDate.now() %>" required><br><br>
            
            <!-- Appointment Time -->
            <label for="appointmentTime">Appointment Time:</label><br>
            <input type="time" id="appointmentTime" name="appointmentTime" 
                   value="<%= appointment.getAppointmentTime() %>" required><br><br>
            
            <!-- Test Type -->
            <label for="testType">Test Type:</label><br>
            <select id="testType" name="testType" required>
                <option value="">--Select Test Type--</option>
                <option value="Blood Test" <%= "Blood Test".equals(appointment.getTestType()) ? "selected" : "" %>>Blood Test</option>
                <option value="Urine Test" <%= "Urine Test".equals(appointment.getTestType()) ? "selected" : "" %>>Urine Test</option>
                <option value="COVID-19 Test" <%= "COVID-19 Test".equals(appointment.getTestType()) ? "selected" : "" %>>COVID-19 Test</option>
                <option value="X-Ray" <%= "X-Ray".equals(appointment.getTestType()) ? "selected" : "" %>>X-Ray</option>
                <option value="MRI" <%= "MRI".equals(appointment.getTestType()) ? "selected" : "" %>>MRI</option>
                <option value="CT Scan" <%= "CT Scan".equals(appointment.getTestType()) ? "selected" : "" %>>CT Scan</option>
                <option value="Ultrasound" <%= "Ultrasound".equals(appointment.getTestType()) ? "selected" : "" %>>Ultrasound</option>
            </select><br><br>
            
            <!-- Note -->
            <label for="note">Note:</label><br>
            <textarea id="note" name="note" rows="4" cols="30"><%= appointment.getNote() != null ? appointment.getNote() : "" %></textarea><br><br>
            
            <!-- Submit Button -->
            <input type="submit" value="Update Appointment">
        </form>
        
        <p><a href="userAppointments.jsp?email=<%= appointment.getEmail() %>">Back to My Appointments</a></p>
        <%
            } else {
        %>
            <p>Appointment not found.</p>
            <p><a href="appointment.jsp">Book New Appointment</a></p>
        <%
            }
        %>
    </div>
</body>
</html>
