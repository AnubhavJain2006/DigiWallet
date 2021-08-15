package com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bean.AccountBean;
import com.bean.CategoryBean;
import com.bean.UserBean;
import com.dao.CategoryDao;
import com.dao.TransactionDao;

@Controller
public class TransactionController {

	@Autowired
	TransactionDao transactionDao;

	@Autowired
	CategoryDao categoryDao;

	public int getUserId(HttpSession session) {
		return ((UserBean) session.getAttribute("user")).getUser_id();
	}

	@RequestMapping(value = "/user/transaction")
	public String transaction(Model model, HttpSession session) {
		int userId = getUserId(session);
		List<AccountBean> userAccountList = transactionDao.getUserAccounts(userId);
		model.addAttribute("account_list", userAccountList);
		List<CategoryBean> userCategoryList = categoryDao.getUserCategoryExpense(userId);
		model.addAttribute("category_list", userCategoryList);
		return "user/transaction";
	}
}