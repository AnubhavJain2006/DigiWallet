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
		try {
			SubCategoryBean scBean = null;
			try {
				scBean = stmt.queryForObject(
						"select TOP(1) * from sub_category where category_id = ? and sub_category_name = ?  ",
						new Object[] { categoryId, subCategoryName },
						new BeanPropertyRowMapper<SubCategoryBean>(SubCategoryBean.class));
				System.out.println("duplicate sub category found try to activating.. it");
			} catch (Exception e) {
				System.out.println("duplicate sub category not found try to inserting.. it");
			}
			if (scBean == null) {
//			try to insert new sub category
				int rowAffected = 0;
				try {
					rowAffected = stmt.update("insert into sub_category (category_id,sub_category_name) values(?,?)",
							categoryId, subCategoryName);
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("Error in insert of sub category");
				}
				return rowAffected == 0 ? false : true;
			} else {
//			try to activate sub category
				int rowAffected = 0;
				try {
					rowAffected = stmt.update(
							"update sub_category set sub_category_isDeleted = 0 where sub_category_id = ? ",
							scBean.getSub_category_id());
				} catch (Exception e) {
					e.printStackTrace();
				}
				return rowAffected == 0 ? false : true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error in add sub category");
			return false;
		}

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
			rowAffected = stmt.update(
					"update sub_category set sub_category_name = ? where sub_category_id = ? and sub_category_isDeleted = 0 ",
					scbean.getSub_category_name(), scbean.getSub_category_id());
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error in insert of sub category");
		}
		return rowAffected == 0 ? false : true;
	}
}
	