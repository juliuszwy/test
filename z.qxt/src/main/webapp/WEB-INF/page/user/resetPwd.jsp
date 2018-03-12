<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<html>
<head>
<title>菜单列表</title>
<script>
</script>
</head>
<body>
<div class="panel panelMin">
	<div class="title">
	<div class="titleImg"><img src="resources/images/left/user-black.png" border="0" width="20px" height="20px"></div>
		<div class="titleText">修改密码</div>
	</div>
	<div class="data-show">
      <div id="passwordEditShow" class="tableWarp">
		<form action="user/updatePwd" method="post" id="passwordEditForm" class="passwordEditForm">
			<div class="DataShow">
				<table>
					<tbody>
						<tr>
							<td style="width: 400px"><label class="label" for="oldPassword"><span class="red">*</span>原密码:</td>
							<td>
								<input type="password" value="" name="oldPassword" id="oldPassword" class="inputxt inputDiv" style="width: 220px">
							</td>
						</tr>
						<tr>
							<td style="width: 400px"><label class="label" for="newPassword">
								<span class="red">*</span>新密码:
							</td>
							<td>
								<input type="password" value="" name="newPassword" id="newPassword" class="inputxt inputDiv" style="width: 220px">
							</td>
						</tr>
						<tr>
							<td style="width: 400px"><label class="label" for="confimPassword">
								<span class="red">*</span>重复密码:
							</td>
							<td>
								<input type="password" id="confimPassword" recheck="newPassword" dataType="*" sucmsg=" " nullmsg="请再输入一次密码！" 
										errormsg="您两次输入的账号密码不一致！" class="inputDiv" style="width: 220px">
							</td>
						</tr>
					</tbody>
				</table>
				<div style="text-align: center;margin-top: 20px">
				<a href="javascript:void(0);" class="btn W50" onclick="updatePassword();"> 修　改 </a>
				 <input id="btn_reset" type="hidden"class="btn W80" value="重置"></input>
				</div>
			</div>
		</form>
	</div>
	</div>
	</div>
</body>
<script type="text/javascript">
var demo ;
$(function(){
	//$(".registerform").Validform();  //就这一行代码！;
	demo=$(".passwordEditForm").Validform({
		btnReset:"#btn_reset",
		tiptype:3,
		label:'.label',
		showAllError:true,
		ajaxPost:true,
		ignoreHidden:true,
		datatype:{
			"zh2-20":/^[\u4E00-\u9FA5\uf900-\ufa2d]{2,20}$/
		},
	});
	demo.tipmsg.w["zh2-20"]="请输入2到20个中文字符！";
	demo.addRule([{
		ele:".inputxt:eq(0)",
		datatype:"*6-16",
		sucmsg:" "
	},
	{
		ele:".inputxt:eq(1)",
		datatype:"*6-16",
		sucmsg:" "
	}]);
});
function updatePassword(){
	if(demo.check(false)){
		$("#passwordEditForm").jrAjax({
			url : "user/updatePwd",
			autoGetParam : true,
			resultAutoProcess : false,
			newdLoading : true,
			loadingType : 'full',
			container : $("#passwordEditForm"),
			successCallback: function(result){
			if (result.return_code == '1') {
					$.message.alert("alert","提示","修改成功！");
			}else{
				$.message.alert("warn","警告",result.return_msg);
			}
				$("#btn_reset").click();
			},
			errorCallback:function(result){
				$.message.alert("error","错误","服务器开小差了！");
				$("#btn_reset").click();
			}
		});
	}
};
$(document).ready(function() {
    $("#Validform_msg").remove();
});
</script>
</html>
