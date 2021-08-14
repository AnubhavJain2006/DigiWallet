package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.bean.AccountBean;

@Repository
public class AccountDao {
	@Autowired
	JdbcTemplate stmt;

	public boolean accInsert(AccountBean abean) {
		boolean flag=false;
		try {
			 stmt.update(
					"insert into account_master(account_user_id,account_group_id,account_name,account_amount,account_description) values(?,?,?,?,? )",
					abean.getAccount_user_id(), abean.getAccount_group_id(), abean.getAccount_name(),
					abean.getAccount_amount(), abean.getAccount_description());
			 flag=true;
			 return flag;
		} catch (Exception e) {
			flag=false;
			return flag;
		}
		
	}

	public List<AccountBean> getGroupId() {
		List<AccountBean> list=stmt.query("select * from account_group",new AccountRowMapper());
		return list;
	}
	//customer row mapper
	class AccountRowMapper implements RowMapper<AccountBean>{

		public AccountBean mapRow(ResultSet rs, int rowNum) throws SQLException {
			AccountBean abean=new AccountBean();
			abean.setAccount_group_id(rs.getInt(1));
			abean.setAccount_group_name(rs.getString(2));
			return abean;
		}
		
		
	}

}
