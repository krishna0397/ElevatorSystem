package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.model.Emp;
import com.model.Order;
import com.model.Product;

public class OrderDao 
{
		@Autowired
		JdbcTemplate template;

		public void setTemplate(JdbcTemplate template) {
			this.template = template;
		}

		public int save(Order o) {

			String query = "insert into orders(customer_id,product_id,order_date,mobileno,status) values(?,?,?,?,?)";
			return template.update(query,o.getCustomer_id(),o.getProduct_id(),o.getOrder_date(),o.getMobileno(),o.getStatus()); 
		}

		public List<Emp> getEmployee() {

			return template.query("select * from employee1", new RowMapper<Emp>() {

				public Emp mapRow(ResultSet rs, int rows) throws SQLException {
					// TODO Auto-generated method stub

					Emp e = new Emp();
					e.setEmployee_id(rs.getInt(1));
					e.setEmployee_name(rs.getString(2));
					e.setJob_title(rs.getString(3));
					e.setDate_of_birth(rs.getString(4));
					e.setRadio(rs.getString(5));
					e.setEmployee_mobileno(rs.getString(6));
					e.setEmployee_emailid(rs.getString(7));
					e.setPassword(rs.getString(8));

					return e;
				}
			});
		}

		public int delete(int id) {
			String sql = "delete from orders where order_id=" + id + "";
			return template.update(sql);
		}

		public List<Order> getOrdersById(int id) {
			String sql = "select * from orders where customer_id=?";
			return template.query(sql, new Object[] { id }, new RowMapper<Order>() {

				public Order mapRow(ResultSet rs, int rows) throws SQLException {
					// TODO Auto-generated method stub

					Order o = new Order();
					o.setOrder_id(rs.getInt(1));
					o.setCustomer_id(rs.getInt(2));
					o.setProduct_id(rs.getInt(3));
					o.setOrder_date(rs.getString(4));
					o.setMobileno(rs.getString(5));
					o.setStatus(rs.getString(6));

					return o;
				}
			});
		}

		public int getCountById(int id) {
			String sql = "select count(*) from orders where customer_id=?";
			return template.queryForObject(sql, new Object[] { id },Integer.class);
	}
		
		public List<Order> getOrders() {
			String sql = "select * from orders";
			return template.query(sql , new RowMapper<Order>() {

				public Order mapRow(ResultSet rs, int rows) throws SQLException {

					Order o = new Order();
					o.setOrder_id(rs.getInt(1));
					o.setCustomer_id(rs.getInt(2));
					o.setProduct_id(rs.getInt(3));
					o.setOrder_date(rs.getString(4));
					o.setMobileno(rs.getString(5));
					o.setStatus(rs.getString(6));

					return o;
				}
			});
		}

		public int approved(int id)
		{
			String sql="update orders set status='Approved' where order_id=?";
			return template.update(sql,new Object[] {id});
		}
		
}
