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
	<form id="CpAdd_form" method="post" class="registerform">
	<input type="hidden" name="id" value="${cpInfo.id }"/>
	<input type="hidden" name="userForm.id" value="${cpInfo.userForm.id }"/>
		<div class="tableWarp">
		    <table>
		    	<tbody>
		    	
			    	<c:if test="${not empty cpInfo.id}">
						 <tr>
				            <td><label for="serialNo">CPID:</label></td>
				            <td><input type="text" name="serialNo" value="${cpInfo.serialNo }" readonly="true" ></input></td>
			       		 </tr>
					</c:if>
			        <tr>
			            <td><label for="name" class="label"><span class="red">*</span>CP名称:</label></td>
			            <td><input id="name"  type="text" name="name" class="inputxt" value="${cpInfo.name }"></input></td>
			        </tr>
			         <tr>
			        	<td><label for="contacts" class="label" >联系人:</label> </td>
			        	<td>
							<input  name="contacts"  type="text"  value="${cpInfo.contacts}"></input>
						</td>
			        </tr>
			        <tr>
			        	<td><label for="tel" class="label" >TEL:</label> </td>
			        	<td>
							<input  name="tel"  type="text"  value="${cpInfo.tel}"></input>
						</td>
			        </tr>
			         <tr>
			        	<td><label for="qq" class="label" >QQ:</label> </td>
			        	<td>
							<input  name="qq"  type="text"  value="${cpInfo.qq}"></input>
						</td>
			        </tr>
			        
			        <tr>
			        	<td><label for="settlementPeriod" class="label" >结算周期:</label> </td>
						<td>
							<input  name="settlementPeriod"  type="text"  value="${cpInfo.settlementPeriod}"></input>
						</td>
			        </tr>
			        <tr>
			        	<td><label for="scaleM" class="label" ><span class="red">*</span>结算比例(移动):</label> </td>
						<td>
							<input  name="scaleM"  type="text" class="inputxt" value="${cpInfo.scaleM}"></input>
						</td>
			        </tr>
			        <tr>
			        	<td><label for="scaleT" class="label" ><span class="red">*</span>结算比例(电信):</label> </td>
						<td>
							<input  name="scaleT"  type="text" class="inputxt" value="${cpInfo.scaleT}"></input>
						</td>
			        </tr>
			        <tr>
			        	<td><label for="scaleU" class="label" ><span class="red">*</span>结算比例(联通):</label> </td>
						<td>
							<input  name="scaleU"  type="text" class="inputxt" value="${cpInfo.scaleU}"></input>
						</td>
			        </tr>
				        
			        <tr>
			        	<td><label for="payUnitCpDay" class="label" ><span class="red">*</span>CP总日限(元):</label> </td>
			        	<td>
							<input  name="payUnitCpDay"  type="text" class="inputxt" value="${cpInfo.payUnitCpDay}"></input>
						</td>
			        </tr>
			        <tr>
			        	<td><label for="payUnitCpMonth" class="label" ><span class="red">*</span>CP总日限(元):</label> </td>
			        	<td>
							<input  name="payUnitCpMonth"  type="text" class="inputxt" value="${cpInfo.payUnitCpMonth}"></input>
						</td>
			        </tr>
			        <tr>
			        	<td><label for="persent" class="label" ><span class="red">*</span>扣量比例(基数100):</label> </td>
			        	<td>
							<input  name="persent"  type="text" class="inputxt" value="${cpInfo.persent}"></input>
						</td>
			        </tr>
			        <tr>
			        	<td><label for="limitDedu" class="label" ><span class="red">*</span>扣量初始条:</label> </td>
			        	<td>
							<input  name="limitDedu"  type="text" class="inputxt" value="${cpInfo.limitDedu}"></input>
						</td>
			        </tr>
			        <tr >
			            <td><label for="status" class="label">状态:</label></td>
			            <td>
				            <select id="status" name="status" tabindex="4"  style="width:150px;">
				            	<option value="0"<c:if test="${cpInfo.status==0 }">selected</c:if>>正常合作</option>
				            	<option value="1"<c:if test="${cpInfo.status==1 }">selected</c:if>>不合作</option>
				            </select>
			            </td>
					</tr>
			    </tbody>
		    </table>
		    <div style="margin-left:180px;padding-top: 20px">
		        <input  type="button" class="btn W80" value="提交" onclick="cpSave()"></input>
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
			"fOne":/^0(\.\d{1,})?$/
		},
	});
	demo.tipmsg.w["fOne"]="请输入小数(0.XXX)";
	demo.addRule([{
		ele:".inputxt:eq(0)",
		datatype:"s2-20",
		sucmsg:" "
	},
	{
		ele:".inputxt:eq(1)",
		datatype:"fOne",
		sucmsg:" "
	},
	{
		ele:".inputxt:eq(2)",
		datatype:"fOne",
		sucmsg:" "
	},
	{
		ele:".inputxt:eq(3)",
		datatype:"fOne",
		sucmsg:" "
	},
	{
		ele:".inputxt:eq(4)",
		datatype:"n",
		sucmsg:" "
	},
	{
		ele:".inputxt:eq(5)",
		datatype:"n",
		sucmsg:" "
	},
	{
		ele:".inputxt:eq(6)",
		datatype:"n1-2",
		sucmsg:" "
	},
	{
		ele:".inputxt:eq(7)",
		datatype:"n",
		sucmsg:" "
	}]);
});
function cpSave(){
	var  cpAdd = $("#cpAdd");
	if(demo.check(false)){
		$("#CpAdd_form").jrAjax({
			url : "cp/addOrUpdate",
			autoGetParam : true,
			resultAutoProcess : true,
			newdLoading : true,
			loadingType : 'full',
			container : cpAdd,
			successCallback: function(result){
				if(result=='1'){
					cpAdd.jrDialog("close");
					$("#searchFunCP").click();
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
	//InitcheckBox();
    $("#Validform_msg").remove();
});
 function InitcheckBox() {
 	var roleList = eval('${roleList}');
	 var selectObj = $("#roleIds");
         $.ajax({
              url: "role/1/content",
              type: "get",
              dataType: "json",
              success: function (result) {
              	var json = eval(result);
              	for(var i=0;i<json.length;i++){
              		var input = $("<input></input>").attr("type","checkbox").attr("name","roleIds").val(json[i].id).after(" "+json[i].name+"  ");
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