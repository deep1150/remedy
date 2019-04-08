package com.dao;

import java.sql.*;
import java.util.ArrayList;

import com.bean.*;
import com.commands.*;
import com.util.DBUtil;

public class DBdao implements ICommands{

	Connection con = null;
	
	public boolean addUserDetails(UserDetails t) throws Exception
	{
		boolean flag=false;
		Connection con=DBUtil.getConnection();
		PreparedStatement ps=con.prepareStatement(q6);
		ps.setString(1,t.getName());
		ps.setString(2,t.getGender());
		ps.setInt(3,t.getAge());
		ps.setString(4,t.getAllergy());
		ps.setString(5,t.getBloodgroup());
		ps.setString(6,t.getTreatment());
		ps.setString(7,t.getEmail());
		ps.setLong(8, t.getContact());
		ps.setString(9,t.getDescription());
			
		PreparedStatement ps1=con.prepareStatement(q8);
		ps1.setString(1, "In Progress");
		if(ps.executeUpdate()>0 && ps1.executeUpdate()>0)
		{
			flag = true;
		}
		ps.close();
		ps1.close();
		con.close();
		return flag;
	}
	
	
	public String validateUser(User user) throws Exception{
		String uname = null;
		con = DBUtil.getConnection();
		PreparedStatement ps = con.prepareStatement(q1);
		ps.setString(1, user.getUname());
		ps.setString(2, user.getPword());
		ResultSet rs = ps.executeQuery();
		if(rs.next()){
			uname = rs.getString(1);
		}
		rs.close();
		ps.close();
		con.close();
		return uname;
	}
	
	public UserDetails getUserDetailList(int id) throws Exception{
		UserDetails ud = null;
		con = DBUtil.getConnection();
		PreparedStatement ps = con.prepareStatement(q2);
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		if(rs.next()){
			String name=rs.getString("name");
			String gender=rs.getString("gender");
			int age= rs.getInt("age");
			String allergy=rs.getString("allergy");
			String bloodgroup=rs.getString("bgroup");
			String treatment=rs.getString("treatment");
			String email=rs.getString("email");
			long contact=rs.getLong("contact");
			String description=rs.getString("description");
			ud = new UserDetails(id, age, contact, name, gender, email, allergy, treatment, bloodgroup, description);
		}
		rs.close();
		ps.close();
		con.close();
		return ud;
	}
	
