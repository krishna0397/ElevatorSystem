package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.model.ChequePayment;
import com.model.CreditCardPayment;
import com.model.DebitCardPayment;
import com.model.Product;
import com.model.Purchase;

public class PurchaseDao 
{
		@Autowired
		JdbcTemplate template;

		public void setTemplate(JdbcTemplate template) {
			this.template = template;
		}

		public int save(Purchase p) {

			String query = "insert into purchase(product_id,product_name,customer_name,customer_email,customer_address,customer_mobileno,bill_date,payment_method,totalcostprice,totalsellingprice,profit) values(?,?,?,?,?,?,?,?,?,?,?)";
			return template.update(query,p.getProduct_id(),p.getProduct_name(),p.getCustomer_name(),p.getCustomer_email(),p.getCustomer_address(),p.getCustomer_mobileno(),p.getBill_date(),p.getPayment_method(),p.getTotalcostprice(),p.getTotalsellingprice(),p.getProfit()); 
		}
		
		public int update(double totalcostprice,double totalsellingprice,double profit,int order_id) {

			String query = "update purchase set totalcostprice='"+totalcostprice+"',totalsellingprice='"+totalsellingprice+"',profit='"+profit+"'where order_id="+order_id;
			return template.update(query); 
		}
		
		public int saveCredit(CreditCardPayment cc) {

			String query = "insert into credit_card(order_id,creditcardno,expdate,creditcvv,creditname) values(?,?,?,?,?)";
			return template.update(query,cc.getOrder_id(),cc.getCreditcardno(),cc.getExpdate(),cc.getCreditcvv(),cc.getCreditname()); 
		}
		
		public int saveDebit(DebitCardPayment dc) {

			String query = "insert into debit_card(order_id,debitcardno,expdate,debitcvv,debitname) values(?,?,?,?,?)";
			return template.update(query,dc.getOrder_id(),dc.getDebitcardno(),dc.getExpdate(),dc.getDebitcvv(),dc.getDebitname()); 
		}
		
		public int saveCheque(ChequePayment ch) {

			String query = "insert into cheque(order_id,nameoncheque,accno,chequeno,date) values(?,?,?,?,?)";
			return template.update(query,ch.getOrder_id(),ch.getNameoncheque(),ch.getAccno(),ch.getChequeno(),ch.getDate()); 
		}
		

		public Product getProduct(int product_id) {

			return template.queryForObject("select * from product where product_id=?",new Object[] {product_id}, new RowMapper<Product>() {

				public Product mapRow(ResultSet rs, int rows) throws SQLException {

					Product p = new Product();

					p.setProduct_id(rs.getInt(1));
					p.setProduct_name(rs.getString(2));
					p.setQuantity(rs.getInt(3));
					p.setAmount(rs.getDouble(4));
					
					return p;
				}
			});
		}
		
		public List<Purchase> getOrders() {

			return template.query("select * from purchase", new RowMapper<Purchase>() {

				public Purchase mapRow(ResultSet rs, int rows) throws SQLException {
					// TODO Auto-generated method stub

					Purchase pr = new Purchase();
					pr.setOrder_id(rs.getInt(1));
					pr.setProduct_id(rs.getString(2));
					pr.setProduct_name(rs.getString(3));
					pr.setCustomer_name(rs.getString(4));
					pr.setCustomer_email(rs.getString(5));
					pr.setCustomer_address(rs.getString(6));
					pr.setCustomer_mobileno(rs.getString(7));
					pr.setTotalcostprice(rs.getDouble(10));
					pr.setTotalsellingprice(rs.getDouble(11));
					pr.setProfit(rs.getDouble(12));
					

					return pr;
				}
			});
		}
		

		public int getCount(){
			String sql = "select count(*) from purchase";
			return template.queryForInt(sql);
	       }

		
		public List<Purchase> selectDateWise(String date1,String date2)
		{
			String sql="select * from purchase where bill_date between"+"'"+date1+"'"+"and"+"'"+date2+"'";
			return template.query(sql, new RowMapper<Purchase>() {

				public Purchase mapRow(ResultSet rs, int rows) throws SQLException {
					// TODO Auto-generated method stub

					Purchase pr = new Purchase();
					pr.setOrder_id(rs.getInt(1));
					pr.setProduct_id(rs.getString(2));
					pr.setProduct_name(rs.getString(3));
					pr.setCustomer_name(rs.getString(4));
					pr.setCustomer_email(rs.getString(5));
					pr.setCustomer_address(rs.getString(6));
					pr.setCustomer_mobileno(rs.getString(7));
					pr.setTotalcostprice(rs.getDouble(10));
					pr.setTotalsellingprice(rs.getDouble(11));
					pr.setProfit(rs.getDouble(12));
					System.out.println();

					return pr;
				}
			});

			
			
		}

		
}
