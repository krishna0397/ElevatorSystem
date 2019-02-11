package com.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dao.CustomerDao;
import com.dao.DepartmentDao;
import com.dao.EmpDao;
import com.dao.ProductDao;
import com.dao.PurchaseDao;
import com.model.AdminLoginBean;
import com.model.Item;
import com.model.LoginBean;
import com.model.Purchase;


@Controller
public class AdminLoginController {
	
	
	@Autowired
	EmpDao dao;
	@Autowired
	CustomerDao cdao;
	@Autowired
	ProductDao pdao;
	@Autowired
	DepartmentDao ddao;
	@Autowired
	PurchaseDao prdao;
	
		@RequestMapping(value = "/admin")
		public ModelAndView showLoginForm() {
			return new ModelAndView("adminlogin","command",new AdminLoginBean());
		}
		
		
		@RequestMapping(value = "/adminlogincheck",method=RequestMethod.POST)
			public ModelAndView logincheck(@RequestParam String username,@RequestParam String password,HttpServletRequest req,HttpSession session){
				
			if(username.equals("admin") && password.equals("admin123")) {
				
				session=req.getSession();
				session.setAttribute("username", username);
				return new ModelAndView("adminhome","username",username);
			}
			else {
				return new ModelAndView("adminlogin","command",new AdminLoginBean());
			}
		}
			
			@RequestMapping(value = "/adminlogout")
			public ModelAndView logoutcheck(HttpServletRequest req,HttpSession session){
				
				session.invalidate();
				return new ModelAndView("login","command",new LoginBean());
			}
			
			@RequestMapping("adminhome")
			public String showAdminHome(HttpServletRequest req,HttpSession session,Model model) {
				
				  int custno=cdao.getCount();
				  int empno=dao.getCount();
				  int prodno=pdao.getCount();
				  int deptno=ddao.getCount();
				  int orderno=prdao.getCount();
				
				  model.addAttribute("custno",custno);
				  model.addAttribute("empno",empno);
				  model.addAttribute("prodno",prodno);
				  model.addAttribute("deptno",deptno);
				  model.addAttribute("orderno",orderno);
				
				session=req.getSession();
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
			
			@RequestMapping(value = "/adminprofile")
			public ModelAndView showAdminProfile(HttpServletRequest req,HttpSession session) {
				session=req.getSession();
				String i=(String)session.getAttribute("username");
				if(i!=null) {
					return new ModelAndView("adminprofile","command",new AdminLoginBean());
					}
					else {
						String msg="Not Authorized Access,Please login";
						return new ModelAndView("error","msg",msg);
					}
			}
			
			
			@RequestMapping("/reports")
			public String viewReports(Model model,HttpSession session)
			{
				
					String i=(String)session.getAttribute("username");
					if(i!=null) {  
						List<Purchase> list=prdao.getOrders();
						model.addAttribute("list",list);
						return "datewisereport";
					}
					else {
					String msg="Not Authorized Access,Please login";
					model.addAttribute("msg",msg);
					return "error";
					}
				}
			
			
			
//			@RequestMapping("/profitloss")
//			public String viewProfitOrLossReports(Model model,HttpSession session)
//			{
//				String i=(String)session.getAttribute("username");
//				if(i!=null) {  
//					
//					
//					List<Purchase> list=prdao.getOrders();
//					model.addAttribute("list",list);
//					return "profitloss";
//				}
//				else
//				{
//					String msg="Not Authorized Access,Please login";
//					model.addAttribute("msg",msg);
//					return "error";
//					
//				}
//			}
//			
//			@RequestMapping("/billreport")
//			public String viewBillRets(Model model,HttpSession session)
//			{
//				String i=(String)session.getAttribute("username");
//				if(i!=null) {  
//					List<Purchase> list=prdao.getOrders();
//					model.addAttribute("list",list);
//					return "datewisereport";
//				}
//				else {
//				String msg="Not Authorized Access,Please login";
//				model.addAttribute("msg",msg);
//				return "error";
//				}
//			}
				
			
}
