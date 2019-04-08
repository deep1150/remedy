package com.bean;

public class Status {

	private int id;
	private String details, status, name, email;
	
	public Status(){
		
	}

	public Status(int id, String details, String status, String name, String email) {
		super();
		this.id = id;
		this.details = details;
		this.status = status;
		this.name = name;
		this.email = email;
	}

	public Status(int id, String status, String name, String email) {
		super();
		this.id = id;
		this.status = status;
		this.name = name;
		this.email = email;
	}

	public Status(int id, String status) {
		super();
		this.id = id;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
}
