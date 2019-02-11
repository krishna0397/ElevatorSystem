package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.model.LoginBean;

public class LoginDao
{
	JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
		this.template=template;
	}
	
	
		
	public LoginBean getLogin(String username,String password)  {
		String sql = "select username,password from customer where username=? and password=?";
		return template.queryForObject(sql, new Object[] {username,password},new RowMapper<LoginBean>()  {

			public LoginBean mapRow(ResultSet rs, int rows) throws SQLException {

				LoginBean bean = new LoginBean();

				bean.setUsername(rs.getString(1));
				bean.setPassword(rs.getString(2));

				return bean;
			}
		});
	}
	

}
