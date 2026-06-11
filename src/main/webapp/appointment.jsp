<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.LocalTime" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lab Appointment Booking</title>
    <link rel="stylesheet" href="css/appointment.css">
    
    <script>
        // Function to validate appointment date and time
        function validateDateTime() {
            var today = new Date();
            
            var appointmentDate = document.getElementById("appointmentDate").value;
            var appointmentTime = document.getElementById("appointmentTime").value;
            
            if (!appointmentDate || !appointmentTime) {
                return true; // Let the required attribute handle empty fields
            }
            
            var selectedDateTime = new Date(appointmentDate + 'T' + appointmentTime);
            var currentDateTime = new Date();
            
            // Check if the appointment is in the past
            if (selectedDateTime < currentDateTime) {
                alert("Cannot book appointments for past dates or times");
                return false;
            }
            
            // Check if time is within business hours (8:00 AM to 5:00 PM)
            var hours = parseInt(appointmentTime.split(':'));
            var minutes = parseInt(appointmentTime.split(':'));
            
            if (hours < 8 || (hours === 17 && minutes > 0) || hours > 17) {
                alert("Appointment time must be between 8:00 AM and 5:00 PM");
                return false;
            }
            
            // Validate age
            var age = parseInt(document.getElementById("age").value);
            if (age <= 0) {
                alert("Age must be greater than 0");
                return false;
            }
            
            return true;
        }
        
        // Set minimum date and time on page load
        window.onload = function() {
            var now = new Date();
            var year = now.getFullYear();
            var month = (now.getMonth() + 1).toString().padStart(2, '0');
            var day = now.getDate().toString().padStart(2, '0');
            
            // Set min attribute for date input
            document.getElementById("appointmentDate").min = year + "-" + month + "-" + day;
            
            // Set min and max time for appointment time
            document.getElementById("appointmentTime").min = "08:00";
            document.getElementById("appointmentTime").max = "17:00";
            
            // If today is selected, set min time to current time if it's between 8 AM and 5 PM
            document.getElementById("appointmentDate").addEventListener("change", function() {
                var selectedDate = this.value;
                var today = year + "-" + month + "-" + day;
                
                if (selectedDate === today) {
                    var currentHour = now.getHours();
                    var currentMinute = now.getMinutes();
                    
                    // If current time is before 8 AM, set min time to 8 AM
                    if (currentHour < 8) {
                        document.getElementById("appointmentTime").min = "08:00";
                    } 
                    // If current time is after 5 PM, don't allow booking for today
                    else if (currentHour >= 17) {
                        alert("No more appointments available for today. Please select another date.");
                        this.value = ""; // Clear the date selection
                    } 
                    // If current time is between 8 AM and 5 PM, set min time to current time
                    else {
                        var timeString = currentHour.toString().padStart(2, '0') + ":" + 
                                        currentMinute.toString().padStart(2, '0');
                        document.getElementById("appointmentTime").min = timeString;
                    }
                } else {
                    // For future dates, allow full business hours
                    document.getElementById("appointmentTime").min = "08:00";
                }
            });
            
            // Trigger change event to set initial time restrictions
            document.getElementById("appointmentDate").dispatchEvent(new Event('change'));
        };
    </script>
</head>
<body>
    <div class="container">
        <h2>LAB APPOINTMENT BOOKING FORM</h2>
        <form class ="form-section" action="InsertAppointmentServlet" method="post" onsubmit="return validateDateTime()">
            <!-- Full Name -->
            <label for="fullName">Full Name:</label><br>
            <input type="text" id="fullName" name="fullName" required><br><br>
            
                   <!-- Age -->
        <label for="age">Age:</label><br>
        <input type="number" id="age" name="age" min="1" required><br><br>
        
        <!-- Gender (Optional) -->
        <label for="gender">Gender (Optional):</label><br>
        <select id="gender" name="gender">
            <option value="">--Select Gender--</option>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
            <option value="Other">Other</option>
        </select><br><br>
        
        <!-- Phone -->
        <label for="phone">Phone:</label><br>
        <input type="tel" id="phone" name="phone" required><br><br>
        
        <!-- Email -->
        <label for="email">Email:</label><br>
        <input type="email" id="email" name="email" required><br><br>
        
        <!-- Address -->
		<label for="address">Address:</label><br>
		<textarea id="address" name="address" rows="4" cols="30" required></textarea><br><br>
        
        
        <!-- Appointment Date -->
        <label for="appointmentDate">Appointment Date:</label><br>
        <input type="date" id="appointmentDate" name="appointmentDate" 
               min="<%= LocalDate.now() %>" required><br><br>
        
        <!-- Appointment Time -->
        <label for="appointmentTime">Appointment Time (8:00 AM - 5:00 PM):</label><br>
        <input type="time" id="appointmentTime" name="appointmentTime" 
               min="08:00" max="17:00" required><br><br>
        
        <!-- Test Type -->
        <label for="testType">Test Type:</label><br>
        <select id="testType" name="testType" required>
            <option value="">--Select Test Type--</option>
            <option value="Blood Test">Blood Test</option>
            <option value="Urine Test">Urine Test</option>
            <option value="COVID-19 Test">COVID-19 Test</option>
            <option value="X-Ray">X-Ray</option>
            <option value="MRI">MRI</option>
            <option value="CT Scan">CT Scan</option>
            <option value="Ultrasound">Ultrasound</option>
        </select><br><br>
        
        <!-- Note -->
        <label for="note">Note:</label><br>
        <textarea id="note" name="note" rows="4" cols="30"></textarea><br><br>
        
        <!-- Submit Button -->
        <input type="submit" value="Book Appointment">
    </form>
</div>
</body>
</html>
