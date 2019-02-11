package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.model.Gst_Discount;
import com.model.Product;

public class Gst_DiscountDao
{
	JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	public int save(Gst_Discount gd) {

		String query = "insert into gst_discount(gst,discount) values(?,?)";
		return template.update(query,gd.getGst(),gd.getDiscount());
	}
	
	
	public int update(Gst_Discount gd) {
		String sql = "update gst_discount set gst="+gd.getGst()+", discount="+gd.getDiscount()+ " where id=1";
		return template.update(sql);

	}
	
	public List<Gst_Discount> getGstDiscount() {

		return template.query("select * from gst_discount", new RowMapper<Gst_Discount>() {

			public Gst_Discount mapRow(ResultSet rs, int rows) throws SQLException {

				Gst_Discount gd = new Gst_Discount();

				gd.setGst(rs.getString(2));
				gd.setDiscount(rs.getString(3));
				return gd;
			}
		});
	}
}
