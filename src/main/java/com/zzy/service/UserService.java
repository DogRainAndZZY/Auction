package com.zzy.service;

import org.springframework.stereotype.Service;

import com.zzy.entity.Auction_user;


public interface UserService {
	Auction_user login(Auction_user user);
	
	void regist(Auction_user user);
}
