package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


import com.bean.User;

public class UserDao {

	public static Connection getConnection() {
		Connection con = null;
		try {
			 // driver registration
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", ""); // open connection
		} catch (Exception e) {
			System.out.println(e);
		}
		return con;
	}
	
	
	public static List<User> getAllRecords() {
		List<User> list = new ArrayList<User>();
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from register");
			
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				User u = new User();
				u.setId(rs.getInt("id"));
				u.setName(rs.getString("name"));
				u.setNumber(rs.getInt("number"));
				u.setEmail(rs.getString("email"));
				u.setSex(rs.getString("sex"));
				u.setType(rs.getString("type"));
				list.add(u);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}
	
	public static int save(User u) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con
					.prepareStatement("insert into register(name,number,email,sex,type) values(?,?,?,?,?)");
			ps.setString(1, u.getName());
			ps.setInt(2, u.getNumber());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getSex());
			ps.setString(5, u.getType());
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int update(User u) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con
					.prepareStatement("update register set name=?,number=?,email=?,type=? where id=?");
			ps.setString(1, u.getName());
			ps.setInt(2, u.getNumber());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getType());
			ps.setInt(5, u.getId());
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int delete(User u) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("delete from register where id=?");
			ps.setInt(1, u.getId());
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}

		return status;
	}



public static User getRecordById(int id) {
	User u = null;
	try {
		Connection con = getConnection();
		PreparedStatement ps = 
		con.prepareStatement("select * from register where id=?");
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			u = new User();
			u.setId(rs.getInt("id"));
			u.setName(rs.getString("name"));
			u.setNumber(rs.getInt("number"));
			u.setEmail(rs.getString("email"));
			u.setSex(rs.getString("sex"));
			u.setType(rs.getString("type"));
		}
	} catch (Exception e) {
		System.out.println(e);
	}
	return u;
}

}
