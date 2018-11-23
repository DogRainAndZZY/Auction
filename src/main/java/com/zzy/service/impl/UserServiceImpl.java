package com.zzy.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzy.dao.UserDao;
import com.zzy.entity.Auction_user;
import com.zzy.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;

	@Override
	public Auction_user login(Auction_user user) {
		if (userDao.getOne(user.getUser_name(), user.getUser_password()) != null) {
			return userDao.getOne(user.getUser_name(), user.getUser_password());
		}
		return null;
	}

	@Override
	public void regist(Auction_user user) {
		userDao.insert(user.getUser_name(), user.getUser_password());
	}

}
