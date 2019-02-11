package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.model.Customer;

public class CustomerDao {

	JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template){
		this.template=template;
	}
	
	public int save(Customer c){
	

		String query="insert into customer(customer_name,customer_email,customer_address,customer_mobileno,date) values(?,?,?,?,?)";
		return template.update(query,c.getCustomer_name(),c.getCustomer_email(),c.getCustomer_address(),c.getCustomer_mobileno(),c.getDate());
	}
	
	public List<Customer> getCustomer(){
		
	return template.query("select * from customer",new RowMapper<Customer>(){

		public Customer mapRow(ResultSet rs, int rows) throws SQLException {
			// TODO Auto-generated method stub
		
			Customer c=new Customer();
			
			c.setCustomer_id(rs.getInt(1));
			c.setCustomer_name(rs.getString(2));
			c.setCustomer_email(rs.getString(3));
			c.setCustomer_address(rs.getString(4));
			c.setCustomer_mobileno(rs.getString(5));
			c.setDate(rs.getString(6));
			
			return c;
			}
		});
	}
	
	public int delete(int id){
		String sql="delete from customer where customer_id="+id+"";
		return template.update(sql);
	}

	public Customer getCustomerById(int id){  
	    String sql="select * from customer where customer_id=?";  
	    return template.queryForObject(sql, new Object[]{id},new RowMapper<Customer>(){

			public Customer mapRow(ResultSet rs, int rows) throws SQLException {
				// TODO Auto-generated method stub
			
				Customer c=new Customer();
				
				c.setCustomer_id(rs.getInt(1));
				c.setCustomer_name(rs.getString(2));
				c.setCustomer_email(rs.getString(3));
				c.setCustomer_address(rs.getString(4));
				c.setCustomer_mobileno(rs.getString(5));
				c.setDate(rs.getString(6));
							
				return c;
			}
		});
	}  
	public Customer getCustomerByName(String name){  
	    String sql="select * from customer where username=?";  
	    return template.queryForObject(sql, new Object[]{name},new RowMapper<Customer>(){

			public Customer mapRow(ResultSet rs, int rows) throws SQLException {
				// TODO Auto-generated method stub
			
				Customer c=new Customer();
				
				c.setCustomer_id(rs.getInt(1));
				c.setCustomer_name(rs.getString(2));
				c.setCustomer_email(rs.getString(3));
				c.setCustomer_address(rs.getString(4));
				c.setCustomer_mobileno(rs.getString(5));
				c.setDate(rs.getString(6));
							
				return c;
			}
		});
	}  
	
	
	public int update(Customer c){
		
	   String sql="update customer set customer_name='"+c.getCustomer_name()+"',customer_email='"+c.getCustomer_email()+"',customer_address='"+c.getCustomer_address()+"',customer_mobileno='"+c.getCustomer_mobileno()+"',date='"+c.getDate()+"' where customer_id="+c.getCustomer_id();
		return template.update(sql);
	
	}
	
	
	public int getCount(){
		String sql = "select count(*) from customer";
		return template.queryForInt(sql);
       }

	
	
	
	
}
