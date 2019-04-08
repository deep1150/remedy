package com.bean;

public class Ack {

	private int id;
	private String acknow;
	
	public Ack(){
		
	}
	
	public Ack(int id, String acknow) {
		super();
		this.id = id;
		this.acknow = acknow;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAcknow() {
		return acknow;
	}
	public void setAcknow(String acknow) {
		this.acknow = acknow;
	}
	
	
}
