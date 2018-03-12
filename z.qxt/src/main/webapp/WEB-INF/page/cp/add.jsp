<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8">
<title>SP管理 | 新增SP</title>
<base href="${contextPath }/" />
<script type="text/javascript" src="resources/js/jquery.form.js"></script>
</head>
<body>
	<div class="easyui-layout" style="text-align: center; height: 270px;" fit="true">
		<div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
		<form id="ff" method="post">
			<input type="hidden" value="${cpInfo.id }" name="id" />
		    <table>
		    	<c:if test="${not empty cpInfo.id}">
					 <tr>
			            <td><label for="serialNo">编号:</label></td>
			            <td><input class="easyui-validatebox" type="text" name="serialNo" value="${cpInfo.serialNo }" readonly="true" data-options="required:true,validType:'length[1,25]'"></input></td>
		       		 </tr>
				</c:if>
		        <tr>
		            <td><label for="name">名称:</label></td>
		            <td><input class="easyui-validatebox" type="text" name="name" value="${cpInfo.name }" data-options="required:true,validType:'length[1,25]'"></input></td>
		        </tr>
		        <tr>
		            <td><label for="status">状态:</label></td>
		            <td>
		                <select class="easyui-combobox" name="status" panelHeight="auto" style="width:155px" data-options="required:true">
			                <option value="0" <c:if test="${cpInfo.status==0 }">selected</c:if>>启用</option>
		                	<option value="1" <c:if test="${cpInfo.status==1 }">selected</c:if>>禁用</option>
			            </select>
		            </td>
		        </tr>
		    </table>
		</form>
		</div>
		<div region="south" border="false" style="text-align: center; padding: 5px 5px 5px 0;">
		<c:choose>
			<c:when test="${cpInfo==null }">
				 <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm('cpInfo/add');">提交</a>
			</c:when>
			<c:otherwise>
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm('cpInfo/update');">确认</a>
			</c:otherwise>
		</c:choose>
		   <!--  <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm();">重置</a> -->
		</div>
	</div>
	<script type="text/javascript">
	</script>
</body>
</html>