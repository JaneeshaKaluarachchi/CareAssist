package com.lab;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.time.LocalDate;

public class AppointmentController {
    
    private static boolean isSuccess;
    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;
    
    // Insert appointment data
    public static boolean insertAppointment(String fullName, int age, String gender, String phone, String email, String address,
                                          String appointmentDate, String appointmentTime, String testType, String note, int uid) {
        
        boolean isSuccess = false;
        
        // Check if appointment date is in the past
        LocalDate today = LocalDate.now();
        LocalDate requestedDate = LocalDate.parse(appointmentDate);
        
        if (requestedDate.isBefore(today)) {
            return false; // Cannot book past dates
        }
        
        try {
            con = DBConnection.getConnection();
            stmt = con.createStatement();
            
            // SQL Query with auto-increment ID (appointment_id is set to 0 and will be auto-incremented by MySQL)
            String sql = "INSERT INTO lab_app VALUES(0,'" + fullName + "'," + age + ",'" + gender + "','" + 
                          phone + "','" + email + "','" + address + "','" + appointmentDate + "','" + appointmentTime + "','" + 
                          testType + "','" + note + "', '" + uid + "')";
            
            int rs = stmt.executeUpdate(sql);
            
            if(rs > 0) {
                isSuccess = true;
            } else {
                isSuccess = false;
            }
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return isSuccess;
    }
    
    // Get appointment by email (for user to view their appointments)
    public static List<AppointmentModel> getAppointmentsByUserId(int uid) {
        List<AppointmentModel> appointments = new ArrayList<>();
        
        try {
            con = DBConnection.getConnection();
            stmt = con.createStatement();
            
            String sql = "SELECT * FROM lab_app WHERE uid = '" + uid + "'";
            rs = stmt.executeQuery(sql);
            
            while(rs.next()) {
                int appointment_id = rs.getInt(1);
                String fullName = rs.getString(2);
                int age = rs.getInt(3);
                String gender = rs.getString(4);
                String phone = rs.getString(5);
                String appointmentEmail = rs.getString(6);
                String address = rs.getString(7);
                String appointmentDate = rs.getString(8);
                String appointmentTime = rs.getString(9);
                String testType = rs.getString(10);
                String note = rs.getString(11);
                int userId = rs.getInt(12);
                
                AppointmentModel appointment = new AppointmentModel(appointment_id, fullName, age, gender, phone, 
                                                                  appointmentEmail, address, appointmentDate, appointmentTime, 
                                                                  testType, note,userId);
                appointments.add(appointment);
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return appointments;
    }
    
    // Get appointment by ID
    public static AppointmentModel getAppointmentById(int id) {
        AppointmentModel appointment = null;
        
        try {
            con = DBConnection.getConnection();
            stmt = con.createStatement();
            
            String sql = "SELECT * FROM lab_app WHERE appointment_id = " + id;
            rs = stmt.executeQuery(sql);
            
            if(rs.next()) {
                int appointment_id = rs.getInt(1);
                String fullName = rs.getString(2);
                int age = rs.getInt(3);
                String gender = rs.getString(4);
                String phone = rs.getString(5);
                String email = rs.getString(6);
                String address = rs.getNString(7);
                String appointmentDate = rs.getString(8);
                String appointmentTime = rs.getString(9);
                String testType = rs.getString(10);
                String note = rs.getString(11);
                int userId = rs.getInt(12);
                
                appointment = new AppointmentModel(appointment_id, fullName, age, gender, phone, email, address, 
                                                 appointmentDate, appointmentTime, testType, note, userId);
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return appointment;
    }
    
    // Get all appointments (for admin view)
    public static List<AppointmentModel> getAllAppointments() {
        List<AppointmentModel> appointments = new ArrayList<>();
        
        try {
            con = DBConnection.getConnection();
            stmt = con.createStatement();
            
            String sql = "SELECT * FROM lab_app";
            rs = stmt.executeQuery(sql);
            
            while(rs.next()) {
                int appointment_id = rs.getInt(1);
                String fullName = rs.getString(2);
                int age = rs.getInt(3);
                String gender = rs.getString(4);
                String phone = rs.getString(5);
                String email = rs.getString(6);
                String address = rs.getString(7);
                String appointmentDate = rs.getString(8);
                String appointmentTime = rs.getString(9);
                String testType = rs.getString(10);
                String note = rs.getString(11);
                int userId = rs.getInt(12);
                
                AppointmentModel appointment = new AppointmentModel(appointment_id, fullName, age, gender, phone, 
                                                                  email, address, appointmentDate, appointmentTime, 
                                                                  testType, note, userId);
                appointments.add(appointment);
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return appointments;
    }
    
    // Update appointment
    public static boolean updateAppointment(int appointment_id, String fullName, int age, String gender, String phone, 
                                          String email, String address, String appointmentDate, String appointmentTime, 
                                          String testType, String note) {
        
        // Check if appointment date is in the past
        LocalDate today = LocalDate.now();
        LocalDate requestedDate = LocalDate.parse(appointmentDate);
        
        if (requestedDate.isBefore(today)) {
            return false; // Cannot update to past dates
        }
        
        try {
            con = DBConnection.getConnection();
            stmt = con.createStatement();
            
            String sql = "UPDATE lab_app SET fullName = '" + fullName + "', age = " + age + 
                         ", gender = '" + gender + "', phone = '" + phone + "', email = '" + email + 
                         "', address = '" + address + "', appointmentDate = '" + appointmentDate + "', appointmentTime = '" + appointmentTime + 
                         "', testType = '" + testType + "', note = '" + note + 
                         "' WHERE appointment_id = " + appointment_id;
            
            int rs = stmt.executeUpdate(sql);
            
            if(rs > 0) {
                isSuccess = true;
            } else {
                isSuccess = false;
            }
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return isSuccess;
    }
    
    // Delete appointment
    public static boolean deleteAppointment(int appointment_id) {
        try {
            con = DBConnection.getConnection();
            stmt = con.createStatement();
            
            String sql = "DELETE FROM lab_app WHERE appointment_id = " + appointment_id;
            int rs = stmt.executeUpdate(sql);
            
            if(rs > 0) {
                isSuccess = true;
            } else {
                isSuccess = false;
            }
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return isSuccess;
    }
    
    // Check if email exists (to verify user can only edit their own appointments)
    public static boolean isUserAppointment(int appointment_id, String email) {
        boolean isUserAppointment = false;
        
        try {
            con = DBConnection.getConnection();
            stmt = con.createStatement();
            
            String sql = "SELECT * FROM lab_app WHERE appointment_id = " + appointment_id + 
                         " AND email = '" + email + "'";
            rs = stmt.executeQuery(sql);
            
            if(rs.next()) {
                isUserAppointment = true;
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return isUserAppointment;
    }
    
    public static boolean isUserAppointment(int appointment_id, int uid) {
        boolean isUserAppointment = false;
        
        try {
            con = DBConnection.getConnection();
            stmt = con.createStatement();
            
            String sql = "SELECT * FROM lab_app WHERE appointment_id = " + appointment_id + 
                         " AND uid = " + uid;
            rs = stmt.executeQuery(sql);
            
            if(rs.next()) {
                isUserAppointment = true;
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return isUserAppointment;
    }

}
