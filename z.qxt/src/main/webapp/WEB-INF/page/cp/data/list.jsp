<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../../common/taglibs.jsp" %>
<html>
<head>
<title>数据列表</title>
<script>
$(document).ready(function() {
	$("#dateEnd").val(dateAdd(new Date(),0));
	$("#dateStart").val(dateAdd(new Date(),-1));
	InitAppSerialNoSelect();
});
function InitAppSerialNoSelect() {
	var selectObj = $("#appSerialNo");
   	var json = eval('${apps}');
   	selectObj.append( $("<option></option>"));
   	for(var i=0;i<json.length;i++){
   		var option = $("<option></option>").val(json[i].serialNo).html(json[i].name+"("+json[i].serialNo+")");
   		selectObj.append(option);
   	}
   	$("select#appSerialNo").flexselect({ 
	 	hideDropdownOnEmptyInput: true ,
	 	allowMismatch:true,
	 	callback:function(){
 	}});
	$("select#carrier").flexselect({ 
	 	hideDropdownOnEmptyInput: true ,
	 	allowMismatch:true
 	});
};
function exportData(){
/* 	var cpId = $('#cpfm').val();
	if(cpId==null||cpId==''){
		$.message.alert(market.content.title, "出错啦");
		return;
	}
 	*/
 var param = "filter_EQS_appSerialNo="+$('#appSerialNo').val()+"&filter_EQS_carrier="+$('#carrier').val()+
							"&filter_EQS_ditch="+$('#ditch').val()+"&filter_GED_createDate="+$('#dateStart').val()+"&filter_LTD_createDate="+$('#dateEnd').val();
	
	$.message.confirm("数据导出", '你确定要导出吗', function(flag){
		if(flag)
			location.href = 'cpData/exportReportData?' + param;
	});
}
function changePage(obj,page,pageSize,totalRows){
	pageLinkClick(obj,'cpData/page',page,pageSize,totalRows);
}
function jumpPage(obj,page,pageSize,totalRows){
	goPageLink(obj,'cpData/page',pageSize,page,totalRows);
}
</script>
</head>
<body>
	<div class="panel panelMin">
		<div class="title">
			<div class="titleImg"><img src="resources/images/left/analysis-black.png" border="0" width="20px" height="20px"></div>
			<div class="titleText">数据列表</div>
		</div>
		<form  action="" method="post">
			<div id="homeCpDataProxyPromoteShow" class="data-show">
				<div class="search">
					<ul>
						<li>
							<span>运营商</span>
							<div>
							   <select id="carrier" class=" W150" name="filter_EQS_carrier">
							   		<option value=""></option>
							   		<option value="CMCC">移动</option>
							   		<option value="CNC">电信</option>
							   		<option value="CUC">联通</option>
							   </select>
							</div>
						</li>
						<li>
							<span>应用</span>
							<div>
							   <select id="appSerialNo" class=" W150" name="filter_EQS_appSerialNo"></select>
							</div>
						</li>
						<li>
							<span>渠道号</span>
							<div>
							   <input id="ditch" class=" W150" name="filter_LIKES_ditch" type="text"/>
							</div>
						</li>
						<li>
							<span>起始时间</span>
							<div>
							   <input id="dateStart" class="Wdate W100" name="filter_GED_createDate" type="text" 
										onclick="WdatePicker({isShowClear:true,readOnly:true,dateFmt: 'yyyy-MM-dd', maxDate: '#F{$dp.$D(\'dateEnd\')||\'%y-%M-#{%d-1}\'}'})"/>
							</div>
						</li>
						<li>
							<span>终止时间</span>
							<div>
							   <input type="text" id="dateEnd" name="filter_LTD_createDate" 
			 		onclick="WdatePicker({isShowClear:true,readOnly:true,dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d',minDate:'#F{$dp.$D(\'dateStart\')}'})"
							   					 class="Wdate W100" value="" readonly="">
							</div>
						</li>
					</ul>
					<ul>
						<li><a href="javascript:void(0);" class="btn W60" onclick="searchFun(this,'cpData/page')" id="searchFunCP">搜索 </a>	</li>
						<li><a href="javascript:void(0);" class="btn3 W80" onclick="exportData()" id="exportId">导出 </a>	</li>
					</ul>
				</div>
				<div class="data-table">
					<jsp:include page="page.jsp"></jsp:include>
				</div>
				<div id="cpDataCommon"/>
			</div>
		</form>
	</div>
</body>
</html>
