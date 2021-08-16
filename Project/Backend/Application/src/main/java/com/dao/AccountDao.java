package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.bean.AccountBean;

@Repository
public class AccountDao {
	@Autowired
	JdbcTemplate stmt;

	public boolean accInsert(AccountBean abean, int id) {
		boolean flag = false;
		try {
			stmt.update(
					"insert into account_master(account_user_id,account_group_id,account_name,account_amount,account_description) values(?,?,?,?,? )",
					id, abean.getAccount_group_id(), abean.getAccount_name(), abean.getAccount_amount(),
					abean.getAccount_description());
			flag = true;
			return flag;
		} catch (Exception e) {
			flag = false;
			return flag;
		}

	}

	public List<AccountBean> getGroupId() {
		List<AccountBean> list = stmt.query("select * from account_group", new AccountRowMapper());
		return list;
	}

	// customer row mapper
	class AccountRowMapper implements RowMapper<AccountBean> {

		public AccountBean mapRow(ResultSet rs, int rowNum) throws SQLException {
			AccountBean abean = new AccountBean();
			abean.setAccount_group_id(rs.getInt(1));
			abean.setAccount_group_name(rs.getString(2));
			return abean;
		}

	}

	public List<AccountBean> getAllAccount(int id) {
		List<AccountBean> beans = stmt.query(
				"select am.account_id,am.account_name,am.account_group_id, am.account_amount, am.account_description ,ag.account_group_name from account_master am join account_group ag on am.account_group_id=ag.account_group_id where am.account_user_id="
						+ id + " order by account_id desc",
				new BeanPropertyRowMapper<AccountBean>(AccountBean.class));
		if (!beans.isEmpty()) {
			return beans;
		}
		return null;
	}

	public List<AccountBean> getAccountByAccountId(int accountId) {
		List<AccountBean> beans = stmt.query(
				"select am.account_id,am.account_name,am.account_group_id, am.account_amount, am.account_description ,ag.account_group_name from account_master am join account_group ag on am.account_group_id=ag.account_group_id where am.account_id="
						+ accountId + " order by account_id desc",
				new BeanPropertyRowMapper<AccountBean>(AccountBean.class));
		if (!beans.isEmpty()) {
			return beans;
		}
		return null;
	}

	public void deleteAccount(int userId, int acc_id) {
		// TODO Auto-generated method stub

		int acc_delete = stmt.update("delete from account_master where account_user_id=? and account_id=?", userId,
				acc_id);
		System.out.println(acc_delete + "deleted");
	}

	public boolean updateAccount(int userId, AccountBean abean) {
		boolean flag = false;
		stmt.update(
				"update account_master set account_group_id=?,account_name=?,account_amount=?,account_description=? where account_id=? and account_user_id=?",
				abean.getAccount_group_id(), abean.getAccount_name(), abean.getAccount_amount(),
				abean.getAccount_description(), abean.getAccount_id(), userId);
		if (flag)
			System.out.println("Updated");
		return flag;
	}

}
