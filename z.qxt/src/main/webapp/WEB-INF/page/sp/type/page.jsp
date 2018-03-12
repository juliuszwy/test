<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglibs.jsp"%>
<table>
	<thead>
		<tr>
			<td>名称</td>
			<td>编号</td>
			<td>用户日限</td>
			<td>用户月限</td>
			<td>描述</td>
			<td>创建时间</td>
			<shiro:hasPermission name="sp:type">
			<td>操作</td>
			</shiro:hasPermission>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${spGatewayTypes}" var="type">
			<tr>
				<td>${type.name}</td>
				<td>${type.serialNo}</td>
				<td>${type.userLimitToday }</td>
				<td>${type.userLimitMonth }</td>
				<td>${type.description}</td>
				<td>${type.createTime}</td>
				<shiro:hasPermission name="sp:type">
				<td style="text-align: center;" ><a href="javascript:void(0);" class="btn3 W40" onclick="input('${type.id}')">编辑</a></td>
				</shiro:hasPermission>
			</tr>
		</c:forEach>
   </tbody>
</table>
<jsp:include page="../../common/pageSimplifier.jsp"></jsp:include>