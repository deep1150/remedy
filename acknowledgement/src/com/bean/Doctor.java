package com.bean;

public class Doctor {
	int id;
	String name, special, docstatus;
	
	public Doctor() {
		super();
	}

	public Doctor(int id, String name, String special, String docstatus) {
		super();
		this.id = id;
		this.name = name;
		this.special = special;
		this.docstatus = docstatus;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSpecial() {
		return special;
	}

	public void setSpecial(String special) {
		this.special = special;
	}

	public String getDocstatus() {
		return docstatus;
	}

	public void setDocstatus(String docstatus) {
		this.docstatus = docstatus;
	}

	
	
	
	

}
