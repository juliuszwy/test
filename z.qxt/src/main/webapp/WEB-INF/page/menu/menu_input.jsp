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
	<input type="hidden" id="parentId" value="${menu.parent }"/>
	<form id="menuAdd_form" method="post" class="registerform" action="menu/sdsds">
	<input type="hidden" name="id" value="${menu.id }"/>
		<div class="tableWarp">
		    <table>
		    	<tbody>
			        <tr>
			            <td><label class="label" for="resourceName"><span class="red">*</span> 资源名称:</label></td>
			            <td><input  id="resourceName" type="text" name="resourceName" class="inputxt" value="${menu.resourceName }"></input></td>
			        </tr>
			        <tr>
			            <td><label for="menuIconUrl" class="label">图片名称:</label></td>
			            <td><input type="text" name="menuIconUrl" class="" value="${menu.menuIconUrl }"></input></td>
			        </tr>
			        <tr>
			        	<td><label for="displaySort"><span class="red">*</span>展示顺序:</label> </td>
						<td>
							<input  name="displaySort"  type="text" class="inputxt" value="${menu.displaySort }"></input>
						</td>
			        </tr>
			        <tr>
			        	<td><label for="property"><span class="red">*</span>平台、合作方:</label> </td>
						<td>
							<input  name="property" value="1"   type="radio" onclick="InitTestSelect(this)"<c:if test="${menu.property=='1' }">checked</c:if>>平台</input>
							<input name="property" value="2"  type="radio" onclick="InitTestSelect(this)"<c:if test="${menu.property=='2' }">checked</c:if>>合作方</input>
						</td>
			        </tr>
			        <tr>
			        	<td><label for="displayType"><span class="red">*</span>类型:</label> </td>
						<td>
							<input  name="displayType" value="1"  onclick="changeType(this.value)" type="radio" <c:if test="${menu.displayType=='1' }">checked</c:if>>模块</input>
							<input name="displayType" value="2" onclick="changeType(this.value)" type="radio" <c:if test="${menu.displayType=='2' }">checked</c:if>>菜单</input>
						</td>
			        </tr>
			        <tr>
			            <td><label for="description" class="label">菜单描述:</label></td>
			            <td colspan="2"><textarea  style="width:250px;" type="text" name="description" class="gray" tip="菜单描述。" altercss="gray" value="${menu.description }">菜单描述。</textarea></td>
			        </tr>
			        </tbody>
			        <tbody class="hide" id="hide">
			        	<tr>
				            <td><label for="resourceUrl"  class="label">菜单地址:</label></td>                                                       
				            <td><input  type="text" name="resourceUrl"  value="${menu.resourceUrl }"></input></td>
			        	</tr>
				        <tr >
				            <td><label for="model" class="label">所属模块:</label></td>
				            <td>
					            <select id="model" name="parent" tabindex="4"  style="width:150px;"></select>
				            </td>
				        </tr>
			        </tbody>
			        <tbody>
				        <tr >
					            <td><label for="state" class="label">状态:</label></td>
					            <td>
						            <select id="state" name="state" tabindex="4"  style="width:150px;">
						            	<option value="0"<c:if test="${menu.state==0 }">selected</c:if>>启用</option>
						            	<option value="1"<c:if test="${menu.state==1 }">selected</c:if>>禁用</option>
						            </select>
					            </td>
					    </tr>
				    </tbody>
		    </table>
		    <div style="margin-left:180px;padding-top: 20px">
		        <input  type="button" class="btn W80" value="提交" onclick="menuSave()"></input>
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
		datatype:{
			"zh1-6":/^[\u4E00-\u9FA5\uf900-\ufa2d]{1,6}$/
		},
		ajaxPost:true,
		ignoreHidden:true,
	});
	demo.tipmsg.w["zh1-6"]="请输入1到6个中文字符！";
	demo.addRule([{
		ele:".inputxt:eq(0)",
		datatype:"s2-10",
		sucmsg:" "
	},
	{
		ele:".inputxt:eq(1)",
		datatype:"n1-2",
		sucmsg:" "
	},
	{
		ele:".inputxt:eq(2)",
		datatype:"*",
		sucmsg:" "
	},
	{
		ele:"select",
		datatype:"*",
		sucmsg:" "
	},
	{
		ele:"textarea",
		datatype:"*0-100",
		sucmsg:" "
	},
	{
		ele:":radio:first",
		datatype:"*",
		sucmsg:" "
	},
	{
		ele:":checkbox:first",
		datatype:"*",
		sucmsg:" "
	}]);
});
function menuSave(){
	var menuAdd = $("#menuAdd");
	var property = $("input:radio[name='property']:checked").val();
	if(demo.check(false)){
		$("#menuAdd_form").jrAjax({
			url : "menu/addOrUpdate",
			autoGetParam : true,
			resultAutoProcess : true,
			newdLoading : true,
			loadingType : 'full',
			container : menuAdd,
			successCallback: function(result){
				if(result=='1'){
					menuAdd.jrDialog("close");
					$("#searchFunMenu"+property).click();
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
if(typeof($('input[name="property"]:checked ').val())!= 'undefined')
	InitTestSelect($('input[name="property"]:checked '));
    $("#Validform_msg").remove();
    changeType($("input[name='displayType']:checked").val());
    
});
 function InitTestSelect(obj) {
	 var parentId = $("#parentId").val(); 
	 var selectObj = $("#model");
	 selectObj.empty();
         $.ajax({
              url: "menu/parent?property="+$(obj).val(),
              type: "get",
              dataType: "json",
              success: function (result) {
              	var json = eval(result);
              	selectObj.append( $("<option></option>"));
              	for(var i=0;i<json.length;i++){
              		var option = $("<option></option>").val(json[i].value).html(json[i].text);
              		if(json[i].value==parentId) option.attr("selected",true);
              		selectObj.append(option);
              	}
	          }
         });
     };
function changeType(obj) {
	if (obj == 2) {//菜单
		$("#hide").removeClass("hide");
	} else if (obj == 1){//模块
		$("#hide").addClass("hide");
	}
}
</script>
</body>
</html>