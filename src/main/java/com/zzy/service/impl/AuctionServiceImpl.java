package com.zzy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzy.dao.AuctionDao;
import com.zzy.dao.RecordDao;
import com.zzy.entity.Auction;
import com.zzy.service.AuctionService;

@Service
public class AuctionServiceImpl implements AuctionService {
	@Autowired
	private AuctionDao auctionDao;

	@Autowired
	private RecordDao recordDao;

	@Override
	public List<Auction> getAll(Auction auction) {
		// TODO Auto-generated method stub
		List<Auction> list = auctionDao.selectAll(auction);
		return list;
	}

	@Override
	public Auction getOne(int auc_id) {
		Auction auc = auctionDao.selectOne(auc_id);
		return auc;
	}

	@Override
	public void delete(int id) {
		recordDao.delete(id);
		auctionDao.delete(id);
	}

	@Override
	public void insert(Auction auction) {
		auctionDao.insert(auction);
	}

	@Override
	public void update(Auction auction) {
		// TODO Auto-generated method stub
		auctionDao.update(auction);
	}

}