	public ArrayList<UserDetails> getUserDetails() throws Exception{
		ArrayList<UserDetails> udlist = new ArrayList<UserDetails>();
		UserDetails ud = null;
		con = DBUtil.getConnection();
		PreparedStatement ps = con.prepareStatement(q21);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			int ticketNo = rs.getInt(1);
			String name = rs.getString(2);
			String email = rs.getString(3);
			ud = new UserDetails(ticketNo, name, email);
			udlist.add(ud);
		}
		rs.close();
		ps.close();
		con.close();
		return udlist;
	}
	
	public boolean getTicketStatus(int id)throws Exception{
		boolean flag = false;
		con = DBUtil.getConnection();
		PreparedStatement ps = con.prepareStatement(q3);
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		if(rs.next()){
			flag = true;
		}
		rs.close();
		ps.close();
		con.close();
		return flag;
	}
	
	
	public int getTicketNum() throws Exception{
		int ticketno = 0;
		con = DBUtil.getConnection();
		PreparedStatement ps = con.prepareStatement(q4);
		ResultSet rs = ps.executeQuery();
		if(rs.next()){
			ticketno = rs.getInt(1);
		}
		rs.close();
		ps.close();
		con.close();
		return ticketno;
	}
	
	public ArrayList<Doctor> getDoctorName(String treatment) throws Exception{ 
	{
		ArrayList<Doctor> doc = new ArrayList<Doctor>();
		con = DBUtil.getConnection();
		PreparedStatement ps = con.prepareStatement(q7);
		ps.setString(1, treatment);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			int id = rs.getInt(1);
			String name=rs.getString(2);
			String special = rs.getString(3);
			String docstatus=rs.getString(4);
			Doctor d=new Doctor(id, name, special, docstatus);
			doc.add(d);		
		}
		rs.close();
		ps.close();
		con.close();
		return doc;
		
		}
	
	}
	
	public ArrayList<checkStatus> getUserStatus() throws Exception{  
	
	ArrayList<checkStatus> al=new ArrayList<checkStatus>();
	checkStatus d =null;
	con = DBUtil.getConnection();
	PreparedStatement ps = con.prepareStatement(q9);
	ResultSet rs = ps.executeQuery();
	while(rs.next()){
		int id = rs.getInt(1);
		String name=rs.getString(2);
		String status=rs.getString(3);
		d=new checkStatus(id, name,status);
		al.add(d);		
	}
	rs.close();
	ps.close();
	con.close();
	return al;
	
	}
	
	public Status getStatus(int id) throws Exception{
		Status st = null;
		con = DBUtil.getConnection();
		PreparedStatement ps = con.prepareStatement(q10);
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		if(rs.next()){
			String name=rs.getString(1);
			String status=rs.getString(2);
			String email = rs.getString(3);
			st = new Status(id, status, name, email);
		}
		rs.close();
		ps.close();
		con.close();
		return st;
	}
	
	public int getDocStatus(String treatment) throws Exception{
		int count = 0;
		con = DBUtil.getConnection();
		PreparedStatement ps = con.prepareStatement(q12);
		ps.setString(1, treatment);
		ResultSet rs = ps.executeQuery();
		if(rs.next()){
			count = rs.getInt(1);
		}
		rs.close();
		ps.close();
		con.close();
		return count;
	}
	
	public boolean changePassword(ChangePassword u) throws Exception
	{
		boolean flag = false;
		con = DBUtil.getConnection();
		PreparedStatement ps = con.prepareStatement(q13);
		ps.setString(1, u.getNewpwd());
		ps.setString(2, u.getUname());
		ps.setString(3, u.getPwd());
		
		if(ps.executeUpdate() > 0){
			flag = true;
		}
		System.out.println(flag);
		ps.close();
		con.close();
		return flag;
	}
	
	public boolean setAcknow(Ack ack)throws Exception{
		boolean flag = false;
		con = DBUtil.getConnection();
		PreparedStatement ps = con.prepareStatement(q14);
		ps.setInt(1, ack.getId());
		ps.setString(2, ack.getAcknow());

		if(ps.executeUpdate() > 0){
			flag = true;
		}
		
		ps.close();
		con.close();
		return flag;
	}
	
	public boolean updateStatus(int id)throws Exception{
		boolean flag = false;
		con = DBUtil.getConnection();
		PreparedStatement ps = con.prepareStatement(q15);
		ps.setString(1, "Approved");
		ps.setInt(2, id);

		if(ps.executeUpdate() > 0){
			flag = true;
		}
		
		ps.close();
		con.close();
		return flag;
	}
	
	public Ack getAcknowledge(int id)throws Exception{
		Ack ack = null;
		con = DBUtil.getConnection();
		PreparedStatement ps = con.prepareStatement(q16);
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		if(rs.next()){
			int ackid = rs.getInt(1);
			String acknow = rs.getString(2);
			ack = new Ack(ackid, acknow);
		}
		rs.close();
		ps.close();
		con.close();
		return ack;
	}
	
	public boolean updateDocStatus(int id)throws Exception{
		boolean flag = false;
		con = DBUtil.getConnection();
		PreparedStatement ps = con.prepareStatement(q17);
		ps.setString(1, "Engaged");
		ps.setInt(2, id);

		if(ps.executeUpdate() > 0){
			flag = true;
		}
		
		ps.close();
		con.close();
		return flag;
	}
	
	public boolean getAckId(int id)throws Exception{
		boolean flag = false;
		con = DBUtil.getConnection();
		PreparedStatement ps = con.prepareStatement(q16);
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		if(rs.next()){
			flag = true;
		}
		rs.close();
		ps.close();
		con.close();
		return flag;
	}
	
}
