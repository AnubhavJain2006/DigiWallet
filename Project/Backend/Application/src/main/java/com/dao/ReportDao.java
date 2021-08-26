package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.bean.ReportBean;
import com.bean.TransactionBean;

@Repository
public class ReportDao {
	@Autowired
	JdbcTemplate stmt;

	class ReportBeanRowMapper implements RowMapper<ReportBean> {
		public ReportBean mapRow(ResultSet rs, int rowNum) throws SQLException {
			// account_name,category_name,subcategory_name,
			ReportBean rbean = new ReportBean();
			try {
				rbean.setMonth(rs.getString("month"));
			} catch (Exception e) {
			}
			TransactionBean tbean = new TransactionBean();
//			System.out.println(rs.getInt("trans_id"));
			try {
				tbean.setDays(Integer.valueOf(rs.getString("days")));
			} catch (Exception e) {
			}
			try {
				tbean.setMonths(rs.getString("months"));
			} catch (Exception e) {
			}
			tbean.setTrans_id(rs.getInt("trans_id"));
			tbean.setTrans_account_id(rs.getInt("trans_account_id"));
			tbean.setTrans_date(rs.getTimestamp("trans_date"));
			tbean.setTrans_type(rs.getString("trans_type"));
			tbean.setTrans_category_id(rs.getInt("trans_category_id"));
			tbean.setTrans_sub_category_id(rs.getInt("trans_sub_category_id"));
			tbean.setTrans_amount(rs.getString("trans_amount"));
			tbean.setTrans_note(rs.getString("trans_note"));
			tbean.setTrans_account_name(rs.getString("account_name"));
			tbean.setTrans_category_name(rs.getString("category_name"));
			tbean.setTrans_sub_category_name(rs.getString("sub_category_name"));
			rbean.setTransactionBean(tbean);
			
			return rbean;
		}
	}

	public List<ReportBean> getUserTransactionByWeek(int userId, String startDate, String endDate) {
		List<ReportBean> allTransaction = stmt.query(
				"select tm.trans_date,tm.trans_id ,tm.trans_account_id, am.account_name, tm.trans_category_id,tm.trans_type, cm.category_name, tm.trans_sub_category_id, sc.sub_category_name, tm.trans_amount, tm.trans_note , DATEPART(day, tm.trans_date) as days from trans_master as tm inner join account_master as am on tm.trans_account_id = am.account_id inner join category_master as cm on tm.trans_category_id = cm.category_id inner join sub_category as sc on tm.trans_sub_category_id = sc.sub_category_id where tm.trans_user_id=? and trans_date between ? and ? order by tm.trans_date desc",
				new Object[] { userId, startDate, endDate }, new ReportBeanRowMapper());

		return allTransaction;
	}

	public List<ReportBean> getUserTransactionByPeriod(int userId, String startDate, String endDate) {
		System.out.println(startDate);
		System.out.println(endDate);
		List<ReportBean> allTransaction = stmt.query(
				"select tm.trans_date,tm.trans_id ,tm.trans_account_id, am.account_name, tm.trans_category_id,tm.trans_type, cm.category_name, tm.trans_sub_category_id, sc.sub_category_name, tm.trans_amount, tm.trans_note, DATEPART(day, tm.trans_date) as days from trans_master as tm inner join account_master as am on tm.trans_account_id = am.account_id inner join category_master as cm on tm.trans_category_id = cm.category_id inner join sub_category as sc on tm.trans_sub_category_id = sc.sub_category_id where tm.trans_user_id=? and trans_date between ? and ? order by tm.trans_date",
				new Object[] { userId, startDate, endDate }, new ReportBeanRowMapper());

		return allTransaction;
	}

	public List<ReportBean> getUserTransactionByMonth(int userId, int month, int year) {
		System.out.println(month);
		System.out.println(year);
		List<ReportBean> allTransaction = stmt.query(
				"select tm.trans_date,tm.trans_id ,tm.trans_account_id, am.account_name, tm.trans_category_id,tm.trans_type, cm.category_name, tm.trans_sub_category_id, sc.sub_category_name, tm.trans_amount, tm.trans_note, DATEPART(day, tm.trans_date) as days,DATENAME(MONTH, tm.trans_date) as months from trans_master as tm inner join account_master as am on tm.trans_account_id = am.account_id inner join category_master as cm on tm.trans_category_id = cm.category_id inner join sub_category as sc on tm.trans_sub_category_id = sc.sub_category_id where tm.trans_user_id= ? and  MONTH(trans_date) = ? AND YEAR(trans_date) = ? order by tm.trans_date desc",
				new Object[] { userId, month, year }, new ReportBeanRowMapper());

		return allTransaction;
	}

