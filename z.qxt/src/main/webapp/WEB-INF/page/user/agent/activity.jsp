<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../../common/taglibs.jsp" %>
<base href="${contextPath }/" />
<html>
<head>
</head>
<body>
<div class="page-content">
	<div class="page-content-area">
		<div class="row">
			<div class="col-xs-12">
				<!-- PAGE CONTENT BEGINS -->
				<div class="alert alert-block alert-success">
					<button type="button" class="close" data-dismiss="alert">
						<i class="ace-icon fa fa-times"></i>
					</button>
	
					<i class="ace-icon fa fa-check green"></i>
	
					温馨提示，所有活动码一旦生成不允退换！！！
				</div>
		 		<div class="row">
					<div class="col-sm-12 ">
						<div class="widget-box">
							<div class="widget-header">
								<h4 class="smaller">
									<small>单码和多码</small>
								</h4>
							</div>
							<div class="widget-body">
								<div class="widget-main">
									<p class="muted">
										单码：创建生成单个活动码，每个活动码可以设置最大使用数并且每个用户只能使用一次
									</p>
									<p class="muted">
										多吗：创建生成多个活动码，每个活动码被正确使用过作废
									</p>	
									<hr />
			
									<!-- #section:elements.tooltip -->
									<p>
										<span class="btn btn-info btn-sm "  onclick="single()">单码</span>
										<span class="btn btn-success btn-sm " onclick="more()">多码</span>
									</p>
								</div>
							</div>
						</div>
				    </div>
				</div>
					<hr />
				<div class="row">
					<div class="col-sm-12 ">
						<div class="widget-box">
							<div class="widget-header">
								<h4 class="smaller">
									历史记录
								</h4>
							</div>
							<div class="widget-body">
								<div class="widget-main">
									<jsp:include page="activityHistory.jsp"></jsp:include>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
function single(){
	showModal("agent/single");
	return false;
}
function more(){
	showModal("agent/more");
	return false;
}

</script>
</html>
