package com.dao;

import java.sql.Types;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.AccountBean;
import com.bean.TransactionBean;

@Repository
public class TransactionDao {
	@Autowired
	JdbcTemplate stmt;

	@Autowired
	AccountDao accountDao;

	public List<AccountBean> getUserAccounts(int userId) {
		List<AccountBean> accountBeanList = stmt.query(
				"select account_id, account_name from account_master where account_user_id = ?",
				new BeanPropertyRowMapper<AccountBean>(AccountBean.class), userId);
		return accountBeanList;
	}

	public boolean addExpenseTransaction(TransactionBean tbean) {
		int rowAffected = 0;
		int rowAffectedForAccount = 0;
		List<AccountBean> curAccountAsList = accountDao.getAccountByAccountId(tbean.getTrans_account_id());
		if (curAccountAsList.size() == 1) {
			System.out.println("Account found starting transaction ...");
			AccountBean curAccount = curAccountAsList.get(0);
			Double curAccountAmount = Double.parseDouble(curAccount.getAccount_amount());
			Double curTransactionAmount = Double.parseDouble(tbean.getTrans_amount());
			System.out.println("curAccountAmount : " + curAccountAmount);
			System.out.println("curTransactionAmount : " + curTransactionAmount);
			if (Double.parseDouble(curAccount.getAccount_amount()) >= Double.parseDouble(tbean.getTrans_amount())) {
				// define query arguments
				Object[] params = new Object[] { tbean.getTrnas_user_id(), "EXPENSE", tbean.getTrans_date(),
						tbean.getTrans_account_id(), tbean.getTrans_category_id(), tbean.getTrans_sub_category_id(),
						tbean.getTrans_amount(), tbean.getTrans_note(), tbean.getTrans_description(),
						tbean.getTrans_image(), "ACTIVE", 0 };

				// define SQL types of the arguments
				int[] types = new int[] { Types.INTEGER, Types.VARCHAR, Types.TIMESTAMP, Types.INTEGER, Types.INTEGER,
						Types.INTEGER, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR,
						Types.INTEGER };

				try {
					rowAffectedForAccount = stmt.update(
							"update account_master set account_amount = account_amount - ? where account_id = ?",
							Double.parseDouble(tbean.getTrans_amount()), tbean.getTrans_account_id());

					rowAffected = stmt.update("insert into trans_master values(?,?,?,?,?,?,?,?,?,?,?,?)", params,
							types);

				} catch (Exception e) {
					e.printStackTrace();
					System.out.print("error in inserting trans_master or ");
					System.out.println("error in update account balance");
				}

			}
		}
		return rowAffected > 0 && rowAffectedForAccount > 0 ? true : false;

	}
}
