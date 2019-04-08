package com.bean;

public class User {

	private String uname, pword;

	public User(String uname, String pword) {
		super();
		this.uname = uname;
		this.pword = pword;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getPword() {
		return pword;
	}

	public void setPword(String pword) {
		this.pword = pword;
	}
	
	
}
