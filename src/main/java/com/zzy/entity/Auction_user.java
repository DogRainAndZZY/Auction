package com.zzy.entity;

public class Auction_user {
	private int user_id;
	private String user_name;
	private String user_password;
	private int user_is_admin;

	public Auction_user() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Auction_user(int user_id, String user_name, String user_password,
			int user_is_admin) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_password = user_password;
		this.user_is_admin = user_is_admin;
	}
	public Auction_user(String user_name, String user_password
			) {
		super();
		
		this.user_name = user_name;
		this.user_password = user_password;
		
	}

	@Override
	public String toString() {
		return "Auction_user [user_id=" + user_id + ", user_name=" + user_name
				+ ", user_password=" + user_password + ", user_is_admin="
				+ user_is_admin + "]";
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public int getUser_is_admin() {
		return user_is_admin;
	}

	public void setUser_is_admin(int user_is_admin) {
		this.user_is_admin = user_is_admin;
	}

}
