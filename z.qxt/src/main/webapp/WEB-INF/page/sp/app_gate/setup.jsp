<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../../common/taglibs.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<style type="text/css">
.niceform{
	background-color:#efefef;
	/* //border:1px solid #999; */
	padding:5px 15px;
	height:600px;
	
}
.provinces_title{
	border-bottom:0px;
	line-height:34px;
	color:#000
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8">
<base href="${contextPath }/" />
<script src="resources/js/order.js"></script>

<body>
	<!-- <div class="panel" style="max-width: 1200px">
		<div class="title">
			<div class="titleImg"><img src="resources/images/left/home-black.png" border="0" width="20px" height="20px"></div>
			<div class="titleText">CP列表</div>
		</div>
			<div id="homeCpProxyPromoteShow" class="data-show">
				<div class="search">
					<ul>
						<li>
							<span>CP编号</span>
							<div>
							   <input id="serialNo" class=" W150" name="filter_EQS_serialNo" type="text"/>
							</div>
						</li>
						<li>
							<span>CP名称</span>
							<div>
							   <input id="name" class=" W150" name="filter_LIKES_name" type="text"/>
							</div>
						</li>
						<li><a href="javascript:void(0);" class="btn W60" onclick="searchFun(this,'appGateWay/page?filter_EQI_status=0')" id="searchFunSp">搜索 </a>	</li>
					</ul>
					<ul>
						<li>
							<input style="width: 19px;height: 25px;" type="checkbox"  id="settleIdsCheckAllBox" onclick="allCpCheckBox();"> 
						</li>
						<li>全选/反选 &nbsp;&nbsp;&nbsp;</li>
					</ul>
				</div>
				<div class="data-table" >
				</div>
				<div id="appGateCommon"/>
			</div>
	</div> -->
	<div class="panel" style="max-width: 1200px">
		<div class="title">
			<div class="titleImg"><img src="resources/images/left/home-black.png" border="0" width="20px" height="20px"></div>
			<div class="titleText">通道应用分配</div>
		</div>
		<div id="homeSgeCpAppProxyPromoteShow" class="data-show">
				<form id="conditionForm" class="niceform" >
			    	<div class="search" style="margin-left: 20px">
				    	<ul>
							<li><span>应用顺序</span>
								<div><input type="text" id="appChoice"  onkeyup="changeChoice()" /></div>
							</li>
							<input type="hidden" name="selectedChanel" id="selectedChanel"/>
				    	</ul>
			    	</div>
			        <div style="width:100%;height:90%">
			            <div style="display:inline-block;margin:1% 2%;width:400px;height: 80%;font-size: " >
			                <select id="total" name="choices" multiple="multiple" style="width:100%;height:100%;overflow:hidden;" size="25" class="NFMultiSelect">
			                </select>
			            </div>
			            <div style="width:9%; display:inline-block;position: relative;top: -220px;">
			                <input  type="button" value="<<" onclick="chooseItems(conditionForm.selectcolumns, conditionForm.choices)"  class="btn3 W40">
			                <input  type="button" value=">>" onclick="chooseItems(conditionForm.choices, conditionForm.selectcolumns)" class="btn3 W40">
			            </div>
			            <div style="display:inline-block;;margin:1% 2%;width:400px;height: 80%">
			                <select id="avail" name="selectcolumns" multiple="multiple " style="width:100%;height:100%;overflow:hidden;" size="25" class="NFMultiSelect">
			                </select>
			            </div>
			            <div > <button  type="button" id="clicksaveDate" class="btn4 W80" style="width:100px;margin-left: 450px;margin-top: 20px">提交</button></div>
			        </div>
			        
			    </form>
		</div>
	</div>
<script type="text/javascript">
function changePage(obj,page,pageSize,totalRows){
	pageLinkClick(obj,'appGateWay/page?filter_EQI_status=0',page,pageSize,totalRows);
}
function jumpPage(obj,page,pageSize,totalRows){
	goPageLink(obj,'appGateWay/page?filter_EQI_status=0',pageSize,page,totalRows);
}
function changeChoice(){
		var condition = $("#appChoice").val();
		newChannelOrder();
		if(condition == undefined || $.trim(condition) == ""){
			$("#total option").bind('dblclick', function(){	
				chooseItems(conditionForm.choices, conditionForm.selectcolumns);
			});
			return;
		}
		$("#total option").each(function(){
			if($(this).html().indexOf(condition) < 0){
				$(this).remove();
			}
		});	
		$("#total option").bind('dblclick', function(){	
			chooseItems(conditionForm.choices, conditionForm.selectcolumns);
		});	
	}
	function newChannelOrder(){
		var avail = [];
		$("#total").empty();
		$("#avail option").each(function(){
			avail[$(this).attr("value")]=$(this).attr("value");
		});
		var AllselectCheckBox =  $("#homeCpProxyPromoteShow").find("table input:checked");
		for(var index=0;index<AllselectCheckBox.length;index++){
			var cpSerialNo = AllselectCheckBox[index].value;
			var cpAllApps = apps[cpSerialNo];
			for(var key in cpAllApps){
				if(typeof(avail[key]) == "undefined"){
					var vTotalOption=document.createElement("option");
					vTotalOption.innerHTML = cpAllApps[key].name+"("+cpAllApps[key].serialNo+")";
					vTotalOption.value = key;
					document.getElementById('total').appendChild(vTotalOption);   
				}
			}
		}
	}
function allCpCheckBox(){
	if($("#settleIdsCheckAllBox").is(':checked'))
	 	$("#homeCpProxyPromoteShow").find("table input").attr("checked",true);
	else{
		$("#homeCpProxyPromoteShow").find("table input").attr("checked",false);
	}
	createOption();
}
$(function(){
	var table=$("#homeCpProxyPromoteShow").children().eq(1);
	$("#homeCpProxyPromoteShow").jrAjax({
		url : 'appGateWay/page?filter_EQI_status=0',
		autoGetParam : true,
		resultAutoProcess : true,
		newdLoading : true,
		loadingType : 'full',
		container : table
	});
	$("#clicksaveDate").on('click', function(){
		var arrNo =[]; 
	    var xxx = document.getElementById('avail').options;
	    if(xxx.length<=0&&jQuery.isEmptyObject(avapps)){
	    	clearAll();
	   	 	return;
	    }
		for(var i=0;i<xxx.length;i++) {
			arrNo[i]= xxx[i].value;
		}
		sendAjax(arrNo);
	});
});
var apps = ${allApps};
var avapps = ${avaApps};
function sendAjax(arr){
	var gateId = "${param['id']}";
	var gateType = "${param['type']}";
	var sgeOrcpd = "${param['gateType']}";
			$.ajax({
				   	type:'post',         
				   	dataType:'json',  
				   	url: "appGateWay/save",
				   	data: {"gateId": gateId,"checkedAppStrings": JSON.stringify(arr),'gateType':gateType,"sgeOrcpd":sgeOrcpd}, 
				   	success: function(message) {
						if(message == 1)	{
							$.message.alert("alert","提示","更新成功");
							$("#sgeCommon").jrDialog('close');
							$("#searchFunSpSge").click();
						}else{
							$.message.alert("warn","警告","更新失败");
						}
					 }, 
					 error : function() { 
						$.message.alert("error","错误","服务器开小差了！");
					}
	 	});
}
$(document).ready(function() {
	createOption();
    $("#Validform_msg").remove();
});
 function InitDoTypeSelect() {
 	 var doType = "${spGatewaySge.doType}";
	 var selectObj = $("#doType");
         $.ajax({
              url: "sgeType/doTypes",
              type: "get",
              dataType: "json",
              success: function (result) {
              	var json = eval(result);
              	for(var i=0;i<json.length;i++){
              		var option = $("<option></option>").val(json[i].value).html(json[i].text);
              		if(json[i].value==doType) option.attr("selected",true);
              		selectObj.append(option);
              	}
	          }
         });
     };
function createOption() {
		$("#total").empty(); 
		$("#avail").empty();
		//var AllselectCheckBox =  $("#homeCpProxyPromoteShow").find("table input:checked");
		/* for(var index=0;index<AllselectCheckBox.length;index++){
			var cpSerialNo = AllselectCheckBox[index].value;
			var cpAllApps = apps[cpSerialNo]; */
			for(var key in apps){
				var vTotalOption=document.createElement("option");
				vTotalOption.innerHTML = apps[key].name+"("+apps[key].serialNo+")";
				vTotalOption.value = key;
				if(typeof(avapps[key]) == "undefined"){
					document.getElementById('total').appendChild(vTotalOption);   
				}else{
					document.getElementById('avail').appendChild(vTotalOption);  
				}
			}
		$("#total option").bind('dblclick', function(){	
			chooseItems(conditionForm.choices, conditionForm.selectcolumns);
		});	
		$("#avail option").bind('dblclick', function(){	
			chooseItems(conditionForm.selectcolumns, conditionForm.choices);
		});	
}
function clearAll(){
	$("#homeCpProxyPromoteShow").find("table input").attr("checked",false);
	$("#settleIdsCheckAllBox").attr("checked",false);
	$("#total").empty(); 
	$("#avail").empty();
}
</script>
</body>
</html>