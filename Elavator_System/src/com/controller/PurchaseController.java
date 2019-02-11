package com.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dao.CustomerDao;
import com.dao.OrderDao;
import com.dao.ProductDao;
import com.dao.PurchaseDao;
import com.model.ChequePayment;
import com.model.CreditCardPayment;
import com.model.Customer;
import com.model.DebitCardPayment;
import com.model.Item;
import com.model.Product;
import com.model.ProductModel;
import com.model.Purchase;
@Controller
public class PurchaseController 
{  
	@Autowired
	PurchaseDao prdao;
	
	@Autowired
	ProductDao pdao;
	
	@Autowired
	OrderDao odao;
	
	@Autowired
	CustomerDao cdao;
	
	@RequestMapping("/cart")
	public String cart(Model model,HttpSession session)
	{
		String i=(String)session.getAttribute("username");
		if(i!=null) { 
		return "cart";
		}
		else {
			  String msg="Not Authorized Access,Please login";
			  model.addAttribute("msg",msg);
			  return "error";
			}
	}
	
	
	@RequestMapping("/returnadminhome")
	public String admonHome(Model model,HttpSession session)
	{
		String i=(String)session.getAttribute("username");
		if(i!=null) { 
		return "adminhome";
		}
		else {
			  String msg="Not Authorized Access,Please login";
			  model.addAttribute("msg",msg);
			  return "error";
			}
	}
	
	
	
	@RequestMapping(value="/pay", method=RequestMethod.POST)
	public String payBill(@ModelAttribute("purchase") Purchase p,HttpSession session,Model model)
	{
		String i=(String)session.getAttribute("username");
		if(i!=null) {       
			
			@SuppressWarnings("unchecked")
			List<Item> cart = (List<Item>) session.getAttribute("cart");
			List<Product> productslist=new ArrayList<Product>();
			List<Integer> productidlist=new ArrayList<Integer>();
			List<String> productnamelist=new ArrayList<String>();
			for(int l=0;l<cart.size();l++) 
			{
		           int pid =cart.get(l).getProduct().getProduct_id();
		           int quantity=cart.get(l).getQuantity();
		           String name=cart.get(l).getProduct().getProduct_name();
		           int countfromdb=pdao.getCountById(pid);
		           int newCount=countfromdb-quantity;
		           pdao.updateQuantityCount(pid,newCount);
		           productidlist.add(pid);
		           productnamelist.add(name);
		           
			}
			
	         	String prid ="";
	           for(int id=0;id<productidlist.size();id++)
     	      {
	    	    prid=prid+productidlist.get(id)+",";
	    	    
              }
	          
	           String prname ="";
	           for(int n=0;n<productidlist.size();n++)
     	      {
	    	    prname=prname+productnamelist.get(n)+",";
	          }
	           
		     p.setProduct_id(prid);
		     p.setProduct_name(prname);
		     model.addAttribute("list",p);
		    
		return "paybill";
		}
		else {
			  String msg="Not Authorized Access,Please login";
			  model.addAttribute("msg",msg);
			  return "error";
			}
	}
	
	
	
	
	@RequestMapping(value="/payamount",method=RequestMethod.POST)
	public String paid(HttpSession session,Model model,HttpServletRequest request)
	{
		String i=(String)session.getAttribute("username");
		if(i!=null) {     
			
			
		    String tot=request.getParameter("total");
			System.out.println("total"+tot);
		    double total=Double.parseDouble(tot);
			
			double totalcartamt=0;
			int count=prdao.getCount();
			int order_id=count;
			double paidamt=total;
			System.out.println(total);
			List<Item> cart=(List<Item>) session.getAttribute("cart");
			for(int j=0;j<cart.size();j++)
			{
				totalcartamt += (cart.get(j).getProduct().getCostprice()*cart.get(j).getQuantity());
			}
			Purchase p=new Purchase();
			p.setTotalcostprice(totalcartamt);
			p.setTotalsellingprice(paidamt);
			
			double profit= paidamt-totalcartamt;
			prdao.update(totalcartamt,paidamt,profit, order_id);
			
	
		return "paidsuccess";
		}
	
		else {
			String msg="Not Authorized Access,Please login";
			model.addAttribute("msg",msg);
			return "error";
		}
	}
	
	
	
	
	@RequestMapping(value="/orderrequests")
	public String orders(HttpSession session,Model model)
	{
		String i=(String)session.getAttribute("username");
		if(i!=null) {  
		List<Purchase> list=prdao.getOrders();
		model.addAttribute("list",list);
		return "orderrequests";
		}
		else {
			String msg="Not Authorized Access,Please login";
			model.addAttribute("msg",msg);
			return "error";
	        }
	   }
	
