<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/taglibs.jsp"%>
<table>
	<thead>
		<tr>
			<td>编号</td>
			<td>提供商名称</td>
			<td>联系人</td>
			<td>电话</td>
			<td>QQ</td>
			<td>邮箱</td>
			<td>日上限</td>
			<td>月上线</td>
			<td>状态</td>
			<td colspan="4">操作</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${spInfos}" var="sp">
			<tr>
				<td>${sp.serialNo}</td>
				<td>${sp.name}</td>
				<td>${sp.contact}</td>
				<td>${sp.tele}</td>
				<td>${sp.qq}</td>
				<td>${sp.email}</td>
				<td>${sp.payUnitSpDay}</td>
				<td>${sp.payUnitSpMonth}</td>
				<td style="text-align: center;">
					<c:choose>
						<c:when test='${sp.status == 0}'>
							<img src="resources/images/tick.png"   />
						</c:when>
						<c:otherwise><img src="resources/images/cancel.png" /></c:otherwise>
					</c:choose>
				</td>
				<td style="text-align: center;" ><a href="javascript:void(0);" class="btn3 W40" onclick="input('${sp.id}')">编辑</a></td>
				<td style="text-align: center;" ><a  href="javascript:void(0);" class="btn3 W60" onclick="pro('${sp.id}')">全局省份</a></td>
				<td style="text-align: center;" ><a  href="javascript:void(0);" class="btn3 W60" onclick="sgeSmp('${sp.id}')">通道列表</a></td>
				<td style="text-align: center;" ><a  href="javascript:void(0);" class="btn3 W60" onclick="synConfigure('${sp.id}')">同步配置</a></td>
			</tr>
		</c:forEach>
   </tbody>
</table>
<jsp:include page="../common/pageSimplifier.jsp"></jsp:include>