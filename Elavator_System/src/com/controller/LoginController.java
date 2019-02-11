package com.controller;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.dao.CustomerDao;
import com.dao.DepartmentDao;
import com.dao.EmpDao;
import com.dao.EmpLoginDao;
import com.dao.Gst_DiscountDao;
import com.dao.LoginDao;
import com.dao.ProductDao;
import com.dao.PurchaseDao;
import com.model.AdminLoginBean;
import com.model.Gst_Discount;
import com.model.Item;
import com.model.LoginBean;

@Controller
public class LoginController {
	
	@Autowired
	LoginDao ldao;
	@Autowired
	EmpLoginDao eldao;
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
	@Autowired
	Gst_DiscountDao gstdao;
	
	@RequestMapping(value = "/login")
	public ModelAndView showLoginForm() {
		return new ModelAndView("login","command",new LoginBean());
	}
	
	
		@RequestMapping(value = "/logincheck",method=RequestMethod.POST)
		public String logincheck(@ModelAttribute LoginBean lg,HttpServletRequest req,HttpServletResponse res,Model model) {
		
			
			
			String username=lg.getUsername();
			String password=lg.getPassword();
			
	       try {
			 if(username.equals("admin") && password.equals("admin123")) {
				  HttpSession session=req.getSession();
				  session.setAttribute("username", username);
				  int custno=cdao.getCount();
				  int empno=dao.getCount();
				  int prodno=pdao.getCount();
				  int deptno=ddao.getCount();
				  int orderno=prdao.getCount();
				  
				  List <Gst_Discount> gd=gstdao.getGstDiscount();
				
				  
				 
				  @SuppressWarnings("unchecked")
				 List<Item> cart = new ArrayList<Item>();
				 session.setAttribute("cart", cart);
				 session.setAttribute("gd",gd);
			  
				  model.addAttribute("username", username);
				  model.addAttribute("custno",custno);
				  model.addAttribute("empno",empno);
				  model.addAttribute("prodno",prodno);
				  model.addAttribute("deptno",deptno);
				  model.addAttribute("orderno",orderno);
				  
				  
				  return "adminhome";
			   }
	       }
			 
//			 LoginBean bean =ldao.getLogin(username, password);
//			 if(username.equals(bean.getUsername()) && password.equals(bean.getPassword())) {
//				  HttpSession session=req.getSession();
//			      session.setAttribute("username", username);
//			      Customer customer=cdao.getCustomerByName(username);
//			      session.setAttribute("id", customer.getCustomer_id());
//			      session.setAttribute("custusername", customer.getUsername());
//              
//			      return new ModelAndView("customerhome","cust",customer);
//	          }
//			 
//			}
//			catch(Exception e)
//			{
//				
//			}
//			
//			
//			try { 
//			 EmpLoginBean bean1 =eldao.getLogin(username, password);
//			 if(username.equals(bean1.getUsername()) && password.equals(bean1.getPassword())){
//                   HttpSession session=req.getSession();	   
//                   session.setAttribute("username", username);
//	               Emp emp=dao.getEmpByEmail(username);	    
//	               return new ModelAndView("emphome","emp",emp);
//	          }
//			}
//	       
			catch(Exception e)
		   {
	
		   }
//	    model.addAttribute("commond",new AdminLoginBean());
		//return new ModelAndView("loginerrorpage","commond",new AdminLoginBean());
	       model.addAttribute("command",new AdminLoginBean());
	       return "loginerrorpage";
	}
		
		
		@RequestMapping(value = "/logout")
		public ModelAndView logoutcheck(@ModelAttribute LoginBean lg,HttpServletRequest req,HttpServletResponse res)
		{
			HttpSession session=req.getSession();
			session.invalidate();
			return new ModelAndView("redirect:/login");
			
			}

		@RequestMapping(value = "/orders/logout")
		public ModelAndView logoutcheck1(@ModelAttribute LoginBean lg,HttpServletRequest req,HttpServletResponse res)
		{
			HttpSession session=req.getSession();
			session.invalidate();
			return new ModelAndView("redirect:/login");
			
			}

		
}
