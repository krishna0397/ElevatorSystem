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

import com.dao.MessageDao;
import com.model.MessageBean;

@Controller
public class HomeController 
{
	
	@Autowired
	MessageDao mdao;
	
	@RequestMapping ("/")
	public String showHomePage(){
	return "index";
	}
	
	@RequestMapping ("/index")
	public String showIndexPage(){
	return "index";
	}

	@RequestMapping ("/about")
	public String showAboutPage(){
	return "about";
	}
	
	@RequestMapping ("/contact")
	public ModelAndView showContactPage(){
	return new ModelAndView("contact","command",new MessageBean());
	}
	
	@RequestMapping ("/product")
	public String showProductPage(){
	return "product";
	}
	
	@RequestMapping(value="/message",method= RequestMethod.POST)
	public ModelAndView save2(@ModelAttribute("msgForm") MessageBean msg){
	mdao.saveMessage(msg);
	return new ModelAndView("contact","command",new MessageBean());	
	}
	
	@RequestMapping("/messages")
	public ModelAndView view(HttpServletRequest req){
		HttpSession session=req.getSession();
		String i=(String) session.getAttribute("username");
		if(i!=null) {
		List<MessageBean> list=mdao.getMessage();
		return new ModelAndView("viewmessages","list",list);
		}
		else {
			String msg="Not Authorized Access,Please login";
			return new ModelAndView("error","msg",msg);
		}
	}
	
	@RequestMapping(value = "/deletemsg/{fname}", method = RequestMethod.GET)
	public ModelAndView delete(@PathVariable String fname,HttpServletRequest req) {
		HttpSession session=req.getSession();
		String i=(String) session.getAttribute("username");
		if(i!=null) {
			mdao.delete(fname);
			return new ModelAndView("redirect:/messages");
		}
		else {
			String msg="Not Authorized Access,Please login";
			return new ModelAndView("error","msg",msg);
		}
	}

	
}
