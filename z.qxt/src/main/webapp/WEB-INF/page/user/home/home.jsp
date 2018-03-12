<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../../common/taglibs.jsp" %>
<base href="${contextPath }/" />
<html>
<head>
<title>首页</title>
<script>
	$(function(){
		$.post('agent/getAgentCount',{'parent':0},function(data){
			$("#agentCount").html(data);
		});
		/* $.post('order/yesterdayData',function(data){
			$("#area2").html(data.totalPriceYstdS);
			$("#area3").html(data.sucPriceYstdS);
			$("#area4").html(data.incomeS);
		}); */
 	})
</script>
</head>

<body>
<div class="page-content">
<div class="page-content-area">
	<div class="row">
		<div class="col-xs-12">
			<!-- PAGE CONTENT BEGINS -->
			<div class="alert alert-block alert-success">
				<button type="button" class="close" data-dismiss="alert">
					<i class="ace-icon fa fa-times"></i>
				</button>

				<i class="ace-icon fa fa-check green"></i>

				欢迎登陆
				<strong class="green">
					全真麻将管理后台
					<small>(v1.0)</small>
				</strong>,
                           ！！！
			</div>
			<!-- <div class="row">
			<div class="col-sm-12 ">
				<div class="infobox infobox-grey infobox-dark" >
					<div class="infobox-icon">
						<i class="ace-icon glyphicon glyphicon-user"></i>
					</div>

					<div class="infobox-data" style="padding-left: 20px">
						<div class="infobox-content">代理商数</div>
						<span class="infobox-data-number" id="agentCount">?</span>
					</div>
				</div>
				<div class="infobox infobox-blue infobox-dark" >
					<div class="infobox-icon">
						<i class="ace-icon glyphicon glyphicon-star-empty"></i>
					</div>

					<div class="infobox-data" style="padding-left: 20px">
						<div class="infobox-content">昨日订单总金额</div>
						<span class="infobox-data-number" id="area2">?</span>
					</div>
				</div>
				<div class="infobox infobox-blue infobox-dark" >
					<div class="infobox-icon">
						<i class="ace-icon glyphicon glyphicon-star-empty"></i>
					</div>

					<div class="infobox-data" style="padding-left: 20px">
						<div class="infobox-content">昨日成功订单金额</div>
						<span class="infobox-data-number" id="area3">?</span>
					</div>
				</div>
				<div class="infobox infobox-green infobox-dark" >
					<div class="infobox-icon">
						<i class="ace-icon glyphicon glyphicon-star"></i>
					</div>
					<div class="infobox-data" style="padding-left: 20px">
						<div class="infobox-content">昨日收益</div>
						<span class="infobox-data-number" id="area4">?</span>
					</div>
				</div>
		    </div>
		    </div> -->
  		</div>
  	</div>
  	</div>
 </div>
</body>
<script type="text/javascript">
</script>
</html>
