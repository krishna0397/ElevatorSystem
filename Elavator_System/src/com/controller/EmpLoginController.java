package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.dao.EmpDao;
import com.dao.EmpLoginDao;
import com.model.Customer;
import com.model.Emp;
import com.model.EmpLoginBean;
import com.model.LoginBean;

@Controller
public class EmpLoginController {
	
		@Autowired
		EmpLoginDao eldao;
		@Autowired
		EmpDao dao;
		
		@RequestMapping(value = "/employee")
		public ModelAndView showLoginForm() {
			return new ModelAndView("emplogin","command",new EmpLoginBean());
		}
		
			@RequestMapping(value = "/emplogincheck",method=RequestMethod.POST)
			public ModelAndView logincheck(@ModelAttribute EmpLoginBean lg,HttpServletRequest req,HttpServletResponse res){
				
			try {
			String username=lg.getUsername();
			
			String password=lg.getPassword();
			EmpLoginBean bean =eldao.getLogin(username, password);
		
			
			if(username.equals(bean.getUsername()) && password.equals(bean.getPassword())) {
		        HttpSession session=req.getSession();
			    session.setAttribute("username", username);
			    Emp emp=dao.getEmpByEmail(username);
			    return new ModelAndView("emphome","emp",emp);
			     }
			    }
			
			catch(Exception e)
			{
			}
		
			return new ModelAndView("emplogin","command",new EmpLoginBean());
			}
			
			@RequestMapping(value = "/emplogout")
			public ModelAndView logoutcheck(@ModelAttribute EmpLoginBean lg,HttpServletRequest req,HttpServletResponse res){
					
				HttpSession session=req.getSession();
				session.invalidate();
				return new ModelAndView("login","command",new EmpLoginBean());
			}
	}
