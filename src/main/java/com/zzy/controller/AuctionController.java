package com.zzy.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.zzy.entity.Auction;
import com.zzy.entity.Auction_record;
import com.zzy.service.AuctionService;
import com.zzy.service.RecordService;

@Controller
public class AuctionController {
	@Autowired
	private AuctionService auctionService;
	@Autowired
	private RecordService recordService;

	@RequestMapping("getAll")
	public String getAll(Map map, Auction auction) throws ParseException {
		List<Auction> auc_list = auctionService.getAll(auction);
		map.put("auc_list", auc_list);
		return "management";
	}

	@RequestMapping("auction")
	public String auction(int auc_id, HttpServletRequest request) {
		Auction auction = auctionService.getOne(auc_id);
		List<Auction_record> record_list = recordService.selectByAuc_id(auc_id);
		request.setAttribute("auction", auction);
		request.setAttribute("record_list", record_list);
		return "auction";
	}

	@RequestMapping("delete")
	public String delete(int auc_id) {
		auctionService.delete(auc_id);
		return "redirect:/getAll.do";
	}

	@RequestMapping("insert")
	public String insert(Auction auction, MultipartFile photo,
			HttpServletRequest request) throws ParseException,
			IllegalStateException, IOException {

		// 获取到上传上来的文件名
		String fileName = photo.getOriginalFilename();
		// 对文件进行重命名
		fileName = new Date().getTime() + "_" + fileName;
		String realPath = request.getRealPath("/images/");
		photo.transferTo(new File(realPath + "\\" + fileName));

		auction.setAuction_pic(fileName);
		String start_date = auction.getAuction_start_time();
		String end_date = auction.getAuction_end_time();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		auction.setAuction_start_time(sdf.format(sdf.parse(start_date)));
		auction.setAuction_end_time(sdf.format(sdf.parse(end_date)));

		System.out.println(auction);
		auctionService.insert(auction);
		return "redirect:/getAll.do";
	}

	@RequestMapping("getOne")
	public String getOne(HttpServletRequest request, int auc_id) {
		Auction auction = auctionService.getOne(auc_id);
		request.setAttribute("auction", auction);
		System.out.println(auction);
		return "update";
	}

	@RequestMapping("update")
	public String update(Auction auction, MultipartFile photo,
			HttpServletRequest request) throws ParseException,
			IllegalStateException, IOException {
		// 获取到上传上来的文件名
		String fileName = photo.getOriginalFilename();
		// 对文件进行重命名
		fileName = new Date().getTime() + "_" + fileName;
		String realPath = request.getRealPath("/images/");
		photo.transferTo(new File(realPath + "\\" + fileName));

		String start_date = auction.getAuction_start_time();
		String end_date = auction.getAuction_end_time();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		auction.setAuction_start_time(sdf.format(sdf.parse(start_date)));
		auction.setAuction_end_time(sdf.format(sdf.parse(end_date)));

		System.out.println(auction);
		auctionService.update(auction);
		return "redirect:/getAll.do";
	}
}
