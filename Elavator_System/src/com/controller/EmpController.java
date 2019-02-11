package com.controller;
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
import org.springframework.web.servlet.ModelAndView;

import com.dao.EmpDao;
import com.model.Emp;

@Controller
public class EmpController {

	@Autowired
	EmpDao dao;

	@RequestMapping("/empform")
	public String showform(HttpServletRequest req,HttpSession session,Model model) {
		session=req.getSession();
		String i=(String)session.getAttribute("username");
		if(i!=null) {
			
			List<Emp> emplist=dao.getEmployee();
			int count=dao.getCount();
			model.addAttribute("emplist", emplist);
			model.addAttribute("command", new Emp());
			return "empform";
		}
		else {
			String msg="Not Authorized Access, Please login ";
			model.addAttribute("msg",msg);
			return "error";
		}
		
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public ModelAndView save2(@ModelAttribute Emp emp,HttpServletRequest req,HttpSession session) {
		
		session=req.getSession();
		String i=(String)session.getAttribute("username");
		if(i!=null) {
			dao.save(emp);
			List<Emp> list = dao.getEmployee();
			return new ModelAndView("viewemp", "list", list);
		}
		else {
			String msg="Not Authorized Access, Please login ";
			return new ModelAndView("error","msg",msg);
		}
		

	}

	@RequestMapping("/viewemp")
	public ModelAndView viewemp(HttpServletRequest req,HttpSession session) {
		
		session=req.getSession();
		String i=(String)session.getAttribute("username");
		if(i!=null) {
			List<Emp> list = dao.getEmployee();
			return new ModelAndView("viewemp", "list", list);
			
		}
		else {
			String msg="Not Authorized Access, Please login ";
			return new ModelAndView("error","msg",msg);
		}
		

	}

	@RequestMapping(value = "/deleteemp/{employee_id}", method = RequestMethod.GET)
	public ModelAndView delete(@PathVariable int employee_id,HttpSession session,HttpServletRequest req) {
		session=req.getSession();
		String i=(String)session.getAttribute("username");
		if(i!=null) {
			dao.delete(employee_id);
			return new ModelAndView("redirect:/viewemp");		}
		else {
			String msg="Not Authorized Access, Please login ";
			return new ModelAndView("error","msg",msg);
		}
		
	}

	@RequestMapping(value = "/editemp/{employee_id}")
	public String edit(@PathVariable int employee_id,HttpSession session,HttpServletRequest req,Model model) {
		session=req.getSession();
		String i=(String)session.getAttribute("username");
		if(i!=null) {
			
			List<Emp> emplist=dao.getEmployee();
			int count=dao.getCount();
			model.addAttribute("emplist", emplist);
			Emp emp = dao.getEmpById(employee_id);
			model.addAttribute("command", emp);
			return "empeditform";
		}
		else {
			String msg="Not Authorized Access, Please login ";
			model.addAttribute("msg", msg);
			return "error";
		}
		
		
	}

	@RequestMapping(value = "/empupdate", method = RequestMethod.POST)
	public ModelAndView update(@ModelAttribute("emp") Emp emp,HttpSession session,HttpServletRequest req) {
		session=req.getSession();
		String i=(String)session.getAttribute("username");
		if(i!=null) {
			dao.update(emp);
			return new ModelAndView("redirect:/viewemp");
		}
		else {
			String msg="Not Authorized Access, Please login ";
			return new ModelAndView("error","msg",msg);
		}
		
				
	}
	
	@RequestMapping("/employees")
	public ModelAndView showEmpForm(HttpSession session) {
		String i=(String)session.getAttribute("username");
		if(i!=null) {
		return new ModelAndView("employees", "command", new Emp());
		}
		else {
			String msg="Not Authorized Access, Please login ";
			return new ModelAndView("error","msg",msg);
		}
	}
	
	
	@RequestMapping("/editemp")
	public ModelAndView showEmpForm1() {
		return new ModelAndView("empeditform", "command", new Emp());
	}
	
	

}
