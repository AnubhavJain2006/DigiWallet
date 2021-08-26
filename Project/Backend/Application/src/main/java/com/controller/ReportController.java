package com.controller;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bean.ReportBean;
import com.bean.TransactionBean;
import com.bean.UserBean;
import com.dao.ReportDao;

@Controller
public class ReportController {
	String activeLink = "report";

	@Autowired
	ReportDao reportDao;

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

	public int getUserId(HttpSession session) {
		return ((UserBean) session.getAttribute("user")).getUser_id();
	}

	@RequestMapping(value = "/user/report")
	public String userReport(HttpServletRequest req, Model model) {
		if (isValidUser(req)) {
			model.addAttribute("activeLink", activeLink);
			return "/user/report";
		} else {
			return "redirect:/login";
		}
	}

	@RequestMapping(value = "/user/report/getTransactionByWeek/{startDate}/{endDate}")
	public String getTransactionByWeek(HttpServletRequest req, HttpSession session, @PathVariable long startDate,
			@PathVariable long endDate, Model model) {
		if (isValidUser(req)) {
			int userId = getUserId(session);
			System.out.println(userId);
			UserBean user=(UserBean)session.getAttribute("user");
//		System.out.println("startDate is " + startDate);
//		System.out.println("endDate is " + endDate);
			Timestamp startTimestamp = new Timestamp(startDate);
			Timestamp endTimestamp = new Timestamp(endDate);
//		System.out.println("startTimestamp is " + startTimestamp);
//		System.out.println("endTimestamp is " + endTimestamp);

			List<ReportBean> transactionListByWeek = reportDao.getUserTransactionByWeek(userId,
					startTimestamp.toString(), endTimestamp.toString());
			
			System.out.println("transactionListByWeek list : "+transactionListByWeek);
			
			List<TransactionBean> weeklyList = reportDao.getDaysTransByWeek(userId, startTimestamp.toString(), endTimestamp.toString());
			System.out.println("weeklyList list : "+weeklyList);
			
			model.addAttribute("weeklyList", weeklyList);
//		for (ReportBean reportBean : allTransaction) {
//			System.out.println(reportBean.getTransactionBean());
//		}
			model.addAttribute("transactionListByWeek", transactionListByWeek);
			model.addAttribute("display", "week");
			model.addAttribute("userName",user.getUser_name());
			model.addAttribute("userEmail",user.getUser_email());
			return "/user/displayReport";
		} else {
			return "redirect:/login";
		}
	}

	@RequestMapping(value = "/user/report/getTransactionByPeriod/{startDate}/{endDate}")
	public String getTransactionByPeriod(HttpServletRequest req, HttpSession session, @PathVariable long startDate,
			@PathVariable long endDate, Model model) {
		if (isValidUser(req)) {
			int userId = getUserId(session);
			System.out.println(userId);
// 			System.out.println("startDate is " + startDate);
//			System.out.println("endDate is " + endDate);
			Timestamp startTimestamp = new Timestamp(startDate);
			Timestamp endTimestamp = new Timestamp(endDate+86400000);
			System.out.println("startTimestamp is " + startTimestamp);
			System.out.println("endTimestamp is " + endTimestamp);

			List<ReportBean> transactionListByPeriod = reportDao.getUserTransactionByPeriod(userId,
					startTimestamp.toString(), endTimestamp.toString());
//			for (ReportBean reportBean : allTransaction) {
//				System.out.println(reportBean.getTransactionBean());
//			}
//			List<TransactionBean> periodlyList = reportDao.getDaysTransByWeek(userId, startTimestamp.toString(), endTimestamp.toString());
//			System.out.println("periodlyList list : "+periodlyList);
//			
//			List<TransactionBean> periodlyMonthList = reportDao.getMonthsTransByPeriod(userId, startTimestamp.toString(), endTimestamp.toString());
//			System.out.println("periodlyMonthList list : "+periodlyMonthList);
//			
//			model.addAttribute("periodlyList", periodlyList);
//			model.addAttribute("periodlyMonthList", periodlyMonthList);
			UserBean user=(UserBean)session.getAttribute("user");
			model.addAttribute("userName",user.getUser_name());
			model.addAttribute("userEmail",user.getUser_email());
			model.addAttribute("transactionListByPeriod", transactionListByPeriod);
			model.addAttribute("display", "period");
			model.addAttribute("startDate", new java.sql.Date(startTimestamp.getTime()).toString());
			model.addAttribute("endDate", new java.sql.Date(endTimestamp.getTime()-86400000).toString());
			return "/user/displayReport";
		} else {
			return "redirect:/login";
		}

	}

	@RequestMapping(value = "/user/report/getTransactionByMonth/{month}/{year}")
	public String getTransactionByMonth(HttpServletRequest req, HttpSession session, @PathVariable int month,
			@PathVariable int year, Model model) {
		if (isValidUser(req)) {
			int userId = getUserId(session);

			String[] months = { "", "January", "February", "March", "April", "May", "June", "July", "August",
					"September", "October", "November", "December" };
			System.out.println("userMonth is " + month);
			System.out.println("userYear is " + year);

			List<ReportBean> transactionListByMonth = reportDao.getUserTransactionByMonth(userId, month, year);
//			for (ReportBean reportBean : allTransaction) {
//				System.out.println(reportBean.getTransactionBean());
//			}
			System.out.println("transactionListByMonth list : "+transactionListByMonth);
			List<TransactionBean> monthlyList = reportDao.getTransDaysByMonths(userId, month, year);
			System.out.println("monthlyList list : "+monthlyList);
			
			UserBean user=(UserBean)session.getAttribute("user");
			model.addAttribute("userName",user.getUser_name());
			model.addAttribute("userEmail",user.getUser_email());
			model.addAttribute("transactionListByMonth", transactionListByMonth);
			model.addAttribute("monthlyList",monthlyList);
			model.addAttribute("display", "month");
			model.addAttribute("month", months[month]);
			model.addAttribute("year", year);
			return "/user/displayReport";
		} else {
			return "redirect:/login";
		}
	}

	@RequestMapping(value = "/user/report/getTransactionByYear/{year}")
	public String getTransactionByYear(HttpServletRequest req, HttpSession session, @PathVariable int year,
			Model model) {
		if (isValidUser(req)) {
			int userId = getUserId(session);

			String[] months = { "", "January", "February", "March", "April", "May", "June", "July", "August",
					"September", "October", "November", "December" };
			System.out.println("userYear is " + year);

			List<ReportBean> transactionListByYear = reportDao.getUserTransactionByYear(userId, year);
			System.out.println("transactionListByYear list : "+transactionListByYear);
			List<TransactionBean> yearlyList = reportDao.getTransMonthsByYear(userId, year);
			System.out.println("yearlyList list : "+yearlyList);
//			for (ReportBean reportBean : allTransaction) {
//				System.out.println(reportBean.getTransactionBean());
//			}
			UserBean user=(UserBean)session.getAttribute("user");
			model.addAttribute("transactionListByYear", transactionListByYear);
			model.addAttribute("yearlyList",yearlyList);
			model.addAttribute("display", "annual");
//			model.addAttribute("month", months[month]);
			model.addAttribute("year", year);
			model.addAttribute("userName",user.getUser_name());
			model.addAttribute("userEmail",user.getUser_email());
			return "/user/displayReport";
		} else {
			return "redirect:/login";
		}

	}

}
