package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.CategoryBean;

@Repository
public class CategoryDao {
	@Autowired
	JdbcTemplate stmt;

	public List<CategoryBean> getUserCategoryExpense(int userId) {
		List<CategoryBean> categoryBeanList = stmt.query(
				"select category_id, category_name from category_master where category_type = 'EXPENSE' and category_user_id = ?",
				new BeanPropertyRowMapper<CategoryBean>(CategoryBean.class), userId);
		return categoryBeanList;
	}
}
