<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../../common/taglibs.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8">
<base href="${contextPath }/" />
<body>
<div class="" >
	<form id="spSgeAdd_form" method="post" class="registerform">
	<input type="hidden" name="id" value="${spGatewaySge.id }"/>
	<input type="hidden" name="type" value="${spGatewaySge.type }"/>
	<input type="hidden" name="isInherit" value="${spGatewaySge.isInherit }"/>
	<input type="hidden"  name="spInfoForm.id" value="${param['spInfoForm.id'] }"/>
		<div class="tableDouble">
		    <table>
		    	<tbody>
			    	<c:if test="${not empty spGatewaySge.id}">
						 <tr>
				            <td><label for="serialNo">通道编号:</label></td>
				            <td><input class="Disable" type="text" name="serialNo" value="${spGatewaySge.serialNo }"disabled='disabled'></input></td>
				            <td><label for="price" class="label"><span class="red">*</span>价格:</label></td>
			            	<td><input id="price"  type="text" name="price"  value="${spGatewaySge.price }" disabled='disabled'></input></td>
			       		 </tr>
					</c:if>
			        <tr>
			        	<td><label  class="label">提供者:</label></td>
			            <td><input  class="Disable"type="text" name="spInfoForm.name"  value="${spGatewaySge.spInfoForm.name }" disabled="true"></input></td>
			            <td><label  class="label">名称:</label></td>
			            <td><input class="Disable"  type="text" name="name"  value="${spGatewaySge.name }" disabled="true"></input></td>
			        </tr>
			         <tr>
			         	<td><label for="operator" class="label" ><span class="red">*</span>运营商:</label></td>
						<td>
							<select class="SelectList" name="operator" panelHeight="auto" <c:if test="${not empty spGatewaySge.id}">disabled='disabled'</c:if> style="width:150px" >
			            	 	<option value="M" <c:if test="${spGatewaySge.operator=='M' }">selected</c:if>>移动</option>
			                	<option value="U" <c:if test="${spGatewaySge.operator=='U' }">selected</c:if>>联通</option>
			                	<option value="T" <c:if test="${spGatewaySge.operator=='T' }">selected</c:if>>电信</option>
			           		</select>
						</td>
						<td><label  >通道类型:</label></td>
						<td>
							<input   type="text"   value="单通道" disabled="disabled"></input>
						</td>
			        </tr>
			        <tr>
			        	<td><label for="level" class="label" ><span class="red">*</span>等级:</label></td>
						<td>
							<select  name="level" panelHeight="auto" style="width:150px" >
		            	 	<option value="0" <c:if test="${spGatewaySge.level==0 }">selected</c:if>>优</option>
		                	<option value="1" <c:if test="${spGatewaySge.level==1 }">selected</c:if>>良</option>
		                	<option value="2" <c:if test="${spGatewaySge.level==2 }">selected</c:if>>中</option>
		                	<option value="3" <c:if test="${spGatewaySge.level==3 }">selected</c:if>>差</option>
						</td>
						<td><label for="scale" class="label" ><span class="red">*</span>结算比例:</label></td>
						<td>
							<input  name="scale"  type="text"   class="inputxt" value="${spGatewaySge.scale}"></input>
						</td>
			        </tr>
			        <tr>
			            <td><label  class="label"><span class="red">*</span>业务类型:</label></td>
			            <td>
				            <select id = "doType"name="doType" tabindex="4"  style="width:150px;"></select>
			            </td>
			             <td><label  class="label"><span class="red">*</span>状态:</label></td>
			            <td>
				            <select  name="status"  style="width:150px;">
				            	<option value="0"<c:if test="${spGatewaySge.status==0 }">selected</c:if>>enable</option>
				            	<option value="1"<c:if test="${spGatewaySge.status==1 }">selected</c:if>>disable</option>
				            </select>
			            </td>
				    </tr>
			        <tr >
			        	<td><label  class="label"><span class="red">*</span>上行端口号:</label></td>
			            <td>
				          <input  name="moPort"  type="text"   class="inputxt" value="${spGatewaySge.moPort}"></input>
			            </td>
			             <td><label  class="label">短信间隔时间:</label></td>
			            <td>
				           <input  name="interval"  type="text"   class="inputxt" value="${spGatewaySge.interval}"></input>
			            </td>
					</tr>
					<tr >
			        	<td><label  class="label"><span class="red">*</span>扣费指令:</label></td>
			            <td >
				          <input  name="moCmd"  type="text"   class="inputxt" value="${spGatewaySge.moCmd}" ></input>
			            </td>
			             <td><label  class="label">请求间隔时间(单位：分钟):</label></td>
			            <td>
				           <input  name="reqIntervalTime"  type="text"   class="inputxt" value="${spGatewaySge.reqIntervalTime}"></input>
			            </td>
					</tr>
					<tr >
			        	<td><label  class="label">屏蔽时间段:(例：02-12|13-14)</label></td>
			            <td colspan="3">
				          <input  name="timeQuantum"  type="text"    value="${spGatewaySge.timeQuantum}" style="width:560px"></input>
			            </td>
					</tr>
					<tr >
			        	<td><label  class="label">屏蔽端口号:</label></td>
			            <td colspan="2">
				          <input  name="mrPort"  type="text"   value="${spGatewaySge.mrPort}" style="width:560px" class="inputxt"></input>
			            </td>
			            <td style="background: #FFFFFF;">
			            	 <select  name="downStatus"  style="width:150px;">
				            	<option value="1"<c:if test="${spGatewaySge.downStatus==1 }">selected</c:if>>OFF</option>
				            	<option value="0"<c:if test="${spGatewaySge.downStatus==0 }">selected</c:if>>ON</option>
				            </select>
			            </td>
					</tr>
					<tr >
			        	<td><label  class="label">拦截信息:</label></td>
			            <td colspan="2">
				          <input  name="cutSms"  type="text"   value="${spGatewaySge.cutSms}" style="width:560px"></input>
			            </td>
			            <td style="background: #FFFFFF;">
			            	<select  name="cutStatus"  style="width:150px;">
				            	<option value="1"<c:if test="${spGatewaySge.cutStatus==1 }">selected</c:if>>OFF</option>
				            	<option value="0"<c:if test="${spGatewaySge.cutStatus==0 }">selected</c:if>>ON</option>
				            </select>
				        </td>
					</tr>
					<tr>
						<td><label  class="label">扣费提示:</label></td>
						<td colspan="3">
							<input  name="costTip"  type="text"   value="${spGatewaySge.costTip}" style="width:700px"></input>
						</td>
					</tr>
					<tr>
						<td><label  class="label">扣费成功提示:</label></td>
						<td colspan="3">
							<input  name="costSucTip"  type="text"    value="${spGatewaySge.costSucTip}" style="width:700px"></input>
						</td>
					</tr>
					<tr>
						<td><label  class="label">警示:</label></td>
						<td colspan="3">
							<input  name="costWarnTip"  type="text"    value="${spGatewaySge.costWarnTip}" style="width:700px"></input>
						</td>
					</tr>
					<tr>
						<td><label  class="label">备忘:</label></td>
						<td colspan="3">
							<input  name="remark"  type="text"   value="${spGatewaySge.remark}" style="width:700px"></input>
						</td>
					</tr>
			    </tbody>
		    </table>
		    <div style="text-align:center;margin-top: 20px">
		        <input  type="button" class="btn W80" value="提交" onclick="sgeSave()"></input>
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
		datatype:"fOne",
		sucmsg:" "
	},
	{
		ele:".inputxt:eq(1)",
		datatype:"n",
		sucmsg:" "
	},
	{
		ele:".inputxt:eq(2)",
		datatype:"n1-2",
		sucmsg:" "
	},
	{
		ele:".inputxt:eq(3)",
		datatype:"*2-150",
		sucmsg:" "
	},
	{
		ele:".inputxt:eq(4)",
		datatype:"n0-5",
		sucmsg:" "
	},{
		ele:".inputxt:eq(5)",
		datatype:"n",
		sucmsg:" "
	}]);
});
function sgeSave(){
	var  sgeCommon = $("#sgeCommon");
	if(demo.check(false)){
		$("#spSgeAdd_form").jrAjax({
			url : "sge/save",
			autoGetParam : true,
			resultAutoProcess : true,
			newdLoading : true,
			loadingType : 'full',
			container : sgeCommon,
			successCallback: function(result){
				if(result=='1'){
					sgeCommon.jrDialog("close");
					$("#searchFunSpSge").click();
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
</script>
</body>
</html>