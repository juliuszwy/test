<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<html>
<head>
<title>菜单列表</title>
<script>
function add(){
	$("#menuAdd").jrDialog('open', {
			url : 'menu/add',
			title : '新增菜单',
			needClose : true,
			width : '600',
			height : '500'
		});
};
function update(menuId){
	$("#menuAdd").jrDialog('open', {
			url : 'menu/update',
			data:{id:menuId},
			title : '新增菜单',
			needClose : true,
			width : '600',
			height : '500'
		});
};
function listMenus(modelId){
	$('.dataDiv').jrAjax({
		url : 'menu/list',
		data : {'modelId':modelId},
		container : '.dataDiv',
		newdLoading : true
	});
};
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
function changePage(obj,page,pageSize,totalRows){
	pageLinkClick(obj,'menu/table',page,pageSize,totalRows);
}
function jumpPage(obj,page,pageSize,totalRows){
	goPageLink(obj,'menu/table',pageSize,page,totalRows);
}

$(function(){
	$("#homeMenuProxyPromoteShow").jrTabs({
		data : [{
				title : '合作方菜单',
				url : 'menu/page?value=2',
				value:'2',
				data : {"filter_EQI_property":2},
				needRequest : true,
				customRequest : false,
			},{
				title : '平台菜单',
				url : 'menu/page?value=1',
				value:'1',
				data : {"filter_EQI_property":1},
				needRequest : true,
				customRequest : false,
			}
		],
		eachRequest : false,
		autoProcess : true,
		requestSuccessCallback : function(value,obj,dataDiv) {
			InitResourceNameSelect(value);
		},
	});
	
});
</script>
</head>
<body>
	<div class="panel">
		<div class="title">
			<div class="titleImg"><img src="resources/images/left/home-black.png" border="0" width="20px" height="20px"></div>
			<div class="titleText">菜单列表</div>
		</div>
		<div id="homeMenuProxyPromoteShow" class="data-show">
		</div>
		<div id="menuAdd"/>
		<div id="menuUpdate"/> 
	</div>
	
</body>
</html>
