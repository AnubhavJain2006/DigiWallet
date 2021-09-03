package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bean.PayeeBean;
import com.dao.PayeeDao;

@Controller
public class PayeeController {

	String activeLink;
	
	@Autowired
	AccountController accountController;

	@Autowired
	PayeeDao payeeDao;

	public boolean isPayeeExist(PayeeBean pBean) {
		PayeeBean payeeBean = null;
		payeeBean = payeeDao.getPayeeByName(pBean);
		return payeeBean == null ? false : true;
	}

	@GetMapping("/user/payee")
	@ResponseBody
	public List<PayeeBean> getUserPayee(HttpServletRequest req, HttpSession session) {
		if (accountController.isValidUser(req)) {
			int userId = accountController.getUserId(session);
			List<PayeeBean> listPayee = payeeDao.getUserPayee(userId);
			return listPayee;
		} else {
			return null;
		}
	}
	
	@GetMapping("/user/payees")
	public String getUserPayees(HttpServletRequest req,HttpSession session,Model model)
	{
		activeLink="payee";
		if (accountController.isValidUser(req)) {
			int userId = accountController.getUserId(session);
			List<PayeeBean> listPayee = payeeDao.getUserPayee(userId);
			model.addAttribute("payeeList",listPayee);
			model.addAttribute("activeLink",activeLink);
			return "/user/payee";
		} else {
			return "redirect:/login";
		}
	}
	
	@RequestMapping(value="/user/payeeDelete/{id}")
	public String deletePayee(@PathVariable("id") int payeeId,HttpServletRequest req)
	{
		if(accountController.isValidUser(req))
		{
			payeeDao.deletePayee(payeeId);
			return "redirect:/user/payees";
		}
		else {
			return "redirect:/login";
		}
	}
	
	@PostMapping("/user/updatePayee")
	public String updatePayee(PayeeBean payeeBean,HttpServletRequest req,HttpSession session) {
		System.out.println(payeeBean);
		if(accountController.isValidUser(req))
		{
			payeeDao.updatePayee(payeeBean);
			return "redirect:/user/payees";
		}
		else {
			return "redirect:/login";
		}
		
	}
	
	@PostMapping("/user/addPayee")
	public String addPayee(PayeeBean payeeBean,HttpServletRequest req,HttpSession session) {
		if(accountController.isValidUser(req))
		{
			payeeBean.setPayee_user_id(accountController.getUserId(session));
			payeeDao.insertUserPayee(payeeBean);
			return "redirect:/user/payees";
		}
		else {
			return "redirect:/login";
		}
	}
	
}
