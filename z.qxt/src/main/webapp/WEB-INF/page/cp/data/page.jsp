<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/taglibs.jsp"%>
<table>
		<thead>
			<tr>
				<td>日期</td>
				<td>运营商</td>
				<td>CP名称</td>
				<td>应用ID</td>
				<td>应用名称</td>
				<td>渠道号</td>
				<td>MO</td>
				<td>MR</td>
				<td>结算金额</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${originalForms}" var="o">
				<tr>
					<td>${o.createDate}</td>
					<td>${o.carrier}</td>
					<td>${o.cpName}</td>
					<td>${o.appSerialNo}</td>
					<td>${o.appName}</td>
					<td>${o.ditch}</td>
					<td>${o.mo}</td>
					<td>${o.mr}</td>
					<td>${o.finalSum}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
<jsp:include page="../../common/pageSimplifier.jsp"></jsp:include>