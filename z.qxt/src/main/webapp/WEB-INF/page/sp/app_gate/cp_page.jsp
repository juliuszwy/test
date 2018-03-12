<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglibs.jsp"%>
<table>
		<thead>
			<tr>
				<td>选择</td>
				<td>CPID</td>
				<td>CP名称</td>
				<td>结算周期</td>
				<td>结算比例</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${cpInfos}" var="cp">
				<tr>
					<td style="text-align: center;"><input style="width: 19px;height: 25px;" type="checkbox" name="cpName" onchange="createOption()" value="${cp.serialNo}"/></td>
					<td>${cp.serialNo}</td>
					<td>${cp.name}</td>
					<td>${cp.settlementPeriod}</td>
					<td>${cp.scale}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
<jsp:include page="../../common/pageSimplifier.jsp"></jsp:include>