<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<base href="${contextPath}/"/> 
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta content="email=no" name="format-detection">
    <meta content="telephone=no" name="format-detection">
    <title>在线充值</title>
    <link rel="stylesheet" href="resources/weixin/stylesheets/main.css"/>
    <script type="text/javascript" src="resources/js/jquery-3.1.0.min.js"></script>  	
    <script type="text/javascript" src="resources/js/md5.js"></script>  
</head>
 
<body>
<div class="container">
	
    <!--banner-->
    <div class="banner">
        <img src="resources/weixin/images/majiang_top.jpg">
        <div class="info">
            <img src="${headimgurl }">
            <div class="nickname">玩家昵称：<span>${nickname}</span>(<span>${userId}</span>)</div>
            <div class="roomCardNum">剩余房卡：<span id="cardCountId">${cardCount }</span></div>
            <input id="weixinId" type="hidden" value="${weixinId}"/>
        </div>
    </div>
    <!--banner-->
    <!--tips-->
    <div class="tips">
        <p>小提示：</p>
        <p class="words">1、充值前请先确认上方的昵称和ID，是您要充值到帐的账号吗？</p>
        <p class="words">2、充值前先记下您的剩余房卡数量，充值成功后立即查看剩余房卡是否增加？</p>
    </div>
    <!--tips-->
    <!--房卡-->
    <div class="roomCard">
        <div class="class1" onclick="onlinePay(${4+g1 },'400')">
        	<img  src="resources/weixin/images/majiang_1.png">
        	<div class = "sendCard"  style="background:url(../../../resources/weixin/images/send.png) no-repeat ; background-size:100% 100%;">
        	</div>
        	<span style="">${g1 }</span>
        </div>
        <div class="class1"onclick="onlinePay(${10+g2 },'1000')">
        	<img src="resources/weixin/images/majiang_2.png">
        	<div class = "sendCard"  style="background:url(../../../resources/weixin/images/send.png) no-repeat ; background-size:100% 100%;">
        	</div>
        	<span style="">${g2 }</span>
        </div>
        <div class="class1"onclick="onlinePay(${30+g3 },'3000')">
        	<img   src="resources/weixin/images/majiang_3.png">
        	<div class = "sendCard"  style="background:url(../../../resources/weixin/images/send.png) no-repeat ; background-size:100% 100%;">
        	</div>
        	<span style="">${g3 }</span>
        </div>
        <div class="class1"onclick="onlinePay(${100+g4},'10000')">
        	<img  src="resources/weixin/images/majiang_4.png">
        	<div class = "sendCard"  style="background:url(../../../resources/weixin/images/send.png) no-repeat ; background-size:100% 100%;">
        	</div>
        	<span style="">${g4 }</span>
        </div>
    </div>
    <!--房卡-->
</div>
<script type="text/javascript" src="resources/weixin/javascripts/mobileSide.js"></script>
<script src="resources/weixin/javascripts/zepto.min.js"></script>
</body>
<script type="text/javascript">
window.onload = function(){ 
　　if(${userId==null||userId==undefined}){
		alert("您还不是我们的用户，请先下载游戏在进行充值！！！");
		window.location.href="weixin/downLoad" ;
	} 
	if(${g1==0}){
		$(".sendCard").hide();
	}
} 
function onlinePay(cardCount,price){
		 $.ajax({
	        type: "post",
	        dataType: "JSON",
	        url: '/order/public_pay',
	        data: {"userId":"${userId}","cardCount":cardCount,"price":price,"openId":"${openid}"},
	        success: function (data) {
	        	if (typeof WeixinJSBridge == "undefined"){
				   if( document.addEventListener ){
				       document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
				   }else if (document.attachEvent){
				       document.attachEvent('WeixinJSBridgeReady', onBridgeReady); 
				       document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
				   }
				}else{
				   onBridgeReady(data.prepay_id);
				}
	        }
	    });
	}
	var interval ;
	function onBridgeReady(prepay_id){
		var date = new Date().getTime()+"";
		date = date.substring(0, 10);
  		WeixinJSBridge.invoke(
       	   'getBrandWCPayRequest', {
           "appId":"wxc42988d973d96c31",     //公众号名称，由商户传入     
           "timeStamp":date, //时间戳，自1970年以来的秒数     
           "nonceStr":"e61463f8efa94090b1f366cccfbbb444", //随机串        
           "package":"prepay_id="+prepay_id,      
           "signType":"MD5",         //微信签名方式：     
           "paySign":hex_md5("appId=wxc42988d973d96c31&nonceStr=e61463f8efa94090b1f366cccfbbb444&package=prepay_id="+prepay_id+"&signType=MD5&timeStamp="+date+"&key=LIISWJCKMFDHD32RYUZYA70NCNC2ASRX").toUpperCase() //微信签名 
       },
       function(res){ 
           if(res.err_msg == "get_brand_wcpay_request:ok" ) {
           		alert("支付成功！！！")
           		interval = setInterval(updateInfo(),2000);
           }
       }
   ); 
}
function  updateInfo(){
	$.ajax({
	        type: "post",
	        dataType: "JSON",
	        url: '/account/info',
	        data: {"data":"{\"id\":\""+$('#weixinId').val()+"\"}"},
	        success: function (data) {
	        var old = $("#cardCountId").html();
	        if(old!=data.cardCount&&data.cardCount>old){
	        	$("#cardCountId").html(data.cardCount);
	        	 clearInterval(interval);
	        }
	   	 }	
	    });
}

</script>
</html>