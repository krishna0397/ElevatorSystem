package com.model;

public class Department {

	private int dept_id;
	private String date;
	private String dept_name;
	private String dept_head;
	private int no_of_employee;
	
	public Department() {
		super();
	}

	public int getDept_id() {
		return dept_id;
	}

	public void setDept_id(int dept_id) {
		this.dept_id = dept_id;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

	public String getDept_head() {
		return dept_head;
	}

	public void setDept_head(String dept_head) {
		this.dept_head = dept_head;
	}

	public int getNo_of_employee() {
		return no_of_employee;
	}

	public void setNo_of_employee(int no_of_employee) {
		this.no_of_employee = no_of_employee;
	}
	
}
	
