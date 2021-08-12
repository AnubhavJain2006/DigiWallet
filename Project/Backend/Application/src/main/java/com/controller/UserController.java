package com.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bean.UserBean;
import com.dao.UserDao;

@Controller
public class UserController {
	@Autowired
	UserDao dao;

	int rowsAffected = 10;

	@RequestMapping(value = "/")
	public String home(Model model,@ModelAttribute("user") UserBean user) {
		return "Login";
	}

	@RequestMapping(value = "/login")
	public String login(Model model,@ModelAttribute("user") UserBean user) {
		model.addAttribute("result", rowsAffected);
		rowsAffected = 10;
		return "Login";
	}

	@RequestMapping(value = "/signup")
	public String signup(UserBean user, Model model) {
		model.addAttribute("user", user);
		return "signup";
	}

	@RequestMapping(value = "/saveuser")
	public String saveuser(Model model, @Valid @ModelAttribute("user") UserBean user, BindingResult result) {
		if (result.hasErrors()) {
			model.addAttribute("user", user);
			return "signup";
		} else {
			rowsAffected = dao.insert(user);
//			System.out.println("SaveUser"+rowsAffected);
			return "redirect:/login";
		}
	}
	@RequestMapping(value="/checkUser",method = RequestMethod.POST)
	public String checkUser(HttpSession session,Model model,@Valid @ModelAttribute("user") UserBean user,BindingResult result) {
		user = dao.checkUser(user);
		if (user!=null) {
			rowsAffected = 2;
			session.setAttribute("user", user);
//			if(Integer.parseInt(user.getUser_role())==2)
//				return "userdashboard";
//			else if(Integer.parseInt(user.getUser_role())==1)
//				return "admindashboard";
			
			switch(Integer.parseInt(user.getUser_role()))
			{
			case 1:
				return "userdashboard";
				
			case 2:
				return "admindashboard";
				
			}
			
				
			
		} else {
			rowsAffected = 3;
			model.addAttribute("result",rowsAffected);
			model.addAttribute("user",user);
		}
		return "login";
//		System.out.println("Called...");
//		return "";
	}
}
