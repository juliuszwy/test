<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8">
<base href="${contextPath }/" />
</head>
<body>
<div class="panel-body" >
	<form id="" method="post" class="registerform">
		<div class="tableWarp">
		    <table>
		    	<tbody>
			        <tr>
			            <td><label for="payUnitDay" class="label"><span class="red">*</span>用户日限:</label></td>
			            <td><input id="payUnitDay"  type="text" name="payUnitDay" class="inputxt" value="${param['payUnitDay'] }"></input></td>
			        </tr>
			        <tr>
			            <td><label for="payUnitMonth" class="label"><span class="red">*</span>用户月限:</label></td>
			            <td><input id="payUnitMonth"  type="text" name="payUnitMonth" class="inputxt" value="${param['payUnitMonth'] }"></input></td>
			        </tr>
			        <tr>
			        	<td><label for="payUnitGlobalDay" class="label" >总日限:</label></td>
						<td>
							<input id="payUnitGlobalDay" name="payUnitGlobalDay"  type="text"  class="inputxt" value="${param['payUnitGlobalDay']}"></input>
						</td>
			        </tr>
			        <tr>
			        	<td><label for="payUnitGlobalMonth" class="label" >总月限:</label></td>
						<td>
							<input id="payUnitGlobalMonth" name="payUnitGlobalMonth"  type="text"  class="inputxt" value="${param['payUnitGlobalMonth']}"></input>
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
	var  sgeProCommon = $("#spProCommon");
	if(demo.check(false)){
		sgeProCommon.jrDialog("close");
		var pro = "${param['pro'] }";
		sgePros[pro].payUnitDay = $("#payUnitDay").val();
		sgePros[pro].payUnitMonth = $("#payUnitMonth").val();
		sgePros[pro].payUnitGlobalDay = $("#payUnitGlobalDay").val();
		sgePros[pro].payUnitGlobalMonth = $("#payUnitGlobalMonth").val();
		if($("#payUnitDay").val()!='0'||$("#payUnitMonth").val()!='0'||$("#payUnitGlobalDay").val()!='0'||$("#payUnitGlobalMonth").val()!='0')
			$("#limitSge_"+pro).attr("class","city_A red");
		else{$("#limitSge_"+pro).attr("class","city_A blueSmall");}
		
	}
};
$(document).ready(function() {
    $("#Validform_msg").remove();
});
</script>
</body>
</html>