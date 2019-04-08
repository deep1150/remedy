package com.bean;

public class ChangePassword {
	private String uname,pwd,newpwd;
	private int empid;
	
	public ChangePassword() {
		super();
	}

	public ChangePassword(String uname, String pwd, String newpwd, int empid) {
		super();
		this.uname = uname;
		this.pwd = pwd;
		this.newpwd = newpwd;
	}

	
	public ChangePassword(String uname, String pwd, String newpwd) {
		super();
		this.uname = uname;
		this.pwd = pwd;
		this.newpwd = newpwd;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getNewpwd() {
		return newpwd;
	}

	public void setNewpwd(String newpwd) {
		this.newpwd = newpwd;
	}

	public int getEmpid() {
		return empid;
	}

	public void setEmpid(int empid) {
		this.empid = empid;
	}

	@Override
	public String toString() {
		return "ChangePassword [uname=" + uname + ", pwd=" + pwd + ", newpwd=" + newpwd + "]";
	}
	

}
