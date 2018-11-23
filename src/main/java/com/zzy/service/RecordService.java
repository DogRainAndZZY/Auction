package com.zzy.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.zzy.entity.Auction_record;

public interface RecordService {
	List<Auction_record> selectByAuc_id(int auction_id);
	
	void addRecord(Auction_record record);
	
	double getMaxPrice(int auction_id);
}
