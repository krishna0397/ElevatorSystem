package com.model;

public class CreditCardPayment {
	
	private int srno;
	private int order_id;
	private String creditcardno;
	private String expdate;
	private String expyear;
	private String creditcvv;
	private String creditname;
	
	public CreditCardPayment() {
		super();
	}

	public int getSrno() {
		return srno;
	}

	public void setSrno(int srno) {
		this.srno = srno;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public String getCreditname() {
		return creditname;
	}

	public void setCreditname(String creditname) {
		this.creditname = creditname;
	}

	public String getCreditcardno() {
		return creditcardno;
	}

	public void setCreditcardno(String creditcardno) {
		this.creditcardno = creditcardno;
	}

	public String getCreditcvv() {
		return creditcvv;
	}

	public void setCreditcvv(String creditcvv) {
		this.creditcvv = creditcvv;
	}

	public String getExpdate() {
		return expdate;
	}

	public void setExpdate(String expdate) {
		this.expdate = expdate;
	}

	public String getExpyear() {
		return expyear;
	}

	public void setExpyear(String expyear) {
		this.expyear = expyear;
	}

	
	

}
