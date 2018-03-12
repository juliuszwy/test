<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8">
<title>帐号管理 | 新增帐号</title>
<base href="${contextPath }/" />
<style>
      input, .flexselect_dropdown li { font-size: 1em; }
      small { color: #999; }
      .flexselect_selected small { color: #ddd; }
    </style>
</head>
<body>
<div class="panel-body" >
	<form id="accountFormAdd_form" method="post" class="registerform">
	<input type="hidden" name="id" value="${cpInfo.id }"/>
	<input type="hidden" name="userForm.id" value="${cpInfo.userForm.id }"/>
		<div class="tableWarp">
		    <table>
		    	<tbody>
		    		<tr>
			            <td><label for="name" class="label"><span class="red">*</span>用户名:</label></td>
			            <td><input id="name"  type="text" name="userForm.name"  value="${cpInfo.name }" readonly="readonly"></input></td>
			        </tr>
			        <tr>
			            <td><label class="label" for="loginName"><span class="red">*</span> 登录名:</label></td>
			            <td><input  id="loginName" type="text" name="userForm.loginName" class="inputxt" value="${cpInfo.userForm.loginName }"></input></td>
			        </tr>
			        
			        <tr <c:if test="${cpInfo.userForm.id==null||cpInfo.userForm.id=='' }">style="display:none"</c:if>>
			        	<td><label for="">修改密码:</label> </td>
						<td>
							<input  name="rePwd" value="1"  onclick="isUpdatePwd(this.value)" type="radio" checked="checked">否</input>
							<input  name="rePwd" value="2" onclick="isUpdatePwd(this.value)" type="radio" >是</input>
						</td>
			        </tr>
			    </tbody> 
			        <!-- 密码 -->
			        <tbody  id="hide" <c:if test="${cpInfo.userForm.id!=null&&cpInfo.userForm.id!='' }">class='hide'</c:if>>
				        <tr>
				        	<td><label for="password" class="label"><span class="red">*</span>密码:</label> </td>
							<td>
								<input type="password"  name="userForm.password" class="inputxt"  />
							</td>
				        </tr>
				        <tr>
				        	<td><label for="" class="label"><span class="red">*</span>确认密码:</label> </td>
							<td>
								<input type="password"  recheck="userForm.password" dataType="*" sucmsg=" " nullmsg="请再输入一次密码！" errormsg="您两次输入的账号密码不一致！" />
							</td>
				        </tr>
			        </tbody>
			        
			        <tbody>
				        <tr>
				        	<td><label for="email" class="label" ><span class="red">*</span>Email:</label> </td>
							<td>
								<input  name="userForm.email"  type="text" class="inputxt" value="${cpInfo.userForm.email}"></input>
							</td>
				        </tr>
				        
				        <!--权限组 -->
				         <tr>
				        	<td><label for="roleIds" class="label" ><span class="red">*</span>角色组:</label> </td>
							<td id="roleIds">
							</td>
				        </tr>
				        <tr >
				            <td><label for="status" class="label">状态:</label></td>
				            <td>
					            <select id="status" name="userForm.status" tabindex="4"  style="width:150px;">
					            	<option value="0"<c:if test="${cpInfo.userForm.status==0 }">selected</c:if>>启用</option>
					            	<option value="1"<c:if test="${cpInfo.userForm.status==1 }">selected</c:if>>禁用</option>
					            </select>
				            </td>
						</tr>
			        </tbody>
		    </table>
		    <div style="margin-left:180px;padding-top: 20px">
		        <input  type="button" class="btn W80" value="提交" onclick="accountSave()"></input>
		        <input id="btn_reset" type="button"class="btn W80" value="重置"></input>
		    </div>
	    </div>
	</form>
</div>
<script type="text/javascript">
var demo ;
$(function(){
	//$(".registerform").Validform();  //就这一行代码！;
	demo=$(".registerform").Validform({
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
	demo.addRule([
	{
		ele:".inputxt:eq(0)",
		datatype:"s2-20",
		sucmsg:" "
	},
	{
		ele:".inputxt:eq(1)",
		datatype:"*6-16",
		sucmsg:" "
	},
	{
		ele:".inputxt:eq(2)",
		datatype:"e",
		sucmsg:" "
	},
	{
		ele:":checkbox:first",
		datatype:"*",
		sucmsg:" "
	}]);
});
function accountSave(){
	var  cpAccount = $("#cpAccount");
	if(demo.check(false)){
		$("#accountFormAdd_form").jrAjax({
			url : "cp/accountSave",
			autoGetParam : true,
			resultAutoProcess : true,
			newdLoading : true,
			loadingType : 'full',
			container : cpAccount,
			successCallback: function(result){
				if(result=='1'){
					cpAccount.jrDialog("close");
				}else{
					$("#btn_reset").click();
				}
			},
			errorCallback:function(result){
				$("#btn_reset").click();
			}
		});
	}
};
$(document).ready(function() {
	InitcheckBox();
    $("#Validform_msg").remove();
});
 function InitcheckBox() {
 	var roleList = eval('${roleList}');
	 var selectObj = $("#roleIds");
         $.ajax({
              url: "role/2/content",
              type: "get",
              dataType: "json",
              success: function (result) {
              	var json = eval(result);
              	for(var i=0;i<json.length;i++){
              		var input = $("<input></input>").attr("type","checkbox").attr("name","userForm.roleIdLists").val(json[i].id).after(" "+json[i].name+"  ");
              		if(roleList){if(roleList.indexOf(json[i].id)>=0)input.attr("checked",true);}
              		selectObj.append(input);
              		selectObj.append("<br />");
              	}
	          }
         });
     };
     function isUpdatePwd(obj) {
		if (obj == 2) {//修改密码
			$("#hide").removeClass("hide");
		} else if (obj == 1){//模块
			$("#hide").addClass("hide");
			$("#hide").children("tr").children("td").children("input").val("");
		}
	}
</script>
</body>
</html>