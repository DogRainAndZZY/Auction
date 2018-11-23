<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
</head>

<body>
	<div class="wrap">
		<!-- main begin-->
		<div class="sale">
			<h1 class="lf">在线拍卖系统</h1>
			<div class="logout right">
				<a href="logout.do">注销</a>
			</div>
		</div>
		<div class="forms">
		<form action="getAll.do" method="post">
			<label for="name">名称</label> 
			<input name="auction_name" type="text" class="nwinput" id="name" /> <label for="names">描述</label> <input
				name="auction_desc" type="text" id="names" class="nwinput" /> <label for="time">开始时间</label>
			<input name="auction_start_time" type="text" id="time" class="nwinput" /> <label
				for="end-time">结束时间</label> <input name="auction_end_time" type="text" id="end-time"
				class="nwinput" /> <label for="price">起拍价</label> <input name="auction_start_price"
				type="text" id="price" class="nwinput" /> <input name=""
				type="submit" value="查询" class="spbg buttombg f14  sale-buttom" /> 
				</form>
				
					<a href="/Auction/add.jsp">
						<input type="button" value="发布" class="spbg buttombg f14  sale-buttom buttomb" />
					</a>
				
				
		</div>
		<div class="items">
			<ul class="rows even strong">
				<li>名称</li>
				<li class="list-wd">描述</li>
				<li>开始时间</li>
				<li>结束时间</li>
				<li>起拍价</li>
				<li class="borderno">操作</li>
			</ul>

			<c:forEach items="${auc_list}" var="auction">
				<ul class="rows">
					<li><a href="auction.do?auc_id=${auction.auction_id }" >${auction.auction_name }</a></li>
					<li class="list-wd">${auction.auction_desc }</li>
					<li>${auction.auction_start_time }</li>
					<li>${auction.auction_end_time }</li>
					<li>${auction.auction_start_price }</li>
					
					<c:if test="${sessionScope.user.user_is_admin==1}">
						<li class="borderno red"><a href="auction.do?auc_id=${auction.auction_id }">竞拍</a> 
						<a href="getOne.do?auc_id=${auction.auction_id }"
							title="修改" onclick="dele();">修改</a>| 
							<a href="delete.do?auc_id=${auction.auction_id }" title="删除" onclick="abc();">删除</a></li>
					</c:if>
					<c:if test="${sessionScope.user.user_is_admin==0}">
						<li class="borderno red"><a href="<s:url action="auction" namespace="/auc"/>?auc_id=<s:property value="auction_id"/>">竞拍</a> </li>
					</c:if>
					
				</ul>
			</c:forEach>
				

		</div>
		<script>
			function abc() {

				if (confirm("你真的确认要删除吗？请确认")) {

					return true;
				} else {
					return false;
				}

			};
			function dele() {
				if (confirm("你真的确认要修改吗？请确认")) {
					return true;
				} else {
					return false;
				}
			}
		</script>
		<!-- main end-->
	</div>
</body>
</html>