	public List<ReportBean> getUserTransactionByYear(int userId, int year) {

		System.out.println(year);
		List<ReportBean> allTransaction = stmt.query(
				"select DATENAME(MONTH, trans_date) as month,trans_date,tm.trans_id ,tm.trans_account_id, am.account_name, tm.trans_category_id,tm.trans_type, cm.category_name, tm.trans_sub_category_id, sc.sub_category_name, tm.trans_amount, tm.trans_note from trans_master as tm inner join account_master as am on tm.trans_account_id = am.account_id  inner join category_master as cm on tm.trans_category_id = cm.category_id inner join sub_category as sc on tm.trans_sub_category_id = sc.sub_category_id  where tm.trans_user_id=? AND YEAR(trans_date) = ? order by tm.trans_date asc ",
				new Object[] { userId, year }, new ReportBeanRowMapper());

		return allTransaction;
	}
	public List<TransactionBean> getTransMonthsByYear(int userId, int year) {

		System.out.println(year);
		List<TransactionBean> allMonthyData = stmt.query(
				"select DATEPART(MONTH, trans_date) as numMonth, DATENAME(MONTH, trans_date) as months, sum(trans_amount) as amount ,count(*) as nrow from trans_master where trans_user_id = ? and year(trans_date) = ?  group by DATENAME(MONTH, trans_date), DATEPART(MONTH, trans_date) order by numMonth",
				new Object[] { userId, year }, new RowMapper<TransactionBean>() {

					public TransactionBean mapRow(ResultSet rs, int rowNum) throws SQLException {
						TransactionBean tbean =  new TransactionBean();
						tbean.setMonths(rs.getString("months"));
						tbean.setNrow(Integer.valueOf(rs.getString("nrow"))+1);
						
						tbean.setAmount(rs.getString("amount"));
						System.out.println(tbean.getNrow() + " "+tbean.getMonths()+ " "+tbean.getAmount());
						return tbean;
					}
					
				});

		return allMonthyData;
	}
	
	
	public List<TransactionBean> getDaysTransByWeek(int userId, String startDate, String endDate) {
		List<TransactionBean> allweeklyList = stmt.query(
				"select  DATENAME(day, trans_date) as days, sum(trans_amount) as amount ,count(*) as nrow from trans_master where trans_user_id = ? and trans_date between ? and ?   group by DATENAME(day, trans_date) order by days ",
				new Object[] { userId, startDate, endDate }, new RowMapper<TransactionBean>() {

					public TransactionBean mapRow(ResultSet rs, int rowNum) throws SQLException {
						TransactionBean tbean =  new TransactionBean();
						tbean.setDays(Integer.valueOf(rs.getString("days")));
						tbean.setNrow(Integer.valueOf(rs.getString("nrow"))+1);
						
						tbean.setAmount(rs.getString("amount"));
						System.out.println(tbean.getNrow() + " "+tbean.getDays()+ " "+tbean.getAmount());
						return tbean;
					}
					
				});

		return allweeklyList;
	}
	
	public List<TransactionBean> getMonthsTransByPeriod(int userId, String startDate, String endDate) {
		System.out.println(startDate+" in perio");
		List<TransactionBean> allMonthList = stmt.query(
				"select  DATEPART(MONTH, trans_date) mno, DATENAME(MONTH, trans_date) as months, sum(trans_amount) as amount ,count(*) as nrow from trans_master where trans_user_id = ? and trans_date between ? and ?   group by DATENAME(MONTH, trans_date),DATEPART(MONTH, trans_date) order by mno ",
				new Object[] { userId, startDate, endDate }, new RowMapper<TransactionBean>() {

					public TransactionBean mapRow(ResultSet rs, int rowNum) throws SQLException {
						TransactionBean tbean =  new TransactionBean();
						tbean.setMonths(rs.getString("months"));
						tbean.setNrow(Integer.valueOf(rs.getString("nrow"))+1);
						
						tbean.setAmount(rs.getString("amount"));
						System.out.println(tbean.getNrow() + " "+tbean.getDays()+ " "+tbean.getAmount());
						return tbean;
					}
					
				});

		return allMonthList;
	}

	public List<TransactionBean> getTransDaysByMonths(int userId, int month, int year) {
		System.out.println(month);
		System.out.println(year);
		List<TransactionBean> allDaysByMonth = stmt.query(
				"select  DATENAME(day, trans_date) as days, sum(trans_amount) as amount ,count(*) as nrow from trans_master where trans_user_id = ? and DATEPART(month, trans_date)=?  and year(trans_date) = ?   group by DATENAME(day, trans_date) order by days",
				new Object[] { userId, month, year }, new RowMapper<TransactionBean>() {

					public TransactionBean mapRow(ResultSet rs, int rowNum) throws SQLException {
						TransactionBean tbean =  new TransactionBean();
						tbean.setDays(Integer.valueOf(rs.getString("days")));
						tbean.setNrow(Integer.valueOf(rs.getString("nrow"))+1);
						
						tbean.setAmount(rs.getString("amount"));
						System.out.println(tbean.getNrow() + " "+tbean.getDays()+ " "+tbean.getAmount());
						return tbean;
					}
					
				});

		return allDaysByMonth;
	}
}
