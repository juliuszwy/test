<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglibs.jsp"%>
<table>
	<thead>
		<tr>
			<td>通道编号</td>
			<td>通道名称</td>
			<td>运营商</td>
			<td>价格</td>
			<td>分成比例</td>
			<td>状态</td>
			<shiro:hasPermission name="sp:edit">
			<td>操作</td>
			</shiro:hasPermission>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${spGatewaySgeSimps}" var="sgeSim">
			<tr>
				<td>${sgeSim.serialNo}</td>
				<td>${sgeSim.name}</td>
				<td>
					<c:choose>
					    <c:when test="${sgeSim.operator=='M'}">
					    	移动
					    </c:when>
					    <c:when test="${sgeSim.operator=='T'}">
					   		 电信
					    </c:when>
					    <c:otherwise>
					    	联通
					    </c:otherwise>
					</c:choose>
				</td>
				<td>${sgeSim.price}</td>
				<td>${sgeSim.scale}</td>
				<td style="text-align: center;">
					<c:choose>
						<c:when test='${sgeSim.status == 0}'>
							<img src="resources/images/tick.png"   />
						</c:when>
						<c:otherwise><img src="resources/images/cancel.png" /></c:otherwise>
					</c:choose>
				</td>
				<shiro:hasPermission name="sp:edit">
					<td style="text-align: center;" ><a href="javascript:void(0);" class="btn3 W40" onclick="input('${sgeSim.id}')">编辑</a></td>
				</shiro:hasPermission>
			</tr>
		</c:forEach>
   </tbody>
</table>
<jsp:include page="../../common/pageSimplifier.jsp"></jsp:include>