package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.model.Product;

public class ProductDao {

	JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	public int save(Product p) {

		String query = "insert into product(date,product_type,product_name,quantity,costprice,amount) values(?,?,?,?,?,?)";
		return template.update(query,p.getDate(),p.getProduct_type(),p.getProduct_name(), p.getQuantity(),p.getCostprice(),p.getAmount());
	}

	public List<Product> getProduct() {

		return template.query("select * from product", new RowMapper<Product>() {

			public Product mapRow(ResultSet rs, int rows) throws SQLException {

				Product p = new Product();

				p.setProduct_id(rs.getInt(1));
				p.setDate(rs.getString(2));
				p.setProduct_type(rs.getString(3));
				p.setProduct_name(rs.getString(4));
				p.setQuantity(rs.getInt(5));
				p.setCostprice(rs.getDouble(6));
				p.setAmount(rs.getDouble(7));
				
				return p;
			}
		});
	}

	public int delete(int id) {
		String sql = "delete from product where product_id=" + id + "";
		return template.update(sql);
	}

	public Product getProductById(int id) {
		String sql = "select * from Product where product_id=?";
		return template.queryForObject(sql, new Object[] { id }, new RowMapper<Product>() {

			public Product mapRow(ResultSet rs, int rows) throws SQLException {

				Product p = new Product();

				p.setProduct_id(rs.getInt(1));
				p.setDate(rs.getString(2));
				p.setProduct_type(rs.getString(3));
				p.setProduct_name(rs.getString(4));
				p.setQuantity(rs.getInt(5));
				p.setCostprice(rs.getDouble(6));
				p.setAmount(rs.getDouble(7));
				
				return p;
			}
		});
	}

	public int update(Product p) {
		String sql = "update product set date='"+p.getDate()+"', product_type='"+p.getProduct_type()+"', product_name='" + p.getProduct_name() + "',quantity='"
				+ p.getQuantity() +"', costprice='"+p.getCostprice()+"',amount='"+ p.getAmount() + "'where product_id=" + p.getProduct_id() + "";
		return template.update(sql);

	}
	
	public int getCount(){
		String sql = "select count(*) from product";
		return template.queryForInt(sql);
       }
	
	public int getCountById(int id) {
		String sql="select quantity from product where product_id="+id+" ";
		return template.queryForInt(sql);
	}
	
	public int updateQuantityCount(int pid,int count)
	{
		String sql="update product set quantity="+count+" where product_id="+pid;
		return template.update(sql);
	}

}
