<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<html>
<head>
<title>菜单列表</title>
<script>
function add(){
	$("#cpAdd").jrDialog('open', {
			url : 'cp/add',
			title : '新增CP',
			needClose : true,
			width : '700',
			height : '500'
		});
};
function update(cpId){
	$("#cpAdd").jrDialog('open', {
			url : 'cp/update',
			data:{id:cpId},
			title : '修改CP信息',
			needClose : true,
			width : '700',
			height : '500'
		});
};
function account(cpId){
	$("#cpAccount").jrDialog('open', {
			url : 'cp/account',
			data:{id:cpId},
			title : '',
			needClose : true,
			width : '700',
			height : '500'
		});
};
function menu(cpId){
	$.ajax({
              url: "cp/checkAcc?id="+cpId,
              type: "get",
              dataType: "json",
              success: function (result) {
              	if(result!=1){
              		$.message.alert("warn","警告","请先设置账户。。。",null);
					return;              	
              	}
              	$("#menuOperator").jrDialog('open', {
					url : 'cp/menu',
					data:{id:cpId},
					title : '',
					needClose : true,
					width : '700',
					height : '500'
				});
	          }
         });
	
};
function cpAPPList(cpId,cpName){
	$('.dataDiv').jrAjax({
		url : 'app/list',
		data : {
			'filter_EQS_cpInfo.id':cpId,
			'cpName':cpName
		},
		container : '.dataDiv',
		newdLoading : true
	});
};
$(document).ready(function() {
	InitResourceNameSelect();
});
function InitResourceNameSelect() {
	 var selectObjName = $("#name");
	 var selectObjSeial = $("#serialNo");
            $.ajax({
              url: "cp/names",
              type: "get",
              dataType: "json",
              success: function (result) {
              	var json = eval(result);
              	selectObjName.append( $("<option></option>"));
              	selectObjSeial.append($("<option></option>"));
              	for(var i=0;i<json.length;i++){
              		var optionName = $("<option></option>").val(json[i].text).html(json[i].text);
              		var optionSerial = $("<option></option>").val(json[i].value).html(json[i].value);
              		selectObjName.append(optionName);
              		selectObjSeial.append(optionSerial);	
              	}
              	$("select#name").flexselect({ 
			 	hideDropdownOnEmptyInput: true ,
			 	allowMismatch:true,
			 	callback:function(){
			 	}});
			 	$("select#serialNo").flexselect({ 
			 	hideDropdownOnEmptyInput: true ,
			 	allowMismatch:true,
			 	callback:function(){
			 	}});
	          }
         });
};
function changePage(obj,page,pageSize,totalRows){
	pageLinkClick(obj,'cp/page',page,pageSize,totalRows);
}
function jumpPage(obj,page,pageSize,totalRows){
	goPageLink(obj,'cp/page',pageSize,page,totalRows);
}
</script>
</head>

<body>
	<div class="panel">
		<div class="title">
			<div class="titleImg"><img src="resources/images/left/channel-black.png" border="0" width="20px" height="20px"></div>
			<div class="titleText">CP列表</div>
		</div>
		<form  action="" method="post">
			<div id="homeCpProxyPromoteShow" class="data-show">
				<div class="search">
					<ul>
						<li>
							<span>CP名称</span>
							<div>
							   <select id="name" class=" W150" name="filter_LIKES_name"></select>
							</div>
						</li>
						<li>
							<span>CP编号</span>
							<div>
							   <select id="serialNo" class=" W150" name="filter_EQS_serialNo"></select>
							</div>
						</li>
						<li><a href="javascript:void(0);" class="btn W60" onclick="searchFun(this,'cp/page')" id="searchFunCP">搜索 </a>	</li>
						<li><a href="javascript:void(0);" class="btn W60" onclick="add()" >新   增</a>	</li>
					</ul>
				</div>
				<div class="data-table">
					<jsp:include page="page.jsp"></jsp:include>
				</div>
				<div id="cpAdd"/><div id="cpAccount"/><div id="menuOperator"/><div id="bulletCommon"/>
			</div>
		</form>
	</div>
</body>
</html>
