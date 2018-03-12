<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<html>
<head>     
<base href="${contextPath }/" /> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">      
<title>好友局苏州麻将</title>  
<script type="text/javascript" src="resources/js/jquery-3.1.0.min.js"></script>  
  <script type="text/javascript" src="resources/js/md5.js"></script>  
<script type="text/javascript">
	
</script>
</head>    
<body>
<img src="${headimgurl }" style="width: 100px;height: 100px"/> <span style="font-size: 30px">用户Id：${userId }</span>    <span style="font-size: 30px">卡片数：${cardCount }</span>
      ${openid }
      <div>
      	<input type="button" value="1分钱充值测试" style="height: 100px;font-size: 50px" onclick="rechangeTest()"/>
      </div>
</body>
<script type="text/javascript">
	function rechangeTest(){
		 $.ajax({
	        type: "post",
	        dataType: "JSON",
	        url: '/order/public_pay',
	        data: {"userId":"${userId}","cardCount":3,"price":"1","openId":"${openid}"},
	        success: function (data) {
	        	alert(data.prepay_id);
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
	
	function onBridgeReady(prepay_id){
		var date = new Date().getTime()+"";
		alert(date.substring(0, 10))
		date = date.substring(0, 10);
  		WeixinJSBridge.invoke(
       	   'getBrandWCPayRequest', {
           "appId":"wxc42988d973d96c31",     //公众号名称，由商户传入     
           "timeStamp":date,         //时间戳，自1970年以来的秒数     
           "nonceStr":"e61463f8efa94090b1f366cccfbbb444", //随机串     
           "package":"prepay_id="+prepay_id,     
           "signType":"MD5",         //微信签名方式：     
           "paySign":hex_md5("appId=wxc42988d973d96c31&nonceStr=e61463f8efa94090b1f366cccfbbb444&package=prepay_id="+prepay_id+"&signType=MD5&timeStamp="+date+"&key=LIISWJCKMFDHD32RYUZYA70NCNC2ASRX").toUpperCase() //微信签名 
       },
       function(res){     
           if(res.err_msg == "ok" ) {
           		alert("支付成功！！！")
           }     // 使用以上方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回    ok，但并不保证它绝对可靠。 
       }
   ); 
}

</script>
</html>