package com.model;

public class EmpLoginBean
{
	private String username;
	private String password;
	
	public EmpLoginBean()
	{
		
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public boolean login(String username,String password)
	{
		return true;
	}
}
