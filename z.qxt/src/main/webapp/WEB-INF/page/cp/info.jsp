<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<html>
<head>
<title>cp基本信息</title>
<script>
</script>
</head>

<body>
	<div class="panel panelMin">
	<div class="title">
	<div class="titleImg"><img src="resources/images/left/channel-black.png" border="0" width="20px" height="20px"></div>
		<div class="titleText">公司基本信息</div>
	</div>
	<div class="data-show">
        <div id="cpBaseInfoShow" class="tableWarp">
        <form id="baseUserEditForm" name="baseUserEditForm">
        	<input type="hidden" name="id" value="${cpInfoForm.id }"/>
			<table>
				<tbody>
					<tr>
						<td>用户名:</td> 
						<td>${cpInfoForm.userForm.loginName }</td>
					</tr>
					<tr>
						<td>名称:</td>
						<td>${cpInfoForm.name }</td>
						<td style="display: none">
							<div class="inputDiv" ><input type="text" name="name" value="${cpInfoForm.name }" >
							</div>
						</td>
					</tr>
					<tr>
						<td>联系人:</td>
						<td>${cpInfoForm.contacts }</td>
						<td style="display: none">
							<div  class="inputDiv"><input type="text" name="contacts" value="${cpInfoForm.contacts }" >
							</div>
						</td>
					</tr>
					<tr>
						<td>TEL:</td>
						<td>${cpInfoForm.tel }</td>
						<td style="display: none">
							<div  class="inputDiv"><input type="text" name="tel" value="${cpInfoForm.tel }" >
							</div>
						</td>
					</tr>
					<tr>
						<td>邮件:</td>
						<td>${cpInfoForm.qq }</td>
						<td style="display: none">
							<div  class="inputDiv"><input type="text" name="qq" value="${cpInfoForm.qq }" >
							</div>
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td  colspan="2" style="text-align: center;">
							<a href="javascript:void(0);" class="btn W50" onclick="showEditPage();"> 编    辑 </a>
						</td>
						<td colspan="2" style="display: none;text-align: center;">
							<a href="javascript:void(0);" class="btn W50" onclick="saveEditPage();"> 保    存 </a>
							<a href="javascript:void(0);" class="btn W50" onclick="hideEditPage();"> 返    回 </a>
						</td>
					</tr>
				</tfoot>
			</table>	
			</form>
	    </div>
	</div>
</div>
<script type="text/javascript">
	function showEditPage(){
		$("#cpBaseInfoShow tfoot tr td:first").hide();
		$("#cpBaseInfoShow tfoot tr td:eq(1)").show();
		$("#cpBaseInfoShow tbody tr").find("td:eq(2)").show();
		$("#cpBaseInfoShow tbody tr").find("td:eq(1)").hide();
		$("#cpBaseInfoShow tbody td:eq(1)").show();
	}
	function hideEditPage(){
		$("#cpBaseInfoShow tfoot tr td:first").show();
		$("#cpBaseInfoShow tfoot tr td:eq(1)").hide();
		$("#cpBaseInfoShow tbody tr").find("td:eq(2)").hide();
		$("#cpBaseInfoShow tbody tr").find("td:eq(1)").show();
	}
	function saveEditPage(){
		$("#baseUserEditForm").jrAjax({
			url : "cp/addOrUpdate",
			autoGetParam : true,
			resultAutoProcess : false,
			newdLoading : true,
			loadingType : 'full',
			container : $("#baseUserEditForm"),
			successCallback: function(result){
				if(result=='1'){
					$.message.alert("info","","操作成功",function(){
						$(".dataDiv").jrAjax({
						url : "user/cpInfo",
						autoGetParam : false,
						resultAutoProcess : true,
						newdLoading : true,
						loadingType : 'full',
						container : $(".dataDiv")
					});
					});
					
				}else{
					$.message.alert("warn","警告","操作失败");
				}
					
			},
			errorCallback:function(result){
				$.message.alert("error","错误","服务器开小差了！");
			}
		});
	}
</script>
</body>
</html>
