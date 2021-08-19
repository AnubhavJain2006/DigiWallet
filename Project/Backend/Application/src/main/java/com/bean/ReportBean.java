package com.bean;

import org.springframework.beans.factory.annotation.Autowired;

public class ReportBean {

	@Autowired
	TransactionBean transactionBean;

	String month;

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public TransactionBean getTransactionBean() {
		return transactionBean;
	}

	public void setTransactionBean(TransactionBean transactionBean) {
		this.transactionBean = transactionBean;
	}
}
