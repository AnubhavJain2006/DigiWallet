
package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormatSymbols;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class ChartDao {

	@Autowired
	JdbcTemplate stmt;

	// expense by given Year
	public JSONObject getExpByYear(int id, String type, int year) {
		List<Map<String, Object>> list = stmt.query(
				"select  DATENAME(MONTH, trans_date) as MONTHS, sum(trans_amount) as amount  "
						+ "from trans_master where year(trans_date) = ? and trans_user_id = ? and trans_type=? group by DATENAME(MONTH, trans_date)",
				new Object[] { year, id, type }, new RowMapper<Map<String, Object>>() {

					public Map<String, Object> mapRow(ResultSet rs, int rowNum) throws SQLException {
						Map<String, Object> l = new HashMap<String, Object>();
						l.put(rs.getString("months"), rs.getDouble("amount"));
						return l;
					}
				});

		JSONObject obj = new JSONObject();
		for (Map<String, Object> m : list) {
			for (String key : m.keySet()) {
				obj.put(key, m.get(key));
			}
		}

		obj.put("label", "Expanse by Year : " + year);

		System.out.println("\nIn Json String");
		System.out.println(obj.toJSONString());
		return obj;
	}

	// expense by given month
	public JSONObject getExpByMonth(int id, String type, int month, int year) {
		@SuppressWarnings("deprecation")
		List<Map<String, Object>> list = stmt.query(
				"select DATEPART(DAY, trans_date) as days , sum(trans_amount) as amount from trans_master where trans_user_id = ? and trans_type = ? and DATEPART(YEAR, trans_date) = ? and DATEPART(MONTH, trans_date) = ? group by DATEPART(DAY, trans_date)  order by days desc",
				new Object[] { id, type, year, month }, new RowMapper<Map<String, Object>>() {

					public Map<String, Object> mapRow(ResultSet rs, int rowNum) throws SQLException {
						Map<String, Object> l = new HashMap<String, Object>();
						l.put(rs.getString("days"), rs.getDouble("amount"));
						return l;
					}
				});

		JSONObject obj = new JSONObject();
		int first10 = 0, secound10 = 0, last10 = 0;
		for (Map<String, Object> m : list) {
			// for(){
			for (String key : m.keySet()) {
				obj.put(key, m.get(key));
			}
		}

		obj.put("label", "Expanse by Month : " + new DateFormatSymbols().getMonths()[month - 1]);

		System.out.println("\nIn Json String");
		System.out.println(obj.toJSONString());
		return obj;
	}

	// expenses by week
	public Object getExpByWeek(int id, String type, String startDate, String endDate) {
		@SuppressWarnings("deprecation")
		List<Map<String, Object>> list = stmt.query(
				"select  CONVERT(DATE,trans_date) as dates , sum(trans_amount) as amount " + "from trans_master "
						+ " group by trans_user_id, DATEPART(MONTH, trans_date), DATEPART(DAY, trans_date),trans_type,CONVERT(DATE,trans_date) "
						+ " having trans_type = ? and trans_user_id = ? AND (CONVERT(DATE,trans_date) between CONVERT(DATE, ?) and CONVERT(DATE,?)) ",
				new Object[] { type, id, startDate, endDate }, new RowMapper<Map<String, Object>>() {

					public Map<String, Object> mapRow(ResultSet rs, int rowNum) throws SQLException {
						Map<String, Object> l = new HashMap<String, Object>();
						l.put(rs.getString("dates"), rs.getDouble("amount"));
						return l;
					}
				});

		JSONObject obj = new JSONObject();
		for (Map<String, Object> l : list) {
			obj.putAll(l);
		}

		obj.put("label", "Expanse by week : " + startDate + " to " + endDate);

		System.out.println("\nIn Json String");
		System.out.println(obj.toJSONString());
		return obj;
	}

	public Object getExpByDate(int id, String type, String date) {
		@SuppressWarnings("deprecation")
		List<Map<String, Object>> list = stmt.query(
				"select  cm.category_name as category , sum(trans_amount) as amount "
						+ " from trans_master join category_master cm on (trans_category_id = cm.category_id) "
						+ " where trans_type = ? and (CONVERT(DATE,trans_date) = CONVERT(DATE,?)) "
						+ " group by trans_user_id, cm.category_name " + "having  trans_user_id = ?   ",
				new Object[] { type, date, id }, new RowMapper<Map<String, Object>>() {

					public Map<String, Object> mapRow(ResultSet rs, int rowNum) throws SQLException {
						Map<String, Object> l = new HashMap<String, Object>();
						l.put(rs.getString("category"), rs.getDouble("amount"));
						return l;
					}
				});

		JSONObject obj = new JSONObject();
		for (Map<String, Object> l : list) {
			obj.putAll(l);
		}
		String[] abc = date.split(" ");
		obj.put("label", "Expanse by date : " + abc[0]);

		System.out.println("\nIn Json String");
		System.out.println(obj.toJSONString());
		return obj;
	}
}
