package com.bean;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.springframework.stereotype.Component;

@Component
public class AccountBean {
	private int account_id;
	private int account_user_id;
	private int account_group_id;
	
	private String account_group_name;
	
	@NotNull(message="*It must be a valid name")
	private String account_name;
	
	@Pattern(regexp = "^[0-9]+$",message="*Amount should be a number")
	private String account_amount;
	
	private String account_description;
	
	public String getAccount_group_name() {
		return account_group_name;
	}
	public void setAccount_group_name(String account_group_name) {
		this.account_group_name = account_group_name;
	}

	
	public AccountBean() {
		
	}
	public AccountBean(int account_id, int account_user_id, int account_group_id, String account_name,
			String account_amount, String account_description) {
		super();
		this.account_id = account_id;
		this.account_user_id = account_user_id;
		this.account_group_id = account_group_id;
		this.account_name = account_name;
		this.account_amount = account_amount;
		this.account_description = account_description;
	}
	public int getAccount_id() {
		return account_id;
	}
	public void setAccount_id(int account_id) {
		this.account_id = account_id;
	}
	public int getAccount_user_id() {
		return account_user_id;
	}
	public void setAccount_user_id(int account_user_id) {
		this.account_user_id = account_user_id;
	}
	public int getAccount_group_id() {
		return account_group_id;
	}
	public void setAccount_group_id(int account_group_id) {
		this.account_group_id = account_group_id;
	}
	public String getAccount_name() {
		return account_name;
	}
	public void setAccount_name(String account_name) {
		this.account_name = account_name;
	}
	public String getAccount_amount() {
		return account_amount;
	}
	public void setAccount_amount(String account_amount) {
		this.account_amount = account_amount;
	}
	public String getAccount_description() {
		return account_description;
	}
	public void setAccount_description(String account_description) {
		this.account_description = account_description;
	}
	
	@Override
	public String toString() {
		return account_id+" "+account_name+" "+account_amount+" "+account_description;
	}

	
}
