package com.zzy.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zzy.entity.Auction_record;
import com.zzy.entity.Auction_user;
import com.zzy.service.RecordService;

@Controller
public class RecordController {
	@Autowired
	private RecordService recordService;

	public RecordService getRecordService() {
		return recordService;
	}

	public void setRecordService(RecordService recordService) {
		this.recordService = recordService;
	}

	@RequestMapping("addRecord")
	public String addRecord(Auction_record record, HttpSession session) {
		List<Auction_record> list = recordService.selectByAuc_id(record
				.getAuction_id());
		System.out.println(list);
		if (list.size() != 0) {
			Double max = recordService.getMaxPrice(record.getAuction_id());
			if (record.getAuction_price() > max) {
				Auction_user user = (Auction_user) session.getAttribute("user");
				record.setUser_id(user.getUser_id());
				recordService.addRecord(record);
			}
		} else {
			Auction_user user = (Auction_user) session.getAttribute("user");
			record.setUser_id(user.getUser_id());
			recordService.addRecord(record);
		}

		return "redirect:/auction.do?auc_id=" + record.getAuction_id();
	}
}
