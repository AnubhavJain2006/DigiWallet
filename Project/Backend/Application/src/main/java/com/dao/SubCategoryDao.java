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
				"select sub_category_id, sub_category_name from sub_category where category_id = ? and sub_category_isDeleted = 0",
				new BeanPropertyRowMapper<SubCategoryBean>(SubCategoryBean.class), categoryId);
		return subCategoryBeanList;
	}

	public boolean addUserSubCategory(int categoryId, String subCategoryName) {
		int rowAffected = 0;
		try {
			rowAffected = stmt.update("insert into sub_category (category_id,sub_category_name) values(?,?)",
					categoryId, subCategoryName);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error in insert of sub category");
		}
		return rowAffected == 0 ? false : true;
	}

	public boolean deleteSubCategory(int subCatgoryId) {
		int rowAffected = 0;
		try {
			rowAffected = stmt.update("update sub_category set sub_category_isDeleted = 1 where sub_category_id = ? ",
					subCatgoryId);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error in insert of sub category");
		}
		return rowAffected == 0 ? false : true;
	}

	public boolean updateSubCategory(SubCategoryBean scbean) {
		int rowAffected = 0;
		try {
			rowAffected = stmt.update("update sub_category set sub_category_name = ? where sub_category_id = ? ",
					scbean.getSub_category_name(), scbean.getSub_category_id());
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error in insert of sub category");
		}
		return rowAffected == 0 ? false : true;
	}
}
