package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.model.Emp;

public class EmpDao {
	
	@Autowired
	JdbcTemplate template;

	

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	public int save(Emp p) {

		String query = "insert into employee1(date,employee_name,job_title,date_of_birth,radio,employee_mobileno,employee_emailid,password) values(?,?,?,?,?,?,?,?)";
		return template.update(query,p.getDate(),p.getEmployee_name(), p.getJob_title(), p.getDate_of_birth(),
				p.getRadio(), p.getEmployee_mobileno(), p.getEmployee_emailid(), p.getPassword());
	}

	public List<Emp> getEmployee() {

		return template.query("select * from employee1", new RowMapper<Emp>() {

			public Emp mapRow(ResultSet rs, int rows) throws SQLException {
				// TODO Auto-generated method stub

				Emp e = new Emp();
				
				e.setEmployee_id(rs.getInt(1));
				e.setDate(rs.getString(2));
				e.setEmployee_name(rs.getString(3));
				e.setJob_title(rs.getString(4));
				e.setDate_of_birth(rs.getString(5));
				e.setRadio(rs.getString(6));
				e.setEmployee_mobileno(rs.getString(7));
				e.setEmployee_emailid(rs.getString(8));
				e.setPassword(rs.getString(9));

				return e;
			}
		});
	}

	public int delete(int id) {
		String sql = "delete from employee1 where employee_id=" + id + "";
		return template.update(sql);
	}

	public Emp getEmpById(int id) {
		String sql = "select * from employee1 where employee_id=?";
		return template.queryForObject(sql, new Object[] { id }, new RowMapper<Emp>() {

			public Emp mapRow(ResultSet rs, int rows) throws SQLException {
				// TODO Auto-generated method stub

				Emp e = new Emp();
				
				e.setEmployee_id(rs.getInt(1));
				e.setDate(rs.getString(2));
				e.setEmployee_name(rs.getString(3));
				e.setJob_title(rs.getString(4));
				e.setDate_of_birth(rs.getString(5));
				e.setRadio(rs.getString(6));
				e.setEmployee_mobileno(rs.getString(7));
				e.setEmployee_emailid(rs.getString(8));
				e.setPassword(rs.getString(9));

				return e;
			}
		});
	}

	public int update(Emp e) {
		String sql = "update employee1 set date='"+e.getDate()+"', employee_name='" + e.getEmployee_name() + "',job_title='" + e.getJob_title()
				+ "',date_of_birth='" + e.getDate_of_birth() + "',radio='" + e.getRadio()
				+ "',employee_mobileno='" + e.getEmployee_mobileno() + "', employee_emailid='" + e.getEmployee_emailid()
				+ "', password='" + e.getPassword() + "'where employee_id=" + e.getEmployee_id() + "";
		
		return template.update(sql);

	}
	
	public Emp getEmpByEmail(String email) {
		String sql = "select * from employee1 where employee_emailid=?";
		return template.queryForObject(sql, new Object[] { email }, new RowMapper<Emp>() {

			public Emp mapRow(ResultSet rs, int rows) throws SQLException {

				Emp e = new Emp();
				e.setEmployee_id(rs.getInt(1));
				e.setEmployee_name(rs.getString(2));
				e.setJob_title(rs.getString(3));
				e.setDate_of_birth(rs.getString(4));
				e.setRadio(rs.getString(5));
				e.setEmployee_mobileno(rs.getString(6));
				e.setEmployee_emailid(rs.getString(7));
				System.out.println(e.getEmployee_emailid());

				return e;
			}
		});
	}

	
	public int getCount(){
		String sql = "select count(*) from employee1";
		return template.queryForInt(sql);
       }
}
