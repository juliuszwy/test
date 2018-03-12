<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../../common/taglibs.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8">
<title>帐号管理 | 新增帐号</title>
<base href="${contextPath }/" />
<script type="text/javascript">
var cityStatus=eval("${spProLimit.citys}");
var cityProx=eval("[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]");
var CityName = {
				'1' : "上海市",
				'2' : "云南省",
				'3' : "内蒙古",
				'4' : "北京市",
				'5' : "吉林省",
				'6' : "四川省",
				'7' : "天津市",
				'8' : "宁夏",
				'9' : "安徽省",
				'10' : "山东省",
				'11' : "山西省",
				'12' : "广东省",
				'13' : "广西",
				'14' : "新疆",
				'15' : "江苏省",
				'16' : "江西省",
				'17' : "河北省",
				'18' : "河南省",
				'19' : "浙江省",
				'20' : "海南省",
				'21' : "湖北省",
				'22' : "湖南省",
				'23' : "甘肃省",
				'24' : "福建省",
				'25' : "西藏",
				'26' : "贵州省",
				'27' : "辽宁省",
				'28' : "重庆市",
				'29' : "陕西省",
				'30' : "青海省",
				'31' : "黑龙江"
			};
			
function selectSingleCity(obj,index){
	if(cityProx[index]==0){
		obj.setAttribute("class", "seatCharts-seat seatCharts-cell selected");
		cityProx[index]=1;
	}else {
		obj.setAttribute("class", "seatCharts-seat seatCharts-cell available");
		cityProx[index]=0;
	}
}
$(function(){
	if($("#spProLimitId").val()===null||$("#spProLimitId").val()===""){
		createCity();
	}
  		
});

function createCity(){
	var bulletFrameForm = document.getElementById("citys");
	for ( var key in CityName) {
			var name = document.createTextNode(CityName[key]);
			var cDiv = document.createElement("div");
			cDiv.appendChild(name);
			if(cityStatus[key]==0){
				cDiv.setAttribute("class", "seatCharts-seat seatCharts-cell available");
				cDiv.setAttribute("onClick", "javascript:selectSingleCity(this,"+ key + ");");
			}else
				cDiv.setAttribute("class", "seatCharts-seat seatCharts-cell unavailable");
			bulletFrameForm.appendChild(cDiv);
	}
}
</script>
</head>
<body>
<div class="panel-body" >
	<form id="spProLimitAdd_form" method="post" class="registerform">
	<input type="hidden" name="id" value="${spProLimit.id }" id="spProLimitId"/>
	<input type="hidden" name="spInfoForm.id" value="${param['spInfoForm.id']}" />
	<input type="hidden" name="citys" id="citysId"/>
		<div class="tableWarp">
		    <table style="border: 1px solid green;">
		    	<tbody>
			        <tr	>
			            <td><label for="payUnitDay" class="label"><span class="red">*</span>用户日月限:</label></td>
			            <td ><input id="payUnitDay"  type="text" name="payUnitDay" class="inputxt " value="${spProLimit.payUnitDay }"></input></td>
			        </tr>
			        <tr><td ><label for="payUnitMonth" class="label"><span class="red">*</span>用户月限:</label></td>
			            <td><input id="payUnitMonth"  type="text" name="payUnitMonth" class="inputxt" value="${spProLimit.payUnitMonth }"></input></td></tr>
			        <tr>
			        	<td><label for="payUnitGlobalDay" class="label" ><span class="red">*</span>总日限:</label></td>
						<td><input id="payUnitGlobalDay" name="payUnitGlobalDay"  type="text"  class="inputxt" value="${spProLimit.payUnitGlobalDay}"></input></td>
			        </tr>
			        <tr><td style="margin-left: 80px"><label for="payUnitGlobalMonth" class="label" ><span class="red">*</span>总月限:</label></td>
						<td><input id="payUnitGlobalMonth" name="payUnitGlobalMonth"  type="text"  class="inputxt" value="${spProLimit.payUnitGlobalMonth}"></input></td></tr>
			    </tbody>
		    </table>
		 </div>
		 <c:if test="${empty spProLimit.id}">
		 	<div id="citys"></div>
		 </c:if>
		 <div style="margin-left:200px;margin-top: 150px">
	        <input  type="button" class="btn W80" value="提交" onclick="spProLimitSave()"></input>
	        <input id="btn_reset" type="button"class="btn W80" value="重置"></input>
	     </div>
	</form>
</div>

<script type="text/javascript">
var demo ;
$(function(){
	//$(".registerform").Validform();  //就这一行代码！;
	demo=$(".registerform").Validform({
		btnReset:"#btn_reset",
		tiptype:3,
		label:'.label',
		showAllError:true,
		ajaxPost:true,
		ignoreHidden:true,
		datatype:{
			"zh2-20":/^[\u4E00-\u9FA5\uf900-\ufa2d]{2,20}$/
		},
	});
	demo.tipmsg.w["zh2-20"]="请输入2到20个中文字符！";
	demo.addRule([{
		ele:".inputxt:eq(0)",
		datatype:"n",
		sucmsg:" "
	},
	{
		ele:".inputxt:eq(1)",
		datatype:"n",
		sucmsg:" "
	},
	{
		ele:".inputxt:eq(2)",
		datatype:"n",
		sucmsg:" "
	},
	{
		ele:".inputxt:eq(3)",
		datatype:"n",
		sucmsg:" "
	}]);
});
function spProLimitSave(){
	var cityVal="";
	if($("#spProLimitId").val()===null||$("#spProLimitId").val()===""){
		var flag = true;
		for(var i=0;i<=31;i++){
			if(cityProx[i]==1){flag=false;break;}
		}
		if(flag){
			$.message.alert("warn","警告","请选择省份至少一个");
			return;
		}else{cityVal = "["+cityProx+"]";}
	}
	$("#citysId").val(cityVal);
	var  spProLimitCommon = $("#spProLimitCommon");
	if(demo.check(false)){
		$("#spProLimitAdd_form").jrAjax({
			url : "spProLimit/save",
			autoGetParam : true,
			resultAutoProcess : true,
			newdLoading : true,
			loadingType : 'full',
			container : spProLimitCommon,
			successCallback: function(result){
				if(result=='1'){
					spProLimitCommon.dialog("close");
					$("#homeSpProLimitProxyPromoteShow").jrAjax({
						url : 'spProLimit/page',
						autoGetParam : true,
						resultAutoProcess : true,
						newdLoading : true,
						loadingType : 'full',
						container : $("#homeSpProLimitProxyPromoteShow").find("div").get(0)
					});
				}else{
					$("#btn_reset").click();
				}
					
			},
			errorCallback:function(result){
				$("#btn_reset").click();
			}
		});
	}
};
$(document).ready(function() {
	//InitcheckBox();
    $("#Validform_msg").remove();
});
 function InitcheckBox() {
 	var roleList = eval('${roleList}');
	 var selectObj = $("#roleIds");
         $.ajax({
              url: "role/1/content",
              type: "get",
              dataType: "json",
              success: function (result) {
              	var json = eval(result);
              	for(var i=0;i<json.length;i++){
              		var input = $("<input></input>").attr("type","checkbox").attr("name","roleIds").val(json[i].id).after(" "+json[i].name+"  ");
              		if(roleList){if(roleList.indexOf(json[i].id)>=0)input.attr("checked",true);}
              		selectObj.append(input);
              		selectObj.append("<br />");
              	}
	          }
         });
     };
</script>
</body>
</html>