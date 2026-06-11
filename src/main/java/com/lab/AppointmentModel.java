package com.lab;

public class AppointmentModel {
    private int appointment_id;
    private String fullName;
    private int age;
    private String gender;
    private String phone;
    private String email;
    private String address;
    private String appointmentDate;
    private String appointmentTime;
    private String testType;
    private String note;
    private int uid;
    
    // Constructor with all fields
    public AppointmentModel(int appointment_id, String fullName, int age, String gender, String phone, String email, String address, 
                           String appointmentDate, String appointmentTime, String testType, String note, int uid) {
        this.appointment_id = appointment_id;
        this.fullName = fullName;
        this.age = age;
        this.gender = gender;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.appointmentDate = appointmentDate;
        this.appointmentTime = appointmentTime;
        this.testType = testType;
        this.note = note;
        this.uid = uid;
    }
    
    // Getters and setters
    public int getAppointment_id() {
        return appointment_id;
    }
    
    public void setAppointment_id(int appointment_id) {
        this.appointment_id = appointment_id;
    }
    
    public String getFullName() {
        return fullName;
    }
    
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }
    
    public int getAge() {
        return age;
    }
    
    public void setAge(int age) {
        this.age = age;
    }
    
    public String getGender() {
        return gender;
    }
    
    public void setGender(String gender) {
        this.gender = gender;
    }
    
    public String getPhone() {
        return phone;
    }
    
    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getAddress() {
        return address;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }
    
    public String getAppointmentDate() {
        return appointmentDate;
    }
    
    public void setAppointmentDate(String appointmentDate) {
        this.appointmentDate = appointmentDate;
    }
    
    public String getAppointmentTime() {
        return appointmentTime;
    }
    
    public void setAppointmentTime(String appointmentTime) {
        this.appointmentTime = appointmentTime;
    }
    
    public String getTestType() {
        return testType;
    }
    
    public void setTestType(String testType) {
        this.testType = testType;
    }
    
    public String getNote() {
        return note;
    }
    
    public void setNote(String note) {
        this.note = note;
    }
    
    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }
}
