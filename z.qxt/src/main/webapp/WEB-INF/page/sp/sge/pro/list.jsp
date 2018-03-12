<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../../../common/taglibs.jsp" %>
<html>
<head>
<style type="text/css">
	.city_A{
	  margin: 0;
	  text-align: center;
	  display: inline-block;
  	  font-size: 13px;
  	  padding-left: 5px;
	}
	.city_A div{
		margin-left: 5px;
	}
	.blueSmall{
		 color: #7D9EC0;
	}
	.proDiv{
		height:25px;
	 	width: 280px;
		display: inline-block;
		padding:2px; 
		
	}
</style>
<script>
</script>
</head>
<body >
	<div class="search">
		<ul>
			<li>
				<span>继承</span>
				<div>
				   <input id="serialNo" type="radio" class=" W100" value="0" name="isIHIT" <c:if test="${param['isInherit']==0 }">checked</c:if> onclick="isInheritChange(this)" style="width:20px;height:20px "/>
				</div>
			</li>
			<li>
				<span>不继承</span>
				<div>
				   <input  type="radio" class=" W100" value="1"  style="width:20px;height:20px " name="isIHIT" <c:if test="${param['isInherit']==1 }">checked</c:if>	onclick="isInheritChange(this)"/>
				</div>
			</li>
		</ul>
	</div>
	<form id="spPro_form" method="post" class="registerform">
		<input type="hidden" name="id"  value="${param['spInfoForm.id']}" ></input>
		<input type="hidden" name="proJsons" id="spProJsonsId" ></input>
		<div style="margin: 5px 3px;background-color: #CDC9C9;">
			<div id="spProProxId" style="padding: 10px 5px;" >
		</div>
		</div>
		<div style="text-align:center;padding-top: 20px">
			 <input  type="button" class="btn3 W120" value="省份确认" onclick="proSave()"></input>
		</div>
	</form>
	<form id="spSgePro_form" method="post" class="registerform" >
		<div id="allSelect"><input type="checkbox" onclick="selectAllPro(this)" id="allSelectCheckBox"> 全选/不选</input></div>
		<input type="hidden" name="id"  value="${param['id']}"></input>
		<input type="hidden" name="proJsons" id="sgeProJsonsId" ></input>
		<div style="margin: 5px 3px;background-color: #CDC9C9;">
			<div id="spSgeProProxId" style="padding: 10px 5px;" >
		</div>
		</div>
		<div style="text-align:center;padding-top: 20px">
			 <input  type="button" class="btn3 W120" value="省份确认" onclick="proSave()"></input>
		</div>
	</form>
	<div id="sgeProCommon"></div><div id="spProCommon"></div><div id="spCommon"></div>
