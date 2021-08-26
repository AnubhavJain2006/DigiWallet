package com.controller;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bean.UserBean;
import com.dao.UserDao;

@Controller
public class AdminController {

	String activeLink;
	@Autowired
	UserDao userDao;

	public String urlCheck(String str) throws MalformedURLException {
		
		URL url=new URL(str);
		String arr[]=url.getPath().split("/");
		for (String string : arr) {
			System.out.println(string);
		}

		return arr[3];
	}

	public boolean isValidUser(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		if ((UserBean) session.getAttribute("user") != null)
			return true;
		else
			return false;
	}

	@RequestMapping(value = "/admin/dashboard")
	public String adminDashboard(HttpServletRequest req) {
		if (isValidUser(req)) {
			return "/admin/dashboard";

		} else {
			return "redirect:/login";
		}
	}

	@RequestMapping(value = "/admin/allUser")
	public String showUser(HttpServletRequest req, Model model) {
		if (isValidUser(req)) {
			int userRoleId=2;
			activeLink="user";
			model.addAttribute("user", new UserBean());
			ArrayList<UserBean> DataList = (ArrayList<UserBean>) userDao.getAllUserRecords(userRoleId);
			model.addAttribute("DataList", DataList);
			return "/admin/allUser";
		} else
			return "redirect:/login";
	}

	@RequestMapping(value = "/admin/logout")
	public String logout(HttpSession session, HttpServletRequest req) {
		session.invalidate();
		session = req.getSession(false);
		return "redirect:/login";
	}

	@RequestMapping(value = "/admin/saveUser", method = RequestMethod.POST)
	public String saveUser(Model model, @Valid @ModelAttribute("user") UserBean user, BindingResult result) {

		if (result.hasErrors()) {
			System.out.println("Has Error" + result.hasErrors());
			model.addAttribute("user", user);
		} else {
			System.out.println(user.getUser_role());
			userDao.insert(user);
		}
		return "redirect:/admin/allUser";
	}

	@RequestMapping(value = "/admin/deleteUser/{userId}")
	public String deletUser(@PathVariable("userId") int userId,HttpServletRequest req) throws MalformedURLException {
//		System.out.println(userId);		

		String url=req.getRequestURL().toString();
		String mainurl=urlCheck(url);
		int result = userDao.deleteUser(userId);
		if(activeLink.equals("admin"))
			return "redirect:/admin/allAdmin";
		else
			return "redirect:/admin/allUser";
	
	}

	@RequestMapping(value = "/admin/updateUser", method = RequestMethod.POST)
	public String updateUser(UserBean user) {
		int result = userDao.updateUser(user);
//		return "redirect:/admin/allUser";
		if(activeLink.equals("admin"))
			return "redirect:/admin/allAdmin";
		else
			return "redirect:/admin/allUser";
	
		
	}

	@RequestMapping(value = "/admin/profile")
	public String adminProfile(UserBean user, Model model, HttpSession session) {
		int userId = ((UserBean) session.getAttribute("user")).getUser_id();
		UserBean ubean = userDao.getUserProfile(userId);
		model.addAttribute("user", ubean);
		return "/admin/profile";
	}

	@PostMapping("/admin/updateProfile")
	public String updateAdminProfile(@Valid @ModelAttribute("user") UserBean user, BindingResult result,
			HttpSession session) {
		if (result.hasErrors()) {
//			System.out.println("error");
			return "/admin/profile";
		} else {
			user.setUser_id(((UserBean) session.getAttribute("user")).getUser_id());
			userDao.updateUserProfile(user);
		}
		return "redirect:/admin/profile";
	}
	
	@RequestMapping(value="/admin/allAdmin")
	public String showAdmin(Model model,HttpServletRequest req) {
		if (isValidUser(req)) {
			int userRoleId=1;
			activeLink="admin";
			model.addAttribute("user", new UserBean());
			ArrayList<UserBean> DataList = (ArrayList<UserBean>) userDao.getAllUserRecords(userRoleId);
			model.addAttribute("DataList", DataList);
			return "/admin/allAdmin";
		} else
			return "redirect:/login";
		
		
	}
	@RequestMapping(value="/admin/getUser/{userId}")
	public String getUser(@PathVariable("userId") int userId ,Model model) {
		UserBean user=userDao.getUserProfile(userId);
		model.addAttribute("user",user);
		
		return "/admin/getUser";
	}
	
}
