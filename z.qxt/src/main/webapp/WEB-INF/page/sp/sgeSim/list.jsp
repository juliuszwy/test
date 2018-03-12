<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../../common/taglibs.jsp" %>
<html>
<head>
<title>菜单列表</title>
<script>
function input(id){
	if(typeof(id) == "undefined")id="";
	$("#sgeSmpCommon").jrDialog('open', {
			url : 'sgeSmp/input',
			title : 'SP',
			data:{
				'id':id,
				'spId':"${param['filter_EQS_spInfo.id']}"
			},
			needClose : true,
			width : '700',
			height : '500'
	});
};
$(document).ready(function() {
	InitResourceNameSelect();
	$("#selectCarrier").flexselect({ 
	 	hideDropdownOnEmptyInput: true ,
	 	allowMismatch:true,
	 	callback:function(){
	}});
});
function InitResourceNameSelect() {
	 var selectObj = $("#selectName");
            $.ajax({
              url: "sgeSmp/names?spid="+$("#spInfoId").val(),
              type: "get",
              dataType: "json",
              success: function (result) {
              	var json = eval(result);
              	selectObj.append( $("<option></option>"));
              	for(var i=0;i<json.length;i++){
              		var option = $("<option></option>").val(json[i].value).html(json[i].text);
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
	pageLinkClick(obj,'sgeSmp/page',page,pageSize,totalRows);
}
function jumpPage(obj,page,pageSize,totalRows){
	goPageLink(obj,'sgeSmp/page',pageSize,page,totalRows);
}
</script>
</head>
<body>
	<div class="panel">
		<div class="title">
			<div class="titleImg"><img src="resources/images/left/home-black.png" border="0" width="20px" height="20px"></div>
			<div class="titleText">通道列表</div>
		</div>
		<form  action="" method="post">
			<div id="homeSpSgeSmpProxyPromoteShow" class="data-show">
				<div class="search">
					<ul>
						<li><input id="spInfoId" type="hidden" name="filter_EQS_spInfo.id" value="${param['filter_EQS_spInfo.id']}"/></li>
						<li>
							<span>通道名称</span>
							<div>
							   <select id="selectName" class=" W150" name="filter_LIKES_name"></select>
							</div>
						</li>
						<li>
							<span>运营商</span>
							<div>
							   <select id="selectCarrier" class=" W150" name="filter_EQS_operator">
							   		<option value=""></option>
							   		<option value="M">移动</option>
							   		<option value="T">电信</option>
							   		<option value="U">联通</option>
							   </select>
							</div>
						</li>
						<li>
							<span>价格</span>
							<div>
							  <input type="text" name="filter_EQI_price"/>
							</div>
						</li>
						<li><a href="javascript:void(0);" class="btn W60" onclick="searchFun(this,'sgeSmp/page')" id="searchFunSpSgeSmp">搜索 </a>	</li>
						<shiro:hasPermission name="sp:edit">
							<li><a href="javascript:void(0);" class="btn W60" onclick="input()" >新   增</a>	</li>
						</shiro:hasPermission>
					</ul>
				</div>
				<div class="data-table">
					<jsp:include page="page.jsp"></jsp:include>
				</div>
				<div id="sgeSmpCommon"/>
			</div>
		</form>
	</div>
	
</body>
</html>
