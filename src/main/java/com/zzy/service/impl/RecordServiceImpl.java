package com.zzy.service.impl;

import java.util.List;

//import javax.enterprise.inject.Any;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzy.dao.RecordDao;
import com.zzy.entity.Auction_record;
import com.zzy.service.RecordService;

@Service
public class RecordServiceImpl implements RecordService {
	@Autowired
	private RecordDao recordDao;

	@Override
	public List<Auction_record> selectByAuc_id(int auction_id) {
		List<Auction_record> list = recordDao.selectByAuc_id(auction_id);
		return list;
	}

	@Override
	public void addRecord(Auction_record record) {
		recordDao.insert(record.getUser_id(), record.getAuction_id(),
				record.getAuction_price());
	}

	@Override
	public double getMaxPrice(int auction_id) {
		Double maxPri = recordDao.getmaxPrice(auction_id);
		return maxPri;
	}

}
