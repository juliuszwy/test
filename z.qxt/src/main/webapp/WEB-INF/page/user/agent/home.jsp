<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../../common/taglibs.jsp" %>
<base href="${contextPath }/" />
<html>
<head>
<title>首页</title>
<script src="resources/js/amcharts/amcharts.js"></script>
<script src="resources/js/amcharts/serial.js"></script>
<script src="resources/js/amcharts/plugins/export/export.min.js"></script>
<script src="resources/js/amcharts/plugins/export/lang/zh.js"></script>
<link rel="stylesheet" href="resources/js/amcharts/plugins/export/export.css" type="text/css" media="all" />
<script src="resources/js/amcharts/themes/light.js"></script>
<script>
	$(function(){
		$.post('account/yesterday/newUser',function(data){
			$("#agentCount").html(data);
		});
		$.post('order/agent/yesterdayData',function(data){
		    $("#area1").html(data.totalPriceYstdS);
			$("#area2").html(data.scalePriceS);
			$("#area3").html(data.cards);
			$("#area4").html(data.noScaleCards);
			$("#area5").html(data.incomeS);
		});
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
			<div class="row">
			<div class="col-sm-10">
				<div class="infobox infobox-grey infobox-dark" style="margin-top: 10px">
					<div class="infobox-icon">
						<i class="ace-icon glyphicon glyphicon-user"></i>
					</div>
					<div class="infobox-data" style="padding-left: 20px">
						<div class="infobox-content">昨日新增</div>
						<span class="infobox-data-number" id="agentCount">?</span>
					</div>
				</div>
				
				<div class="infobox infobox-blue infobox-dark" style="margin-top: 10px">
					<div class="infobox-icon">
						<i class="ace-icon glyphicon glyphicon-star-empty"></i>
					</div>
					<div class="infobox-data" style="padding-left: 10px">
						<div class="infobox-content">昨日充值金额</div>
						<span class="infobox-data-number" id="area1">?</span>
					</div>
				</div>
				
				<div class="infobox infobox-blue infobox-dark" style="margin-top: 10px">
					<div class="infobox-icon">
						<i class="ace-icon glyphicon glyphicon-star-empty"></i>
					</div>
					<div class="infobox-data" style="padding-left: 10px">
						<div class="infobox-content">昨日非转扣金额</div>
						<span class="infobox-data-number" id="area2">?</span>
					</div>
					
				</div>
				
				<div class="infobox infobox-blue infobox-dark" style="margin-top: 10px">
					<div class="infobox-icon">
						<i class="ace-icon glyphicon glyphicon-star-empty"></i>
					</div>

					<div class="infobox-data" style="padding-left: 10px">
						<div class="infobox-content">昨日充值卡片数</div>
						<span class="infobox-data-number" id="area3">?</span>
					</div>
				</div>
				<div class="infobox infobox-blue infobox-dark" style="margin-top: 10px">
					<div class="infobox-icon">
						<i class="ace-icon glyphicon glyphicon-star-empty"></i>
					</div>

					<div class="infobox-data" style="padding-left: 10px">
						<div class="infobox-content">昨日卡片转扣数</div>
						<span class="infobox-data-number" id="area4">?</span>
					</div>
				</div>
				
				<div class="infobox infobox-green infobox-dark" style="margin-top: 10px">
					<div class="infobox-icon">
						<i class="ace-icon glyphicon glyphicon-star"></i>
					</div>
					<div class="infobox-data" style="padding-left: 20px">
						<div class="infobox-content">昨日收益</div>
						<span class="infobox-data-number" id="area5">?</span>
					</div>
				</div>
		    </div>
		    </div>
  		</div>
  	</div>
  	<div class="row" >
		<div class="col-sm-12">
			<div class="widget-box">
				<div class="widget-header">
					<h5 class="widget-title">
							<i class="ace-icon fa fa-signal"></i>
							新增数据图表分析(近一周走势)
					</h5> 
				</div>
				<div class="widget-body">
					<div class="widget-main">
						<div class="row">
							<div class="col-sm-12">
								<div id="newUserChart" style="width: 100%; height: 400px;"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row" >
		<div class="col-sm-12">
			<div class="widget-box">
				<div class="widget-header">
					<h5 class="widget-title">
							<i class="ace-icon fa fa-signal"></i>
							流水数据图表分析(近一周走势)
					</h5> 
				</div>
				<div class="widget-body">
					<div class="widget-main">
						<div class="row">
							<div class="col-sm-12">
								<div id="flowChart" style="width: 100%; height: 400px;"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</body>
<script type="text/javascript">
var chart;

$(document).ready(function () { 
	         $.ajax({
              url: "account/week/newUser",
              type: "get",
              dataType: "json",
              success: function (result){
              	 var json = eval(result);
              	 createUserChart(json);
              }
	     }); 
     $.ajax({
              url: "order/agent/weekChart",
              type: "get",
              dataType: "json",
              success: function (result1){
              	 var json1 = eval(result1);
              	/*  for(var i=0;i<data.length;i++){
              	 	data[i].value1=json1[i].value;
              	 } */
              	 createPriceChart(json1);
              }
  		}); 
});  
function createUserChart(data){
chart = AmCharts.makeChart( "newUserChart", {
  "type": "serial",
  "addClassNames": true,
  "theme": "light",
  "autoMargins": false,
  "marginLeft": 30,
  "marginRight": 8,
  "marginTop": 10,
  "marginBottom": 26,
  "balloon": {
    "adjustBorderColor": false,
    "horizontalPadding": 10,
    "verticalPadding": 8,
    "color": "#ffffff"
  },

  "dataProvider": data,
  "valueAxes": [ {
    "axisAlpha": 0,
    "position": "left"
  } ],
  "startDuration": 1,
  "graphs": [ {
    "alphaField": "alpha",
    "balloonText": "<span style='font-size:12px;'>[[title]] in [[category]]:<br><span style='font-size:20px;'>[[value]]</span> [[additional]]</span>",
    "fillAlphas": 1,
    "title": "新增",
    "type": "column",
    "valueField": "value",
    "dashLengthField": "dashLengthColumn"
  }],
  "categoryField": "name",
  "categoryAxis": {
    "gridPosition": "start",
    "axisAlpha": 0,
    "tickLength": 0
  },
  "export": {
    "enabled": true,
    "menu": [ {
				"class": "export-main",
				"menu": [ {
					"label": "下载",
					"menu": [ "PNG", "JPG", "CSV" ]
				} ]
			} ]
  }
} );
}

function createPriceChart(data){
chart = AmCharts.makeChart( "flowChart", {
  "type": "serial",
  "addClassNames": true,
  "theme": "none",
  "autoMargins": false,
  "marginLeft": 50,
  "marginRight": 8,
  "marginTop": 10,
  "marginBottom": 26,
  "balloon": {
    "adjustBorderColor": false,
    "horizontalPadding": 10,
    "verticalPadding": 8,
    "color": "#ffffff"
  },

  "dataProvider": data,
  "valueAxes": [ {
    "axisAlpha": 0,
    "position": "left"
  } ],
  "startDuration": 1,
  "graphs": [ {
    "alphaField": "alpha",
    "balloonText": "<span style='font-size:12px;'>[[title]] in [[category]]:<br><span style='font-size:20px;'>[[value]]</span> [[additional]]</span>",
    "fillAlphas": 1,
    "title": "流水",
    "type": "column",
    "valueField": "value",
    "dashLengthField": "dashLengthColumn"
  }/* , {
    "id": "graph2",
    "balloonText": "<span style='font-size:12px;'>[[title]] in [[category]]:<br><span style='font-size:20px;'>[[value]]</span> [[additional]]</span>",
    "bullet": "round",
    "lineThickness": 3,
    "bulletSize": 7,
    "bulletBorderAlpha": 1,
    "bulletColor": "#FFFFFF",
    "useLineColorForBulletBorder": true,
    "bulletBorderThickness": 3,
    "fillAlphas": 0,
    "lineAlpha": 1,
    "title": "流水",
    "valueField": "value1",
    "dashLengthField": "dashLengthLine"
  }  */],
  "categoryField": "name",
  "categoryAxis": {
    "gridPosition": "start",
    "axisAlpha": 0,
    "tickLength": 0
  },
  "export": {
    "enabled": true,
    "menu": [ {
				"class": "export-main",
				"menu": [ {
					"label": "下载",
					"menu": [ "PNG", "JPG", "CSV" ]
				} ]
			} ]
  }
} );
}
</script>
</html>
