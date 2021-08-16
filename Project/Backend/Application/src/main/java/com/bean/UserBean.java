package com.bean;

import java.sql.Date;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.springframework.stereotype.Component;

@Component
public class UserBean {
	 int user_id;

	@NotNull
	@Pattern(regexp = "^[A-Za-z]\\w{2,30}$", message = "Name is not Valid")
	 String user_name;

	@Email(regexp = "^[\\w-\\+]+(\\.[\\w]+)*@[\\w-]+(\\.[\\w]+)*(\\.[a-z]{2,})$", message = "Email is not valid")
	 String user_email;

	@Size(min = 8, max = 20, message = "Password must be greater than 8 and less than 20")
	@Pattern(regexp = "^(?=.*[0-9])" + "(?=.*[a-z])(?=.*[A-Z])" + "(?=.*[@#$%^&+=])"
			+ "(?=\\S+$).{8,20}$", message = "Password must contain 1 Upper case 1 Lower case 1 Special character and 1 Number")
	String user_password;
	String user_gender;

	@Pattern(regexp = "^[0-9]{10}$",message="Phone is not Valid")
	String user_phone;

	Date user_insertDate;

	Date user_updateDate;

	String user_role;

	String user_image;

	String user_full_name;

	public String getUser_full_name() {
		return user_full_name;
	}

	public void setUser_full_name(String user_full_name) {
		this.user_full_name = user_full_name;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getUser_gender() {
		return user_gender;
	}

	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public Date getUser_insertDate() {
		return user_insertDate;
	}

	public void setUser_insertDate(Date user_insertDate) {
		this.user_insertDate = user_insertDate;
	}

	public Date getUser_updateDate() {
		return user_updateDate;
	}

	public void setUser_updateDate(Date user_updateDate) {
		this.user_updateDate = user_updateDate;
	}

	public String getUser_role() {
		return user_role;
	}

	public void setUser_role(String user_role) {
		this.user_role = user_role;
	}

	public String getUser_image() {
		return user_image;
	}

	public void setUser_image(String user_image) {
		this.user_image = user_image;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

}
