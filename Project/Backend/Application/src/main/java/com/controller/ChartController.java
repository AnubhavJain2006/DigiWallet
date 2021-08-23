package com.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dao.ChartDao;

@Controller
public class ChartController {
	String activeLink;
	@Autowired
	ChartDao chartDao;

	@Autowired
	UserController userController;

	@RequestMapping(value = "/user/chart")
	public String displayChart(Model model, HttpServletRequest req, HttpSession session) {
		if (userController.isValidUser(req)) {
			activeLink="chart";
			model.addAttribute("activeLink",activeLink);
			int userId = (new AccountController()).getUserId(session);
			System.out.println(userId);
			String dates = new Timestamp(new Date().getTime()).toString();
			model.addAttribute("obj", chartDao.getExpByDate(userId, "EXPENSE", dates));

			return "/user/chart";

		} else {
			return "redirect:/login";
		}

	}

	@RequestMapping(value = "/user/chart/year/{trans_type}/{year}", method = RequestMethod.GET)
	public void chartByYear(Model model, HttpServletRequest request, HttpSession session, HttpServletResponse resp,
			@PathVariable String trans_type, @PathVariable int year) throws Exception {
		int userId = (new AccountController()).getUserId(session);
		System.out.println(userId);
		Object data = chartDao.getExpByYear(userId, trans_type, year);
		model.addAttribute("obj", data);
		System.out.println(data);
		resp.getWriter().println(data);
	}

	@RequestMapping(value = "/user/chart/month/{trans_type}/{month}/{year}", method = RequestMethod.GET)
	public void chartByMonth(Model model, HttpServletRequest request, HttpSession session,
			@PathVariable String trans_type, @PathVariable int month, @PathVariable int year, HttpServletResponse resp)
			throws Exception {
		int userId = (new AccountController()).getUserId(session);
		System.out.println(userId);
		Object data = chartDao.getExpByMonth(userId, trans_type, month, year);
//		model.addAttribute("obj", chartDao.getExpByMonth(userId, "EXPENSE", month, year));
		System.out.println(data);
		resp.getWriter().println(data);
	}

	@RequestMapping(value = "/user/chart/week/{trans_type}/{startDate}/{endDate}", method = RequestMethod.GET)
	public void chartByWeek(Model model, HttpServletRequest request, HttpSession session,
			@PathVariable String trans_type, @PathVariable long startDate, @PathVariable long endDate,
			HttpServletResponse resp) throws IOException {
		int userId = (new AccountController()).getUserId(session);
		System.out.println(userId);
		String startDateS = new Timestamp(startDate).toString();
		String endDateS = new Timestamp(endDate).toString();
		// int week = 5; //Integer.valueOf(request.getParameter("month"));
		Object data = chartDao.getExpByWeek(userId, trans_type, startDateS, endDateS);
		System.out.println(data);
		resp.getWriter().println(data);
	}

	@RequestMapping(value = "/user/chart/date/{trans_type}/{startDate}", method = RequestMethod.GET)
	public void chartByDate(Model model, HttpServletRequest request, HttpSession session, HttpServletResponse resp,
			@PathVariable String trans_type, @PathVariable long startDate) throws IOException {
		int userId = (new AccountController()).getUserId(session);
		System.out.println(userId);
		String date = new Timestamp(startDate).toString();
		// int week = 5; //Integer.valueOf(request.getParameter("month"));
		Object data = chartDao.getExpByDate(userId, trans_type, date);
//		model.addAttribute("obj", chartDao.getExpByDate(userId, "EXPENSE", dates));
		System.out.println(data);
		resp.getWriter().println(data);

	}
}
