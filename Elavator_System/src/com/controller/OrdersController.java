package com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dao.CustomerDao;
import com.dao.OrderDao;
import com.dao.ProductDao;
import com.model.Order;
import com.model.Product;


@Controller
public class OrdersController 
{
    @Autowired
	OrderDao odao; 
    @Autowired
    ProductDao pdao;
    @Autowired
    CustomerDao cdao;
	
	Order order;
	
	
	
	
	@RequestMapping(value = "/orders/{customer_id}")
	public String showOrders(@PathVariable int customer_id,HttpSession session,Model model) {
	int count=odao.getCountById(customer_id);
       if(count>0)
       {
    	  List <Order> list=odao.getOrdersById(customer_id);
    	  model.addAttribute("list",list);
    	  model.addAttribute("id",customer_id);
       
         return "orders";
       }
       else
       {
    	   model.addAttribute("command",new Order());
          return "noorders";
       }
	}
	
	@RequestMapping("/makeorder")
	public ModelAndView productview(HttpSession session) 
	{
		String i=(String)session.getAttribute("username");
		if(i!=null) {
		List<Product> list = pdao.getProduct();
		return new ModelAndView("makeneworder", "list", list);
		}
		else {
			String msg="Not Authorized Access, Please login ";
			return new ModelAndView("error","msg",msg);
		}
	}
//	
//	@RequestMapping(value="/purchase/{product_id}")
//	public ModelAndView purchase(@PathVariable int product_id, HttpServletRequest req,HttpSession session)
//	{   
//		String i=(String)session.getAttribute("username");
//		if(i!=null) { 
//		String status="Not Approved";
//		DateTimeFormatter dtm=DateTimeFormatter.ofPattern("dd/MM/yyyy");
//		LocalDateTime date=LocalDateTime.now();
//		
//		session.setAttribute("productid", product_id);
//		order=new Order();
//		
////		order.setCustomer_id(cust_id);
////		order.setProduct_id(product_id);
////		session=req.getSession();
////		session.setAttribute("pid", product_id);
////		session.setAttribute("cname",name);
////		order.setOrder_date(dtm.format(date));
////		order.setMobileno(customer.getCustomer_mobileno());
////		order.setStatus(status);
////		odao.save(order);
////		
//		return new ModelAndView("purchaseform","command",new Purchase());
//		}
//		else {
//			String msg="Not Authorized Access,Please login";
//			return new ModelAndView("error","msg",msg);
//		}
//	}	
	
//	@RequestMapping("/approved/{order_id}")
//	public ModelAndView approved(@PathVariable int order_id,HttpServletRequest req,HttpSession session)
//	{
//		
//		session=req.getSession();
//		String i=(String)session.getAttribute("username");
//		
//		if(i!=null) {
//			odao.approved(order_id);
//			return new ModelAndView("redirect:/orderrequests");
//		}
//		else {
//			String msg="Not Authorized Access, Please login ";
//			return new ModelAndView("error","msg",msg);
//		}
//		
//		
//	}
	
	
//	@RequestMapping(value="/orderrequests")
//	public ModelAndView getOrders()
//	{
//			List<Order> list = odao.getOrders();
//			return new ModelAndView("orderrequests", "list", list);
//	}
	
	@RequestMapping(value = "/orders/orders/{customer_id}")
	public String showOrder(@PathVariable int customer_id,HttpSession session,Model model) {
		
		String i=(String)session.getAttribute("username");
		if(i!=null) { 
		int count=odao.getCountById(customer_id);
		if(count>0)
		{
    	  List <Order> list=odao.getOrdersById(customer_id);
    	  model.addAttribute("list",list);
          return "orders";
        }
       else
       {
    	   model.addAttribute("command",new Order());
           return "noorders";
       }
	  
	}

		else {
			String msg="Not Authorized Access,Please login";
			model.addAttribute("msg",msg);
			return "error";
		}
	}

}
