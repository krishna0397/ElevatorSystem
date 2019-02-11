package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.dao.DepartmentDao;
import com.model.Department;

@Controller
public class DepartmentController {

	@Autowired
	DepartmentDao ddao;

	@RequestMapping("/deptform")
	public ModelAndView showform(HttpServletRequest req,HttpSession session) {
		session=req.getSession();
		String i=(String)session.getAttribute("username");
		if(i!=null) {
			return new ModelAndView("deptform", "command", new Department());
		}
		else {
			String msg="Not Authorized Access, Please login ";
			return new ModelAndView("error","msg",msg);
		}

		
	}

	@RequestMapping(value = "/deptsave", method = RequestMethod.POST)
	public ModelAndView save2(@ModelAttribute Department dept,HttpServletRequest req,HttpSession session) {
		session=req.getSession();
		String i=(String)session.getAttribute("username");
		if(i!=null) {
			ddao.save(dept);
			List<Department> list = ddao.getDepartment();
			return new ModelAndView("viewdept", "list", list);

		}
		else {
			String msg="Not Authorized Access, Please login ";
			return new ModelAndView("error","msg",msg);
		}
		
	}

	@RequestMapping("/viewdept")
	public ModelAndView view(HttpServletRequest req,HttpSession session) {
		
		session=req.getSession();
		String i=(String)session.getAttribute("username");
		if(i!=null) {
			List<Department> list = ddao.getDepartment();
			return new ModelAndView("viewdept", "list", list);
		}
		else {
			String msg="Not Authorized Access, Please login ";
			return new ModelAndView("error","msg",msg);
		}
		
		
	}

	@RequestMapping(value = "/deletedept/{dept_id}", method = RequestMethod.GET)
	public ModelAndView delete(@PathVariable int dept_id,HttpServletRequest req,HttpSession session) {
		session=req.getSession();
		String i=(String)session.getAttribute("username");
		if(i!=null) {
			ddao.delete(dept_id);
			return new ModelAndView("redirect:/viewdept");
		}
		else {
			String msg="Not Authorized Access, Please login ";
			return new ModelAndView("error","msg",msg);
		}

	}

	@RequestMapping(value = "/editdept/{dept_id}")
	public ModelAndView edit(@PathVariable int dept_id,HttpServletRequest req,HttpSession session) {
		session=req.getSession();
		String i=(String)session.getAttribute("username");
		if(i!=null) {
			Department dept = ddao.getDeptById(dept_id);
			return new ModelAndView("editdept", "command", dept);
		}
		else {
			String msg="Not Authorized Access, Please login ";
			return new ModelAndView("error","msg",msg);
		}

	}

	@RequestMapping(value = "/deptupdate", method = RequestMethod.POST)
	public ModelAndView update(@ModelAttribute("dept") Department dept,HttpServletRequest req,HttpSession session) {
		session=req.getSession();
		String i=(String)session.getAttribute("username");
		if(i!=null) {
			ddao.update(dept);
			return new ModelAndView("redirect:/viewdept");
		}
		else {
			String msg="Not Authorized Access, Please login ";
			return new ModelAndView("error","msg",msg);
		}

	}
	
	@RequestMapping("/departments")
	public ModelAndView showDepartmentForm(HttpSession session) {
		String i=(String)session.getAttribute("username");
		if(i!=null) {
		return new ModelAndView("departments", "command", new Department());
		}
		else {
			String msg="Not Authorized Access, Please login ";
			return new ModelAndView("error","msg",msg);
		}
	}

}