	@RequestMapping(value="/{product_id}")
	public String buy(@PathVariable int product_id, HttpSession session,Model model) {
		String i1=(String)session.getAttribute("username");
		if(i1!=null) {  
		
	      // get the product id
		//get the product details from db
		   Product p=pdao.getProductById(product_id);
		//set the properties to the product model properties
		
		
		//add product to products list
		   //create product list
		 
	      
		if (session.getAttribute("cart") == null) {
			List<Item> cart = new ArrayList<Item>();
			cart.add(new Item(p, 1));
			session.setAttribute("cart", cart);
		} else {
			@SuppressWarnings("unchecked")
			
			List<Item> cart = (List<Item>) session.getAttribute("cart");
			List<Product> productslist=new ArrayList<Product>();
			for(int i=0;i<cart.size();i++) 
			{
				
				productslist.add(cart.get(i).getProduct());
			}
			ProductModel productModel=new ProductModel(productslist);
			
			
		
			int index = productModel.exists(p.getProduct_id(), cart);
			
			
			
			if (index == -1) {
			cart.add(new Item(p, 1));
			} 
			else 
			
			   {   
				int count=pdao.getCountById(p.getProduct_id());
				int quantity = cart.get(index).getQuantity();
				if(quantity<count) {
					int newquantity=quantity + 1;
					cart.get(index).setQuantity(newquantity);
				}
				
				
			session.setAttribute("cart", cart);
			}
		}
		return "cart";
		}
		else {
			String msg="Not Authorized Access,Please login";
			model.addAttribute("msg",msg);
			return "error";
	        }
	
	}
	
	
	
	
		@RequestMapping(value = "remove/{id}", method = RequestMethod.GET)
		public String remove(@PathVariable("id") int id, HttpSession session,Model model) {
			String i1=(String)session.getAttribute("username");
			if(i1!=null) {  
			
			try {
		
		@SuppressWarnings("unchecked")
		
		
		
		List<Item> cart = (List<Item>) session.getAttribute("cart");
		List<Product> productslist=new ArrayList<Product>();
		for(int i=0;i<cart.size();i++) 
		{
			
			productslist.add(cart.get(i).getProduct());
		}
		
		ProductModel productModel = new ProductModel( productslist);
		
		
		int index =productModel.exists(id, cart);
		cart.remove(index);
		session.setAttribute("cart", cart);
		
			}
			catch(Exception e) {
				
			}
			return "cart";
			}
			else {
				String msg="Not Authorized Access,Please login";
				model.addAttribute("msg",msg);
				return "error";
		        }
	}
		
		@RequestMapping("/buy")
		public String buy(Model model,HttpSession session)
		{
		String i1=(String)session.getAttribute("username");
		if(i1!=null) {  
		
		{
			List<Customer> custlist=cdao.getCustomer();
			int count=prdao.getCount();
			model.addAttribute("custlist", custlist);
			model.addAttribute("count",count);
			model.addAttribute("command", new Purchase());
			return "purchaseform";
		}
		}
		else {
			String msg="Not Authorized Access,Please login";
			model.addAttribute("msg",msg);
			return "error";
	        }
		}
		
		
		
		


		@RequestMapping("/paymentoption")
		public String paymentoption(@ModelAttribute Purchase p,Model model,HttpSession session){
		
			String i1=(String)session.getAttribute("username");
			if(i1!=null) {  
				
			
			session.setAttribute("customerdata",p);
			int count=prdao.getCount();
			p.setOrder_id(++count);
			model.addAttribute("count",count);
			
			
			return "paymentoption";
			}
			else {
				String msg="Not Authorized Access,Please login";
				model.addAttribute("msg",msg);
				return "error";
		        }
			
		}

		
		
