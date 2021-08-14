package com.controller;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bean.AccountBean;
import com.bean.UserBean;
import com.dao.AccountDao;

@Controller
public class AccountController {
	@Autowired
	AccountDao dao;

	public int getUserId(HttpSession session) {
		return ((UserBean) session.getAttribute("user")).getUser_id();
	}

	public boolean isValidUser(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
//		System.out.println(session.getAttribute("user"));
		UserBean user = (UserBean) session.getAttribute("user");
		if ((UserBean) session.getAttribute("user") != null) {
			return true;
		} else {
			return false;
		}
	}

	@RequestMapping(value = "/user/account")
	public String Account(HttpServletRequest req,Model model, AccountBean abean) {
		if (isValidUser(req)) {
			List<AccountBean> account_grp_list = dao.getGroupId();
			model.addAttribute("abean", abean);
			model.addAttribute("account_grp_list", account_grp_list);
			return "/user/account";

		}
		else {
			return "redirect:/login";
		}
	}

	@RequestMapping(value = "/user/saveAccount", method = RequestMethod.POST)
	public String saveAccount(@ModelAttribute("abean") AccountBean abean, BindingResult result, Model model) {
//		System.out.println(abean.getAccount_user_id() + " " + abean.getAccount_group_id() + " "
//				+ abean.getAccount_name() + " " + abean.getAccount_amount() + " " + abean.getAccount_description());

		if (result.hasErrors()) {
			model.addAttribute("abean", abean);
			return "/user/account";

		} else {
			boolean flag = dao.accInsert(abean);
			model.addAttribute("flag", flag);
			return "redirect:/user/account";

		}
	}
}