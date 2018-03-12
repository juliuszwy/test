<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8">
<base href="${contextPath }/" /> 
<title>微信支付结果</title> 
<link href="css/login1.css" mce_href="css/login1.css" rel="stylesheet" type="text/css" /> 
<script language="javascript" type="text/javascript"> 
	var i = 5; 
	var intervalid; 
	intervalid = setInterval("fun()", 1000); 
	function fun() { 
		if (i == 0) { 
			clearInterval(intervalid); 
			rechange();
		} 
		document.getElementById("mes").innerHTML = i; 
		i--; 
	} 
	function s(){
		  clearInterval(intervalid);
		  rechange();
	}
</script> 
</head> 
<body> 
<div id="success" class="col-lg-12"> 
	<p style="font-size: 30px;color: red">充值失败！！！</p> 
	<p style="font-size: 30px">将在 <span id="mes">5</span> 秒钟后返回充值首页面！</p> 
	<a href="javascript:void(0);" onclick="s()">立即跳转</a>
</div> 
</body> 
</html> 