		@RequestMapping("/credit")
		public String paybycredit(Model model,HttpSession session) {
			String i1=(String)session.getAttribute("username");
			if(i1!=null) {  
	
			model.addAttribute("command",new CreditCardPayment());
			return "paymentbycredit";
			}
			else {
				String msg="Not Authorized Access,Please login";
				model.addAttribute("msg",msg);
				return "error";
		        }
		}
		
		
		
		@RequestMapping("/creditpayment")
		public String paycredit(@ModelAttribute CreditCardPayment cc, Model model,HttpSession session) {
			

			String i1=(String)session.getAttribute("username");
			if(i1!=null) { 
			Purchase p=(Purchase) session.getAttribute("customerdata");
			cc.setOrder_id(p.getOrder_id());
			prdao.saveCredit(cc);
			       
				
				@SuppressWarnings("unchecked")
				List<Item> cart = (List<Item>) session.getAttribute("cart");
				List<Product> productslist=new ArrayList<Product>();
				List<Integer> productidlist=new ArrayList<Integer>();
				List<String> productnamelist=new ArrayList<String>();
				for(int l=0;l<cart.size();l++) 
				{
			           int pid =cart.get(l).getProduct().getProduct_id();
			           int quantity=cart.get(l).getQuantity();
			           String name=cart.get(l).getProduct().getProduct_type().concat("-").concat(cart.get(l).getProduct().getProduct_name());
			           
			           int countfromdb=pdao.getCountById(pid);
			           int newCount=countfromdb-quantity;
			           pdao.updateQuantityCount(pid,newCount);
			           productidlist.add(pid);
			           productnamelist.add(name);
			           
				}
				
		         	String prid ="";
		           for(int id=0;id<productidlist.size();id++)
	     	      {
		    	    prid=prid+productidlist.get(id)+",";
		    	    
	              }
		          
		           String prname ="";
		           for(int n=0;n<productidlist.size();n++)
	     	      {
		    	    prname=prname+productnamelist.get(n)+" , ";
		          }
		           
		          Date date=new Date();
				  String d=new SimpleDateFormat("yyyy-MM-dd").format(date);
				   
		           Customer c=new Customer();
		           c.setCustomer_name(p.getCustomer_name());
		           c.setCustomer_email(p.getCustomer_email());
		           c.setCustomer_address(p.getCustomer_address());
		           c.setCustomer_mobileno(p.getCustomer_mobileno());
		           c.setDate(d);
		           
			     p.setProduct_id(prid);
			     p.setProduct_name(prname);
			     
			     p.setBill_date(d);
			     p.setPayment_method("Credit Card");
			     model.addAttribute("list",p);
			     prdao.save(p);
			     cdao.save(c);
			
			 
			
			return "paybill";
			}
			else {
				String msg="Not Authorized Access,Please login";
				model.addAttribute("msg",msg);
				return "error";
		        }
		}

		
		

