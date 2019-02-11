package com.model;

public class Purchase 
{	
	private int order_id;
	private String product_id;
	private String product_name;
	private String customer_name;
	private String customer_email;
	private String customer_address;
	private String customer_mobileno;
	private String bill_date;
	private String payment_method;
	private double totalcostprice;
	private double totalsellingprice;
	private double profit;
	
	public Purchase()
	{
		
	}

	public int getOrder_id() {
		return order_id;
	}



	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}



	public String getProduct_id() {
		return product_id;
	}



	public void setProduct_id(String i) {
		this.product_id = i;
	}



	public String getProduct_name() {
		return product_name;
	}



	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}



	public String getCustomer_name() {
		return customer_name;
	}



	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}



	public String getCustomer_email() {
		return customer_email;
	}



	public void setCustomer_email(String customer_email) {
		this.customer_email = customer_email;
	}



	public String getCustomer_address() {
		return customer_address;
	}



	public void setCustomer_address(String customer_address) {
		this.customer_address = customer_address;
	}



	public String getCustomer_mobileno() {
		return customer_mobileno;
	}



	public void setCustomer_mobileno(String customer_mobileno) {
		this.customer_mobileno = customer_mobileno;
	}



	public String getBill_date() {
		return bill_date;
	}



	public void setBill_date(String bill_date) {
		this.bill_date = bill_date;
	}



	public String getPayment_method() {
		return payment_method;
	}



	public void setPayment_method(String payment_method) {
		this.payment_method = payment_method;
	}
	
	
	public double getTotalcostprice() {
		return totalcostprice;
	}
	
	public void setTotalcostprice(double totalcostprice) {
		this.totalcostprice = totalcostprice;
	}
	
	public double getTotalsellingprice() {
		return totalsellingprice;
	}
	
	public void setTotalsellingprice(double totalsellingprice) {
		this.totalsellingprice = totalsellingprice;
	}
	
	public double getProfit() {
		return profit;
	}
	
	public void setProfit(double profit) {
		this.profit = profit;
	}

}