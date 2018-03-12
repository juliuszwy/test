<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../../common/taglibs.jsp" %>
<html>
<head>
<title>组合通道列表</title>
<script>
function input(id){
	if(typeof(id) == "undefined")id="";
	$("#cpdCommon").jrDialog('open', {
			url : 'cpd/input',
			title : '组合通道',
			data:{
				'id':id,
			},
			needClose : true,
			width : '1200',
			height : '700'
	});
};
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
	//InitResourceNameSelect();
});
function InitResourceNameSelect() {
	 var selectObj = $("#name");
            $.ajax({
              url: "sp/names?property=0",
              type: "get",
              dataType: "json",
              success: function (result) {
              	var json = eval(result);
              	selectObj.spend( $("<option></option>"));
              	for(var i=0;i<json.length;i++){
              		var option = $("<option></option>").val(json[i].value).html(json[i].text);
              		selectObj.spend(option);
              	}
              	$("select#name").flexselect({ 
				 	hideDropdownOnEmptyInput: true ,
				 	allowMismatch:true,
				 	callback:function(){
			 	}});
	          }
         });
};
function changePage(obj,page,pageSize,totalRows){
	pageLinkClick(obj,'cpd/page',page,pageSize,totalRows);
}
function jumpPage(obj,page,pageSize,totalRows){
	goPageLink(obj,'cpd/page',pageSize,page,totalRows);
}
</script>
</head>

<body>
	<div class="data-partners-tab" style="height:35px;">
		<input type="hidden" value="1" id="spCpdOperatorProxId">
		<ul>
			<li onclick="onclickDataPartners(this,'cpd/page?filter_EQS_operator=M')" style="padding:0px;height:35px;line-height:35px;"><div>移动</div></li>
			<li style="padding:0px;height:35px;line-height:35px;" onclick="onclickDataPartners(this,'cpd/page?filter_EQS_operator=T')"><div>电信</div></li>
			<li onclick="onclickDataPartners(this,'cpd/page?filter_EQS_operator=U')" style="padding:0px;height:35px;line-height:35px;"><div>联通</div></li>
		</ul>
	</div>
<div id="spCpdProxDiv" style="text-align: left;">
	<div class="panel">
		<div class="title">
			<div class="titleImg"><img src="resources/images/left/home-black.png" border="0" width="20px" height="20px"></div>
			<div class="titleText">组合通道列表</div>
		</div>
		<form  action="" method="post">
			<div id="homeSpCpdProxyPromoteShow" class="data-show">
				<div class="search">
					<input type="hidden" name="filter_EQS_operator" value="M" id="operator"/>
					<ul>
						<li>
							<span>通道名称</span>
							<div class=" W150">
							    <input class=" W150" name="filter_LIKES_name" type="text"></select>
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
						<li><a href="javascript:void(0);" class="btn W60" onclick="searchFun(this,'cpd/page')" id=searchFunSpSge>搜索 </a>	</li>
						<shiro:hasPermission name="sp:edit">
						<li><a href="javascript:void(0);" class="btn W60" onclick="input()" >新增 </a></li>
						</shiro:hasPermission>
					</ul>
				</div>
				<div id="qwe"class="data-table">
					<jsp:include page="page.jsp"></jsp:include>
				</div>
				<div id="cpdCommon"/><div id="limitCommon"/><div id="sgeCommon"/>
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
		
		$("#homeSpCpdProxyPromoteShow").jrAjax({
			url : url,
			autoGetParam : false,
			resultAutoProcess : true,
			newdLoading : true,
			loadingType : 'full',
			container : $("#qwe")
		});
	}
	$(document).ready(function() {
		$("#spCpdOperatorProxId").next().find("li:first-child").attr("class","select");
	});
</script>
</html>
