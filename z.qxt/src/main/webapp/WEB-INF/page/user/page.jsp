<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/taglibs.jsp"%>

<table>
		<thead>
			<tr>
				<td>登录名:</td>
				<td>用户名</td>
				<td>邮箱</td>
				<td>权限组</td>
				<td>状态</td>
				<td colspan="2">操作</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${userForms}" var="user">
				<tr>
					<td>${user.loginName}</td>
					<td>${user.name}</td>
					<td>${user.email}</td>
					<td>${user.groupNameStr}</td>
					<td style="text-align: center;">
						<c:choose>
							<c:when test='${user.status == 0}'>
								<img src="resources/images/tick.png"   />
							</c:when>
							<c:otherwise><img src="resources/images/cancel.png" /></c:otherwise>
						</c:choose>
					</td>
					<td style="text-align: center;" ><a href="javascript:void(0);" class="btn3 W40" onclick="update(${user.id})">编辑</a></td>
					<td style="text-align: center;" ><a  href="javascript:void(0);" class="btn3 W60" onclick="menu(${user.id})">菜单设置</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
<jsp:include page="../common/pageSimplifier.jsp"></jsp:include>