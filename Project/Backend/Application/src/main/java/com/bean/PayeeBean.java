package com.bean;

import java.sql.Timestamp;

public class PayeeBean {
	private int payee_id;
	private int payee_user_id;
	private String payee_name;
	private int payee_isDeleted;
	private Timestamp payee_createdAt;
	private Timestamp payee_updatedAt;

	public PayeeBean() {
	}

	@Override
	public String toString() {
		return "PayeeBean [payee_id=" + payee_id + ", payee_user_id=" + payee_user_id + ", payee_name=" + payee_name
				+ ", payee_isDeleted=" + payee_isDeleted + ", payee_createdAt=" + payee_createdAt + ", payee_updatedAt="
				+ payee_updatedAt + "]";
	}

	public int getPayee_id() {
		return payee_id;
	}

	public void setPayee_id(int payee_id) {
		this.payee_id = payee_id;
	}

	public int getPayee_user_id() {
		return payee_user_id;
	}

	public void setPayee_user_id(int payee_user_id) {
		this.payee_user_id = payee_user_id;
	}

	public String getPayee_name() {
		return payee_name;
	}

	public void setPayee_name(String payee_name) {
		this.payee_name = payee_name;
	}

	public int getPayee_isDeleted() {
		return payee_isDeleted;
	}

	public void setPayee_isDeleted(int payee_isDeleted) {
		this.payee_isDeleted = payee_isDeleted;
	}

	public Timestamp getPayee_createdAt() {
		return payee_createdAt;
	}

	public void setPayee_createdAt(Timestamp payee_createdAt) {
		this.payee_createdAt = payee_createdAt;
	}

	public Timestamp getPayee_updatedAt() {
		return payee_updatedAt;
	}

	public PayeeBean(int payee_id, int payee_user_id, String payee_name, int payee_isDeleted, Timestamp payee_createdAt,
			Timestamp payee_updatedAt) {
		super();
		this.payee_id = payee_id;
		this.payee_user_id = payee_user_id;
		this.payee_name = payee_name;
		this.payee_isDeleted = payee_isDeleted;
		this.payee_createdAt = payee_createdAt;
		this.payee_updatedAt = payee_updatedAt;
	}

	public void setPayee_updatedAt(Timestamp payee_updatedAt) {
		this.payee_updatedAt = payee_updatedAt;
	}
}
