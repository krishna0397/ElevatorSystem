package com.dao;

import java.io.InputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

public class FileUploadDao {
	
	@Autowired
	JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	public int save(InputStream file) {

		String query = "insert into images1 values(?)";
		return template.update(query,file);
	}

}
