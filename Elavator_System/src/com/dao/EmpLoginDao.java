package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.model.Emp;
import com.model.EmpLoginBean;

public class EmpLoginDao
{
	JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
		this.template=template;
	}
	
	
		
	public EmpLoginBean getLogin(String username,String password)  {
		String sql = "select employee_emailid,password from employee1 where employee_emailid=? and password=?";
		return template.queryForObject(sql, new Object[] {username,password},new RowMapper<EmpLoginBean>()  {

			public EmpLoginBean mapRow(ResultSet rs, int rows) throws SQLException {

				EmpLoginBean bean = new EmpLoginBean();

				bean.setUsername(rs.getString(1));
				bean.setPassword(rs.getString(2));

				return bean;
			}
		});
	}
	
}
