package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
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

	public JSONObject getExpByYear(int id,String type , int year) {
		List<Map<String, Double>> list =stmt.query("select  DATENAME(month, trans_date) as months , sum(trans_amount) as amount  from trans_master group by trans_user_id, DATENAME(year, trans_date), DATENAME(month, trans_date),trans_type having trans_type = ? and trans_user_id = ? AND DATENAME(year, trans_date) = ? ",new Object[] {type,id,year}, new RowMapper<Map<String, Double>>(){
			
			public Map<String, Double> mapRow(ResultSet rs, int rowNum) throws SQLException {
				Map<String, Double> l = new HashMap<String, Double>();
				l.put(rs.getString("months"), rs.getDouble("amount"));
				return l;
			}
		});
		
		
		JSONObject obj=new JSONObject();
		for(Map<String, Double> l : list) {
			obj.putAll(l);
		}

		System.out.println("\nIn Json String");
		System.out.println(obj.toJSONString());
		return obj;
	}
}
