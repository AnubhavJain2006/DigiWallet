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

	public int addUserCategoryExpense(int userId, String categoryName) {
		try {
			int rowAffected = stmt.update("insert into category_master values(?,?,?)", userId, categoryName, "EXPENSE");
			try {
				CategoryBean categoryBean = stmt
						.queryForObject(
								"select * from category_master where category_user_id = " + userId
										+ " and category_name = '" + categoryName + "'",
								new BeanPropertyRowMapper<CategoryBean>(CategoryBean.class));
				return categoryBean.getCategory_id();
			} catch (Exception e1) {
				e1.printStackTrace();
				System.out.println("Error in getting categoryBean object ");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println("Error in inserting user cartegory to category_master table");
		}
		return -1;
	}
}
