package com.model;

public class Emp {

	private int employee_id;
	private String date;
	private String employee_name;
	private String job_title;
	private String date_of_birth;
	private String radio;
	private String employee_mobileno;
	private String employee_emailid;
	private String password;

	public Emp() {
	}
	
	

	public Emp(int employee_id, String employee_name, String job_title, String date_of_birth, String radio,
			String employee_mobileno, String employee_emailid, String password) {
		super();
		this.employee_id = employee_id;
		this.employee_name = employee_name;
		this.job_title = job_title;
		this.date_of_birth = date_of_birth;
		this.radio = radio;
		this.employee_mobileno = employee_mobileno;
		this.employee_emailid = employee_emailid;
		this.password = password;
	}



	public int getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}



	public String getEmployee_name() {
		return employee_name;
	}

	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}

	public String getJob_title() {
		return job_title;
	}

	public void setJob_title(String job_title) {
		this.job_title = job_title;
	}

	public String getDate_of_birth() {
		return date_of_birth;
	}

	public void setDate_of_birth(String date_of_birth) {
		this.date_of_birth = date_of_birth;
	}

	public String getRadio() {
		return radio;
	}

	public void setRadio(String radio) {
		this.radio = radio;
	}

	public String getEmployee_mobileno() {
		return employee_mobileno;
	}

	public void setEmployee_mobileno(String employee_mobileno) {
		this.employee_mobileno = employee_mobileno;
	}

	public String getEmployee_emailid() {
		return employee_emailid;
	}

	public void setEmployee_emailid(String employee_emailid) {
		this.employee_emailid = employee_emailid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
