<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8">
<title>帐号管理 | 新增帐号</title>
<base href="${contextPath }/" />
</head>
<body>
<div class="panel-body" >
	<form id="cpAppLimit_form" method="post" class="registerform">
	<input type="hidden" name="id" value="${limit.id }"/>
	<input type="hidden" name="commonId" value="${param['id']}"/>
		<div class="tableWarp">
		    <table>
		    	<tbody>
			        <tr>
			            <td><label for="payUnitDay" class="label"><span class="red">*</span>用户日限:</label></td>
			            <td><input id="payUnitDay"  type="text" name="payUnitDay" class="inputxt" value="${limit.payUnitDay }"></input></td>
			        </tr>
			        <tr>
			            <td><label for="payUnitMonth" class="label"><span class="red">*</span>用户月限:</label></td>
			            <td><input id="payUnitMonth"  type="text" name="payUnitMonth" class="inputxt" value="${limit.payUnitMonth }"></input></td>
			        </tr>
			        <tr>
			        	<td><label for="payUnitGlobalDay" class="label" >总日限:</label></td>
						<td>
							<input id="payUnitGlobalDay" name="payUnitGlobalDay"  type="text"  class="inputxt" value="${limit.payUnitGlobalDay}"></input>
						</td>
			        </tr>
			        <tr>
			        	<td><label for="payUnitGlobalMonth" class="label" >总月限:</label></td>
						<td>
							<input id="payUnitGlobalMonth" name="payUnitGlobalMonth"  type="text"  class="inputxt" value="${limit.payUnitGlobalMonth}"></input>
						</td>
			        </tr>
				        
			    </tbody>
		    </table>
		    <div style="margin-left:180px;padding-top: 20px">
		        <input  type="button" class="btn W80" value="提交" onclick="LimitSave()"></input>
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
function LimitSave(){
	var  limitCommon = $("#limitCommon");
	if(demo.check(false)){
		$("#cpAppLimit_form").jrAjax({
			url : "common/limitSave",
			autoGetParam : true,
			resultAutoProcess : true,
			newdLoading : true,
			loadingType : 'full',
			container : limitCommon,
			successCallback: function(result){
				if(result=='1'){
					limitCommon.jrDialog("close");
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