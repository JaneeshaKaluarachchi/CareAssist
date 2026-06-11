package com.lab;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserDBUtil {
	
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	
	public static List<User> getUser(String username , String password){
		ArrayList<User> user1 = new ArrayList<>();
		
		try {
			con=DBConnection.getConnection();
			stmt=con.createStatement();
			
			String sql = "select * from user where username='"+username+"' and password='"+password+"'";
			rs=stmt.executeQuery(sql);
			
			if(rs.next()) {
				int id = rs.getInt(1);
				String uname = rs.getString(2);
				String email = rs.getString(3);
				String pass = rs.getString(4);
				
				User u = new User(id, uname, email, pass);
				
				user1.add(u);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return user1;
	}
	
	
	
	public static boolean validate(String username , String password) {
		
		try {
			con=DBConnection.getConnection();
			stmt = con.createStatement();
			
			String sql = "select * from user where username='"+username+"' and  password='"+password+"'";
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	
	
	public static boolean insertUser(String username,String email,String password) {
		isSuccess=false;
		
		try {
			con = DBConnection.getConnection();
			stmt=con.createStatement();
			
			String sql = "insert into user values (0,'"+username+"','"+email+"','"+password+"')";
			int rs = stmt.executeUpdate(sql);
			
			if(rs>0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	public static boolean updateUser(String id,String username, String email,String password) {
		isSuccess=false;
		
		try {
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			String sql = "Update user set username='"+username+"', email='"+email+"', password='"+password+"' where uid = '"+id+"'";
			int rs = stmt.executeUpdate(sql);
			
			if(rs>0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	public static List<User> getUserDeatails(String id){
		int convertedID = Integer.parseInt(id);
		
		ArrayList<User> u1 = new ArrayList<>();
		
		try {
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			String sql = "select * from user where uid ='"+convertedID+"'";
			rs= stmt.executeQuery(sql);
			
			while(rs.next()) {
				int uid = rs.getInt(1);
				String username = rs.getString(2);
				String email = rs.getString(3);
				String password = rs.getString(4);
				
				User u = new User(uid, username, email, password);
				
				u1.add(u);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return u1;
	}
	
	
	public static boolean DeleteUser(String id) {
		isSuccess=false;
		int convertedID = Integer.parseInt(id);
		
		try {
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			String sql = "delete from user where uid='"+convertedID+"'";
			int r= stmt.executeUpdate(sql);
			
			if(r > 0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
}