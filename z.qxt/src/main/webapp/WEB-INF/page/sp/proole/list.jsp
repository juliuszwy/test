<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../../common/taglibs.jsp" %>
<html>
<head>
<script>
function input(spId){
	if(typeof(spId) == "undefined")spId="";
	$("#spProLimitCommon").dialog('open', {
			url : 'spProLimit/input',
			title : 'SP省份操作',
			data:{
				'id':spId,
				'spInfoForm.id':"${param['filter_EQS_spInfo.id']}"
			},
			needClose : true,
			width : '700',
			height : '500'
	});
};
function deleteProLimit(id){
	$.message.confirm("确认","确定要删除吗？",function(flag){
		if(flag){
			$.ajax({
				type : "POST",
				url : "spProLimit/delete",
				data : {
					"id" : id
				},
				success : function(msg) {
				if(msg==1){
					$.message.alert("alert","提示","删除成功");
					$("#homeSpProLimitProxyPromoteShow").jrAjax({
						url : 'spProLimit/page',
						autoGetParam : true,
						resultAutoProcess : true,
						newdLoading : true,
						loadingType : 'full',
						container : $("#homeSpProLimitProxyPromoteShow").find("div").get(0)
					});
				}
				else
					$.message.alert("warn","警告","删除失败");
				},
				error : function(msg) {
					$.message.alert("error","error","服务器出小差了");
				}
			});
		}
	});
};
$(document).ready(function() {
	//InitResourceNameSelect();
});

</script>
</head>
<body>
		<form  action="" method="post">
			<div id="homeSpProLimitProxyPromoteShow">
					<ul>
						<li><a href="javascript:void(0);" class="btn W60" onclick="input()" >新   增</a>	</li>
					</ul>
				<div class="data-table">
					<jsp:include page="page.jsp"></jsp:include>
				</div>
				<div id="spProLimitCommon"/>
			</div>
		</form>
	
</body>
</html>
