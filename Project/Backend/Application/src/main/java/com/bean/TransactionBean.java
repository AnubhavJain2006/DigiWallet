package com.bean;
import javax.validation.constraints.Pattern;
import org.springframework.stereotype.Component;

@Component
public class TransactionBean {
	private int trans_id;
	private int trans_user_id;
	private String trans_date;
	private int trans_account_id;
	private int trans_category_id;
	private int trans_sub_category_id;
	private String trans_category_name;
	private String trans_sub_category_name;
	private String trans_account_name;
	@Pattern(regexp = "^[0-9]+$", message = "*Amount should be a number")
	private String trans_amount;
	private String trans_note;
	private String trans_description;
	private String trans_image;
	private String trans_status;
	private String trans_type;
	public int getTrans_user_id() {
		return trans_user_id;
	}

	public String getTrans_type() {
		return trans_type;
	}

	public void setTrans_type(String trans_type) {
		this.trans_type = trans_type;
	}

	public void setTrans_user_id(int trans_user_id) {
		this.trans_user_id = trans_user_id;
	}

	public String getTrans_category_name() {
		return trans_category_name;
	}

	public void setTrans_category_name(String trans_category_name) {
		this.trans_category_name = trans_category_name;
	}

	public String getTrans_sub_category_name() {
		return trans_sub_category_name;
	}

	public void setTrans_sub_category_name(String trans_sub_category_name) {
		this.trans_sub_category_name = trans_sub_category_name;
	}

	public String getTrans_account_name() {
		return trans_account_name;
	}

	public void setTrans_account_name(String trans_account_name) {
		this.trans_account_name = trans_account_name;
	}

	
	@Override
	public String toString() {
		return "TransactionBean [trans_id=" + trans_id + ", trans_user_id=" + trans_user_id + ", trans_date="
				+ trans_date + ", trans_account_id=" + trans_account_id + ", trans_category_id=" + trans_category_id
				+ ", trans_sub_category_id=" + trans_sub_category_id + ", trans_amount=" + trans_amount
				+ ", trans_note=" + trans_note + ", trans_description=" + trans_description + ", trans_image="
				+ trans_image + ", trans_status=" + trans_status + "]";
	}

	

	public int getTrans_id() {
		return trans_id;
	}

	public void setTrans_id(int trans_id) {
		this.trans_id = trans_id;
	}

	public int getTrnas_user_id() {
		return trans_user_id;
	}

	public void setTrnas_user_id(int trnas_user_id) {
		this.trans_user_id = trnas_user_id;
	}



	public String getTrans_date() {
		return trans_date;
	}

	public void setTrans_date(String trans_date) {
		this.trans_date = trans_date;
	}

	public int getTrans_account_id() {
		return trans_account_id;
	}

	public void setTrans_account_id(int trans_account_id) {
		this.trans_account_id = trans_account_id;
	}

	public int getTrans_category_id() {
		return trans_category_id;
	}

	public void setTrans_category_id(int trans_category_id) {
		this.trans_category_id = trans_category_id;
	}

	public int getTrans_sub_category_id() {
		return trans_sub_category_id;
	}

	public void setTrans_sub_category_id(int trans_sub_category_id) {
		this.trans_sub_category_id = trans_sub_category_id;
	}

	public String getTrans_amount() {
		return trans_amount;
	}

	public void setTrans_amount(String trans_amount) {
		this.trans_amount = trans_amount;
	}

	public String getTrans_note() {
		return trans_note;
	}

	public void setTrans_note(String trans_note) {
		this.trans_note = trans_note;
	}

	public String getTrans_description() {
		return trans_description;
	}

	public void setTrans_description(String trans_description) {
		this.trans_description = trans_description;
	}

	public String getTrans_image() {
		return trans_image;
	}

	public void setTrans_image(String trans_image) {
		this.trans_image = trans_image;
	}

	public String getTrans_status() {
		return trans_status;
	}

	public void setTrans_status(String trans_status) {
		this.trans_status = trans_status;
	}

	public TransactionBean() {
	}
}
