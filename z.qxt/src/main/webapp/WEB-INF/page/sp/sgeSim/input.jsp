<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../../common/taglibs.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8">
<title>帐号管理 | 新增帐号</title>
<base href="${contextPath }/" />
<body>
<div class="panel-body" >
	<form id="spSgeSmpAdd_form" method="post" class="registerform">
	<input type="hidden" name="id" value="${spGatewaySgeSimp.id }"/>
	<input type="hidden"  name="spInfoForm.id" value="${param['spId'] }"/>
		<div class="tableWarp">
		    <table>
		    	<tbody>
			    	<c:if test="${not empty spGatewaySgeSimp.id}">
						 <tr>
				            <td><label for="serialNo">编号:</label></td>
				            <td><input type="text" name="serialNo" value="${spGatewaySgeSimp.serialNo }"disabled='disabled'></input></td>
			       		 </tr>
					</c:if>
			        <tr>
			            <td><label for="name" class="label"><span class="red">*</span>名称:</label></td>
			            <td><input id="name"  type="text" name="name" class="inputxt" value="${spGatewaySgeSimp.name }"></input></td>
			        </tr>
			        <tr>
			            <td><label for="price" class="label"><span class="red">*</span>价格:</label></td>
			            <td><input id="price"  type="text" name="price" class="inputxt" value="${spGatewaySgeSimp.price }"></input></td>
			        </tr>
			         <tr>
			        	<td><label for="scale" class="label" ><span class="red">*</span>结算比例:</label></td>
						<td>
							<input  name="scale"  type="text"   class="inputxt" value="${spGatewaySgeSimp.scale}"></input>
						</td>
			        </tr>
			        <tr>
			        	<td><label for="" class="label" ><span class="red">*</span>省份继承:</label></td>
						<td>
							<input  name="isInherit"  type="radio"  value="0" <c:if test="${spGatewaySgeSimp.isInherit==0 }">checked</c:if> 
							<c:if test="${not empty spGatewaySgeSimp.id}">disabled='disabled'</c:if>>继承</input>
							<input  name="isInherit"  type="radio"  value="1" <c:if test="${spGatewaySgeSimp.isInherit==1 }">checked</c:if>
							<c:if test="${not empty spGatewaySgeSimp.id}">disabled='disabled'</c:if>>不继承</input> 
						</td>
			        </tr>
			        <tr>
			        	<td><label for="operator" class="label" ><span class="red">*</span>运营商:</label></td>
						<td>
							<select  name="operator" panelHeight="auto" <c:if test="${not empty spGatewaySgeSimp.id}">disabled='disabled'</c:if> style="width:150px" >
			            	 	<option value="M" <c:if test="${spGatewaySgeSimp.operator=='M' }">selected</c:if>>移动</option>
			                	<option value="U" <c:if test="${spGatewaySgeSimp.operator=='U' }">selected</c:if>>联通</option>
			                	<option value="T" <c:if test="${spGatewaySgeSimp.operator=='T' }">selected</c:if>>电信</option>
			           		</select>
						</td>
			        </tr>
			        <tr>
			        	<td><label for="level" class="label" ><span class="red">*</span>等级:</label></td>
						<td>
							<select  name="level" panelHeight="auto" style="width:150px" >
		            	 	<option value="0" <c:if test="${spGatewaySgeSimp.level==0 }">selected</c:if>>优</option>
		                	<option value="1" <c:if test="${spGatewaySgeSimp.level==1 }">selected</c:if>>良</option>
		                	<option value="2" <c:if test="${spGatewaySgeSimp.level==2 }">selected</c:if>>中</option>
		                	<option value="3" <c:if test="${spGatewaySgeSimp.level==3 }">selected</c:if>>差</option>
						</td>
			        </tr>
			        <tr >
			            <td><label for="doType" class="label">业务类型:</label></td>
			            <td>
				            <select id="doType" name="doType" tabindex="4"  style="width:150px;"></select>
			            </td>
				    </tr>
					<input type="hidden" name="status" value="1"/>
					<input type="hidden" name="type" value="0"/>
			    </tbody>
		    </table>
		    <div style="margin-left:180px;padding-top: 20px">
		        <input  type="button" class="btn W80" value="提交" onclick="sgeSmpSave()"></input>
		        <input id="btn_reset" type="button"class="btn W80" value="重置"></input>
		    </div>
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
			"fOne":/^0(\.\d{1,})?$/
		},
	});
	demo.tipmsg.w["fOne"]="请输入小数(0.XXX)";
	demo.addRule([{
		ele:".inputxt:eq(0)",
		datatype:"s2-20",
		sucmsg:" "
	},
	{
		ele:".inputxt:eq(1)",
		datatype:"n",
		sucmsg:" "
	},
	{
		ele:".inputxt:eq(2)",
		datatype:"fOne",
		sucmsg:" "
	},
	{
		ele:".inputxt:eq(3)",
		datatype:"n",
		sucmsg:" "
	}]);
});
function sgeSmpSave(){
	var  sgeSmpCommon = $("#sgeSmpCommon");
	if(demo.check(false)){
		$("#spSgeSmpAdd_form").jrAjax({
			url : "sgeSmp/save",
			autoGetParam : true,
			resultAutoProcess : true,
			newdLoading : true,
			loadingType : 'full',
			container : sgeSmpCommon,
			successCallback: function(result){
				if(result=='1'){
					sgeSmpCommon.jrDialog("close");
					$("#searchFunSpSgeSmp").click();
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
	InitDoTypeSelect();
    $("#Validform_msg").remove();
});
 function InitDoTypeSelect() {
 	 var doType = "${spGatewaySgeSimp.doType}";
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
</script>
</body>
</html>