<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8">
<title>帐号管理 | 新增帐号</title>
<base href="${contextPath }/" />
<style type="text/css">

.squaredOne {
  width: 20px;
  height: 20px;
  position: relative;
  margin: 5px auto;
  background-color: #F2F2F2;
  
}
.squaredOne label {
  width: 20px;
  height: 20px;
  position: absolute;
  top: 0px;
  left: 0px;
  cursor: pointer;
}
.squaredOne label:after {
  content: '';
  width: 19px;
  height: 19px;
  position: absolute;
  top: 0px;
  left: 0px;
  background: #00bf00;
  background: -moz-linear-gradient(top, #00bf00 0%, #009400 100%);
  background: -webkit-linear-gradient(top, #00bf00 0%, #009400 100%);
  background: linear-gradient(to bottom, #00bf00 0%, #009400 100%);
  -moz-box-shadow: inset 0px 1px 1px white, 0px 1px 3px rgba(0, 0, 0, 0.5);
  -webkit-box-shadow: inset 0px 1px 1px white, 0px 1px 3px rgba(0, 0, 0, 0.5);
  box-shadow: inset 0px 1px 1px white, 0px 1px 3px rgba(0, 0, 0, 0.5);
  filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
  opacity: 0;
}
.squaredOne label:hover::after {
  filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=30);
  opacity: 0.3;
}
.squaredOne input[type=checkbox] {
  visibility: hidden;
}
.squaredOne input[type=checkbox]:checked + label:after {
  filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
  opacity: 1;
}
.ondisplay {
  border-bottom: 1px solid gray;
}
.ondisplay section {
 	width: 55px;
  height: 55px;
  display: inline-block;
  position: relative;
  text-align: center;
  margin: 5px;
  border-right:thick double #8C8C8C;
 
}
.ondisplay section:after {
  content: attr(title);
  position: absolute;
  width: 100%;
  left: 0;
  bottom: 3px;
  color: black;
  font-size: 12px;
}
.ondisplay section:first-child:after {
	color:red;
}
</style>
</head>
	<form id="bulletFrame_form" method="post" class="registerform">
	<input type="hidden" name="id" value="${bulletFrame.id }"/>
	<input type="hidden" name="commonId" value="${param['id']}"/>
	<input type="hidden" id = "bullet" name="bullet" value=""/>
	<div id="ondisplay"class="ondisplay" style="background-color: #CCCCCC">
	</div>
	<div style="text-align:center;padding-top: 20px">
		 <input  type="button" class="btn3 W120" value="提交" onclick="bulletFrameSave()"></input>
	</div>
	</form>
<script type="text/javascript">
var  bulletFrame =eval("${bulletFrame.bullet}"); 
$(function(){
  createBulletFrameCity();
});
function bulletFrameSave(){
	var bulletFrameVal="";
	var flag = true;
	for(var i=0;i<=31;i++){
		if(bulletFrame[i]==1){flag=false;break;}
	}
	if(flag){
	}else{bulletFrameVal = "["+bulletFrame+"]";}
	$("#bullet").val(bulletFrameVal);
	var  bulletCommon = $("#bulletCommon");
	$("#bulletFrame_form").jrAjax({
		url : "common/bulletFrameSave",
		autoGetParam : true,
		resultAutoProcess : true,
		newdLoading : true,
		loadingType : 'full',
		container : bulletCommon,
		successCallback: function(result){
			if(result=='1'){
				bulletCommon.jrDialog("close");
			}else{
				$("#btn_reset").click();
			}
				
		},
		errorCallback:function(result){
			$("#btn_reset").click();
		}
	});
};
function selectAllCity(index){
	var flag = $("#City_"+index).is(':checked');
	if(flag){
		for(var i=1;i<=31;i++){
			$("#City_"+i).attr("checked", false);
			bulletFrame[0]=0;bulletFrame[i]=0;
		}
	}else{
		for(var i=1;i<=31;i++){
			$("#City_"+i).attr("checked", true);
			bulletFrame[0]=1;bulletFrame[i]=1;
		}
	}
}
function selectSingleCity(index){
	var flag = $("#City_"+index).is(':checked');
	if(flag){
		bulletFrame[0]=0;bulletFrame[index]=0;
		$("#City_0").attr("checked", false);
	}else{
		bulletFrame[index]=1;
		var all = false;
		for(var i=1;i<=31;i++){
			if(i!=index)
				if(!$("#City_"+i).is(':checked')){all=true;break;}
		}
		if(!all){
			bulletFrame[0]=1;
			$("#City_0").attr("checked", true);
		}
	}
}

function createBulletFrameCity(){
	var bulletFrameForm = document.getElementById("ondisplay");
	for ( var key in CityName) {
			var name = CityName[key];
			var cSection = document.createElement("section");
			cSection.setAttribute("title", name);
			var cDiv = document.createElement("div");
			cDiv.setAttribute("class", "squaredOne");
			var cInput = document.createElement("input");
			cInput.setAttribute("type", "checkbox");
			cInput.setAttribute("class", "checkCity");
			cInput.setAttribute("id", "City_"+key);
			if(bulletFrame[key]==1)
				cInput.setAttribute("checked", "checked");
			var cLabel = document.createElement("label");
			cLabel.setAttribute("for", "City_"+key);
			if(key==0)
				cLabel.setAttribute("onClick", "javascript:selectAllCity("+ key + ");");
			else 
				cLabel.setAttribute("onClick", "javascript:selectSingleCity("+ key + ");");
			cDiv.appendChild(cInput);
			cDiv.appendChild(cLabel);
			cSection.appendChild(cDiv);
			bulletFrameForm.appendChild(cSection);
	}
}
</script>
</body>
</html>