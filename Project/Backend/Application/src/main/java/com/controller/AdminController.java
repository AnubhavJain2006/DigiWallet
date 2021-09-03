package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.bean.AccountBean;
import com.bean.CategoryBean;
import com.bean.SubCategoryBean;
import com.bean.TransactionBean;
import com.bean.UserBean;
import com.dao.AccountDao;
import com.dao.CategoryDao;
import com.dao.SubCategoryDao;
import com.dao.TransactionDao;
import com.dao.UserDao;

@Controller
public class AdminController {

	String activeLink;
	@Autowired
	UserDao userDao;
	@Autowired
	AccountDao accountDao;
	@Autowired
	CategoryDao categoryDao;
	
	@Autowired
	SubCategoryDao subCategoryDao;
	
	@Autowired
	TransactionDao transactionDao;

	public String urlCheck(String str) throws MalformedURLException {

		URL url = new URL(str);
		String arr[] = url.getPath().split("/");
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
			int userRoleId = 2;
			activeLink = "user";
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
	public String saveUser(Model model, @Valid @ModelAttribute("user") UserBean user, BindingResult result,
			HttpServletRequest req) {

		if (isValidUser(req)) {
			if (result.hasErrors()) {
				System.out.println("Has Error" + result.hasErrors());
				model.addAttribute("user", user);
			} else {
				System.out.println(user.getUser_role());
				userDao.insert(user);
			}
			return "redirect:/admin/allUser";
		}
		return "redirect:/login";
	}

	@RequestMapping(value = "/admin/deleteUser/{userId}")
	public String deleteUser(@PathVariable("userId") int userId, HttpServletRequest req) {
//		System.out.println(userId);		
		if (isValidUser(req)) {
			int result = userDao.deleteUser(userId);
			if (activeLink.equals("admin"))
				return "redirect:/admin/allAdmin";
			else
				return "redirect:/admin/allUser";
		} else
			return "redirect:/login";

	}

	@RequestMapping(value = "/admin/updateUser", method = RequestMethod.POST)
	public String updateUser(UserBean user) {
		int result = userDao.updateUser(user);
//		return "redirect:/admin/allUser";
		if (activeLink.equals("admin"))
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
			HttpSession session, HttpServletRequest req) {
		if (isValidUser(req)) {
			if (result.hasErrors()) {
//				System.out.println("error");
				return "/admin/profile";
			} else {
				user.setUser_id(((UserBean) session.getAttribute("user")).getUser_id());
				userDao.updateUserProfile(user);
			}
			return "redirect:/admin/profile";
		} else
			return "redirect:/login";
	}

	@RequestMapping(value = "/admin/allAdmin")
	public String showAdmin(Model model, HttpServletRequest req) {
		if (isValidUser(req)) {
			int userRoleId = 1;
			activeLink = "admin";
			model.addAttribute("user", new UserBean());
			ArrayList<UserBean> DataList = (ArrayList<UserBean>) userDao.getAllUserRecords(userRoleId);
			model.addAttribute("DataList", DataList);
			return "/admin/allAdmin";
		} else
			return "redirect:/login";

	}

	@RequestMapping(value = "/admin/getUser")
	public String getUser() {
		return "redirect:/admin/getUser";
	}

	@RequestMapping(value = "/admin/getUser/{userId}")
	public String getUser(@PathVariable("userId") int userId, Model model, HttpServletRequest req) {
		if (isValidUser(req)) {
			UserBean user = userDao.getUserProfile(userId);
			model.addAttribute("user", user);
			return "/admin/getUser";
		} else {
			return "redirect:/login";
		}
	}

	@RequestMapping(value = "/admin/transaction")
	public String getAllTransaction(Model model, TransactionBean tbean, HttpServletRequest req) {
		if (isValidUser(req)) {
			
			List<TransactionBean> allExpenseList = transactionDao.getAllExpense();
			System.out.println(allExpenseList);
			model.addAttribute("allExpenseList", allExpenseList);
			model.addAttribute("tbean", tbean);
			return "/admin/transaction";
		} else {
			return "redirect:/login";
		}
	}
	
	@RequestMapping(value = "/admin/getUserCategory", method = RequestMethod.GET)
	public void getUserCategory(HttpServletRequest req, HttpServletResponse res) throws IOException {
		System.out.println(" user Id is"+req.getParameter("userId"));
		int userId = Integer.parseInt(req.getParameter("userId"));
		List<CategoryBean> userCategoryList = categoryDao.getUserCategoryExpense(userId);
		String data = "";
//		<option selected>Open this select menu</option>
//		<option value="1">One</option>
//		<option value="2">Two</option>
//		<option value="3">Three</option>
		for (CategoryBean categoryBean : userCategoryList) {
			data += "<option value=" + categoryBean.getCategory_id() + ">"
					+ categoryBean.getCategory_name() + "</option>";
		}
		PrintWriter out = res.getWriter();
		out.println(data);
	}
	
	@RequestMapping(value = "/admin/getUserCategoryIncome", method = RequestMethod.GET)
	public void getUserCategoryIncome(HttpServletRequest req, HttpServletResponse res) throws IOException {
		System.out.println(" user Id is"+req.getParameter("userId"));
		int userId = Integer.parseInt(req.getParameter("userId"));
		List<CategoryBean> userCategoryList = categoryDao.getUserCategoryIncome(userId);
		String data = "";
//		<option selected>Open this select menu</option>
//		<option value="1">One</option>
//		<option value="2">Two</option>
//		<option value="3">Three</option>
		for (CategoryBean categoryBean : userCategoryList) {
			data += "<option value=" + categoryBean.getCategory_id() + ">"
					+ categoryBean.getCategory_name() + "</option>";
		}
		PrintWriter out = res.getWriter();
		out.println(data);
	}
	
	@RequestMapping(value = "/admin/getUserSubCategory", method = RequestMethod.GET)
	public void getUserSubCategory(HttpServletRequest req, HttpServletResponse res) throws IOException {
		System.out.println(" categoryId Id is"+req.getParameter("categoryId"));
		int categoryId = Integer.parseInt(req.getParameter("categoryId"));
		List<SubCategoryBean> userSubCategoryList = subCategoryDao.getUserSubCategoryByCategoryId(categoryId);
		String data = "";
//		<option selected>Open this select menu</option>
//		<option value="1">One</option>
//		<option value="2">Two</option>
//		<option value="3">Three</option>
		for (SubCategoryBean categoryBean : userSubCategoryList) {
			data += "<option value=" + categoryBean.getSub_category_id() + ">"
					+ categoryBean.getSub_category_name() + "</option>";
		}
		PrintWriter out = res.getWriter();
		out.println(data);
	}
	
	@RequestMapping(value = "/admin/getUserAccount", method = RequestMethod.GET)
	public void getUserAccount(HttpServletRequest req, HttpServletResponse res) throws IOException {
		System.out.println(" user Id is"+req.getParameter("userId"));
		int userId = Integer.parseInt(req.getParameter("userId"));
		List<AccountBean> userAccountList = accountDao.getUserAccounts(userId);
		String data = "";
//		<option selected>Open this select menu</option>
//		<option value="1">One</option>
//		<option value="2">Two</option>
//		<option value="3">Three</option>
		for (AccountBean categoryBean : userAccountList) {
			data += "<option value=" + categoryBean.getAccount_id() + ">"
					+ categoryBean.getAccount_name() + "</option>";
		}
		PrintWriter out = res.getWriter();
		out.println(data);
	}
}
