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
					<div class="tabbable">
							<ul class="nav nav-tabs" id="myTab">
								<li class="active">
									<a data-toggle="tab" href="#singleTable" onclick='showPage("singleTable","agent/sCode/list")' id="singleTableId">
										单码记录
									</a>
								</li>
								<li>
									<a data-toggle="tab" href="#moreTable" onclick='showPage("moreTable","agent/mCode/list")'>
										多码记录
									</a>
								</li>
							</ul>

							<div class="tab-content">
								<div id="singleTable" class="tab-pane fade in active"></div>
								<div id="moreTable" class="tab-pane fade"></div>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
					
</body>
<script type="text/javascript">
var agentId="";
$(document).ready(function () {   
       agentId = ${admin.agentId};
});  
function showPage(tabId, url){
	url = url+"?filter_EQI_agentId="+agentId;
	$('#maintab a[href="#'+tabId+'"]').tab('show'); // 显示点击的tab页面
	if($('#'+tabId).html().length<20){ // 当tab页面内容小于20个字节时ajax加载新页面
		//$('#'+tabId).html('<br>'+loadimg+' 页面加载中，请稍后...'); // 设置页面加载时的loading图片
		$('#'+tabId).load(url); // ajax加载页面
	}
}
$("#singleTableId").click();
</script>
</html>
