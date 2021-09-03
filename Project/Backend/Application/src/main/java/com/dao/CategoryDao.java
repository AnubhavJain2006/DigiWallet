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

	public List<CategoryBean> getUserCategory(int userId) {
		List<CategoryBean> categoryBeanList = stmt.query(
				"select category_id, category_name,category_type from category_master where category_user_id = ? and category_isDeleted = 0 ",
				new BeanPropertyRowMapper<CategoryBean>(CategoryBean.class), userId);
		return categoryBeanList;
	}

	public List<CategoryBean> getUserCategoryExpense(int userId) {
		List<CategoryBean> categoryBeanList = stmt.query(
				"select category_id, category_name from category_master where category_type = 'EXPENSE' and category_user_id = ? and category_isDeleted = 0 ",
				new BeanPropertyRowMapper<CategoryBean>(CategoryBean.class), userId);
		return categoryBeanList;
	}

	public int addUserCategoryExpense(int userId, String categoryName) {
		try {
			CategoryBean cbean = null;
			try {
				cbean = stmt.queryForObject(
						"select * from category_master where category_user_id = ? and category_name = ? ",
						new Object[] { userId, categoryName },
						new BeanPropertyRowMapper<CategoryBean>(CategoryBean.class));
			} catch (Exception e) {
			}
			if (cbean == null) {
				int rowAffected = stmt.update(
						"insert into category_master (category_user_id,category_name,category_type) values(?,?,?)",
						userId, categoryName, "EXPENSE");
				try {
					CategoryBean categoryBean = stmt.queryForObject(
							"select * from category_master where category_user_id = " + userId
									+ " and category_name = '" + categoryName + "'",
							new BeanPropertyRowMapper<CategoryBean>(CategoryBean.class));
					return categoryBean.getCategory_id();
				} catch (Exception e1) {
					e1.printStackTrace();
					System.out.println("Error in getting categoryBean object ");
				}
			} else {
				try {
					stmt.update(
							"update category_master set category_isDeleted = 0 where category_user_id = ? and category_id = ? ",
							cbean.getCategory_user_id(), cbean.getCategory_id());
//					stmt.update("update sub_category set sub_category_isDeleted = 0 where category_id = ? ",
//							cbean.getCategory_id());

				} catch (Exception e) {
					e.printStackTrace();
				}
				return cbean.getCategory_id();
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println("Error in inserting user cartegory to category_master table");
		}
		return -1;
	}

	public int addUserCategoryIncome(int userId, String categoryName) {
		try {
			CategoryBean cbean = null;
			try {
				cbean = stmt.queryForObject(
						"select * from category_master where category_user_id = ? and category_name = ? ",
						new Object[] { userId, categoryName },
						new BeanPropertyRowMapper<CategoryBean>(CategoryBean.class));
			} catch (Exception e) {
			}
			if (cbean == null) {
				int rowAffected = stmt.update(
						"insert into category_master (category_user_id,category_name,category_type) values(?,?,?)",
						userId, categoryName, "INCOME");
				try {
					CategoryBean categoryBean = stmt.queryForObject(
							"select * from category_master where category_user_id = " + userId
									+ " and category_name = '" + categoryName + "'",
							new BeanPropertyRowMapper<CategoryBean>(CategoryBean.class));
					return categoryBean.getCategory_id();
				} catch (Exception e1) {
					e1.printStackTrace();
					System.out.println("Error in getting categoryBean object ");
				}
			} else {
				try {
					stmt.update(
							"update category_master set category_isDeleted = 0 where category_user_id = ? and category_id = ? ",
							cbean.getCategory_user_id(), cbean.getCategory_id());
//					stmt.update("update sub_category set sub_category_isDeleted = 0 where category_id = ? ",
//							cbean.getCategory_id());

				} catch (Exception e) {
					e.printStackTrace();
				}
				return cbean.getCategory_id();
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println("Error in inserting user cartegory to category_master table");
		}
		return -1;
	}

	public List<CategoryBean> getUserCategoryIncome(int userId) {
		List<CategoryBean> categoryBeanList = stmt.query(
				"select category_id, category_name from category_master where category_type = 'INCOME' and category_user_id = ? and category_isDeleted = 0 ",
				new BeanPropertyRowMapper<CategoryBean>(CategoryBean.class), userId);
		return categoryBeanList;
	}

	public boolean deleteUserCategory(int userId, int categoryId) {
		int rowAffectted = 0;
		try {
			rowAffectted = stmt.update(
					"update category_master set category_isDeleted = 1 where category_user_id = ? and category_id = ? ",
					userId, categoryId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rowAffectted == 0 ? false : true;
	}

	public boolean updateCategory(int userId, CategoryBean categoryBean) {
		int rowAffectted = 0;
		try {
			rowAffectted = stmt.update(
					"update category_master set category_name = ? where category_user_id = ? and category_id = ? ",
					categoryBean.getCategory_name(), userId, categoryBean.getCategory_id());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rowAffectted == 0 ? false : true;
	}
}
