package com.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.json.simple.JSONObject;
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
import com.bean.PayeeBean;
import com.bean.TransactionBean;
import com.bean.UserBean;
import com.dao.CategoryDao;
import com.dao.PayeeDao;
import com.dao.TransactionDao;
import com.google.gson.Gson;
import com.util.MyTime;

@Controller
public class TransactionController {
	int rowsAffected;

	@Autowired
	PayeeDao payeeDao;

	@Autowired
	TransactionDao transactionDao;

	@Autowired
	CategoryDao categoryDao;

	@Autowired
	AccountController accountController;
	String activeLink;

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

	@RequestMapping(value = "/user/transaction")
	public String transaction(HttpServletRequest req, TransactionBean tbean, Model model, HttpSession session) {
		if (isValidUser(req)) {
			activeLink = "transaction";
			model.addAttribute("activeLink", activeLink);
			int userId = getUserId(session);
			model.addAttribute("tbean", tbean);
			List<AccountBean> userAccountList = transactionDao.getUserAccounts(userId);
			model.addAttribute("account_list", userAccountList);
//			JSONObject userAccountListInJson = new JSONObject();
//			for (AccountBean abean : userAccountList) {
//				userAccountListInJson.put(abean.getAccount_id(), abean);
//			}
//			model.addAttribute("account_list_json", userAccountListInJson.toJSONString());

			model.addAttribute("account_list_json", new Gson().toJson(userAccountList));
			List<CategoryBean> userExpenseCategoryList = categoryDao.getUserCategoryExpense(userId);
			model.addAttribute("expense_category_list", userExpenseCategoryList);
			List<CategoryBean> userIncomeCategoryList = categoryDao.getUserCategoryIncome(userId);
			model.addAttribute("income_category_list", userIncomeCategoryList);
			ArrayList<TransactionBean> list = getAllExpenses(session);
			System.out.println(list);
			model.addAttribute("allRecordsList", list);
			model.addAttribute("rowsAffected", rowsAffected);
		
			rowsAffected = 0;
			return "user/transaction";
		} else {
			return "redirect:/login";
		}
	}

	@RequestMapping(value = "/user/addExpenseTransaction", method = RequestMethod.POST)
	public String addExpenseTransaction(HttpServletRequest req, @Valid @ModelAttribute("tbean") TransactionBean tbean,
			BindingResult result, Model model, HttpSession session) {
		if (accountController.isValidUser(req)) {
			String transDate = req.getParameter("trans_date");
			try {
				Timestamp transTime = MyTime.toTimestampFromString(transDate);
				tbean.setTrans_date(transTime);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			tbean.setTrnas_user_id(accountController.getUserId(session));
//			code for payee insert or exist
			PayeeBean pBean = new PayeeBean(0, tbean.getTrans_user_id(), req.getParameter("payee_name"), 0, null, null);
			payeeDao.insertUserPayee(pBean);
			pBean = payeeDao.getPayeeByName(pBean);

			tbean.setTrans_payee_id(pBean.getPayee_id());
//			code end for payee insert or exist
			boolean addedTrans = transactionDao.addExpenseTransaction(tbean);
			System.out.println("addedTrans " + addedTrans);
			model.addAttribute("tbean", new TransactionBean());
			return "redirect:/user/transaction";
		} else {
			return "redirect:/login";
		}

	}

	@RequestMapping(value = "/user/addIncomeTransaction", method = RequestMethod.POST)
	public String addIncomeTransaction(HttpServletRequest req, @Valid @ModelAttribute("tbean") TransactionBean tbean,
			BindingResult result, Model model, HttpSession session) {
		if (accountController.isValidUser(req)) {
			String transDate = req.getParameter("trans_date");
			try {
				Timestamp transTime = MyTime.toTimestampFromString(transDate);
				tbean.setTrans_date(transTime);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				
				e.printStackTrace();
			}
			tbean.setTrnas_user_id(accountController.getUserId(session));
//			code for payee insert or exist
			PayeeBean pBean = new PayeeBean(0, tbean.getTrans_user_id(), req.getParameter("payee_name"), 0, null, null);
			payeeDao.insertUserPayee(pBean);
			pBean = payeeDao.getPayeeByName(pBean);

			tbean.setTrans_payee_id(pBean.getPayee_id());
//			code end for payee insert or exist
			boolean addedTrans = transactionDao.addIncomeTransaction(tbean);
			System.out.println("addedTrans " + addedTrans);
			model.addAttribute("tbean", new TransactionBean());
			return "redirect:/user/transaction";
		} else {
			return "redirect:/login";
		}

	}

	public ArrayList<TransactionBean> getAllExpenses(HttpSession session) {
		ArrayList<TransactionBean> allExpenseList = (ArrayList<TransactionBean>) transactionDao
				.getAllExpense(accountController.getUserId(session));
		return allExpenseList;
	}

	@RequestMapping(value = "/user/transaction/delete/{id}")
	public String deleteTransaction(@PathVariable("id") int trans_id) {
//		System.out.println(trans_id + " Transaction ID");
		int rowsAffected = transactionDao.deleteTransaction(trans_id);
		if (rowsAffected > 0) {
			rowsAffected = 1;
			System.out.println(rowsAffected);
		}
		return "redirect:/user/transaction";
	}

	@RequestMapping(value = "/admin/transaction/delete/{id}")
	public String adminDeleteTransaction(@PathVariable("id") int trans_id) {
//		System.out.println(trans_id + " Transaction ID");
		int rowsAffected = transactionDao.deleteTransaction(trans_id);
		if (rowsAffected > 0) {
			rowsAffected = 1;
			System.out.println(rowsAffected);
		}
		return "redirect:/admin/transaction";
	}

	@PostMapping(value = "/user/updateTransaction")
	public String updateTransaction(@Valid @ModelAttribute("tbean") TransactionBean tbean, BindingResult result,
			Model model, HttpSession session, HttpServletRequest request) {
		System.out.println("\n" + tbean.getTrans_id() + " abc Transaction ID");

		try {
			tbean.setTrans_date(MyTime.toTimestampFromString(request.getParameter("trans_date")));
		} catch (ParseException e) {

			e.printStackTrace();
		}

		int userId = getUserId(session);
		tbean.setTrans_user_id(userId);

		boolean flag = transactionDao.updateExpence(tbean);
		if (flag) {
			System.out.println(" flag of update : " + flag);
			model.addAttribute("msg", "update successfull");
		} else {
			System.out.println(" flag of update : " + flag);
			model.addAttribute("msg", "No any fields are updated!");
		}
		System.out.println("end of transup");
		return "redirect:/user/transaction";
	}

	@PostMapping(value = "/admin/updateTransaction")
	public String adminUpdateTransaction(@Valid @ModelAttribute("tbean") TransactionBean tbean, BindingResult result,
			Model model, HttpSession session, HttpServletRequest request) {
		System.out.println("\n" + tbean.getTrans_id() + " abc Transaction ID");

		try {
			tbean.setTrans_date(MyTime.toTimestampFromString(request.getParameter("trans_date")));
		} catch (ParseException e) {

			e.printStackTrace();
		}
		boolean flag = transactionDao.updateExpence(tbean);
		if (flag) {
			System.out.println(" flag of update : " + flag);
			model.addAttribute("msg", "update successfull");
		} else {
			System.out.println(" flag of update : " + flag);
			model.addAttribute("msg", "No any fields are updated!");
		}
		System.out.println("end of transup");
		return "redirect:/admin/transaction";
	}

}