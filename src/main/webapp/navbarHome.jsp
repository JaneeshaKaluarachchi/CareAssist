<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Healthcare Help Desk</title>
    <link rel="stylesheet" href="css/navbar.css">
    <link href='https://fonts.googleapis.com/css?family=Saira' rel='stylesheet'>
    <script defer src="css/navbarHome.js"></script>
</head>
<body>
    <header>
        <nav class="navbar">
            <!-- ☰ Menu Icon -->
            <div class="menu-icon" onclick="toggleMenu()">&#9776;</div>

            <!-- Logo -->
            <div class="logo">
                <img src="assert/logo1.png" alt="Healthcare Logo">
            </div>

            <!-- Navbar Links (Visible on Desktop, Hidden on Mobile) -->
            <ul class="nav-links">
                <li><a href="about.html">About Us</a></li>
                <li><a href="doctors.html">Doctors</a></li>
                <li class="dropdown">
                    <a href="#">Services ▼</a>
                    <ul class="dropdown-menu">
                        <li><a href="appointments.html">Appointments</a></li>
                        <li><a href="medical_records.html">Medical Records</a></li>
                    </ul>
                </li>
                <li><a href="blog.html">Blog</a></li>
                <li><a href="subscription.html">Subscription</a></li>
            </ul>

            <!-- Consult Now Button -->
            <button class="consult-btn" onclick="showConsultModal()"><a href="userLogin.jsp">Consult Now</a></button>
        </nav>
    </header>

    <!-- Sidebar (☰ Menu) -->
    <div id="sidebar" class="sidebar">
        <button class="close-btn" onclick="closeMenu()">&times;</button>
        <ul id="sidebar-links">
            <!-- Links will be added dynamically via JavaScript -->
        </ul>
    </div>

    <!-- Consult Modal (You can add your modal content here) -->
    <div id="consultModal" class="consult-modal">
        <div class="modal-content">
            <span class="close-btn" onclick="closeConsultModal()">&times;</span>
            <h2>Consult Now</h2>
            <p>Form or content for the consultation goes here.</p>
        </div>
    </div>
</body>
</html>