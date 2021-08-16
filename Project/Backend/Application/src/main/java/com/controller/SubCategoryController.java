package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bean.SubCategoryBean;
import com.bean.TransactionBean;
import com.dao.SubCategoryDao;

@Controller
public class SubCategoryController {

	@Autowired
	SubCategoryDao subCategoryDao;

	@Autowired
	AccountController accountController;

	@Autowired
	TransactionController transactionController;

	@RequestMapping(value = "/user/getUserSubCategory", method = RequestMethod.GET)
	public void getUserSubCategory(HttpServletRequest req, HttpServletResponse res) throws IOException {
		int categoryId = Integer.parseInt(req.getParameter("categoryId"));
		List<SubCategoryBean> userSubCategoryList = subCategoryDao.getUserSubCategoryByCategoryId(categoryId);
		String data = "";
//		<option selected>Open this select menu</option>
//		<option value="1">One</option>
//		<option value="2">Two</option>
//		<option value="3">Three</option>
		for (SubCategoryBean subCategoryBean : userSubCategoryList) {
			data += "<option value=" + subCategoryBean.getSub_category_id() + ">"
					+ subCategoryBean.getSub_category_name() + "</option>";
		}
		PrintWriter out = res.getWriter();
		out.println(data);
	}

	@RequestMapping(value = "/user/addUserSubCategory", method = RequestMethod.POST)
	public String addUserSubCategory(HttpServletRequest req, HttpSession session, Model model) {
		if (accountController.isValidUser(req)) {
			int categoryId = Integer.parseInt(req.getParameter("categoryId"));
			String subCategoryName = req.getParameter("subCategoryInput");
			boolean isSubCategoryAdded = subCategoryDao.addUserSubCategory(categoryId, subCategoryName);
			return transactionController.transaction(req, new TransactionBean(), model, session);
		} else {
			return "redirect:/login";
		}
	}
}
