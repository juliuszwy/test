<%@ page contentType="text/html;charset=UTF-8"%>
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
<div id="allSelect" style="margin: 10px"><input type="checkbox" onclick="selectAllPro(this)" id="allSelectCheckBox"> 全选/不选</input></div>
<form id="spPro_form" method="post" class="registerform">
		<input type="hidden" name="id"  value="${param['id']}"></input>
		<input type="hidden" name="proJsons" id="proJsonsId" ></input>
	<div style="margin: 5px 3px;background-color: #CDC9C9;">
		<div id="spProProxId" style="padding: 10px 5px;" >
	</div>
	</div>
	<div style="text-align:center;padding-top: 20px">
		 <input  type="button" class="btn3 W120" value="开通省份" onclick="proSave()"></input>
	</div>
</form>
<div id="spProCommon"></div>
</body>
<script type="text/javascript">
var spPros = ${spPros};
$(function(){
  createLabel();
});

function proSave(){
		var  spCommon = $("#spCommon");
	$("#proJsonsId").val(JSON.stringify(spPros));
		$("#spPro_form").jrAjax({
			url : "sp/proUpdate",
			autoGetParam : true,
			resultAutoProcess : false,
			newdLoading : true,
			loadingType : 'full',
			container : spCommon,
			successCallback: function(result){
				if(result=='1'){
					spCommon.jrDialog("close");
					$.message.alert("alert","提示","更新成功");
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
};
function selectAllPro(obj){
	var flag = $(obj).is(':checked');
	if(!flag){
		for(var i=1;i<=31;i++){
			$("#Pro_"+i).attr("checked", false);
			spPros[i].proStatus=0;
			$("#handel_"+i).css("visibility","hidden");
		}
	}else{
		for(var i=1;i<=31;i++){
			$("#Pro_"+i).attr("checked", true);
			spPros[i].proStatus=1;
			$("#handel_"+i).css("visibility","visible");
		}
	}
}
function selectSinglePro(index){
	var flag = $("#Pro_"+index).is(':checked');
	if(!flag){
		spPros[index].proStatus=0;
		$("#allSelectCheckBox").attr("checked", false);
		$("#handel_"+index).css("visibility","hidden");
	}else{
		spPros[index].proStatus=1;
		$("#handel_"+index).css("visibility","visible");
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
function createLabel(){
	var spProProxId = document.getElementById("spProProxId");
	var allSelectFlag= true;
	for ( var key in CityName) {
			var spProForm = spPros[key];
			if(key==0){continue;}
			var name = CityName[key];
			var cDiv = document.createElement("div");
			cDiv.setAttribute("class", "proDiv");
			var cInput = document.createElement("input");
			cInput.setAttribute("type", "checkbox");
			cInput.setAttribute("class", "checkPro");
			cInput.setAttribute("id", "Pro_"+key);
			cInput.setAttribute("name", "pros");
			cInput.setAttribute("onClick", "javascript:selectSinglePro("
						+ key + ");");
			cInput.setAttribute("value", key);			
			var proA = document.createElement("a");
			proA.setAttribute("class", "city_A blueTint");
			proA.setAttribute("for", "Pro_"+key);
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
			cutA2.setAttribute("class", "city_A ");
			cutA2.appendChild(cutDiv2);
			
			var timeA = document.createElement("a");
			timeA.setAttribute("id","time_"+key);
			timeA.setAttribute("class", "city_A blueSmall");
			if(spProForm.timeQuantum!=''&&spProForm.timeQuantum!=null&&spProForm.timeQuantum!='null')
				timeA.setAttribute("class", "city_A red");
			timeA.innerHTML = "屏蔽时间";
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
			
			if(spProForm.proStatus==0){allSelectFlag=false;handelDiv.style.visibility="hidden";}
		 	else cInput.setAttribute("checked", "checked");
		 	
			cDiv.appendChild(cInput);
			cDiv.appendChild(proA);
			handelDiv.appendChild(timeA);handelDiv.appendChild(cutA1);
			handelDiv.appendChild(limitA);handelDiv.appendChild(cutA2);
			handelDiv.appendChild(bulletA);
			cDiv.appendChild(handelDiv);
			spProProxId.appendChild(cDiv);
			if(allSelectFlag)$("#allSelectCheckBox").attr("checked", true);
				
	}
}
function timeQuantumPro(index){
	var time = spPros[index].timeQuantum;
	if(time==null||time=='null')time ="";
	$("#spProCommon").jrDialog('open', {
			url : 'sp/timeQuantumPro',
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
			width : '600',
			height : '400'
		});
}
	function bulletConfirm(index){
	if(spPros[index].bulletStatus==0)
		$.message.confirm("通道省份二次确认","确定开启二次确认？",function(flag){
			if(flag){
				spPros[index].bulletStatus=1;
				$("#bullet_"+index).attr("class", "city_A red");
				$("#bullet_"+index).html("二次确认(是)");
			}
		});
	if(spPros[index].bulletStatus==1){
			spPros[index].bulletStatus=0;
			$("#bullet_"+index).attr("class", "city_A blueSmall");
			$("#bullet_"+index).html("二次确认(否)");
		}
	}
</script>
</html>
