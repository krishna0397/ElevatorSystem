package com.model;

public class ChequePayment {
	
	private int order_id;
	private String nameoncheque;
	private String accno;
	private String chequeno;
	private String date;
	
	public ChequePayment() {
		super();
	}
	
	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}


	public String getNameoncheque() {
		return nameoncheque;
	}

	public void setNameoncheque(String nameoncheque) {
		this.nameoncheque = nameoncheque;
	}

	public String getAccno() {
		return accno;
	}

	public void setAccno(String accno) {
		this.accno = accno;
	}

	public String getChequeno() {
		return chequeno;
	}

	public void setChequeno(String chequeno) {
		this.chequeno = chequeno;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	

}
