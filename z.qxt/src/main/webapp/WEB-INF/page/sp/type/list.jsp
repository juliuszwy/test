<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../../common/taglibs.jsp" %>
<html>
<head>
<title>菜单列表</title>
<script>
function input(id){
	if(typeof(id) == "undefined")id="";
	$("#sgeTypeCommon").jrDialog('open', {
			url : 'sgeType/input',
			title : 'TYPE',
			data:{
				'id':id
			},
			needClose : true,
			width : '500',
			height : '300'
	});
};
$(document).ready(function() {
	//InitResourceNameSelect();
});

function changePage(obj,page,pageSize,totalRows){
	pageLinkClick(obj,'sgeType/page',page,pageSize,totalRows);
}
function jumpPage(obj,page,pageSize,totalRows){
	goPageLink(obj,'sgeType/page',pageSize,page,totalRows);
}
</script>
</head>
<body>
	<div class="panel">
		<div class="title">
			<div class="titleImg"><img src="resources/images/left/home-black.png" border="0" width="20px" height="20px"></div>
			<div class="titleText">通道列表</div>
		</div>
		<form  action="" method="post">
			<div id="homeSpSgeTypeProxyPromoteShow" class="data-show">
				<div class="search">
					<ul>
						<!-- <li>
							<span>通道名称</span>
							<div>
							   <select id="serialNo" class=" W150" name="filter_LIKES_serialNo"></select>
							</div>
						</li>
						-->
						<li><a href="javascript:void(0);" class="btn W60" onclick="searchFun(this,'sgeType/page')" id="searchFunSpSgeType">搜索 </a>	</li> 
						<shiro:hasPermission name="sp:type">
							<li><a href="javascript:void(0);" class="btn W60" onclick="input()" >新   增</a>	</li>
						</shiro:hasPermission>
					</ul>
				</div>
				<div class="data-table">
					<jsp:include page="page.jsp"></jsp:include>
				</div>
				<div id="sgeTypeCommon"/>
			</div>
		</form>
	</div>
	
</body>
</html>
