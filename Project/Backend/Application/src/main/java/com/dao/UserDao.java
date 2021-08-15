package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.bean.UserBean;


@Repository
public class UserDao {
	@Autowired
	JdbcTemplate stmt;
	public int insert(UserBean user)
	{
		int result=stmt.update("insert into user_master(user_name,user_email,user_password) values(?,?,?)",user.getUser_name(),user.getUser_email(),user.getUser_password());
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
		
		int result=stmt.update("update user_master set user_password=? where user_email=?",password,email);
		if(result>0)
			System.out.println("Hui gava");
		return result;
	}
}
