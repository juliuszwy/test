<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8">
<title>SP管理 | 新增SP</title>
<base href="${contextPath }/" />
<script type="text/javascript" src="${contextPath }/resources/js/jquery.form.js"></script>
<script type="text/javascript">
$(document).ready(function() {
 });
</script>
</head>
<body>
	<div class="easyui-layout" style="text-align: center; height: 270px;" fit="true">
		<div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
		<form id="ff" method="post">
			<input type="hidden" value="${spSynForm.id }" name="id" />
			<input type="hidden" value="${spSynForm.spId }" name="spId" />
		    <table>
		   		 <tr>
		            <td><label for="requestType">请求类型:</label></td>
		            <td>
		                <select class="easyui-combobox" name="requestType" panelHeight="auto" style="width:155px" >
			                <option value="1" <c:if test="${spSynForm.requestType==1 }">selected</c:if>>表单提交</option>
		                	<option value="2" <c:if test="${spSynForm.requestType==2 }">selected</c:if>>XML</option>
		                	<option value="3" <c:if test="${spSynForm.requestType==3 }">selected</c:if>>JSON</option>
			            </select>
		            </td>
		        </tr>
		        <tr>
		            <td><label for="name">同步名称:</label></td>
		            <td><input class="easyui-validatebox" type="text" name="name" value="${spSynForm.name }" data-options="required:true,validType:'length[1,25]'"></input></td>
		        </tr>
		         <tr>
		            <td><label for="priceName">价格字段名称:</label></td>
		            <td><input class="easyui-validatebox" type="text" name="priceName" value="${spSynForm.priceName }" data-options="validType:'length[1,200]'"></input></td>
		        </tr>
		        <tr>
		            <td><label for="sucName">成功字段名称:</label></td>
		            <td><input class="easyui-validatebox" type="text" name="sucName" value="${spSynForm.sucName }" data-options="validType:'length[1,25]'"></input></td>
		        </tr>
		        <tr>
		            <td><label for="sucSign">同步数据成功标识:</label></td>
		            <td><input class="easyui-validatebox" type="text" name="sucSign" value="${spSynForm.sucSign }" data-options="validType:'length[1,25]'"></input></td>
		        </tr>
		        <tr>
		            <td><label for="phone">手机号码:</label></td>
		            <td><input class="easyui-validatebox" type="text" name="phone" value="${spSynForm.phone }" data-options="validType:'length[1,25]'"></input></td>
		        </tr>
		        
		        <tr>
		            <td><label for="payCodeName">payCode字段名称:</label></td>
		            <td><input class="easyui-validatebox" type="text" name="payCodeName" value="${spSynForm.payCodeName }" data-options="validType:'length[1,15]'"></input></td>
		        </tr>
		         <tr>
		            <td><label for="returnType">返回类型:</label></td>
		            <td>
		                <select class="easyui-combobox" name="returnType" panelHeight="auto" style="width:155px" >
			                <option value="0" <c:if test="${spSynForm.returnType==0 }">selected</c:if>>字符串</option>
		                	<option value="1" <c:if test="${spSynForm.returnType==1 }">selected</c:if>>XML</option>
		                	<option value="2" <c:if test="${spSynForm.returnType==2 }">selected</c:if>>JSON</option>
			            </select>
		            </td>
		        </tr>
		        <tr>
		            <td><label for="returnLine">返回数据内容:</label></td>
		            <td><input  type="text" name="returnLine" value="${spSynForm.returnLine }"></input></td>
		        </tr>
		        <tr>
		            <td><label for="errorCode">错误Code:</label></td>
		            <td><input class="easyui-validatebox" type="text" name="errorCode" value="${spSynForm.errorCode }" ></input></td>
		        </tr>
		        <tr>
		            <td><label for="bijectionName">MR对应MO的唯一标识:</label></td>
		            <td><input class="easyui-validatebox" type="text" name="bijectionName" value="${spSynForm.bijectionName }"></input></td>
		        </tr>
		        <tr>
		            <td><label for="info">预留同步字段:</label></td>
		            <td><input class="easyui-validatebox" type="text" name="info" value="${spSynForm.info }" ></input></td>
		        </tr>
		    </table>
		</form>
		</div>
		<div region="south" border="false" style="text-align: center; padding: 5px 5px 5px 0;">
				 <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm('spSyn/update');">提交</a>
		</div>
	</div>
	<script type="text/javascript">
	</script>
</body>
</html>