<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/taglibs.jsp"%>
<table>
		<thead>
			<tr>
				<td>CPID</td>
				<td>CP名称</td>
				<td>结算周期</td>
				<td>结算比例<br/>(移动)</td>
				<td>结算比例<br/>(电信)</td>
				<td>结算比例<br/>(联通)</td>
				<td>CP总日限(元)</td>
				<td>CP总月限(元)</td>
				<td>状态</td>
				<td style="width: 420px">操作</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${cpInfos}" var="cp">
				<tr>
					<td>${cp.serialNo}</td>
					<td>${cp.name}</td>
					<td>${cp.settlementPeriod}</td>
					<td>${cp.scaleM}</td>
					<td>${cp.scaleT}</td>
					<td>${cp.scaleU}</td>
					<td>${cp.payUnitCpDay}</td>
					<td>${cp.payUnitCpMonth}</td>
					<td style="text-align: center;">
						<c:choose>
							<c:when test='${cp.status == 0}'>
								<img src="resources/images/tick.png" />
							</c:when>
							<c:otherwise><img src="resources/images/cancel.png" /></c:otherwise>
						</c:choose>
					</td>
					<td style="text-align: center;">
						<a href="javascript:void(0);" class="btn3 W40" onclick="update('${cp.id}')">编辑</a>
						<shiro:hasPermission name="cp:acc">
							<a  href="javascript:void(0);" class="btn3 W60" onclick="account('${cp.id}')">账号管理</a>
							<a  href="javascript:void(0);" class="btn3 W60" onclick="menu('${cp.id}')">菜单设置</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="cp:edit">
							<a href="javascript:void(0);" class="btn3 W60" onclick="BulletFrame('${cp.id}')">二次确认</a>
						</shiro:hasPermission>
						<a href="javascript:void(0);" class="btn3 W60" onclick="cpAPPList('${cp.id}','${cp.name }')">APP管理</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
<jsp:include page="../common/pageSimplifier.jsp"></jsp:include>