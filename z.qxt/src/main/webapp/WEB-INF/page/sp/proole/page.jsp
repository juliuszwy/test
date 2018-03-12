<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglibs.jsp" %>
<table>
		<thead>
			<tr>
				<td>省份</td>
				<td>总日限</td>
				<td>总月限</td>
				<td>用户日限</td>
				<td>用户月限</td>
				<td colspan="2">操作</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${spProLimits}" var="sp">
				<tr>
					<td>${sp.proName}</td>
					<td>${sp.payUnitDay}</td>
					<td>${sp.payUnitMonth}</td>
					<td>${sp.payUnitGlobalDay}</td>
					<td>${sp.payUnitGlobalMonth}</td>
					<td style="text-align: center;" ><a href="javascript:void(0);" class="btn3 W40" onclick="input('${sp.id}')">编辑</a></td>
					<td style="text-align: center;" ><a  href="javascript:void(0);" class="btn3 W40" onclick="deleteProLimit('${sp.id}')">删除</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<script type="text/javascript">
	
	</script>
