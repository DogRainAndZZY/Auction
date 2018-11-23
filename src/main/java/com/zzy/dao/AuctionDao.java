package com.zzy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zzy.entity.Auction;

public interface AuctionDao {
	List<Auction> selectAll(Auction auction);
	
	Auction selectOne(int id);
	
	void delete(int id);
	
	void insert(Auction auction);
	
	void update(Auction auction);
}
