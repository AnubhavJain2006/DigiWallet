package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.AccountBean;

@Repository
public class TransactionDao {
	@Autowired
	JdbcTemplate stmt;

	public List<AccountBean> getUserAccounts(int userId) {
		List<AccountBean> accountBeanList = stmt.query(
				"select account_id, account_name from account_master where account_user_id = ?",
				new BeanPropertyRowMapper<AccountBean>(AccountBean.class), userId);
		return accountBeanList;
	}
}
