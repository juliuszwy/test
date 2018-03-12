<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/taglibs.jsp"%>
<div class="search">
	<ul>
	<li><input class="property" type="hidden" name="filter_EQI_property" value="2" /></li>
		<li>
			<span>菜单名称</span>
			<div>
			   <select id="resourceName2" class=" W150" name="filter_LIKES_resourceName"></select>
			</div>
		</li>
		<li><a href="javascript:void(0);" class="btn W60" onclick="searchFun(this,'menu/table')" id="searchFunMenu2">搜索 </a></li>
		<shiro:hasPermission name="menu:edit">
			<li><a href="javascript:void(0);" class="btn W60" onclick="add()" >新   增</a></li>
		</shiro:hasPermission>
	</ul>
</div>
<div class="data-table">
	<jsp:include page="table.jsp"></jsp:include>
</div>
