package com.model;

public class DebitCardPayment {
	
	private int order_id;
	private String debitcardno;
	private String expdate;
	private String expyear;
	private String debitcvv;
	private String debitname;
	
	
	
	public DebitCardPayment() {
		super();
	}
	
	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}


	public String getDebitname() {
		return debitname;
	}

	public void setDebitname(String debitname) {
		this.debitname = debitname;
	}

	public String getDebitcardno() {
		return debitcardno;
	}

	public void setDebitcardno(String debitcardno) {
		this.debitcardno = debitcardno;
	}

	public String getDebitcvv() {
		return debitcvv;
	}

	public void setDebitcvv(String debitcvv) {
		this.debitcvv = debitcvv;
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
