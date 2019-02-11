package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.dao.CustomerDao;
import com.model.AdminLoginBean;
import com.model.Customer;
import com.model.LoginBean;

@Controller
public class CustomerController {

	@Autowired
	CustomerDao cdao;
	
	@RequestMapping ("/regform")
		public ModelAndView showform(HttpSession session){
		String i=(String)session.getAttribute("username");
		if(i!=null) {
			return new ModelAndView("regform","command",new Customer());
		}
		else {
			String msg="Not Authorized Access, Please login ";
			return new ModelAndView("error","msg",msg);
		}
	}
	
	@RequestMapping(value="/customersave",method= RequestMethod.POST)
		public ModelAndView save2(@ModelAttribute Customer customer,HttpServletRequest req,HttpSession session){
		session=req.getSession();
		String i=(String)session.getAttribute("username");
		if(i!=null) {
		cdao.save(customer);
		List<Customer> list=cdao.getCustomer();
		return new ModelAndView("viewcustomer","list",list);	
		}
		else {
			String msg="Not Authorized Access, Please login ";
			return new ModelAndView("error","msg",msg);
		}
	}
	
	@RequestMapping("/viewcustomer")
	public ModelAndView view(HttpServletRequest req,HttpSession session){
		session=req.getSession();
		String i=(String)session.getAttribute("username");
		if(i!=null) {
			List<Customer> list=cdao.getCustomer();
			return new ModelAndView("viewcustomer","list",list);
		}
		else {
			String msg="Not Authorized Access, Please login ";
			return new ModelAndView("error","msg",msg);
		}
		
	}
	
	@RequestMapping(value="/deletecustomer/{customer_id}",method=RequestMethod.GET)
	public ModelAndView delete(@PathVariable int customer_id,HttpSession session,HttpServletRequest req){
		session=req.getSession();
		String i=(String)session.getAttribute("username");
		if(i!=null) {
			cdao.delete(customer_id);
			return new ModelAndView("redirect:/viewcustomer");
		}
		else {
			String msg="Not Authorized Access, Please login ";
			return new ModelAndView("error","msg",msg);
		}
	}
	
	@RequestMapping(value="/editcustomer/{customer_id}")
	public ModelAndView edit(@PathVariable int customer_id,HttpSession session,HttpServletRequest req){
		session=req.getSession();
		String i=(String)session.getAttribute("username");
		if(i!=null) {
		Customer customer=cdao.getCustomerById(customer_id);
		return new ModelAndView("customeredit","command",customer);
		}
		else {
			String msg="Not Authorized Access, Please login ";
			return new ModelAndView("error","msg",msg);
		}
		
	}
	
	@RequestMapping (value="/customerupdate", method=RequestMethod.POST)
	public ModelAndView update(@ModelAttribute("customer") Customer customer,HttpSession session,HttpServletRequest req){
		session=req.getSession();
		String i=(String)session.getAttribute("username");
		if(i!=null) {
		cdao.update(customer);
		List<Customer> list=cdao.getCustomer();
		return new ModelAndView("viewcustomer","list",list);
		}
		else {
			String msg="Not Authorized Access, Please login ";
			return new ModelAndView("error","msg",msg);
		}
	}
	
	@RequestMapping ("/customers")
	public ModelAndView showCustomersForm(HttpSession session,HttpServletRequest req){
		session=req.getSession();
		String i=(String)session.getAttribute("username");
		if(i!=null) {
			List<Customer> list=cdao.getCustomer();
			return new ModelAndView("viewcustomer","list",list);
	}
	else {
		String msg="Not Authorized Access, Please login ";
		return new ModelAndView("error","msg",msg);
	}
}
	

	@RequestMapping ("/customerhome")
	public ModelAndView showCustomersProfile(HttpServletRequest req,HttpServletResponse res){
		HttpSession session=req.getSession();
		int id=(Integer) session.getAttribute("id");
		String user=(String)session.getAttribute("custusername");
		if(user!= null) {
			Customer customer=cdao.getCustomerById(id);
			return new ModelAndView("customerhome","cust",customer);
		}
		else {
			String msg="Not Authorized Access, Please login ";
			return new ModelAndView("error","msg",msg);
		}

		
	    
	}
	
	@RequestMapping(value = "/orders/customerhome")
	public ModelAndView custhome(@ModelAttribute LoginBean lg,HttpServletRequest req,HttpServletResponse res)
	{
		HttpSession session=req.getSession();
		String user=(String)session.getAttribute("custusername");
		if(user!= null) {
		return new ModelAndView("redirect:/customerhome");
		}
		else {
			String msg="Not Authorized Access, Please login ";
			return new ModelAndView("error","msg",msg);
		}
	}
	
	@RequestMapping(value = "/purchase/returnadminhome")
	public ModelAndView custhome1(@ModelAttribute LoginBean lg,HttpServletRequest req,HttpServletResponse res)
	{
		HttpSession session=req.getSession();
		String user=(String)session.getAttribute("username");
		if(user!= null) {
		return new ModelAndView("redirect:/adminhome");
		}
		else {
			String msg="Not Authorized Access, Please login ";
			return new ModelAndView("error","msg",msg);
		}
	}

	
}
