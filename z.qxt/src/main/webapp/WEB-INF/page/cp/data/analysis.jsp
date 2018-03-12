<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../../common/taglibs.jsp" %>
<html>
<head>
<title>cp数据分析</title>
<script>
function InitResourceNameSelect(value) {
	 var url = "menu/resourceNames?value="+value;
	 var selectObj = $("#resourceName"+value);
	 	selectObj.empty();
            $.ajax({
              url: url,
              type: "get",
              dataType: "json",
              success: function (result) {
              	var json = eval(result);
              	selectObj.append( $("<option></option>"));
              	for(var i=0;i<json.length;i++){
              		var option = $("<option></option>").val(json[i].value).html(json[i].text);
              		selectObj.append(option);
              	}
              	$("select#resourceName"+value).flexselect({ 
			 	hideDropdownOnEmptyInput: true ,
			 	allowMismatch:true,
			 	callback:function(){
			 	}});
	          }
         });
};

$(function(){
	$("#homeDataSummaryChartTableDiv").jrTabs({
		data : [{
				title : '近一周趋势',
				url : 'cpData/weakCharts',
				needRequest : true,
				customRequest : false,
			},{
				title : '昨日占比',
				url : 'cpData/yesterdayChart',
				needRequest : true,
				customRequest : false,
			}
		],
		eachRequest : false,
		autoProcess : true,
		requestSuccessCallback : function(value,obj,dataDiv) {
		},
	});
	
});
</script>
</head>
<body>


	<div class="data-partners-tab">
		<div class="yester-income">
			昨日收入汇总：<span>${ cpTotalForm.finalSumTotal}</span>&nbsp;元
		</div>
	</div>
	<div class="panel panelMin" >
		<div class="title">
			<div class="titleImg" id="homeProxySummaryPanelTipTrigger"><img src="resources/images/left/analysis-black.png" border="0" width="20px" height="20px"></div>
			<div class="titleText">昨日数据汇总</div>
		</div>
	<div id="homeDataSummaryShow" class="data-show">
	<ul class="data-summary">
		<li>
			<div class="user-summary">
				<span class="icon-summary">
					<img src="resources/images/main/home/user-summary.png" border="0">
					<span>新增用户</span>
				</span>
				<div class="text-summary">
					<div class="summary center"><span class="number">${ cpTotalForm.newUsers}</span></div>
					<!-- <div class="floating">-39(↓-51%)</div> -->
				</div>
			</div>
		</li>
		<li >
			<div class="income-summary">
				<span class="icon-summary">
					<img src="resources/images/main/home/income-summary.png" border="0">
					<span>总信息费</span>
				</span>
				<div class="text-summary">
					<div class="center">${ cpTotalForm.mrTotal}</div>
				</div>
			</div>
		</li>
		<li class="last">
			<div class="income-summary">
				<span class="icon-summary">
					<img src="resources/images/main/home/income-summary.png" border="0">
					<span>总收入</span>
				</span>
				<div class="text-summary">
					<div class="center">${ cpTotalForm.finalSumTotal}</div>
				</div>
			</div>
		</li>
	</ul>
	</div>
	</div>
	<div class="panel panelMin">
		<div class="title">
			<div class="titleImg"><img src="resources/images/left/analysis-black.png" border="0" width="20px" height="20px"></div>
			<div class="titleText">图形化数据</div>
		</div>
		<div id="homeDataSummaryChartTableDiv" class="data-show">
		</div>
	</div>
</body>
</html>
