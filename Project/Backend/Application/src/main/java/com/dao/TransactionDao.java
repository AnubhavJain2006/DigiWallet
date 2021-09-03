package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
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
				"select account_id, account_name,account_amount from account_master where account_user_id = ?",
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
						tbean.getTrans_image(), "ACTIVE", 0 , tbean.getTrans_payee_id() };

				// define SQL types of the arguments
				int[] types = new int[] { Types.INTEGER, Types.VARCHAR, Types.TIMESTAMP, Types.INTEGER, Types.INTEGER,
						Types.INTEGER, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR,
						Types.INTEGER ,Types.INTEGER };

				try {
					rowAffectedForAccount = stmt.update(
							"update account_master set account_amount = account_amount - ? where account_id = ?",
							Double.parseDouble(tbean.getTrans_amount()), tbean.getTrans_account_id());

					rowAffected = stmt.update("insert into trans_master(trans_user_id ,trans_type ,trans_date ,trans_account_id ,trans_category_id ,trans_sub_category_id ,trans_amount ,trans_note ,trans_description ,trans_image ,trans_status ,trans_isDeleted , trans_payee_id) values(?,?,?,?,?,?,?,?,?,?,?,?,?)", params,
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

	public boolean addIncomeTransaction(TransactionBean tbean) {
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
//			here if condition is true because we don't need to check account balance when we add money to it
			if (true) {
				// define query arguments
				Object[] params = new Object[] { tbean.getTrnas_user_id(), "INCOME", tbean.getTrans_date(),
						tbean.getTrans_account_id(), tbean.getTrans_category_id(), tbean.getTrans_sub_category_id(),
						tbean.getTrans_amount(), tbean.getTrans_note(), tbean.getTrans_description(),
						tbean.getTrans_image(), "ACTIVE", 0 ,  tbean.getTrans_payee_id() };

				// define SQL types of the arguments
				int[] types = new int[] { Types.INTEGER, Types.VARCHAR, Types.TIMESTAMP, Types.INTEGER, Types.INTEGER,
						Types.INTEGER, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR,
						Types.INTEGER , Types.INTEGER};

				try {
					rowAffectedForAccount = stmt.update(
							"update account_master set account_amount = account_amount + ? where account_id = ?",
							Double.parseDouble(tbean.getTrans_amount()), tbean.getTrans_account_id());

					rowAffected = stmt.update("insert into trans_master(trans_user_id ,trans_type ,trans_date ,trans_account_id ,trans_category_id ,trans_sub_category_id ,trans_amount ,trans_note ,trans_description ,trans_image ,trans_status ,trans_isDeleted, trans_payee_id) values(?,?,?,?,?,?,?,?,?,?,?,?,?)", params,
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

	public List<TransactionBean> getAllExpense(int id) {
		List<TransactionBean> list = new ArrayList<TransactionBean>();
		try {
			list = stmt.query(
					"select tm.trans_date,tm.trans_id, payee.payee_name ,tm.trans_account_id, am.account_name, tm.trans_category_id,tm.trans_type, cm.category_name, tm.trans_sub_category_id, sc.sub_category_name, tm.trans_amount, tm.trans_note from trans_master as tm inner join account_master as am on tm.trans_account_id = am.account_id inner join category_master as cm on tm.trans_category_id = cm.category_id inner join payee_master as payee on tm.trans_payee_id=payee.payee_id inner join sub_category as sc on tm.trans_sub_category_id = sc.sub_category_id where tm.trans_user_id=? order by tm.trans_date desc",
					new Object[] { id }, new TransactionBeanRowMapper());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;

	}
	public List<TransactionBean> getAllExpense() {
		List<TransactionBean> list = new ArrayList<TransactionBean>();
		System.out.println("in all exp");
		try {
			list = stmt.query(
					"select tm.trans_date, tm.trans_id, tm.trans_account_id, am.account_name, tm.trans_category_id,tm.trans_user_id,user_master.user_name ,tm.trans_type, cm.category_name, tm.trans_sub_category_id, sc.sub_category_name, tm.trans_amount, tm.trans_note from trans_master as tm inner join account_master as am on tm.trans_account_id = am.account_id inner join user_master on user_master.user_id=tm.trans_user_id inner join category_master as cm on tm.trans_category_id = cm.category_id inner join sub_category as sc on tm.trans_sub_category_id = sc.sub_category_id order by tm.trans_date desc", new TransactionBeanRowMapper1());
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;

	}

	class TransactionBeanRowMapper implements RowMapper<TransactionBean> {
		public TransactionBean mapRow(ResultSet rs, int rowNum) throws SQLException {
			// account_name,category_name,subcategory_name,
			TransactionBean tbean = new TransactionBean();
//			System.out.println(rs.getInt("trans_id"));
			tbean.setTrans_payee_name(rs.getString("payee_name"));
			tbean.setTrans_id(rs.getInt("trans_id"));
			tbean.setTrans_account_id(rs.getInt("trans_account_id"));
			tbean.setTrans_date(rs.getTimestamp("trans_date"));
			tbean.setTrans_type(rs.getString("trans_type"));
			tbean.setTrans_category_id(rs.getInt("trans_category_id"));
			tbean.setTrans_sub_category_id(rs.getInt("trans_sub_category_id"));
			tbean.setTrans_amount(rs.getString("trans_amount"));
			tbean.setTrans_note(rs.getString("trans_note"));
			tbean.setTrans_account_name(rs.getString("account_name"));
			tbean.setTrans_category_name(rs.getString("category_name"));
			tbean.setTrans_sub_category_name(rs.getString("sub_category_name"));
			
			return tbean;

		}

	}

	class TransactionBeanRowMapper1 implements RowMapper<TransactionBean> {
		public TransactionBean mapRow(ResultSet rs, int rowNum) throws SQLException {
			// account_name,category_name,subcategory_name,
			TransactionBean tbean = new TransactionBean();
//			System.out.println(rs.getInt("trans_id"));
			tbean.setTrans_id(rs.getInt("trans_id"));
			tbean.setTrans_user_id(rs.getInt("trans_user_id"));
			tbean.setTrans_account_id(rs.getInt("trans_account_id"));
			tbean.setTrans_date(rs.getTimestamp("trans_date"));
			tbean.setTrans_type(rs.getString("trans_type"));
			tbean.setTrans_category_id(rs.getInt("trans_category_id"));
			tbean.setTrans_sub_category_id(rs.getInt("trans_sub_category_id"));
			tbean.setTrans_amount(rs.getString("trans_amount"));
			tbean.setTrans_note(rs.getString("trans_note"));
			tbean.setTrans_account_name(rs.getString("account_name"));
			tbean.setTrans_category_name(rs.getString("category_name"));
			tbean.setTrans_sub_category_name(rs.getString("sub_category_name"));
			tbean.setUser_name(rs.getString("user_name"));
			return tbean;

		}

	}
	public int deleteTransaction(int trans_id) {
		// TODO Auto-generated method stub
		TransactionBean tbean=(TransactionBean) stmt.queryForObject("select trans_id,trans_amount,trans_account_id,trans_type from trans_master where trans_id=?",new TransRowMapper(),new Object[] {trans_id});
		int rowsAffected = stmt.update("delete from trans_master where trans_id=?", trans_id);
		if(tbean.getTrans_type().equals("EXPENSE"))
		{
			double amount=Double.parseDouble(tbean.getTrans_amount());
			stmt.update("update account_master set account_amount=account_amount + ? where account_id=?",amount,tbean.getTrans_account_id());
		}
		else
		{
			double amount=Double.parseDouble(tbean.getTrans_amount());
			stmt.update("update account_master set account_amount=account_amount - ? where account_id=?",amount,tbean.getTrans_account_id());
		}
		return rowsAffected;
	}
	class TransRowMapper implements RowMapper<TransactionBean>{

		public TransactionBean mapRow(ResultSet rs, int rowNum) throws SQLException {
			TransactionBean tbean=new TransactionBean();
			tbean.setTrans_id(rs.getInt(1));
			tbean.setTrans_amount(rs.getString(2));
			tbean.setTrans_account_id(rs.getInt(3));
			tbean.setTrans_type(rs.getString(4));
			return tbean;
		}
	}
	

	public boolean updateExpence(TransactionBean tbean) {
		TransactionBean oldbean = (TransactionBean) stmt.queryForObject("select trans_id,trans_amount,trans_account_id,trans_type  from trans_master where trans_id=?",new TransRowMapper(),new Object[] {tbean.getTrans_id()});
		int affectedRows=0;
		System.out.println(tbean+" In method "+oldbean);
		affectedRows = stmt.update("update trans_master set trans_date =? , trans_account_id =?, trans_category_id=?,trans_sub_category_id=?, trans_amount=?,trans_note=?,trans_description=?,trans_image=?, trans_updatedAt = GETDATE() where trans_id =  ? ",tbean.getTrans_date(),tbean.getTrans_account_id(),tbean.getTrans_category_id(),tbean.getTrans_sub_category_id(),
				tbean.getTrans_amount(),tbean.getTrans_note(),tbean.getTrans_description(),tbean.getTrans_image(),tbean.getTrans_id());
		
		double amount=Double.parseDouble(oldbean.getTrans_amount())-Double.parseDouble(tbean.getTrans_amount());
		if(oldbean.getTrans_type().equals("EXPENSE")) {
			stmt.update("update account_master set account_amount=account_amount + ? where account_id=?",amount,tbean.getTrans_account_id());
		}
		else
		{
			
			stmt.update("update account_master set account_amount=account_amount - ? where account_id=?",amount,tbean.getTrans_account_id());
		}
		System.out.println("in mathod up");
		if(affectedRows > 0) {
			return true;
		}
		return false;
	}
}