</body>
<script type="text/javascript">
var spPros = ${spPros};
var sgePros = ${sgePros};
$(function(){
  createLabelSp();
  createLabelSge();
  if("${param['isInherit']}"=='0'){$("#spSgePro_form").hide();$("#spPro_form").show();}
  	else {$("#spSgePro_form").show();$("#spPro_form").hide();}
});
function isInheritChange(obj){
	var isInherit = $(obj).val();
	if(isInherit==0){
		$("#spSgePro_form").hide();$("#spPro_form").show();
	}else{ 
		$("#spSgePro_form").show();$("#spPro_form").hide();
	}
}
function proSave(){
	var  spCommon = $("#sgeCommon");
	var isInherit = $("input[name='isIHIT']:checked ").val();
	var url="";var obj;
	if(isInherit==0){
		$("#spProJsonsId").val(JSON.stringify(spPros));
		url="sp/proUpdate";obj=$("#spPro_form");
	}else{
		$("#sgeProJsonsId").val(JSON.stringify(sgePros));
		url="sge/proUpdate";obj=$("#spSgePro_form");
	}
	obj.jrAjax({
			url : url,
			autoGetParam : true,
			resultAutoProcess : false,
			newdLoading : true,
			loadingType : 'full',
			container : spCommon,
			successCallback: function(result){
				if(result=='1'){
					if(isInherit==0){
						 $.ajax({
				              url: "sge/${param['id']}/changeInherit",
				              type: "get",
				              success: function (result) {
					              	if(result==1){
					              		spCommon.jrDialog("close");
					              		$("#searchFunSpSge").click();
					              		$.message.alert("alert","提示","更新成功");
					              	}else{
					              		$.message.alert("warn","警告","更新继承关系失败");
					              	}
					          }
				         });
					}else{
						spCommon.jrDialog("close");
		              	$.message.alert("alert","提示","更新成功");
		              	$("#searchFunSpSge").click(); 
					}
					
				}else if(result=='2'){
					$.message.alert("warn","警告","操作失败");
				}else{
					spCommon.jrDialog("close");
				}
					
			},
			errorCallback:function(result){
				$("#btn_reset").click();
			}
		});
	
}
function createLabelSp(){
	var spProProxId = document.getElementById("spProProxId");
	for ( var key in CityName) {
		if(key==0){continue;}
		var spProForm = spPros[key];
			var name = CityName[key];
			var cDiv = document.createElement("div");
			cDiv.setAttribute("class", "proDiv");
			
			var proA = document.createElement("a");
			proA.setAttribute("class", "city_A blueTint");
			proA.setAttribute("id","ProName_"+key);
			proA.innerHTML = name;
			
			var handelDiv =document.createElement("div");
			handelDiv.setAttribute("style", "display:inline");
			handelDiv.setAttribute("id", "handel_"+key);
			
			var cutDiv1 = document.createElement("div");
			cutDiv1.setAttribute("style", "float:left;width: 1px;height: 13px; background: #000;");
			
			var cutA1 = document.createElement("a");
			cutA1.setAttribute("class", "city_A");
			cutA1.appendChild(cutDiv1);
			
			var cutDiv2 = document.createElement("div");
			cutDiv2.setAttribute("style", "float:left;width: 1px;height: 13px; background: #000;");
			
			var cutA2 = document.createElement("a");
			cutA2.setAttribute("class", "city_A");
			cutA2.appendChild(cutDiv2);
			
			var timeA = document.createElement("a");
			timeA.setAttribute("id","time_"+key);
			timeA.setAttribute("class", "city_A blueSmall");
			timeA.innerHTML = "屏蔽时间";
			if(spProForm.timeQuantum!=''&&spProForm.timeQuantum!=null&&spProForm.timeQuantum!='null')
				timeA.setAttribute("class", "city_A red");
			timeA.setAttribute("href","javascript:void(0);");
			timeA.setAttribute("onClick", "javascript:timeQuantumPro("
						+ key + ");");
			
			var limitA = document.createElement("a");
			limitA.setAttribute("id","limit_"+key);
			limitA.setAttribute("class", "city_A blueSmall");
			limitA.innerHTML = "限额";
			if(spProForm.payUnitDay!='0'||spProForm.payUnitGlobalDay!='0'&&spProForm.payUnitGlobalMonth!='0'&&spProForm.payUnitMonth!='0')
				limitA.setAttribute("class", "city_A red");
			limitA.setAttribute("onClick", "javascript:prolimit("
						+ key + ");");
			limitA.setAttribute("href","javascript:void(0);");
			
			var bulletA = document.createElement("a");
			bulletA.setAttribute("id","bullet_"+key);
			if(spProForm.bulletStatus==1){
				bulletA.setAttribute("class", "city_A red");
				bulletA.innerHTML = "二次确认(是)";
			}else{
				bulletA.setAttribute("class", "city_A blueSmall");
				bulletA.innerHTML = "二次确认( 否)";
			}
			bulletA.setAttribute("onClick", "javascript:bulletConfirm("
						+ key + ");");
			bulletA.setAttribute("href","javascript:void(0);");
		
			if(spProForm.proStatus==0){handelDiv.style.visibility="hidden";proA.setAttribute("class", "city_A gray");}
			cDiv.appendChild(proA);
			handelDiv.appendChild(timeA);handelDiv.appendChild(cutA1);
			handelDiv.appendChild(limitA);handelDiv.appendChild(cutA2);
			handelDiv.appendChild(bulletA);
			cDiv.appendChild(handelDiv);
			spProProxId.appendChild(cDiv);
			
	}
}
function createLabelSge(){
	var spSgeProProxId = document.getElementById("spSgeProProxId");
	for ( var key in CityName) {
		if(key==0){continue;}
		var sgeProForm = sgePros[key];
			var name = CityName[key];
			var cDiv = document.createElement("div");
			cDiv.setAttribute("class", "proDiv");
			var cInput = document.createElement("input");
			cInput.setAttribute("type", "checkbox");
			cInput.setAttribute("class", "checkPro");
			cInput.setAttribute("id", "Pro_"+key);
			cInput.setAttribute("name", "isInheritStr");
			cInput.setAttribute("onClick", "javascript:selectSinglePro("
						+ key + ");");
			cInput.setAttribute("value", key);			
			var proA = document.createElement("a");
			proA.setAttribute("class", "city_A blueTint");
			proA.setAttribute("for", "Pro_"+key);
			proA.setAttribute("id","ProNameSge_"+key);
			proA.innerHTML = name;
			
			var handelDiv =document.createElement("div");
			handelDiv.setAttribute("style", "display:inline");
			handelDiv.setAttribute("id", "handelSge_"+key);
			
			var cutDiv1 = document.createElement("div");
			cutDiv1.setAttribute("style", "float:left;width: 1px;height: 13px; background: #000;");
			
			var cutA1 = document.createElement("a");
			cutA1.setAttribute("class", "city_A");
			cutA1.appendChild(cutDiv1);
			
			var cutDiv2 = document.createElement("div");
			cutDiv2.setAttribute("style", "float:left;width: 1px;height: 13px; background: #000;");
			
			var cutA2 = document.createElement("a");
			cutA2.setAttribute("class", "city_A");
			cutA2.appendChild(cutDiv2);
			
			var timeA = document.createElement("a");
			timeA.setAttribute("id","timeSge_"+key);
			timeA.setAttribute("class", "city_A blueSmall");
			timeA.innerHTML = "屏蔽时间";
			if(sgeProForm.timeQuantum!=''&&sgeProForm.timeQuantum!=null&&sgeProForm.timeQuantum!='null')
				timeA.setAttribute("class", "city_A red");
			timeA.setAttribute("href","javascript:void(0);");
			timeA.setAttribute("onClick", "javascript:timeQuantumPro("
						+ key + ");");
			
			var limitA = document.createElement("a");
			limitA.setAttribute("id","limitSge_"+key);
			limitA.setAttribute("class", "city_A blueSmall");
			limitA.innerHTML = "限额";
			if(sgeProForm.payUnitDay!='0'||sgeProForm.payUnitGlobalDay!='0'&&sgeProForm.payUnitGlobalMonth!='0'&&sgeProForm.payUnitMonth!='0')
				limitA.setAttribute("class", "city_A red");
			limitA.setAttribute("onClick", "javascript:prolimit("
						+ key + ");");
			limitA.setAttribute("href","javascript:void(0);");
			
			var bulletA = document.createElement("a");
			bulletA.setAttribute("id","bulletSge_"+key);
			if(sgeProForm.bulletStatus==1){
				bulletA.setAttribute("class", "city_A red");
				bulletA.innerHTML = "二次确认(是)";
			}else{
				bulletA.setAttribute("class", "city_A blueSmall");
				bulletA.innerHTML = "二次确认( 否)";
			}
			bulletA.setAttribute("onClick", "javascript:bulletConfirm("
						+ key + ");");
			bulletA.setAttribute("href","javascript:void(0);");
			if(sgeProForm.proStatus==1)
		 		cInput.setAttribute("checked", "checked");
		 	else{
		 		handelDiv.style.visibility="hidden";
		 	}
			
			cDiv.appendChild(cInput);
			cDiv.appendChild(proA);
			handelDiv.appendChild(timeA);handelDiv.appendChild(cutA1);
			handelDiv.appendChild(limitA);handelDiv.appendChild(cutA2);
			handelDiv.appendChild(bulletA);
			cDiv.appendChild(handelDiv);
			spSgeProProxId.appendChild(cDiv);
			
	}
}

