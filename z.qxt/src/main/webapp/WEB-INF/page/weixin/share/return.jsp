
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../../common/taglibs.jsp" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<html>
<head>     
<base href="${contextPath }/" /> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">      
<title>汕尾麻将</title>  
<script type="text/javascript" src="resources/js/jquery-3.1.0.min.js"></script>    
<script type="text/javascript">
	
</script>
</head>    
   
<body>
<div id="Layer1" style="position:absolute;left:0;top:0; width:100%; height:100%;">      
	<img src="resources/images/swmj.png" height="100%" width="100%">      
</div>
<div id="Layer2" style="position:absolute; left:0;top:0;width:100%; height:100%; z-index:1000;display: none">      
	<img src="resources/images/swmjtop.png" height="100%" width="100%">      
</div>
<script>
	var ua = navigator.userAgent.toLowerCase(); //用户代理
	var ipad = ua.match(/ipad/i) == "ipad";
	var iphoneos = (ua.match(/iphone os/i) == "iphone os") || (ua.match(/iph os/i) == "iph os"); 
	var android = (ua.match(/android/i) == "android") || (ua.match(/adr/i) == "adr"); 
	if((ipad || iphoneos) && !android)
	{
		document.getElementById('Layer2').style.display = "none";
	}
	else 
	{
		if(ua.match(/MicroMessenger/i) == 'micromessenger')
		{
			document.getElementById('Layer2').style.display = "";
		}
		else
		{
			document.getElementById('Layer2').style.display = "none";
		}
	}
	
	document.getElementById('Layer1').onclick=function()
	{
		if((ipad || iphoneos) && !android)
		{
			//window.open("https://itunes.apple.com/us/app/%E5%A5%BD%E5%8F%8B%E5%B1%80%E8%8B%8F%E5%B7%9E%E9%BA%BB%E5%B0%86/id1226851671?mt=8");
			alert("敬请期待！！！！！");
		}
		else
		{
			/* $.ajax({
			  type: 'POST',
			  url: "version",
			  success: function(data){ */
			  	window.open("http://mjdownload.baoxiangkeji.com/common/download/mjapk");	
			 /*  }
			}); */
		}
	}
</script>      
      
</body></html>