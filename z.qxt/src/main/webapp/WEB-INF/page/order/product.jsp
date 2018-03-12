<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<base href="${contextPath }/" />
<html>
<head>
<title>卡片商城</title>
<style type="text/css">
.product{
	position:relative;
	width:150px;
	height:300px;
	float:left;
	margin-left: 6%;
}
.productdiv{
	position:absolute;
	width:100%;
	height:20px;
	z-indent:2;
	
	text-align: center;
}
.topPosition{
	top:35%;
}
.bottomPosition{
	top:45%;
}
.productdiv span{
	font-family:Arial,Helvetica,sans-serif;
	font-size:100%;
	color: #87CEFF;
	font-size: 10px;
	padding-right: 10px
}
.buy{
	margin-right: 5px;
	margin-top: 10px;
	width:150px;
	height:50;
}
</style>
<script>
</script>
</head>
	
<body style="">
	<div class="page-content">
		<div class="row" style="height: 100px">
			<div class="col-xs-12 " style="text-align: center;">
				<img class="img-responsive center-block" alt="" src="resources/images/card/fksc.png"/>
			</div>	
		</div>
		<div class="row">
			<div class="col-xs-12 " style="text-align: center;">	
				<!-- <ul class="list-group" style="float:left;">
					<li class="list-group-item"style="border-color: #fff"><img class="img-responsive center-block" alt="" src="resources/images/card/fk.png"/></li>
					<li class="list-group-item" style="border-color: #fff"><img class="img-responsive center-block" alt="" src="resources/images/card/buy.png"/></li>
				</ul>
				<ul class="list-group"style="float:left">
					<li class="list-group-item" style="border-color: #fff"><img alt="" src="resources/images/card/fk.png"/></li>
					<li class="list-group-item" style="border-color: #fff"><img alt="" src="resources/images/card/buy.png"/></li>
				</ul>
				<ul class="list-group"style="float:left">
					<li class="list-group-item" style="border-color: #fff"><img alt="" src="resources/images/card/fk.png"/></li>
					<li class="list-group-item" style="border-color: #fff"><img alt="" src="resources/images/card/buy.png"/></li>
				</ul> -->
				<div class="product">
				    <img class="img-responsive center-block" alt="" src="resources/images/card/fk.png"/>
				    <div class="productdiv topPosition">
				      	<span >1000张</span>
				    </div>
				    <div class="productdiv bottomPosition">
				      	<span >¥ 
				      		<fmt:formatNumber type="number" value="1000" pattern="0.0" maxFractionDigits="1"/>  
				      	</span>
				    </div>
				     <img class="buy" alt="" src="resources/images/card/buy.png" card="1000" fee="1"  pattern='0.0' maxFractionDigits='1'/>
				</div>
				<div class="product">
				    <img class="img-responsive center-block" alt="" src="resources/images/card/fk.png"/>
				    <div class="productdiv topPosition">
				      	<span >2000 张</span>
				    </div>
				     <div class="productdiv bottomPosition">
				      	<span >¥ <fmt:formatNumber type="number" value="2000" pattern="0.0" maxFractionDigits="1"/></span>
				    </div>
				    <img class="buy"alt="" src="resources/images/card/buy.png" card="2000" fee="2"  pattern='0.0' maxFractionDigits='1'/>
				</div>
				<div class="product">
				    <img class="img-responsive center-block" alt="" src="resources/images/card/fk.png"/>
				    <div class="productdiv topPosition">
				      	<span>5000 张</span>
				    </div>
				    <div class="productdiv bottomPosition" >
				      	<span >¥ <fmt:formatNumber type="number" value="5000" pattern="0.0" maxFractionDigits="1"/></span>
				    </div>
				    <img class="buy" alt="" src="resources/images/card/buy.png" card="5000" fee="5"  pattern='0.0' maxFractionDigits='1'/>
				</div>
				<div class="product">
				    <img class="img-responsive center-block" alt="" src="resources/images/card/fk.png"/>
				    <div class="productdiv topPosition">
				      	<span >10000张</span>
				    </div>
				    <div class="productdiv bottomPosition">
				      	<span>¥ 
				      		<fmt:formatNumber type="number" value="10000" pattern="0.0" maxFractionDigits="1"/>  
				      	</span>
				    </div>
				     <img class="buy" alt="" src="resources/images/card/buy.png" card="10000" fee="10"  pattern='0.0' maxFractionDigits='1'/>
				</div>
				<div class="product">
				    <img class="img-responsive center-block" alt="" src="resources/images/card/fk.png"/>
				    <div class="productdiv topPosition">
				      	<span>50000 张</span>
				    </div>
				     <div class="productdiv bottomPosition">
				      	<span >¥ <fmt:formatNumber type="number" value="5000" pattern="0.0" maxFractionDigits="1"/></span>
				    </div>
				    <img class="buy"alt="" src="resources/images/card/buy.png" card="50000" fee="50"  pattern='0.0' maxFractionDigits='1'/>
				</div>
				<div class="product">
				    <img class="img-responsive center-block" alt="" src="resources/images/card/fk.png"/>
				    <div class="productdiv topPosition">
				      	<span>100000 张</span>
				    </div>
				    <div class="productdiv bottomPosition" >
				      	<span >¥ <fmt:formatNumber type="number" value="100000" pattern="0.0" maxFractionDigits="1"/></span>
				    </div>
				    <img class="buy" alt="" src="resources/images/card/buy.png" card="100000" fee="100"  pattern='0.0' maxFractionDigits='1'/>
				</div>
			</div>
		</div>
	</div>		
	
</body>
<script type="text/javascript">
$(".buy").click(function(){
   var	card = $(this).attr("card");
   var price = $(this).attr("fee");
   var url = "order/input?card="+card+"&price="+price;
   showModal(url);
})
$(document).ready(function() {
	});
</script>
</html>
