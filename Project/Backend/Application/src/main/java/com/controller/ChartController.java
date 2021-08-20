package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dao.ChartDao;

@Controller
public class ChartController {

	@Autowired
	ChartDao chartDao;
	
	@RequestMapping(value = "/user/chart", method = RequestMethod.GET)
	public String chartByYear(Model model, HttpServletRequest request, HttpSession session) {
		int userId =( new AccountController()).getUserId(session);
		System.out.println(userId);
		int year = 1900; //Integer.valueOf(request.getParameter("year"));
		model.addAttribute("obj",chartDao.getExpByYear(userId,"EXPENSE",year));
		return "user/chart";
	}
}
