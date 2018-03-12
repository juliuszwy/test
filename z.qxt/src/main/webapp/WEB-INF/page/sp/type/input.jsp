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
	<form id="spSgeTypeAdd_form" method="post" class="registerform">
	<input type="hidden" name="id" value="${spGatewayType.id }"/>
		<div class="tableWarp">
		    <table>
		    	<tbody>
				   <tr>
		             <td><label for="serialNo">编号:</label></td>
		             <td><input type="text" name="serialNo" value="${spGatewayType.serialNo }"<c:if test="${not empty spGatewayType.id}">disabled='disabled'></c:if></input></td>
	       		   </tr>
			        <tr>
			            <td><label for="name" class="label"><span class="red">*</span>名称:</label></td>
			            <td><input id="name"  type="text" name="name" class="inputxt" value="${spGatewayType.name }"></input></td>
			        </tr>
			        <tr>
			            <td><label for="userLimitToday" class="label"><span class="red">*</span>用户日限:</label></td>
			            <td><input id="userLimitToday"  type="text" name="userLimitToday" class="inputxt" value="${spGatewayType.userLimitToday }"></input></td>
			        </tr>
			        <tr>
			            <td><label for="userLimitMonth" class="label"><span class="red">*</span>用户月限:</label></td>
			            <td><input id="userLimitMonth"  type="text" name="userLimitMonth" class="inputxt" value="${spGatewayType.userLimitMonth }"></input></td>
			        </tr>
			    </tbody>
		    </table>
		    <div style="margin-left:180px;padding-top: 20px">
		        <input  type="button" class="btn W80" value="提交" onclick="sgeTypeSave()"></input>
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
		ignoreHidden:true
	});
	demo.addRule([{
		ele:".inputxt:eq(0)",
		datatype:"s2-16",
		sucmsg:" "
	},
	{
		ele:".inputxt:eq(1)",
		datatype:"s2-16",
		sucmsg:" "
	}]);
});
function sgeTypeSave(){
	var  sgeTypeCommon = $("#sgeTypeCommon");
	if(demo.check(false)){
		$("#spSgeTypeAdd_form").jrAjax({
			url : "sgeType/save",
			autoGetParam : true,
			resultAutoProcess : true,
			newdLoading : true,
			loadingType : 'full',
			container : sgeTypeCommon,
			successCallback: function(result){
				if(result=='1'){
					sgeTypeCommon.jrDialog("close");
					$("#searchFunSpSgeType").click();
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
    $("#Validform_msg").remove();
});
</script>
</body>
</html>