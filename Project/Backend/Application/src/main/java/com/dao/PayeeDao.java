package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.PayeeBean;

@Repository
public class PayeeDao {

	@Autowired
	JdbcTemplate stmt;

	public List<PayeeBean> getUserPayee(int userId) {
		List<PayeeBean> list = null;
		try {
			list = stmt.query("select * from payee_master where payee_user_id = ? and payee_isDeleted=0",
					new BeanPropertyRowMapper<PayeeBean>(PayeeBean.class), userId);
		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
		return list;
	}

	public PayeeBean getPayeeByName(PayeeBean pBean) {
		try {
			return stmt.queryForObject("select * from payee_master where payee_user_id = ? and payee_name = ? ",
					new BeanPropertyRowMapper<PayeeBean>(PayeeBean.class), pBean.getPayee_user_id(),
					pBean.getPayee_name());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return null;
	}

	public boolean insertUserPayee(PayeeBean payee) {
		int rowAffected = 0;
		PayeeBean oldPayee = getPayeeByName(payee);
		if(oldPayee == null) {
			try {
				rowAffected = stmt.update("insert into payee_master (payee_user_id,payee_name) values(?,?) ",
						payee.getPayee_user_id(), payee.getPayee_name());
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		else {
			try {
				rowAffected = stmt.update("update payee_master set payee_isDeleted = 0 where payee_id = ?", oldPayee.getPayee_id());
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return rowAffected == 1 ? true : false;		
	}

	public void deletePayee(int payeeId) {

		try {
			stmt.update("update payee_master set payee_isDeleted=1 where payee_id=?", payeeId);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	public void updatePayee(PayeeBean payeeBean) {
		try {
			stmt.update("update payee_master set payee_name = ? ,payee_updatedAt = GETDATE() where payee_id=?",payeeBean.getPayee_name(),payeeBean.getPayee_id());
		}
		catch(Exception e) {
		System.out.println(e.getMessage());
		}
		
	}
}
