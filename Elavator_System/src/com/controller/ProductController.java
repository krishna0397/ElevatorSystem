package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.dao.Gst_DiscountDao;
import com.dao.ProductDao;
import com.model.Gst_Discount;
import com.model.Product;

@Controller
public class ProductController {

	@Autowired
	ProductDao pdao;
	@Autowired
	Gst_DiscountDao gstdao;

	@RequestMapping("/productform")
	public ModelAndView showform(HttpServletRequest req,HttpSession session) {
		session=req.getSession();
		String i=(String)session.getAttribute("username");
		if(i!=null) {
			return new ModelAndView("productform", "command", new Product());
		}
		else {
			String msg="Not Authorized Access, Please login ";
			return new ModelAndView("error","msg",msg);
		}

		
	}

	@RequestMapping(value = "/productsave", method = RequestMethod.POST)
	public ModelAndView save2(@ModelAttribute Product product,HttpServletRequest req,HttpSession session) {
		
		session=req.getSession();
		String i=(String)session.getAttribute("username");
		if(i!=null) {
			pdao.save(product);
			List<Product> list = pdao.getProduct();
			return new ModelAndView("viewproduct", "list", list);
		}
		else {
			String msg="Not Authorized Access, Please login ";
			return new ModelAndView("error","msg",msg);
		}
		

	}

	@RequestMapping("/viewproduct")
	public ModelAndView view(HttpServletRequest req,HttpSession session) {
		
		session=req.getSession();
		String i=(String)session.getAttribute("username");
		
		if(i!=null) {
			List<Product> list = pdao.getProduct();
			return new ModelAndView("viewproduct", "list", list);
		}
		else {
			String msg="Not Authorized Access, Please login ";
			return new ModelAndView("error","msg",msg);
		}
		

	}
	
		
	@RequestMapping(value = "/deleteproduct/{product_id}", method = RequestMethod.GET)
	public ModelAndView delete(@PathVariable int product_id,HttpServletRequest req,HttpSession session) {
		session=req.getSession();
		String i=(String)session.getAttribute("username");
		
		if(i!=null) {
			pdao.delete(product_id);
			return new ModelAndView("redirect:/viewproduct");
		}
		else {
			String msg="Not Authorized Access, Please login ";
			return new ModelAndView("error","msg",msg);
		}
	}

	@RequestMapping(value = "/editproduct/{product_id}")
	public ModelAndView edit(@PathVariable int product_id,HttpServletRequest req,HttpSession session) {
		session=req.getSession();
		String i=(String)session.getAttribute("username");
		
		if(i!=null) {
			Product product = pdao.getProductById(product_id);
			return new ModelAndView("editproduct", "command", product);
		}
		else {
			String msg="Not Authorized Access, Please login ";
			return new ModelAndView("error","msg",msg);
		}
	}

	@RequestMapping(value = "/productupdate", method = RequestMethod.POST)
	public ModelAndView update(@ModelAttribute("product") Product product,HttpServletRequest req,HttpSession session) {
		session=req.getSession();
		String i=(String)session.getAttribute("username");
		
		if(i!=null) {
			pdao.update(product);
			return new ModelAndView("redirect:/viewproduct");
		}
		else {
			String msg="Not Authorized Access, Please login ";
			return new ModelAndView("error","msg",msg);
		}
	}
	
	@RequestMapping("/inventory")
	public ModelAndView showInventoryForm(HttpSession session,HttpServletRequest req) {
		session=req.getSession();
		String i=(String)session.getAttribute("username");
		if(i!=null) {
			return new ModelAndView("inventory", "command", new Product());
		}
		else {
			String msg="Not Authorized Access, Please login ";
			return new ModelAndView("error","msg",msg);
	    }
	}
	
	
	
	@RequestMapping("/gstdiscountform")
	public String showGstDiscountForm(HttpServletRequest req,HttpSession session,Model model) {
		session=req.getSession();
		String i=(String)session.getAttribute("username");
		if(i!=null) {
			
			List<Gst_Discount> list = gstdao.getGstDiscount();
			model.addAttribute("command", new Gst_Discount());
			model.addAttribute("list", list);
			return "gst_discount";
		}
		else {
			String msg="Not Authorized Access, Please login ";
			model.addAttribute("msg",msg);
			return "error";
		}
	}
	
	
	@RequestMapping(value = "/gstdiscountsave", method = RequestMethod.POST)
	public String saveGstDiscount(@ModelAttribute Gst_Discount gst_discount,HttpServletRequest req,HttpSession session,Model model) {
		
		session=req.getSession();
		String i=(String)session.getAttribute("username");
		if(i!=null) {
			
			 @SuppressWarnings("unchecked")
			List <Gst_Discount> gd=(List<Gst_Discount>) session.getAttribute("gd");
			gstdao.update(gst_discount);
			 List <Gst_Discount> gd1=gstdao.getGstDiscount();
			 gd=gd1;
			 session.setAttribute("gd",gd);
		
			List<Gst_Discount> list = gstdao.getGstDiscount();
			model.addAttribute("command", new Gst_Discount());
			model.addAttribute("list", list);
			return "gst_discount";
		}
		else {
			String msg="Not Authorized Access, Please login ";
			model.addAttribute("msg",msg);
			return "error";
		}
		
	}
	
	
	
	
	
	
}