
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
        var _mjNewApkUrl;
    </script>
<script type="text/javascript" src="resources/js/schema.js"></script>


 <style type="text/css">
        body {
            text-align: center;
        }

        .load-main {
            position: absolute;
            width: 300px;
            text-align: center;
            height: 170px;
            top: 50%;
            left: 50%;
            margin-top: -120px;
            margin-left: -150px;
            color: #666;
        }
    </style>
  
</head>    
   
<body>
<div id="Layer1" style="position:absolute;left:0;top:0; width:100%; height:100%;">      
	<img src="resources/images/invateRoom.jpg" height="100%" width="100%">      
</div>
<div id="Layer2" style="position:absolute; left:0;top:0;width:100%; height:100%; z-index:1000;display: none">      
	<img src="resources/images/swmjtop.png" height="100%" width="100%">      
</div>
<div class="load-main" style = "display: none">
    <img class="loadimg" src="resources/images/loading1.gif" alt="">
    <p>页面跳转中···</p>
</div>
<script>
	var ua = navigator.userAgent.toLowerCase(); //用户代理
	var ipad = ua.match(/ipad/i) == "ipad";
	var iphoneos = (ua.match(/iphone os/i) == "iphone os") || (ua.match(/iph os/i) == "iph os"); 
	var android = (ua.match(/android/i) == "android") || (ua.match(/adr/i) == "adr"); 
	/* if((ipad || iphoneos) && !android)
	{
		document.getElementById('Layer2').style.display = "none";
	}
	else 
	{ */
		if(ua.match(/MicroMessenger/i) == 'micromessenger')
		{
			document.getElementById('Layer2').style.display = "";
		}
		else
		{
			document.getElementById('Layer2').style.display = "none";
		}
	//}
	
	document.getElementById('Layer1').onclick=function()
	
	{
		$(".load-main").css('display','block'); 
		openDefault();
		/* if((ipad || iphoneos) && !android)
		{
			//window.open("https://itunes.apple.com/us/app/%E5%A5%BD%E5%8F%8B%E5%B1%80%E8%8B%8F%E5%B7%9E%E9%BA%BB%E5%B0%86/id1226851671?mt=8");
			alert("敬请期待！！！！！");
		}
		else
		{
			
		} */
	}
</script>      

</body></html>

<%-- <%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../../common/taglibs.jsp" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<html>
<head>
	<base href="${contextPath }/" /> 
    <title>汕尾麻将</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width,target-densitydpi=high-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="renderer" content="webkit">
    <meta name="keywords" content="一切精彩，尽在汕尾麻将">
    <style type="text/css">
        body {
            text-align: center;
        }

        .load-main {
            position: absolute;
            width: 300px;
            text-align: center;
            height: 170px;
            top: 50%;
            left: 50%;
            margin-top: -120px;
            margin-left: -150px;
            color: #666;
        }
    </style>
    <script type="text/javascript">
        var _mjNewApkUrl;	
    </script>
</head>
<body>
<div class="load-main">
    <img class="loadimg" src="resources/images/loading.gif" alt="">
    <p>页面跳转中···</p>
</div>
<script type="text/javascript" src="resources/js/schema.js"></script>
<!-- <iframe src="douyutvtest://platformapi/startApp?room_id=2203323&amp;isVertical=0&amp;room_src=undefined&amp;isVideo=" style="display: none;"></iframe></body> -->
</html> --%>



