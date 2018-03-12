<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<html>
<head>
<title>菜单列表</title>
<script>
function input(spId){
	if(typeof(spId) == "undefined")spId="";
	$("#spCommon").jrDialog('open', {
			url : 'sp/input',
			title : 'SP',
			data:{
				'id':spId,
			},
			needClose : true,
			width : '700',
			height : '500'
	});
};
function synConfigure(spId){
	$("#spCommon").jrDialog('open', {
			url : 'spSyn/'+spId+'/input',
			title : 'SP同步配置',
			needClose : true,
			width : '700',
			height : '600'
		});
}
/* function proLimit(spId){
	$("#spCommon").dialog('open', {
			url : 'spProLimit/list',
			title : 'SP省份上限',
			data:{
				'filter_EQS_spInfo.id':spId
			},
			needClose : true,
			width : '700',
			height : '500'
		});
}; */
function pro(spId){
	$("#spCommon").jrDialog('open', {
			url : 'sp/pro',
			title : 'SP开通省份',
			data:{
				'id':spId
			},
			needClose : true,
			width : '1200',
			height : '500'
		});
};
function sgeSmp(spId){
	$('.dataDiv').jrAjax({
			url : 'sgeSmp/list',
			data : {
				'filter_EQS_spInfo.id':spId,
			},
			container : '.dataDiv',
			newdLoading : true
	});
};
$(document).ready(function() {
	InitResourceNameSelect();
});
function InitResourceNameSelect() {
	 var selectObj = $("#selectName");
            $.ajax({
              url: "sp/names",
              type: "get",
              dataType: "json",
              success: function (result) {
              	var json = eval(result);
              	selectObj.append( $("<option></option>"));
              	for(var i=0;i<json.length;i++){
              		var option = $("<option></option>").val(json[i].text).html(json[i].text);
              		selectObj.append(option);
              	}
              	$("#selectName").flexselect({ 
				 	hideDropdownOnEmptyInput: true ,
				 	allowMismatch:true,
				 	callback:function(){
			 	}});
	          }
         });
};
function changePage(obj,page,pageSize,totalRows){
	pageLinkClick(obj,'sp/page',page,pageSize,totalRows);
}
function jumpPage(obj,page,pageSize,totalRows){
	goPageLink(obj,'sp/page',pageSize,page,totalRows);
}
</script>
</head>
<body>
	<div class="panel">
		<div class="title">
			<div class="titleImg"><img src="resources/images/left/channel-black.png" border="0" width="20px" height="20px"></div>
			<div class="titleText">SP列表</div>
		</div>
		<form  action="" method="post">
			<div id="homeSpProxyPromoteShow" class="data-show">
				<div class="search">
					<ul>
						<li>
							<span>SP名称</span>
							<div>
							   <select id="selectName" class=" W150" name="filter_LIKES_name"></select>
							</div>
						</li>
						<li><a href="javascript:void(0);" class="btn W60" onclick="searchFun(this,'sp/page')" id="searchFunSp">搜索 </a>	</li>
						<shiro:hasPermission name="sp:edit">
							<li><a href="javascript:void(0);" class="btn W60" onclick="input()" >新   增</a></li>
						</shiro:hasPermission>
					</ul>
				</div>
				<div class="data-table">
					<jsp:include page="page.jsp"></jsp:include>
				</div>
				<div id="spCommon"/><div id="bulletCommon"></div>
			</div>
		</form>
	</div>
	
</body>
</html>
