package com.zzy.dao;

import com.zzy.entity.Auction_user;

public interface UserDao {
	Auction_user getOne(String name, String password);

	void insert(String name, String password);
}
