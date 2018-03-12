<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/taglibs.jsp"%>
<table>
		<thead>
			<tr>
				<td>模块名称</td>
				<td>资源地址</td>
				<td>资源图片</td>
				<td>模块/菜单</td>
				<td>展示顺序</td>
				<td>状态</td>
				<td>创建时间</td>
				<shiro:hasPermission name="menu:edit">
					<td >操作</td>
				</shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${menuForms}" var="menu">
				<tr>
					<td>${menu.resourceName }</td>
					<td>${menu.resourceUrl }</td>
					<td>${menu.menuIconUrl }</td>
					<td>${menu.parent }</td>
					<td>${menu.displaySort }</td>
					<td style="text-align: center;" >
						<c:choose>
							<c:when test='${menu.state == 0}'>
								<img src="resources/images/tick.png"   />
							</c:when>
							<c:otherwise><img src="resources/images/cancel.png" /></c:otherwise>
						</c:choose>
					</td>
					<td>${menu.createTime }</td>
					<shiro:hasPermission name="menu:edit">
						<td style="text-align: center;" ><a title="编辑" href="javascript:void(0);" class="btn3 W40" onclick="update(${menu.id})">编辑</a></td>
					</shiro:hasPermission>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<jsp:include page="../common/pageSimplifier.jsp"></jsp:include>