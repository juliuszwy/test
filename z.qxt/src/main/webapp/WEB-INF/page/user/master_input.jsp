<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8">
<title>角色管理</title>
<base href="${contextPath }/" />
<style>
</style>
</head>
<body>
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					账号管理
				</h4>
			</div>
			<div class="modal-body" >
				  <form id="userForm" method="post" class="form-horizontal" action="user/save">
				  		<input type="hidden" value="${user.id }" name="id"/>
				  		<input type="hidden" value="1" name="property"/>
				  		
		                <div class="form-group">
		                    <label class="col-lg-3 control-label">名称：</label>
		                    <div class="col-lg-5">
		                        <input type="text" class="form-control" name="name" value="${user.name }"/>
		                    </div>
		                </div>
		                <div class="form-group">
		                    <label class="col-lg-3 control-label">登陆名：</label>
		                    <div class="col-lg-5">
		                        <input type="text" class="form-control" name="loginName" value="${user.loginName }"/>
		                    </div>
		                </div>
		                
		                 <div class="form-group">
                            <label class="col-lg-3 control-label">密码：</label>
                            <div class="col-lg-5">
                                <input type="password" class="form-control" name="password" value="${user.password }"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">密码确认：</label>
                            <div class="col-lg-5">
                                <input type="password" class="form-control" name="confirmPassword" value="${user.password }"/>
                            </div>
                        </div>
                         <div class="form-group">
		                	<label class="col-lg-3 control-label">短信业务状态：</label>
			                <div class="col-lg-5">
					            <select class="form-control" name="smsStatus">
					               <option value="0" <c:if test="${user.smsStatus==0 }">selected</c:if>>开启</option>
					               <option value="1" <c:if test="${user.smsStatus==1 }">selected</c:if>>暂停</option>
					            </select>
					        </div>
				        </div>
				         <div class="form-group">
		                	<label class="col-lg-3 control-label">API业务状态：</label>
			                <div class="col-lg-5">
					            <select class="form-control" name="apiStatus">
					               <option value="0" <c:if test="${user.apiStatus==0 }">selected</c:if>>开启</option>
					               <option value="1" <c:if test="${user.apiStatus==1 }">selected</c:if>>暂停</option>
					            </select>
					        </div>
				        </div>
		                <div class="form-group">
		                	<label class="col-lg-3 control-label">状态：</label>
			                <div class="col-lg-5">
					            <select class="form-control" name="status">
					               <option value="0" <c:if test="${user.status==0 }">selected</c:if>>启用</option>
					               <option value="1" <c:if test="${user.status==1 }">selected</c:if>>禁止</option>
					            </select>
					        </div>
				        </div>
		          </form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary" id="save">
					提交更改
				</button>
			</div>
			
		</div>
   </div>
   <script type="text/javascript">

$("#save").on("click", function(){
	   var bootstrapValidator = $("#userForm").data('bootstrapValidator');
	   bootstrapValidator.validate();
});

$(document).ready(function() {

		    $('#userForm')
		        .bootstrapValidator({
		            message: '无效值',
		            feedbackIcons: {
		                valid: 'glyphicon glyphicon-ok',
		                invalid: 'glyphicon glyphicon-remove',
		                validating: 'glyphicon glyphicon-refresh'
		            },
		            fields: {
		                name: {
		                    message: '无效的用户名称',
		                    validators: {
		                        notEmpty: {
		                            message: '名称不能空'
		                        },
		                        stringLength: {
		                            min: 3,
		                            max: 10,
		                            message: '长度应该在3-10位'
		                        }
		                    }
		                },
		                loginName: {
		                     validators: {
		                         notEmpty: {
		                            message: '登陆名不能空'
		                         },
		                         remote: {
			                        type: 'POST',
			                        url: 'user/repeat/?id=${user.id }',
			                        message: '登陆名被注册了'
			                    }
		                    }
		                },
		                password: {
			                validators: {
			                    notEmpty: {
			                        message: '密码不能为空'
			                    },
			                    identical: {
			                        field: 'confirmPassword',
			                        message: '密码和确认密码不一样'
			                    },
			                    different: {
			                        field: 'loginName',
			                        message: '密码和登陆名不能一样'
			                    }
			                }
		            	},
		            	confirmPassword: {
			                validators: {
			                    notEmpty: {
			                        message: '确认密码不能为空'
			                    },
			                    identical: {
			                        field: 'password',
			                        message: '密码和确认密码不一样'
			                    },
			                    different: {
			                        field: 'loginName',
			                        message: '密码和登陆名不能一样'
			                    }
			                }
		            	}
		            }
		        }).on('success.form.bv', function(e) {
		            // Prevent form submission
		            e.preventDefault();
		            var $form = $(e.target);
		            var bv = $form.data('bootstrapValidator');
		            $(".modal-body").mLoading({
						    text:"请稍后。。。。",
						    html:false,
						    content:"",
						    mask:true
						});
		            $.post($form.attr('action'), $form.serialize(), function(result) {
		            	alert(result.msg);
		               if(result.result==0){
		               		$("#myModal").modal('hide');
		               		menuAjax("user/master/list");
		               }else{
		               		$(".modal-body").mLoading("hide");
		               }
		            },'json');
		        });
		      });
</script>
</body>

</html>