function selectAllPro(obj){
	var flag = $(obj).is(':checked');
	if(!flag){
		for(var i=1;i<=31;i++){
			$("#Pro_"+i).attr("checked", false);
			sgePros[i].proStatus=0;
			$("#handelSge_"+i).css("visibility","hidden");
		}
	}else{
		for(var i=1;i<=31;i++){
			$("#Pro_"+i).attr("checked", true);
			sgePros[i].proStatus=1;
			$("#handelSge_"+i).css("visibility","visible");
		}
	}
}
function selectSinglePro(index){
	var flag = $("#Pro_"+index).is(':checked');
	if(!flag){
		sgePros[index].proStatus=0;
		$("#allSelectCheckBox").attr("checked", false);
		$("#handelSge_"+index).css("visibility","hidden");
	}else{
		sgePros[index].proStatus=1;
		$("#handelSge_"+index).css("visibility","visible");
		var all = false;
		for(var i=1;i<=31;i++){
			if(i!=index)
				if(!$("#Pro_"+i).is(':checked')){all=true;break;}
		}
		if(!all){
			$("#allSelectCheckBox").attr("checked", true);
		}
	}
}


function timeQuantumPro(index){
	var isInherit = $("input[name='isIHIT']:checked").val();
	var time ="";var url="";
	if(isInherit==0){
		time = spPros[index].timeQuantum;
		if(time==null||time=='null')time ="";
		url = "sp/timeQuantumPro";
	}else{
		time = sgePros[index].timeQuantum;
		if(time==null||time=='null')time ="";
		url = 'sge/timeQuantumPro';
	}
	$("#spProCommon").jrDialog('open', {
				url : url,
				title : '屏蔽时间',
				data:{
					'pro':index,
					'value':time
				},
				needClose : true,
				width : '500',
				height : '200'
		});
}
function prolimit(index){
	var isInherit = $("input[name='isIHIT']:checked").val();
	if(isInherit==1){
		$("#spProCommon").jrDialog('open', {
				url : 'sge/proLimit',
				title : '通道省份上限',
				data:{
					'pro':index,
					'payUnitDay':sgePros[index].payUnitDay,
					'payUnitMonth' : sgePros[index].payUnitMonth,
	 				'payUnitGlobalDay': sgePros[index].payUnitGlobalDay,
					'payUnitGlobalMonth' :sgePros[index].payUnitGlobalMonth
				},
				needClose : true,
				width : '600',
				height : '400'
		});
	}else{
		$("#spProCommon").jrDialog('open', {
				url : 'sp/proLimit',
				title : '通道省份上限',
				data:{
					'pro':index,
					'payUnitDay':spPros[index].payUnitDay,
					'payUnitMonth' : spPros[index].payUnitMonth,
	 				'payUnitGlobalDay': spPros[index].payUnitGlobalDay,
					'payUnitGlobalMonth' :spPros[index].payUnitGlobalMonth
				},
				needClose : true,
				width : '500',
				height : '300'
		});
	}
}
	function bulletConfirm(index){
		var isInherit = $("input[name='isIHIT']:checked").val();
		var isHIT = null;var obj=null;
		if(isInherit==1){
			isHIT = sgePros;obj = $("#bulletSge_"+index);
		}else {isHIT = spPros;obj = $("#bullet_"+index);}
		if(isHIT[index].bulletStatus==0)
				$.message.confirm("通道省份二次确认","确定开启二次确认？",function(flag){
					if(flag){
						isHIT[index].bulletStatus=1;
						obj.attr("class", "city_A red");
						obj.html("二次确认(是)");
					}
				});
			if(isHIT[index].bulletStatus==1){
					isHIT[index].bulletStatus=0;
					obj.attr("class", "city_A blueSmall");
					obj.html("二次确认(否)");
				}
		}
</script>
</html>
