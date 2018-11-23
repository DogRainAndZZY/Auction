<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
$(function(){
        			// 文件上传(文件域)的改变事件
        			$(':file').change(function(event) {
        				//  HTML5 js 对象的获取
           				var files = event.target.files, file;  
        				if(files && files.length > 0){
        					// 获取目前上传的文件
             		 		file = files[0];
             		 		// 文件的限定类型什么的道理是一样的
             		 		if(file.size > 1024 * 1024 * 2) {
        	       			 	alert('图片大小不能超过 2MB!');
        	        			return false;
             				}
              				// file对象生成可用的图片
              				var URL = window.URL || window.webkitURL;
              				// 通过 file 生成目标 url
              				var imgURL = URL.createObjectURL(file);
              				// 用这个 URL 产生一个 <img> 将其显示出来
              				$("img").attr('src', imgURL);
        				}
        			});
        		});
	
</script>
</head>

<body>

	<div class="wrap">
		<s:fielderror></s:fielderror>
		<s:actionerror/>
		<!-- main begin-->
		<div class="sale">
			<h1 class="lf">在线拍卖系统</h1>
			<div class="logout right">
				<a href="logout.do">注销</a>
			</div>
		</div>
		<form action="update.do" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="auction_id" value="${auction.auction_id }"/>
			<div class="login logns produce">
				<h1 class="blues">拍卖品信息</h1>

				<dl>
					<dd>
						<label>名称：</label> <input type="text" class="inputh lf"
							name="auction_name" value="${auction.auction_name }"/>
						<div class="xzkbg spbg lf"></div>
					</dd>
					<dd>
						<label>起拍价：</label> <input type="text" class="inputh lf"
							name="auction_start_price" value="${auction.auction_start_price }"/>
						<div class="lf red laba">必须为数字</div>
					</dd>
					<dd>
						<label>底价：</label> <input type="text" class="inputh lf"
							name="auction_upset" value="${auction.auction_upset }"/>
						<div class="lf red laba">必须为数字</div>
					</dd>
					<dd>
						<label>开始时间：</label> <input type="text" class="inputh lf"
							name="auction_start_time" value="${auction.auction_start_time }"/>
						<div class="lf red laba">格式：2010-05-05 12:30:00</div>
					</dd>
					<dd>
						<label>结束时间：</label> <input type="text" class="inputh lf"
							name="auction_end_time" value="${auction.auction_end_time }"/> <input type="hidden"
							class="inputh lf" name="auction_pic"  value="${auction.auction_pic }"/>
						<div class="lf red laba">格式：2010-05-06 16:30:00</div>
					</dd>
					<dd class="dds">
						<label>拍卖品图片：</label>
						<div class="lf salebd">
							<a href="#"><img src="/Auction/images/${auction.auction_pic }" width="100"
								height="100" /></a>
						</div>
						<input name="photo" type="file" class="offset10 lf" />

					</dd>
					<dd class="dds">
						<label>描述：</label> <input type="text" name="auction_desc" value="${auction.auction_desc }"/>
						<!-- <textarea name="" cols="" rows="" class="textarea"></textarea> -->
					</dd>
					<dd class="hegas">
						<input name="" type="submit" value="保 存"
							class="spbg buttombg buttombgs buttomb f14 lf" /> 
						<a href="<s:url action="getAll" namespace="/auc"/>">
							<input name=""
							type="button" value="取 消"
							class="spbg buttombg buttombgs buttomb f14 lf" />
						</a>
							
					</dd>
				</dl>
			</div>
		</form>


		<!-- main end-->
		<!-- footer begin-->

	</div>
	<!--footer end-->

	</div>
</body>
</html>
