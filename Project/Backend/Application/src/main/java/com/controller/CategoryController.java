package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bean.CategoryBean;
import com.bean.TransactionBean;
import com.bean.UserBean;
import com.dao.CategoryDao;
import com.dao.SubCategoryDao;

@Controller
public class CategoryController {
	String activeLink = "category";
	@Autowired
	CategoryDao categoryDao;

	@Autowired
	SubCategoryDao subCategoryDao;

	@Autowired
	AccountController accountController;

	@Autowired
	TransactionController transactionController;

	@RequestMapping(value = "/user/category")
	public String category(HttpServletRequest req, Model model, HttpSession session) {
		if (accountController.isValidUser(req)) {
			int userId = accountController.getUserId(session);
			model.addAttribute("activeLink", activeLink);
			List<CategoryBean> categoryList = categoryDao.getUserCategory(userId);

			model.addAttribute("categoryList", categoryList);
			return "/user/category";

		} else {
			return "redirect:/login";
		}
	}

	@RequestMapping(value = "/user/category/update")
	public String updateCategory(HttpServletRequest req, CategoryBean categoryBean, Model model, HttpSession session) {
		if (accountController.isValidUser(req)) {
			int userId = accountController.getUserId(session);
			categoryDao.updateCategory(userId, categoryBean);
			return "redirect:/user/category";

		} else {
			return "redirect:/login";
		}
	}

	@RequestMapping(value = "/user/category/delete/{id}")
	public String deleteCategory(HttpServletRequest req, Model model, HttpSession session,
			@PathVariable("id") int categoryId) {
		if (accountController.isValidUser(req)) {
			int userId = accountController.getUserId(session);
			categoryDao.deleteUserCategory(userId, categoryId);
			return "redirect:/user/category";

		} else {
			return "redirect:/login";
		}
	}

	@RequestMapping(value = "/user/addExpenseCategory", method = RequestMethod.POST)
	public String addExpenseCategory(HttpServletRequest req, HttpSession session, Model model) {
		if (accountController.isValidUser(req)) {
			int userId = ((UserBean) session.getAttribute("user")).getUser_id();
			String categoryName = req.getParameter("categoryInput");
			String subCategoryName = req.getParameter("subCategoryInput");
			int categoryId = categoryDao.addUserCategoryExpense(userId, categoryName);

			if (categoryId > 0) {

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

	@RequestMapping(value = "/user/addIncomeCategory", method = RequestMethod.POST)
	public String addIncomeCategory(HttpServletRequest req, HttpSession session, Model model) {
		if (accountController.isValidUser(req)) {
			int userId = ((UserBean) session.getAttribute("user")).getUser_id();
			String categoryName = req.getParameter("categoryInput");
			String subCategoryName = req.getParameter("subCategoryInput");
			int categoryId = categoryDao.addUserCategoryIncome(userId, categoryName);

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

	@GetMapping("/user/getCategory/{type}")
	@ResponseBody
	public List<CategoryBean> getUserCategory(@PathVariable("type") String catType, HttpSession session,
			HttpServletRequest req) {
		if (accountController.isValidUser(req)) {
			int userId = accountController.getUserId(session);
			if (catType.equals("Expense")) {
				System.out.println("inside cat");
				return categoryDao.getUserCategoryExpense(userId);
			}
			if (catType.equals("Income")) {
				return categoryDao.getUserCategoryIncome(userId);
			}
		}
		return null;
	}
}
