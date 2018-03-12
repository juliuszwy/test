<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../../common/taglibs.jsp" %>
<html>
<head>
<script>
function input(id){
	if(typeof(id) == "undefined")id="";
	$("#sgeCommon").jrDialog('open', {
			url : 'sge/input',
			title : 'SP',
			data:{
				'id':id,
				'spInfoForm.id':"${param['filter_EQS_spInfo.id']}"
			},
			needClose : true,
			width : '1200',
			height : '700'
	});
};
$(document).ready(function() {
	$("#spGateType").flexselect({ 
		 	hideDropdownOnEmptyInput: true ,
		 	allowMismatch:true,
		 	callback:function(){
	}});
	$("#spGateDoType").flexselect({ 
		 	hideDropdownOnEmptyInput: true ,
		 	allowMismatch:true,
		 	callback:function(){
	}});
	InitSgeResourceNameSelect();
	InitSpResourceNameSelect();
});
function InitSpResourceNameSelect() {
	 var selectObj = $("#spIdSelect");
            $.ajax({
              url: "sp/names",
              type: "get",
              dataType: "json",
              success: function (result) {
              	var json = eval(result);
              	selectObj.append( $("<option></option>"));
              	for(var i=0;i<json.length;i++){
              		var option = $("<option></option>").val(json[i].value).html(json[i].text);
              		selectObj.append(option);
              	}
              	$("#spIdSelect").flexselect({ 
				 	hideDropdownOnEmptyInput: true ,
				 	allowMismatch:true,
				 	callback:function(){
			 	}});
	          }
         });
};
function InitSgeResourceNameSelect() {
	 var selectObj = $("#selectName");
            $.ajax({
              url: "sgeSmp/namesByCarrier",
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
function deleteSge(id){
	$.message.confirm("","确定要删除吗",function(flag){
	if(flag){
		$.ajax({
					type : "POST",
					url : "sge/"+id+"/delete",
					dataType : "json",
					success : function(msg) {
						$.message.alert("alert","提示","删除成功");
						$("#searchFunSpSge").click();
					},
					error : function() {
						$.message.alert("error","错误","服务器出错了！");
					}
				});
			}
	});
}
function cpAppAllotSge(sgeId,type){
	$("#sgeCommon").jrDialog('open', {
			url : 'appGateWay/setup',
			title : 'SP',
			data:{
				'id':sgeId,
				'type':type,
				'gateType':0
			},
			needClose : true,
			width : '1200',
			height : '700'
	});
}
function changePage(obj,page,pageSize,totalRows){
	pageLinkClick(obj,'cp/page',page,pageSize,totalRows);
}
function jumpPage(obj,page,pageSize,totalRows){
	goPageLink(obj,'cp/page',pageSize,page,totalRows);
}
</script>
</head>
<body>
	<div class="data-partners-tab" style="height:35px;">
		<input type="hidden" value="1" id="spSgeOperatorProxId">
		<ul>
			<li onclick="onclickDataPartners(this,'sge/page?filter_EQS_operator=M')" style="padding:0px;height:35px;line-height:35px;" value="M"><div>移动</div></li>
			<li style="padding:0px;height:35px;line-height:35px;" onclick="onclickDataPartners(this,'sge/page?filter_EQS_operator=T')"><div>电信</div></li>
			<li onclick="onclickDataPartners(this,'sge/page?filter_EQS_operator=U')" style="padding:0px;height:35px;line-height:35px;"><div>联通</div></li>
		</ul>
	</div>
<div id="cpDevelopAppIncomeChartDiv" style=" text-align: left;">
	<div class="panel">
		<div class="title">
			<div class="titleImg"><img src="resources/images/left/home-black.png" border="0" width="20px" height="20px"></div>
			<div class="titleText">通道列表</div>
		</div>
		<form  action="" method="post">
			<div id="homeSpSgeProxyPromoteShow" class="data-show">
				<div class="search">
					<input type="hidden" name="filter_EQS_operator" value="M" id="operator"/>
					<ul>
						<li>
							<span>SP名称</span>
							<div>
							   <select id="spIdSelect" class=" W150" name="filter_EQS_spInfo.id"></select>
							</div>
						</li>
						<li>
							<span>通道名称</span>
							<div class=" W150">
							   <select id="selectName" class=" W150" name="filter_LIKES_name"></select>
							</div>
						</li>
						<li>
							<span>业务类型</span>
							<div class=" W150">
							   <select id="spGateDoType" class=" W150" name="filter_EQS_doType">
							   		<option value=""></option>
							   		<c:forEach items="${spGateTypes}" var="spt">
							   			<option value="${spt.value }">${spt.text }</option>
							   		</c:forEach>
							   </select>
							</div>
						</li>
						<li>
							<span>通道类型</span>
							<div class=" W150">
							   <select id="spGateType" class=" W150" name="filter_EQI_type">
							   		<option value=""></option>
							   		<option value="1">专属</option>
							   		<option value="0">未分配</option>
							   </select>
							</div>
						</li>
						<li>
							<span>价格</span>
							<div class=" W150">
							   <input class=" W150" name="filter_EQI_price" type="text"></select>
							</div>
						</li>
						<li><a href="javascript:void(0);" class="btn W60" onclick="searchFun(this,'sge/page')" id="searchFunSpSge">搜索 </a>	</li>
						<shiro:hasPermission name="sge:develop">
							<li><a href="javascript:void(0);" class="btn3 W100" onclick="develop()" >发布 </a></li>
						</shiro:hasPermission>
					</ul>
				</div>
				<div id="qwe"class="data-table">
					<jsp:include page="page.jsp"></jsp:include>
				</div>
				<div id="sgeCommon"/><div id="limitCommon"/>
				<div id="bulletCommon"/>
			</div>
		</form>
	</div>
	</div>
</body>
<script type="text/javascript">
	function onclickDataPartners(obj,url){
		if(typeof($(obj).attr("class")) == "undefined"||$(obj).attr("class")==''||$(obj).attr("class")==null){
			$(obj).siblings(".select").removeClass("select");
			$(obj).attr("class","select");
			if($(obj).index()==0)$("#operator").val("M");
			if($(obj).index()==1)$("#operator").val("T");
			if($(obj).index()==2)$("#operator").val("U");
		}else{
			return;
		}
		
		$("#homeSpSgeProxyPromoteShow").jrAjax({
			url : url,
			autoGetParam : false,
			resultAutoProcess : true,
			newdLoading : true,
			loadingType : 'full',
			container : $("#qwe")
		});
	}
	$(document).ready(function() {
		$("#spSgeOperatorProxId").next().find("li:first-child").attr("class","select");
	});
	function pro(sgeId,isInherit,spid){
		$("#sgeCommon").jrDialog('open', {
			url : 'sge/pro',
			title : '省份控制',
			data:{
				'id':sgeId,
				'spInfoForm.id':spid,
				'isInherit':isInherit
			},
			needClose : true,
			width : '1200',
			height : '500'
		});
	}
</script>
</html>
