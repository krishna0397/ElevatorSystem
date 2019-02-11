package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.model.Department;

public class DepartmentDao {

	JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	public int save(Department d) {

		String query = "insert into department(date,dept_name,dept_head,no_of_employee) values(?,?,?,?)";
		return template.update(query,d.getDate(),d.getDept_name(), d.getDept_head(), d.getNo_of_employee());
	}

	public List<Department> getDepartment() {

		return template.query("select * from department", new RowMapper<Department>() {

			public Department mapRow(ResultSet rs, int rows) throws SQLException {
				// TODO Auto-generated method stub

				Department d = new Department();

				d.setDept_id(rs.getInt(1));
				d.setDate(rs.getString(2));
				d.setDept_name(rs.getString(3));
				d.setDept_head(rs.getString(4));
				d.setNo_of_employee(rs.getInt(5));

				return d;
			}
		});
	}

	public int delete(int id) {
		String sql = "delete from department where dept_id=" + id + "";
		return template.update(sql);
	}

	public Department getDeptById(int id) {
		String sql = "select * from department where dept_id=?";
		return template.queryForObject(sql, new Object[] { id }, new RowMapper<Department>() {

			public Department mapRow(ResultSet rs, int rows) throws SQLException {
				// TODO Auto-generated method stub

				Department d = new Department();

				d.setDept_id(rs.getInt(1));
				d.setDate(rs.getString(2));
				d.setDept_name(rs.getString(3));
				d.setDept_head(rs.getString(4));
				d.setNo_of_employee(rs.getInt(5));

				return d;
			}
		});
	}

	public int update(Department d) {
		String sql = "update department set date='"+d.getDate()+"',dept_name='" + d.getDept_name() + "',dept_head='" + d.getDept_head()
				+ "',no_of_employee='" + d.getNo_of_employee() + "'where dept_id=" + d.getDept_id() + "";

		return template.update(sql);

	}
	
	public int getCount(){
		String sql = "select count(*) from department";
		return template.queryForInt(sql);
       }

}
