package com.model;

public class Product 
{
	private int product_id;
	private String date;
	private String product_type;
	private String product_name;
	private int quantity;
	private double costprice;
	private double amount;
	
	public Product() {
		super();
	}

	public Product(int product_id, String date, String product_type, String product_name, int quantity, double amount) {
		super();
		this.product_id = product_id;
		this.date = date;
		this.product_type = product_type;
		this.product_name = product_name;
		this.quantity = quantity;
		this.amount = amount;
	}


	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getProduct_type() {
		return product_type;
	}

	public void setProduct_type(String product_type) {
		this.product_type = product_type;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public double getCostprice() {
		return costprice;
	}
	
	public void setCostprice(double costprice) {
		this.costprice = costprice;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}
	
}
