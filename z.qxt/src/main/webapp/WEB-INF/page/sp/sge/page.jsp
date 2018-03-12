<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglibs.jsp"%>
<table>
	<thead>
		<tr>
			<td>SP名称</td>
			<td>通道编号</td>
			<td>通道名称</td>
			<td>业务类型</td>
			<td>通道类型</td>
			<td>价格</td>
			<td>开通省份是否继承</td>
			<td>分成比例</td>
			<td>状态</td>
			<td style="width: 400px">操作</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${spGatewaySges}" var="sge">
			<tr>
				<td>${sge.spInfoForm.name}</td>
				<td>${sge.serialNo}</td>
				<td>${sge.name}</td>
				<td>
					<c:forEach items="${spGateTypes}" var="spt">
						<c:if test="${sge.doType==spt.value}">${spt.text }</c:if>
					</c:forEach>
				</td>
				<td><c:choose>
						<c:when test='${sge.type == 0}'>
							普通
						</c:when>
						<c:otherwise><span style="color: red">专属</span></c:otherwise>
					</c:choose></td>
				<td>${sge.price}</td>
				<td>
					<c:choose>
						<c:when test='${sge.isInherit == 0}'>
							继承
						</c:when>
						<c:otherwise>不继承</c:otherwise>
					</c:choose>
				</td>
				<td>${sge.scale}</td> 
				<td style="text-align: center;">
					<c:choose>
						<c:when test='${sge.status == 0}'>
							<img src="resources/images/tick.png"   />
						</c:when>
						<c:otherwise><img src="resources/images/cancel.png" /></c:otherwise>
					</c:choose>
				</td>
				<td style="text-align: center;">
					<shiro:hasPermission name="sp:edit">
						<a href="javascript:void(0);" class="btn3 W40" onclick="input('${sge.id}')">编辑</a>
						<a href="javascript:void(0);" class="btn3 W40" onclick="pro('${sge.id}','${sge.isInherit }','${sge.spInfoForm.id }')">省份</a>
					</shiro:hasPermission>
					<shiro:hasPermission name="sp:limit">
						<a href="javascript:void(0);" class="btn3 W60" onclick="limit('${sge.id}')">上限设置</a>
					</shiro:hasPermission>
					<shiro:hasPermission name="sge:allocate">
						<a href="javascript:void(0);" class="btn3 W60" onclick="cpAppAllotSge('${sge.id}','${sge.type }')">通道分配</a>
					</shiro:hasPermission>
					<shiro:hasPermission name="sp:delete">
						<a href="javascript:void(0);" class="btn W40" onclick="deleteSge('${sge.id}')">删除</a>
					</shiro:hasPermission>
				</td>
			</tr>
		</c:forEach>
   </tbody>
</table>
<jsp:include page="../../common/pageSimplifier.jsp"></jsp:include>