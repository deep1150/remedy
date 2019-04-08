package com.service;

import java.util.ArrayList;


import com.bean.*;
import com.dao.DBdao;


public class TicketCreateservice {
	
	DBdao td = new DBdao();
	public TicketCreateservice(){
		
	}
	
	public boolean addUserDetails(UserDetails t) throws Exception
	{
		boolean b= td.addUserDetails(t);
		return b;
	}
	
	public String validateUser(User user) throws Exception{
		String uname = td.validateUser(user);
		return uname;
	}
	
	public UserDetails getUserDetailList(int id) throws Exception{
		UserDetails userDetailList = td.getUserDetailList(id);
		return userDetailList;
	}
	
	public ArrayList<UserDetails> getUserDetails() throws Exception{
		ArrayList<UserDetails> ud = td.getUserDetails();
		return ud;
	}

	
	public int getTicketNum() throws Exception{
		int ticketno = td.getTicketNum();
		return ticketno;
	}
	public ArrayList<Doctor> getDoctorName(String treatment) throws Exception{ 
		ArrayList<Doctor> ud = td.getDoctorName(treatment);
		return ud;
	}
	
	public ArrayList<checkStatus> getUserStatus() throws Exception{  
		ArrayList<checkStatus> ud = td.getUserStatus();
		return ud;
	}
	
	public Status getStatus(int id) throws Exception{
		Status st = td.getStatus(id);
		return st;
	}
	
	public int getDocStatus(String treatment) throws Exception{
		int count = td.getDocStatus(treatment);
		return count;
	}
	
	public boolean changePassword(ChangePassword u) throws Exception
	{
		boolean flag= td.changePassword(u);
		return flag;
	}
	
	public boolean setAcknow(Ack ack)throws Exception{
		boolean flag = td.setAcknow(ack);
		return flag;
	}
	
	public boolean updateStatus(int id)throws Exception{
		boolean flag = td.updateStatus(id);
		return flag;
	}

	public Ack getAcknowledge(int id)throws Exception{
		Ack ack = td.getAcknowledge(id);
		return ack;
	}
	
	public boolean updateDocStatus(int id)throws Exception{
		boolean flag = td.updateDocStatus(id);
		return flag;
	}
	
	public boolean getAckId(int id)throws Exception{
		boolean flag = td.getAckId(id);
		return flag;
	}
	
	public boolean getTicketStatus(int id)throws Exception{
		boolean flag = td.getTicketStatus(id);
		return flag;
	}
	
}
