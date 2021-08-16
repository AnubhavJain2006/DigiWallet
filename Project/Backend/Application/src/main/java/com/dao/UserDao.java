package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.bean.AccountBean;
import com.bean.UserBean;


@Repository
public class UserDao {
	@Autowired
	JdbcTemplate stmt;
	public int insert(UserBean user)
	{
		int result=0;
		try {
		result=stmt.update("insert into user_master(user_name,user_email,user_password) values(?,?,?)",user.getUser_name(),user.getUser_email(),user.getUser_password());
		}
		catch(Exception e)
		{
			result=5;
		}
		return result;
	}
	public UserBean checkUser(UserBean user) {
		// TODO Auto-generated method stub
		UserBean  userbean=null;
		try {
			/*
			 * System.out.println(user.getUser_email());
			 * System.out.println(user.getUser_password());
			 */
		userbean=stmt.queryForObject("select * from user_master where user_email=? and user_password=?",new UserRowMapper(),new Object[] {user.getUser_email(),user.getUser_password()});
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
		return userbean;
	}
	
	class UserRowMapper implements RowMapper<UserBean>{

		public UserBean mapRow(ResultSet rs, int rowNum) throws SQLException {
			UserBean user=new UserBean();
			user.setUser_id(rs.getInt("user_id"));
			user.setUser_name(rs.getString("user_name"));
			user.setUser_email(rs.getString("user_email"));
			user.setUser_password(rs.getString("user_password"));
			user.setUser_role(rs.getString(9));
			return user;
		}
	}

	public boolean checkEmail(String emailId) {
		// TODO Auto-generated method stub
		UserBean userbean=null;
		boolean isFound=false;
		try {
			userbean=stmt.queryForObject("select * from user_master where user_email=?",new UserRowMapper(), new Object[] {emailId});
			if(userbean!=null)
			{
				isFound=true;
			}
		}
		catch(Exception e)
		{
			isFound=false;
			System.out.println(e.getMessage());
		}
		return isFound;
	}
	public int updatePassword(String password,String email) {
		// TODO Auto-generated method stub
		int result=0;
		try {
		result=stmt.update("update user_master set user_password=? where user_email=?",password,email);
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
//		if(result>0)
//			System.out.println("Hui gava");
		return result;
	}
	
	public List<AccountBean> UserAccountList(int id) {
		List<AccountBean> list=new ArrayList<AccountBean>();
		try {
	
			list=stmt.query("select top 5 am.account_name,am.account_amount ,ag.account_group_name from account_master as am ,account_group as ag where am.account_group_id=ag.account_group_id and am.account_user_id=? order by am.account_id desc",new Object[] {id}, new UserAccountMapper()); 
			
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		return list;
	}
	
	class UserAccountMapper implements RowMapper<AccountBean>{

		public AccountBean mapRow(ResultSet rs, int rowNum) throws SQLException {
			AccountBean abean=new AccountBean();
			abean.setAccount_name(rs.getString("account_name"));
			abean.setAccount_amount(rs.getString("account_amount"));
			abean.setAccount_group_name(rs.getString("account_group_name"));
			return abean;
		}
		
	}

	public UserBean getUserProfile(int user_id) {
		UserBean user=(UserBean) stmt.queryForObject("select * from user_master where user_id=?",new BeanPropertyRowMapper<UserBean>(UserBean.class),new Object[] {user_id});
		return user;
	}
	public int updateUserProfile(UserBean user) {
//		System.out.println("UserID"+user.getUser_id());
		int rowsAffected=stmt.update("update user_master set user_name=?,user_gender=?,user_phone=?,user_password=? where user_id=?",user.getUser_name(),user.getUser_gender(),user.getUser_phone(),user.getUser_password(),user.getUser_id());
//		System.out.println(rowsAffected);
		return rowsAffected;
	}
}
