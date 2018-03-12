<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../../common/taglibs.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8">
<title>SP同步管理 </title>
<base href="${contextPath }/" />
</head>
<body>
	<div class="panel-body" >
	<form id="spSynAdd_form" method="post" class="registerform">
		<div class="tableWarp">
			<input type="hidden" value="${spSynForm.id }" name="id" />
			<input type="hidden" value="${spSynForm.spId }" name="spId" />
			    <table>
		   		 <tr>
		            <td><label for="requestType">请求类型:</label></td>
		            <td>
		                <select  name="requestType" panelHeight="auto" style="width:155px" >
			                <option value="1" <c:if test="${spSynForm.requestType==1 }">selected</c:if>>表单提交</option>
		                	<option value="2" <c:if test="${spSynForm.requestType==2 }">selected</c:if>>XML</option>
		                	<option value="3" <c:if test="${spSynForm.requestType==3 }">selected</c:if>>JSON</option>
			            </select>
		            </td>
			        </tr>
			        <tr>
			            <td><label for="name" class="label">同步名称:</label></td> 
			            <td><input  type="text" name="name" value="${spSynForm.name }" class="inputxt"></input></td>
			        </tr>
			         <tr>
			            <td><label for="priceName" class="label">价格字段名称:</label></td>
			            <td><input class="inputxt" type="text" name="priceName" value="${spSynForm.priceName }" ></input></td>
			        </tr>
			        <tr>
			            <td><label for="sucName" class="label">成功字段名称:</label></td>
			            <td><input class="inputxt" type="text" name="sucName" value="${spSynForm.sucName }" ></input></td>
			        </tr>
			        <tr>
			            <td><label for="sucSign" class="label">同步数据成功标识:</label></td>
			            <td><input class="inputxt" type="text" name="sucSign" value="${spSynForm.sucSign }"></input></td>
			        </tr>
			        <tr>
			            <td><label for="phone" class="label">手机号码:</label></td>
			            <td><input class="inputxt" type="text" name="phone" value="${spSynForm.phone }" ></input></td>
			        </tr>
			        
			        <tr>
			            <td><label for="payCodeName" class="label">payCode字段名称:</label></td>
			            <td><input class="inputxt" type="text" name="payCodeName" value="${spSynForm.payCodeName }" ></input></td>
			        </tr>
			         <tr>
			            <td><label for="returnType" >返回类型:</label></td>
			            <td>
			                <select  name="returnType" panelHeight="auto" style="width:155px" >
				                <option value="0" <c:if test="${spSynForm.returnType==0 }">selected</c:if>>字符串</option>
			                	<option value="1" <c:if test="${spSynForm.returnType==1 }">selected</c:if>>XML</option>
			                	<option value="2" <c:if test="${spSynForm.returnType==2 }">selected</c:if>>JSON</option>
				            </select>
			            </td>
			        </tr>
			        <tr>
			            <td><label for="returnLine" class="label">返回数据内容:</label></td>
			            <td><input class="inputxt" type="text" name="returnLine" value="${spSynForm.returnLine }"></input></td>
			        </tr>
			        <tr>
			            <td><label for="errorCode" class="label">错误Code:</label></td>
			            <td><input class="inputxt" type="text" name="errorCode" value="${spSynForm.errorCode }" ></input></td>
			        </tr>
			        <tr>
			            <td><label for="bijectionName" class="label">MR对应MO的唯一标识:</label></td>
			            <td><input class="inputxt" type="text" name="bijectionName" value="${spSynForm.bijectionName }"></input></td>
			        </tr>
			        <tr>
			            <td><label for="info" class="label">预留同步字段:</label></td>
			            <td><input class="inputxt" type="text" name="info" value="${spSynForm.info }" ></input></td>
			        </tr>
			    </table>
			    <div style="margin-left:180px;padding-top: 20px">
			        <input  type="button" class="btn W80" value="提交" onclick="SpSynSave()"></input>
			        <input id="btn_reset" type="button"class="btn W80" value="重置"></input>
		    	</div>
		    </div>
		</form>
		</div>
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
		datatype:"s2-25",
		sucmsg:" "
	},
	{
		ele:".inputxt:eq(1)",
		datatype:"s0-25",
		sucmsg:" "
	},
	{
		ele:".inputxt:eq(2)",
		datatype:"s0-25",
		sucmsg:" "
	},
	{
		ele:".inputxt:eq(3)",
		datatype:"s0-10",
		sucmsg:" "
	},{
		ele:".inputxt:eq(4)",
		datatype:"s0-50",
		sucmsg:" "
	},{
		ele:".inputxt:eq(5)",
		datatype:"s0-25",
		sucmsg:" "
	},{
		ele:".inputxt:eq(6)",
		datatype:"s0-255",
		sucmsg:" "
	},{
		ele:".inputxt:eq(7)",
		datatype:"s0-255",
		sucmsg:" "
	},{
		ele:".inputxt:eq(8)",
		datatype:"s0-100",
		sucmsg:" "
	},{
		ele:".inputxt:eq(9)",
		datatype:"s0-255",
		sucmsg:" "
	}
	]);
});
function SpSynSave(){
	var  spCommon = $("#spCommon");
	if(demo.check(false)){
		$("#spSynAdd_form").jrAjax({
			url : "spSyn/save",
			autoGetParam : true,
			resultAutoProcess : true,
			newdLoading : true,
			loadingType : 'full',
			container : spCommon,
			successCallback: function(result){
				if(result=='1'){
					spCommon.jrDialog("close");
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