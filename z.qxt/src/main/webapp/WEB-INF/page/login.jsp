<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${contextPath}/resources/css/login/css/login.css">
<script type="text/javascript" src="${contextPath}/resources/css/login/js/jquery-1.9.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$(".screenbg ul li").each(function(){
		$(this).css("opacity","0");
	});
	$(".screenbg ul li:first").css("opacity","1");
	var index = 0;
	var t;
	var li = $(".screenbg ul li");	
	var number = li.size();
	function change(index){
		li.css("visibility","visible");
		li.eq(index).siblings().animate({opacity:0},3000);
		li.eq(index).animate({opacity:1},3000);
	}
	function show(){
		index = index + 1;
		if(index<=number-1){
			change(index);
		}else{
			index = 0;
			change(index);
		}
	}
	t = setInterval(show,8000);
	//根据窗口宽度生成图片宽度
	var width = $(window).width();
	$(".screenbg ul img").css("width",width+"px");
});
function changePic(target) {
		$(target).attr("src", "captchaImage");
	}
</script>
</head>

<body>

<div class="login-box">
	<h1>数据后台</h1>
	<form method="post" action="login.do">
		<div class="loginName">
			<label>管理员账号：</label>
			<input type="text" name="loginName" id="loginName" tabindex="1" autocomplete="off">
		</div>
		<div class="loginPwd">
			<label>密  码：</label>
			<input type="password" name="loginPwd" maxlength="16" id="loginPwd" tabindex="2">
		</div>
		<div class="code">
			<label>验证码：</label>
			<input type="text" name="code" maxlength="4" id="code" tabindex="3">
			<div class="codeImg">
				<img src="captchaImage" onclick="changePic(this)">
			</div>
		</div>
		<div class="remember">
			<input type="checkbox" id="remember" tabindex="4" checked="checked" >
			<label>记住密码</label>
		</div>
		<div class="login">
			<button type="submit" tabindex="5">登录</button>
		</div>
	</form>
</div>
<div class="bottom">©2015 QUANZHEN <a href="javascript:;" target="_blank">关于</a> <span></span><img width="13" height="16" src="resources/images/copy_rignt_24.png"></div>

<div class="screenbg">
	<ul>
		<li style="opacity: 0; visibility: visible;"><a href="javascript:;"><img src="resources/images/0.jpg" style="width: 1903px;"></a></li>
	</ul>
</div>

<div><span style="margin-left: 48%;color:red;">${msg }</span></div>
</body>
</html>

