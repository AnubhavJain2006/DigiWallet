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
				"select tm.trans_date,tm.trans_id ,tm.trans_account_id, am.account_name, tm.trans_category_id,tm.trans_type, cm.category_name, tm.trans_sub_category_id, sc.sub_category_name, tm.trans_amount, tm.trans_note from trans_master as tm inner join account_master as am on tm.trans_account_id = am.account_id inner join category_master as cm on tm.trans_category_id = cm.category_id inner join sub_category as sc on tm.trans_sub_category_id = sc.sub_category_id where tm.trans_user_id=? and trans_date between ? and ? order by tm.trans_date desc",
				new Object[] { userId, startDate, endDate }, new ReportBeanRowMapper());

		return allTransaction;
	}

	public List<ReportBean> getUserTransactionByPeriod(int userId, String startDate, String endDate) {
		System.out.println(startDate);
		System.out.println(endDate);
		List<ReportBean> allTransaction = stmt.query(
				"select tm.trans_date,tm.trans_id ,tm.trans_account_id, am.account_name, tm.trans_category_id,tm.trans_type, cm.category_name, tm.trans_sub_category_id, sc.sub_category_name, tm.trans_amount, tm.trans_note from trans_master as tm inner join account_master as am on tm.trans_account_id = am.account_id inner join category_master as cm on tm.trans_category_id = cm.category_id inner join sub_category as sc on tm.trans_sub_category_id = sc.sub_category_id where tm.trans_user_id=? and trans_date between ? and ? order by tm.trans_date desc",
				new Object[] { userId, startDate, endDate }, new ReportBeanRowMapper());

		return allTransaction;
	}

	public List<ReportBean> getUserTransactionByMonth(int userId, int month, int year) {
		System.out.println(month);
		System.out.println(year);
		List<ReportBean> allTransaction = stmt.query(
				"select tm.trans_date,tm.trans_id ,tm.trans_account_id, am.account_name, tm.trans_category_id,tm.trans_type, cm.category_name, tm.trans_sub_category_id, sc.sub_category_name, tm.trans_amount, tm.trans_note from trans_master as tm inner join account_master as am on tm.trans_account_id = am.account_id inner join category_master as cm on tm.trans_category_id = cm.category_id inner join sub_category as sc on tm.trans_sub_category_id = sc.sub_category_id where tm.trans_user_id= ? and  MONTH(trans_date) = ? AND YEAR(trans_date) = ? order by tm.trans_date desc",
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
}
