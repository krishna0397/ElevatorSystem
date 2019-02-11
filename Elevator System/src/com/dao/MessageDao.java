package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.model.MessageBean;

public class MessageDao 
{
	@Autowired
	JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template)
	{
		this.template=template;
	}
	 public int saveMessage(MessageBean msg)
	 {
		 String query="insert into message (date,fname,lname,email,subject,msg)values(?,?,?,?,?,?)";
		 return template.update(query,msg.getDate(),msg.getFname(),msg.getLname(),msg.getEmail(),msg.getSubject(),msg.getMsg());
	 }
	 
	 public List<MessageBean> getMessage() {

			return template.query("select * from message", new RowMapper<MessageBean>() {

				public MessageBean mapRow(ResultSet rs, int rows) throws SQLException {

					MessageBean msg = new MessageBean();
					
					msg.setSrno(rs.getInt(1));
					msg.setDate(rs.getString(2));
					msg.setFname(rs.getString(3));
					msg.setLname(rs.getString(4));
					msg.setEmail(rs.getString(5));
					msg.setSubject(rs.getString(6));
					msg.setMsg(rs.getString(7));
					
					return msg;
				}
			});
		}
	 
	 public int delete(String fname) {
		
			String sql = "delete from message where fname=" +"'"+ fname+"'"+ "";
			System.out.println(fname);
			return template.update(sql);
		}


}
