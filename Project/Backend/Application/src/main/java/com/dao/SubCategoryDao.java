package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.SubCategoryBean;

@Repository
public class SubCategoryDao {
	@Autowired
	JdbcTemplate stmt;

	public List<SubCategoryBean> getUserSubCategoryByCategoryId(int categoryId) {
		List<SubCategoryBean> subCategoryBeanList = stmt.query(
				"select sub_category_id, sub_category_name from sub_category where category_id = ?",
				new BeanPropertyRowMapper<SubCategoryBean>(SubCategoryBean.class), categoryId);
		return subCategoryBeanList;
	}

	public boolean addUserSubCategory(int categoryId, String subCategoryName) {
		int rowAffected = 0;
		try {
			rowAffected = stmt.update("insert into sub_category values(?,?)", categoryId, subCategoryName);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error in insert of sub category");
		}
		return rowAffected == 0 ? false : true;
	}
}
