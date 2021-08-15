package com.bean;

import org.springframework.stereotype.Component;

@Component
public class CategoryBean {
	private int category_id;
	private int category_user_id;
	private String category_name;
	private String category_type;

	public CategoryBean() {
	}

	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}

	public int getCategory_user_id() {
		return category_user_id;
	}

	public void setCategory_user_id(int category_user_id) {
		this.category_user_id = category_user_id;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	public String getCategory_type() {
		return category_type;
	}

	public void setCategory_type(String category_type) {
		this.category_type = category_type;
	}

}
