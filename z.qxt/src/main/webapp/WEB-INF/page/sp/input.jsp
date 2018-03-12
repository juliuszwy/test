<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8">
<title>帐号管理 | 新增帐号</title>
<base href="${contextPath }/" />
<body>
<div class="panel-body" >
	<form id="spAdd_form" method="post" class="registerform">
	<input type="hidden" name="id" value="${spInfo.id }"/>
		<div class="tableWarp">
		    <table>
		    	<tbody>
			    	<c:if test="${not empty spInfo.id}">
						 <tr>
				            <td><label for="serialNo">编号:</label></td>
				            <td><input type="text" name="serialNo" value="${spInfo.serialNo }" readonly="true" ></input></td>
			       		 </tr>
					</c:if>
			        <tr>
			            <td><label for="name" class="label"><span class="red">*</span>名称:</label></td>
			            <td><input id="name"  type="text" name="name" class="inputxt" value="${spInfo.name }"></input></td>
			        </tr>
			        <tr>
			            <td><label for="contact" class="label"><span class="red">*</span>联系人:</label></td>
			            <td><input id="contact"  type="text" name="contact" class="inputxt" value="${spInfo.contact }"></input></td>
			        </tr>
			        <tr>
			        	<td><label for="payUnitSpDay" class="label" ><span class="red">*</span>日上限:</label></td>
						<td>
							<input  name="payUnitSpDay"  type="text"    class="inputxt" value="${spInfo.payUnitSpDay}"></input>
						</td>
			        </tr>
			        
			        <tr>
			        	<td><label for="payUnitSpMonth" class="label" ><span class="red">*</span>月上限:</label></td>
						<td>
							<input  name="payUnitSpMonth"  type="text"   class="inputxt" value="${spInfo.payUnitSpMonth}"></input>
						</td>
			        </tr>
			        <tr>
			        	<td><label for="tele" class="label" >电话:</label></td>
						<td>
							<input  name="tele"  type="text"   value="${spInfo.tele}"></input>
						</td>
			        </tr>
				    <tr>
			        	<td><label for="qq" class="label" >QQ:</label></td>
						<td>
							<input  name="qq"  type="text"   value="${spInfo.qq}"></input>
						</td>
			        </tr>
			        <tr>
			        	<td><label for="email" class="label" >邮箱:</label></td>
						<td>
							<input  name="email"  type="text"   value="${spInfo.email}"></input>
						</td>
			        </tr>
			        <tr >
			            <td><label for="status" class="label">状态:</label></td>
			            <td>
				            <select id="status" name="status"  style="width:150px;">
				            	<option value="0"<c:if test="${spInfo.status==0 }">selected</c:if>>正常合作</option>
				            	<option value="1"<c:if test="${spInfo.status==1 }">selected</c:if>>不合作</option>
				            </select>
			            </td>
					</tr>
			    </tbody>
		    </table>
		    <div style="margin-left:180px;padding-top: 20px">
		        <input  type="button" class="btn W80" value="提交" onclick="spSave()"></input>
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
		datatype:"s2-20",
		sucmsg:" "
	},
	{
		ele:".inputxt:eq(1)",
		datatype:"s2-20",
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
function spSave(){
	var  spCommon = $("#spCommon");
	if(demo.check(false)){
		$("#spAdd_form").jrAjax({
			url : "sp/save",
			autoGetParam : true,
			resultAutoProcess : false,
			newdLoading : true,
			loadingType : 'full',
			container : spCommon,
			successCallback: function(result){
				if(result=='1'){
					spCommon.jrDialog("close");
					$("#searchFunSp").click();
					$.message.alert("alert","提示","更新成功");
				}else if(result=='2'){
					$("#btn_reset").click();
					$.message.alert("warn","警告","操作失败");
				}else{
					spCommon.jrDialog("close");
					$("#searchFunSp").click();
					pro(result);
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