package com.commands;

import com.bean.Ack;
import com.bean.ChangePassword;
import com.bean.Doctor;
import com.bean.Status;
import com.bean.User;
import com.bean.UserDetails;
import com.bean.checkStatus;
import com.dao.ArrayList;
import com.dao.Connection;
import com.dao.Exception;
import com.dao.PreparedStatement;
import com.dao.ResultSet;
import com.dao.String;
import com.util.DBUtil;
import java.util.*;
import java.sql.*;


public interface ICommands {

	String q1 = "select uname from login where uname=? and pwd=?";
	
	String q2 = "select * from userdetail where ticketno=?";	//rightDiv
	String q21 = "select ticketno, name, email from userdetail";			//leftDiv
	String q3 = "select ticketno from userdetail where ticketno=?";
	String q4 = "select max(ticketno + 1) from userdetail";
	String q5 = "select * from userdetail";
	String q6 = "insert into userdetail(name, gender, age, allergy, bgroup, treatment, email, contact, description) values(?,?,?,?,?,?,?,?,?)";
	String q7 = "select * from doctor where special=? and docstatus='Idle'";
	String q8 = "insert into ticket_status(status) values(?)";
	String q9 = "select userdetail.ticketno, userdetail.name, ticket_status.status from userdetail inner join ticket_status on userdetail.ticketno=ticket_status.id order by userdetail.ticketno desc";
	String q10 = "select userdetail.name, ticket_status.status, userdetail.email from userdetail inner join ticket_status on userdetail.ticketno=ticket_status.id where ticketno=?";
	String q11 = "update ticket_status set status=? where id=?";
	String q12 = "select count(docstatus) from doctor where special=? and docstatus='Idle'";
	String q13 = "update login set pwd = ? where uname = ? and pwd = ?";
	String q14 = "insert into ack(id, acknow) values(?,?)";
	String q15 = "update ticket_status set status=? where id=?";
	String q16 = "select * from ack where id=?";
	String q17 = "update doctor set docstatus=? where id=?";
	
	public boolean addUserDetails(UserDetails t) throws Exception
	{
		
	}
	
	
	public String validateUser(User user) throws Exception{
		
	}
	
	public UserDetails getUserDetailList(int id) throws Exception{
	
		
	}
	
	public ArrayList<UserDetails> getUserDetails() throws Exception{
	
	}
	
	public boolean getTicketStatus(int id)throws Exception{
		
	}
	
	
	public int getTicketNum() throws Exception{
		
	}
	
	public ArrayList<Doctor> getDoctorName(String treatment) throws Exception{ 
	{
		
	
	}
	
	public ArrayList<checkStatus> getUserStatus() throws Exception{  
	
	
	
	}
	
	public Status getStatus(int id) throws Exception{
		
	}
	
	public int getDocStatus(String treatment) throws Exception{
	
	}
	
	public boolean changePassword(ChangePassword u) throws Exception
	{
	
	}
	
	public boolean setAcknow(Ack ack)throws Exception{
		
	}
	
	public boolean updateStatus(int id)throws Exception{
		
	}
	
	public Ack getAcknowledge(int id)throws Exception{
		
	}
	
	public boolean updateDocStatus(int id)throws Exception{
		
	}
	
	public boolean getAckId(int id)throws Exception{
		
	}
}
