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
	<div class="page-content">
		  <div class="page-content-area">
					<div class="row">
					   <div class="col-lg-12 ">
						  <form id="rePwdForm" method="post" class="form-horizontal" action="user/updatePwd">
				                 <div class="form-group">
		                            <label class="col-lg-3 control-label">原密码：</label>
		                            <div class="col-lg-5">
		                                <input type="password" class="form-control" name="oldPassword" />
		                            </div>
		                        </div>
		                        <div class="form-group">
		                            <label class="col-lg-3 control-label">新密码：</label>
		                            <div class="col-lg-5">
		                                <input type="password" class="form-control" name="password"/>
		                            </div>
		                        </div>
		                         <div class="form-group">
		                            <label class="col-lg-3 control-label">新密码确认：</label>
		                             <div class="col-lg-5">
		                                <input type="password" class="form-control" name="confirmPassword" />
		                            </div>
		                        </div>
				          </form>
						  <div class="clearfix form-actions">
							  <div class="col-md-offset-3 col-md-9">
									<button type="button" class="btn btn-default" id="resetBtn">重置
									</button>
									<button type="button" class="btn btn-primary" id="save">
										提交更改
									</button>
							  </div>
						 </div>
						 </div>
			    </div>
		</div>
   </div>
   <script type="text/javascript">

$("#save").on("click", function(){
	   var bootstrapValidator = $("#rePwdForm").data('bootstrapValidator');
	   bootstrapValidator.validate();
});
 $('#resetBtn').click(function() {
        $('#rePwdForm').data('bootstrapValidator').resetForm(true);
    });
$(document).ready(function() {
		    $('#rePwdForm')
		        .bootstrapValidator({
		            message: '无效值',
		            feedbackIcons: {
		                valid: 'glyphicon glyphicon-ok',
		                invalid: 'glyphicon glyphicon-remove',
		                validating: 'glyphicon glyphicon-refresh'
		            },
		            fields: {
		                oldPassword: {
		                     validators: {
		                         notEmpty: {
		                            message: '原密码不能空'
		                         },
		                         remote: {
			                        type: 'POST',
			                        url: 'user/pwdRepeat',
			                        delay:1000,
			                        message: '原密码错误'
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
			                    }
			                }
		            	}
		            }
		        }).on('success.form.bv', function(e) {
		            // Prevent form submission
		            e.preventDefault();
		            var $form = $(e.target);
		            var bv = $form.data('bootstrapValidator');
		            $("#rePwdForm").mLoading({
						    text:"请稍后。。。。",
						    html:false,
						    content:"",
						    mask:true
						});
		            $.post($form.attr('action'), $form.serialize(), function(result) {
		               $("#rePwdForm").mLoading("hide");
		               $("#resetBtn").click();
		               if(result.result==0){
		                    alert("修改成功,重新登陆");
		              		window.location.href="/logout";
		              	}
		               else
		               	   alert("修改失败")
		            },'json');
		        });
		      });
</script>
</body>

</html>