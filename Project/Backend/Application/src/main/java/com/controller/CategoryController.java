package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bean.TransactionBean;
import com.bean.UserBean;
import com.dao.CategoryDao;
import com.dao.SubCategoryDao;

@Controller
public class CategoryController {

	@Autowired
	CategoryDao categoryDao;

	@Autowired
	SubCategoryDao subCategoryDao;

	@Autowired
	AccountController accountController;

	@Autowired
	TransactionController transactionController;

	@RequestMapping(value = "/user/addCategory", method = RequestMethod.POST)
	public String addCategory(HttpServletRequest req, HttpSession session, Model model) {
		if (accountController.isValidUser(req)) {
			int userId = ((UserBean) session.getAttribute("user")).getUser_id();
			String categoryName = req.getParameter("categoryInput");
			String subCategoryName = req.getParameter("subCategoryInput");
			int categoryId = categoryDao.addUserCategoryExpense(userId, categoryName);

			if (categoryId > 0) {
				System.out.println("User Category added");
				if (subCategoryName != null) {
					boolean isSubCategoryAdded = subCategoryDao.addUserSubCategory(categoryId, subCategoryName);
					System.out.println("User Sub Category " + (isSubCategoryAdded ? "inserted" : "not inserted"));
				} else {
					System.out.println("Sub category id not provided");
				}
			} else {
				System.out.println("User Category not added");
			}
			return transactionController.transaction(req, new TransactionBean(), model, session);
		} else {
			return "redirect:/login";
		}
	}
}