		@RequestMapping("/debit")
		public String paybydebit(Model model,HttpSession session){
		
			String i1=(String)session.getAttribute("username");
			if(i1!=null) { 
				
			model.addAttribute("command",new DebitCardPayment());
			return "paymentbydebit";
		}
		else {
			String msg="Not Authorized Access,Please login";
			model.addAttribute("msg",msg);
			return "error";
	        }
		}
		
		
		@RequestMapping("/debitpayment")
		public String paydebit(@ModelAttribute DebitCardPayment dc, Model model,HttpSession session) {
			String i1=(String)session.getAttribute("username");
			if(i1!=null) { 
		
			Purchase p=(Purchase) session.getAttribute("customerdata");
			dc.setOrder_id(p.getOrder_id());
			prdao.saveDebit(dc);
			
			
			
				@SuppressWarnings("unchecked")
				List<Item> cart = (List<Item>) session.getAttribute("cart");
				List<Product> productslist=new ArrayList<Product>();
				List<Integer> productidlist=new ArrayList<Integer>();
				List<String> productnamelist=new ArrayList<String>();
				for(int l=0;l<cart.size();l++) 
				{
			           int pid =cart.get(l).getProduct().getProduct_id();
			           int quantity=cart.get(l).getQuantity();
			           String name=cart.get(l).getProduct().getProduct_type().concat("-").concat(cart.get(l).getProduct().getProduct_name());
			           
			           int countfromdb=pdao.getCountById(pid);
			           int newCount=countfromdb-quantity;
			           pdao.updateQuantityCount(pid,newCount);
			           productidlist.add(pid);
			           productnamelist.add(name);
			           
				}
				
		         	String prid ="";
		           for(int id=0;id<productidlist.size();id++)
	     	      {
		    	    prid=prid+productidlist.get(id)+",";
		    	    
	              }
		          
		           String prname ="";
		           for(int n=0;n<productidlist.size();n++)
	     	      {
		    	    prname=prname+productnamelist.get(n)+",";
		          }
		           
		           Date date=new Date();
				   String d=new SimpleDateFormat("yyyy-MM-dd").format(date);
		           
		           Customer c=new Customer();
		           c.setCustomer_name(p.getCustomer_name());
		           c.setCustomer_email(p.getCustomer_email());
		           c.setCustomer_address(p.getCustomer_address());
		           c.setCustomer_mobileno(p.getCustomer_mobileno());
		           c.setDate(d);

		           
		           
		         
			     p.setProduct_id(prid);
			     p.setProduct_name(prname);
			     p.setBill_date(d);
			     p.setPayment_method("Debit Card");
			     model.addAttribute("list",p);
			     prdao.save(p);
			     cdao.save(c);
			   
			
			return "paybill";
			}
			else {
				String msg="Not Authorized Access,Please login";
				model.addAttribute("msg",msg);
				return "error";
		        }
		}

		
		
		
		
		

		@RequestMapping("/cheque")
		public String paybycheque(Model model,HttpSession session) {

		String i1=(String)session.getAttribute("username");
		if(i1!=null) {  
		
			model.addAttribute("command",new ChequePayment());
			return "paymentbycheque";
		}
			else {
				String msg="Not Authorized Access,Please login";
				model.addAttribute("msg",msg);
				return "error";
		        }
		}
		
		
		@RequestMapping("/chequepayment")
		public String paycheque(@ModelAttribute ChequePayment ch, Model model,HttpSession session) {
			String i=(String)session.getAttribute("username");
			if(i!=null) { 
		
			Purchase p=(Purchase) session.getAttribute("customerdata");
			ch.setOrder_id(p.getOrder_id());
			prdao.saveCheque(ch);
			
			
				@SuppressWarnings("unchecked")
				List<Item> cart = (List<Item>) session.getAttribute("cart");
				List<Product> productslist=new ArrayList<Product>();
				List<Integer> productidlist=new ArrayList<Integer>();
				List<String> productnamelist=new ArrayList<String>();
				for(int l=0;l<cart.size();l++) 
				{
			           int pid =cart.get(l).getProduct().getProduct_id();
			           int quantity=cart.get(l).getQuantity();
			           String name=cart.get(l).getProduct().getProduct_type().concat("-").concat(cart.get(l).getProduct().getProduct_name());
			           
			           int countfromdb=pdao.getCountById(pid);
			           int newCount=countfromdb-quantity;
			           pdao.updateQuantityCount(pid,newCount);
			           productidlist.add(pid);
			           productnamelist.add(name);
			           
				}
				
		         	String prid ="";
		           for(int id=0;id<productidlist.size();id++)
	     	      {
		    	    prid=prid+productidlist.get(id)+",";
		    	    
	              }
		          
		           String prname ="";
		           for(int n=0;n<productidlist.size();n++)
	     	      {
		    	    prname=prname+productnamelist.get(n)+",";
		          }
		           
		           
		           Date date=new Date();
				   String d=new SimpleDateFormat("yyyy-MM-dd").format(date);
		           
		           Customer c=new Customer();
		           c.setCustomer_name(p.getCustomer_name());
		           c.setCustomer_email(p.getCustomer_email());
		           c.setCustomer_address(p.getCustomer_address());
		           c.setCustomer_mobileno(p.getCustomer_mobileno());
		           c.setDate(d);

		           
		         
			     p.setProduct_id(prid);
			     p.setProduct_name(prname);
			     p.setBill_date(d);
			     p.setPayment_method("Cheque");
			     model.addAttribute("list",p);
			     prdao.save(p);
			     cdao.save(c);
			
			
			return "paybill";
		}
			else {
				String msg="Not Authorized Access,Please login";
				model.addAttribute("msg",msg);
				return "error";
		        }
		}

		


		
		@RequestMapping(value = "/reset", method = RequestMethod.GET)
		public String remove(HttpSession session,Model model) {
			String i1=(String)session.getAttribute("username");
			if(i1!=null) {
		
		@SuppressWarnings("unchecked")
		List<Item> cart = (List<Item>) session.getAttribute("cart");
		cart.clear();
		session.setAttribute("cart", cart);
		return "cart";
			}
		else {
			String msg="Not Authorized Access,Please login";
			model.addAttribute("msg",msg);
			return "error";
	        }
	  }


