package com.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bean.AccountBean;
import com.bean.UserBean;
import com.dao.AccountDao;

@Controller
public class AccountController {
	@Autowired
	AccountDao dao;
	String activeLink;
	
	boolean deleteFlag=false;
	boolean updateFlag=false;
	boolean insertFlag=false;

	public int getUserId(HttpSession session) {
		return ((UserBean) session.getAttribute("user")).getUser_id();
	}

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

	@RequestMapping(value = "/user/account")
	public String Account(HttpServletRequest req,Model model, AccountBean abean,HttpSession session) {
		if (isValidUser(req)) {
			activeLink="account";
			model.addAttribute("deleteFlag",deleteFlag);
			model.addAttribute("activeLink",activeLink);
			model.addAttribute("updateFlag",updateFlag);
			model.addAttribute("insertFlag",insertFlag);
			deleteFlag=false;
			updateFlag=false;
			insertFlag=false;
			int beanId = getUserId(session);
			List<AccountBean> account_grp_list = dao.getGroupId();
			List<AccountBean> account_bean_list = dao.getAllAccount(beanId);
//			System.out.println(account_grp_list.size()+" 1st "+account_grp_list.get(0).getAccount_description());
			model.addAttribute("abean", abean);
			model.addAttribute("account_grp_list", account_grp_list);
			model.addAttribute("account_bean_list", account_bean_list);
			return "/user/account";
		}
		else {
			return "redirect:/login";
		}
	}

	@RequestMapping(value = "/user/saveAccount", method = RequestMethod.POST)
	public String saveAccount(@Valid @ModelAttribute("abean") AccountBean abean, BindingResult result, Model model,HttpServletRequest req,HttpSession session) {
//		System.out.println(abean.getAccount_user_id() + " " + abean.getAccount_group_id() + " "
//				+ abean.getAccount_name() + " " + abean.getAccount_amount() + " " + abean.getAccount_description());
		if(isValidUser(req))
		{
			int beanId = getUserId(session);
			List<AccountBean> account_bean_list = dao.getAllAccount(beanId);
			System.out.println(result.hasErrors());
			if (result.hasErrors()) {
				model.addAttribute("abean", abean);
				List<AccountBean> account_grp_list = dao.getGroupId();
				model.addAttribute("account_grp_list", account_grp_list);
				model.addAttribute("account_bean_list", account_bean_list);
				return "/user/account";

			} else {
//				int beanId = getUserId(session);
				insertFlag= dao.accInsert(abean,beanId);
//				model.addAttribute("flag", flag);
				return "redirect:/user/account";

			}
		}
		else {
			return "redirect:/login";
		}
	}
	@RequestMapping(value="/user/delete/{id}")
	public String delete(HttpSession session,@PathVariable("id") int acc_id)
	{
		int userId=getUserId(session);
		dao.deleteAccount(userId,acc_id);
		deleteFlag=true;
		return "redirect:/user/account";
	}
	
	@RequestMapping(value="/user/updateAccount",method = RequestMethod.POST)
	public String updateAccount(@Valid @ModelAttribute("abean") AccountBean abean, BindingResult result,Model model,HttpSession session)
	{
		int userId=getUserId(session);
		boolean flag=dao.updateAccount(userId,abean);
		List<AccountBean> account_grp_list = dao.getGroupId();
		model.addAttribute("account_grp_list", account_grp_list);
		updateFlag=true;
		return "redirect:/user/account";
	}
}
