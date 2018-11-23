<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="/Auction/css/common.css" rel="stylesheet" type="text/css" />
<link href="/Auction/css/style.css" rel="stylesheet" type="text/css" />
<script src="/Auction/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	function test(){
		var sale = parseInt($("#sale").val());
		var downprice=parseInt($("#downprice").html());
		
		console.log(sale);
		console.log(downprice);
		
		if($("#pri").children().length>=2){
		var array= parseInt($("#money").get(0).innerHTML);
			if(sale>array){
				return true;
			}else{
				$("#choose").html("你已经低于最高竞价");
				return false;
			}
		}else{
			if(sale>downprice){
				return true;
			}else{
				$("#choose").html("你已经低于起拍价");
				return false;
			}
		}
	}
</script>
</head>

<body>
<div class="wrap">
<!-- main begin-->
  <div class="sale">
    <h1 class="lf">在线拍卖系统</h1>
    <div class="logout right"><a href="logout.do" >注销</a></div>
  </div>
  <div class="items sg-font lf">
      <ul class="rows">
        <li>名称：</li>
        <li class="borderno">${auction.auction_name }</li>
      </ul>
      <ul class="rows">
        <li>描述：</li>
        <li class="borderno">${auction.auction_desc }</li>
      </ul>
      <ul class="rows">
        <li>开始时间：</li>
        <li class="borderno">${auction.auction_start_time }</li>
      </ul>
      <ul class="rows">
        <li>结束时间：</li>
        <li class="borderno">${auction.auction_end_time }</li>
      </ul>
      <ul class="rows border-no">
        <li>起拍价：</li>
        <li class="borderno" id="downprice">${auction.auction_start_price }</li>
      </ul>
  </div>
  <div class="rg borders"><img src="/Auction/images/${auction.auction_pic }" width="270" height="185" alt="" /></div>
  <div class="cl"></div>
  <div class="top10 salebd">
  	<form action="addRecord.do" method="post" onsubmit="return test()">
       <p>
       <label for="sale">出价：</label>
       <input type="hidden" name="auction_id" value="${auction.auction_id }"/>
       <input type="text"  class="inputwd" id="sale" name="auction_price"/>
       
       <input type="submit" value="竞 拍" class="spbg buttombg f14  sale-buttom" />
       </p>
    </form>
       <p class="f14 red">
		   
		   		<span id="choose">不能低于最高竞拍价</span>
		   
		</p>
  </div>
  <div class="top10">
  	<a href="auction.do?auc_id=${auction.auction_id }"><input name="" type="button" value="刷 新" class="spbg buttombg f14" /></a>
    <a href="getAll.do"><input name="" type="button" value="返回列表" class="spbg buttombg f14" /></a>
  </div>
  <div class="offer">
    <h3>出价记录</h3>
    <div class="items sg-font" id="pri">
      <ul class="rows even strong">
        <li>竞拍时间</li>
        <li>竞拍价格</li>
        <li class="borderno">竞拍人</li>
      </ul>
      <c:forEach items="${record_list }" var="r">
      	<ul class="rows">
	        <li>${r.auction_time }</li>
	        <li id="money">${r.auction_price }</li>
	        <li class="borderno">${sessionScope.user.user_name }</li>
      	</ul>
     </c:forEach>
      
      
  </div>
  </div>
<!-- main end-->
</div>
</body>
</html>