		@RequestMapping(value = "/increment/{id}", method = RequestMethod.GET)
		public String increment(@PathVariable("id") int id,HttpSession session,Model model) {
			String i1=(String)session.getAttribute("username");
			if(i1!=null) {
		
			@SuppressWarnings("unchecked")
			
			List<Item> cart = (List<Item>) session.getAttribute("cart");
			List<Product> productslist=new ArrayList<Product>();
			for(int i=0;i<cart.size();i++) 
			{
				
				productslist.add(cart.get(i).getProduct());
			}
			
			ProductModel productModel = new ProductModel( productslist);

			int index = productModel.exists(id, cart);
			
			
		  
				int count=pdao.getCountById(id);
				int quantity = cart.get(index).getQuantity();
				if(quantity<count) {
					int newquantity=quantity + 1;
					cart.get(index).setQuantity(newquantity);
				}
			
			session.setAttribute("cart", cart);	
			return "cart";
			}
			else {
				String msg="Not Authorized Access,Please login";
				model.addAttribute("msg",msg);
				return "error";
		        }
	  }

		
		
		@RequestMapping(value = "/decrement/{id}", method = RequestMethod.GET)
		public String decrement(@PathVariable("id") int id,HttpSession session,Model model) {

			String i1=(String)session.getAttribute("username");
			if(i1!=null) {

			@SuppressWarnings("unchecked")
			
			List<Item> cart = (List<Item>) session.getAttribute("cart");
			List<Product> productslist=new ArrayList<Product>();
			for(int i=0;i<cart.size();i++) 
			{
				
				productslist.add(cart.get(i).getProduct());
			}
			
			ProductModel productModel = new ProductModel( productslist);

			int index = productModel.exists(id, cart);
	 
			
				int quantity = cart.get(index).getQuantity();
				if(quantity>1) {
					int newquantity=quantity-1;
					cart.get(index).setQuantity(newquantity);
				}
			
			session.setAttribute("cart", cart);	
			return "cart";
			}
			else {
				String msg="Not Authorized Access,Please login";
				model.addAttribute("msg",msg);
				return "error";
		        }
		
		
	  }
		
		
		@RequestMapping("/cancelorder")
		public String cancelOrder(Model model,HttpSession session) {
			
			String i1=(String)session.getAttribute("username");
			if(i1!=null) {
			return "cart";
		}
		else {
			String msg="Not Authorized Access,Please login";
			model.addAttribute("msg",msg);
			return "error";
	        }
		}
		
		
		
		@RequestMapping(value = "/search")
		public String searchDate(Model model,HttpSession session,HttpServletRequest request)
		
		{
			String i=(String)session.getAttribute("username");
			if(i!=null) {  
				
				String date1=request.getParameter("date1");
				String date2=request.getParameter("date2");
				//List<Purchase> list=prdao.getOrders();
				//model.addAttribute("list",list);
				List<Purchase> list=prdao.selectDateWise(date1, date2);
				model.addAttribute("list",list);
				System.out.println(date1);
				System.out.println("-----------------");
				System.out.println(date2);
				//System.out.println(list.size());
				return "datewisereport";
			}
			else
			{
				String msg="Not Authorized Access,Please login";
				model.addAttribute("msg",msg);
				return "error";
			}
			
			
		}
		
}


