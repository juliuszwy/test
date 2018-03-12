<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglibs.jsp"%>

<table >
	<thead>
		<tr>
			<td>通道编号</td>
			<td>通道名称</td>
			<td>价格</td>
			<td>权值</td>
			<td>状态</th>
			<td>通道类型</td>
			<td >操作</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${spGatewayCpds}" var="cpd">
			<tr>
				<td>${cpd.serialNo}</td>
				<td>${cpd.name}</td>
				<td>${cpd.price}</td>
				<td><c:choose>
						<c:when test='${cpd.level == 0}'>
							优
						</c:when>
						<c:when test='${cpd.level == 1}'>
							良
						</c:when>
						<c:when test='${cpd.level == 2}'>
							中
						</c:when>
						<c:otherwise>差</c:otherwise>
					</c:choose></td>
				<td style="text-align: center;">
					<c:choose>
						<c:when test='${cpd.status == 0}'>
							<img src="resources/images/tick.png"   />
						</c:when>
						<c:otherwise><img src="resources/images/cancel.png" /></c:otherwise>
					</c:choose>
				</td>
				<td><c:choose>
						<c:when test='${cpd.type == 0}'>
							普通
						</c:when>
						<c:otherwise><span style="color: red">专属</span></c:otherwise>
					</c:choose></td>
				<td style="text-align: center;">
					<shiro:hasPermission name="sp:edit">
						<a href="javascript:void(0);" class="btn3 W40" onclick="input('${cpd.id}')">编辑</a>
					</shiro:hasPermission>
					<shiro:hasPermission name="sp:limit">
						<a href="javascript:void(0);" class="btn3 W60" onclick="limit('${cpd.id}')">上限设置</a>
					</shiro:hasPermission>
					<shiro:hasPermission name="sge:allocate">
						<a href="javascript:void(0);" class="btn3 W60" onclick="cpAppAllotSge('${cpd.id}','${cpd.type }')">通道分配</a>
					</shiro:hasPermission>
				</td>
				
			</tr>
		</c:forEach>
	</tbody>
</table>
<jsp:include page="../../common/pageSimplifier.jsp"></jsp:include>