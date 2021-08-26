package com.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bean.AccountBean;
import com.bean.TransactionBean;
import com.bean.UserBean;
import com.dao.TransactionDao;
import com.dao.UserDao;
import com.service.EmailService;

@Controller
public class UserController {
	@Autowired
	UserDao dao;
	@Autowired
	TransactionDao transactionDao;
	
	String activeLink;
	int rowsAffected = 10;

//=======================================================================================
	@RequestMapping(value = "/")
	public String home(Model model, @ModelAttribute("user") UserBean user) {
		return "Login";
	}

	@RequestMapping(value = "/login")
	public String login(Model model, @ModelAttribute("user") UserBean user) {
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
			if (rowsAffected == 5){
				model.addAttribute("result", rowsAffected);
				return "Login";
			}
//			System.out.println("SaveUser"+rowsAffected);
			return "redirect:/login";
		}
	}

	@RequestMapping(value = "/forgotpassword")
	public String forgotpassword() {
		return "forgotPassword";
	}

	@RequestMapping(value = "/verifyEmail")
	public String verifyEmail(HttpSession session, @RequestParam("email") String emailId) {
		Random random = new Random();

		boolean flag = dao.checkEmail(emailId);
		if (flag) {
			int otp = random.nextInt(900000) + 100000;
			System.out.println(otp);
			EmailService email = new EmailService();
			String msg = "Dear User," + otp + " is your one time password(OTP).PLease enter the OTP to proceed";
			email.setTo(emailId);
			email.setUsermessage(msg);
			session.setAttribute("otp", otp);
			session.setAttribute("email", emailId);
			email.SendMail();

			return "verifyOtp";
		}
		return "NoUserFound";
	}

	@RequestMapping(value = "/verifyOtp")
	public String verifyOtp(Model model, HttpSession session, @RequestParam("otp") int userOtp) {
		int otp = (Integer) session.getAttribute("otp");
//		System.out.println("Session otp value" + otp);
//		System.out.println("UserOtp" + userOtp);
		if (otp == userOtp) {
			return "changePassword";
		} else {
//			 model.addAttribute("flag",true);
			return "verifyOtp";

		}
	}

	@RequestMapping(value = "/changePassword", method = RequestMethod.POST)
	public String changePassword(HttpSession session, Model model, @RequestParam("password") String password) {
		String regex = "^(?=.*[0-9])" + "(?=.*[a-z])(?=.*[A-Z])" + "(?=.*[@#$%^&+=])" + "(?=\\S+$).{8,20}$";
		Pattern p = Pattern.compile(regex);
		Matcher m = p.matcher(password);
		String email = (String) session.getAttribute("email");

		if (m.matches() && email != null) {
			rowsAffected = 4;
			dao.updatePassword(password, email);
			model.addAttribute("result", rowsAffected);
//			rowsAffected = 10;
			model.addAttribute("user", new UserBean());
			return "redirect:/login";
		} else {
			boolean flag = true;
			model.addAttribute("flag", flag);
			return "changePassword";
		}
	}

//==================================================================================================================

	public boolean isValidUser(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
//		System.out.println(session.getAttribute("user"));
//		UserBean user = (UserBean) session.getAttribute("user");
		if ((UserBean) session.getAttribute("user") != null) {
			return true;
		} else {
			return false;
		}
	}

	@RequestMapping(value = "/checkUser", method = RequestMethod.POST)
	public String checkUser(@Valid @ModelAttribute("user") UserBean user, BindingResult result, HttpSession session,
			Model model) {
		/* System.out.println("HEllo"); */
		UserBean userbean = dao.checkUser(user);
		if (userbean != null) {
			if(userbean.getUser_status().equals("DEACTIVE"))
			{
				rowsAffected=7;
				return "redirect:/login";
			}
			session.setAttribute("user", userbean);
			switch (Integer.parseInt(userbean.getUser_role())) {
			case 1:
				System.out.println(((UserBean) session.getAttribute("user")).getUser_name());
				return "redirect:/admin/dashboard";

			case 2:
				System.out.println(((UserBean) session.getAttribute("user")).getUser_name());
				return "redirect:/user/dashboard";

			}
		} else {
			rowsAffected = 3;
			model.addAttribute("result", rowsAffected);
			model.addAttribute("user", user);
			rowsAffected = 10;
			return "Login";
		}
//		System.out.println("Called...");
		return "Login";
	}

	@RequestMapping(value = "/user/header")
	public String header() {
		return "/user/header";

	}

	@RequestMapping(value = "/user/dashboard")
	public String UserDashboard(HttpServletRequest req, Model model, HttpSession session) {
		activeLink = "dashboard";
//		HttpSession session=req.getSession(false);
		model.addAttribute("user", new UserBean());
		model.addAttribute("activeLink", activeLink);
		if (isValidUser(req)) {
			int userId = ((UserBean) session.getAttribute("user")).getUser_id();
			List<AccountBean> userAccountList = dao.UserAccountList(userId);
			List<Integer> userDashboardDetails = dao.getUserDashboardDetail(userId);
			ArrayList<TransactionBean> allTransactionList=(ArrayList<TransactionBean>) transactionDao.getAllExpense(userId);
//			for (Integer i : dao.getUserDashboardDetail(userId)) {
//				System.out.println(i);
//			}
			if(allTransactionList.size()>5)
				model.addAttribute("allTransactionList",allTransactionList.subList(0, 5));
			else
				model.addAttribute("allTransactionList",allTransactionList);
			model.addAttribute("userDashboardDetails", userDashboardDetails);
			model.addAttribute("userAccountList", userAccountList);
			return "/user/dashboard";
		} else
			return "redirect:/login";
	}

	@RequestMapping(value = "user/logout")
	public String logout(HttpServletRequest req, HttpSession session, Model model) {
		session.invalidate();
		session = req.getSession(false);
		model.addAttribute("user", new UserBean());
		return "redirect:/login";
	}

//==============================================
	@RequestMapping(value = "/user/profile")
	public String userProfile(HttpServletRequest req, HttpSession session, Model model, UserBean user) {
		if (isValidUser(req)) {
			UserBean ubean = dao.getUserProfile(((UserBean) session.getAttribute("user")).getUser_id());
			user.setUser_id(((UserBean) session.getAttribute("user")).getUser_id());
			model.addAttribute("user", ubean);
//			model.addAttribute("user_id",((UserBean)session.getAttribute("user")).getUser_id());
			return "/user/profile";
		} else {
			return "redirect:/login";
		}
	}

	@RequestMapping(value = "/user/updateProfile", method = RequestMethod.POST)
	public String updateProfile(@Valid @ModelAttribute("user") UserBean user, BindingResult result,
			HttpSession session) {
//		System.out.println("aaya");
		if (result.hasErrors()) {
			System.out.println("error");
			return "/user/profile";
		} else {
			user.setUser_id(((UserBean) session.getAttribute("user")).getUser_id());
			dao.updateUserProfile(user);
		}
		return "redirect:/user/profile";
	}

}
