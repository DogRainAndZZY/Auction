<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<div class="zclf login logns">
			<h1 class="blue">用户注册</h1>
			<form action="regist.do" method="post">
			<dl>
				<dd>
					<label> <small>*</small>用户名
					</label> <input type="text" class="inputh lf" value="" name="user_name"/>
					<div class="lf red laba">用户名要求不低于6个字符</div>
				</dd>
				<dd>
					<label> <small>*</small>密码
					</label> <input type="text" class="inputh lf" value="" name="user_password"/>
					<div class="lf red laba">密码要求不低于6个字符</div>
				</dd>

				<dd class="hegas">
					<label> <small>*</small>验证码
					</label> <input type="text" class="inputh inputs lf" value="" name="code"/> <span
						class="wordp lf"><img src="getKaptcha.do"
						id="imgVcode" width="96" height="27" alt="" /></span> <span
						class="blues lf"><a href="javascript:void(0)"
						onclick="change()">看不清楚？换个图片</a></span>
				</dd>
				<dd class="hegas">
					<label>&nbsp;</label> <input name="" type="checkbox" id="rem_u" />
					<label for="rem_u" class="labels">我同意<span class="blues">《服务条款》</span></label>
				</dd>
				<dd class="hegas">
					<label>&nbsp;</label> <input name="" type="submit" value="立即注册"
						class="spbg buttombg buttombgs f14 lf" />
				</dd>
			</dl>
			</form>
		</div>
		<!-- main end-->
		<!-- footer begin-->

	</div>
	<!--footer end-->

	</div>
	<script type="text/javascript">
		function change() {
			var c = document.getElementById("imgVcode");
			c.src = "getKaptcha.do?a=" + Math.random();
		}
	</script>
</body>
</html>

