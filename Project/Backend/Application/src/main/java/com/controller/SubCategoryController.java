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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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

	@RequestMapping(value = "/user/getDisplaySubCategory/{subCatId}", method = RequestMethod.GET)
	public String getDisplaySubCategory(@PathVariable("subCatId") int subCatId, HttpSession session,
			HttpServletRequest req, Model model) {
		if (accountController.isValidUser(req)) {
			List<SubCategoryBean> subCategoryList = subCategoryDao.getUserSubCategoryByCategoryId(subCatId);
			model.addAttribute("subCategoryList", subCategoryList);
			return "user/displaySubCategory";
		} else {
			return "redirect:/login";
		}
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

	@RequestMapping(value = "/user/subcategory/delete/{subCatId}", method = RequestMethod.GET)
	@ResponseBody
	public Boolean deleteSubCategory(@PathVariable("subCatId") int subCatId, HttpServletRequest req) {
		if (accountController.isValidUser(req)) {
			return subCategoryDao.deleteSubCategory(subCatId);
		} else {
			return false;
		}
	}

	@RequestMapping(value = "/user/subcategory/update/{id}/{name}")
	@ResponseBody
	public Boolean updateSubCategory(@PathVariable("id") int catId, @PathVariable("name") String catName,
			HttpServletRequest req) {
		if (accountController.isValidUser(req)) {
			SubCategoryBean cbean = new SubCategoryBean();
			cbean.setSub_category_id(catId);
			cbean.setSub_category_name(catName);
			return subCategoryDao.updateSubCategory(cbean);
		} else {
			return false;
		}
	}

	@RequestMapping(value = "/user/addSubCategory", method = RequestMethod.POST)
	public String addSubCategory(HttpServletRequest req, HttpSession session, Model model) {
		if (accountController.isValidUser(req)) {
			int categoryId = Integer.parseInt(req.getParameter("categoryId"));
			System.out.println("category Id is " + categoryId);
			String subCategoryName = req.getParameter("subCategoryInputName");
			boolean isSubCategoryAdded = subCategoryDao.addUserSubCategory(categoryId, subCategoryName);
			if (isSubCategoryAdded) {
				System.out.println("sub category added");
			} else {
				System.out.println("sub not category added");
			}
			return "redirect:/user/category";
		} else {
			return "redirect:/login";
		}
	}

}
