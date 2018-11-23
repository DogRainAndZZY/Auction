package com.zzy.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.zzy.entity.Auction;

public interface AuctionService {
	List<Auction> getAll(Auction auction);
	
	Auction getOne(int auc_id);
	
	void delete(int id);
	
	void insert(Auction auction);
	
	void update(Auction auction);
}
