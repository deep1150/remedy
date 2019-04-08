package com.bean;

public class UserDetails {
	
	private int ticketno, age;
	private long contact;
	private String name, gender, email, allergy, treatment, bloodgroup, description;
	
	public UserDetails(int ticketno, String name, String email) {
		super();
		this.ticketno = ticketno;
		this.name = name;
		this.email = email;
	}

	public UserDetails(int ticketno, int age, long contact, String name, String gender, String email, String allergy,
			String treatment, String bloodgroup, String description) {
		super();
		this.ticketno = ticketno;
		this.age = age;
		this.contact = contact;
		this.name = name;
		this.gender = gender;
		this.email = email;
		this.allergy = allergy;
		this.treatment = treatment;
		this.bloodgroup = bloodgroup;
		this.description = description;
	}

	public UserDetails(int age, long contact, String name, String gender, String email, String allergy, String treatment,
			String bloodgroup, String description) {
		super();
		this.age = age;
		this.contact = contact;
		this.name = name;
		this.gender = gender;
		this.email = email;
		this.allergy = allergy;
		this.treatment = treatment;
		this.bloodgroup = bloodgroup;
		this.description = description;
	}

	public int getTicketno() {
		return ticketno;
	}

	public void setTicketno(int ticketno) {
		this.ticketno = ticketno;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public long getContact() {
		return contact;
	}

	public void setContact(long contact) {
		this.contact = contact;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAllergy() {
		return allergy;
	}

	public void setAllergy(String allergy) {
		this.allergy = allergy;
	}

	public String getTreatment() {
		return treatment;
	}

	public void setTreatment(String treatment) {
		this.treatment = treatment;
	}

	public String getBloodgroup() {
		return bloodgroup;
	}

	public void setBloodgroup(String bloodgroup) {
		this.bloodgroup = bloodgroup;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "UserDetails [ticketno=" + ticketno + ", age=" + age + ", contact=" + contact + ", name=" + name
				+ ", gender=" + gender + ", email=" + email + ", allergy=" + allergy + ", treatment=" + treatment
				+ ", bloodgroup=" + bloodgroup + ", description=" + description + "]";
	}
	
	
}
