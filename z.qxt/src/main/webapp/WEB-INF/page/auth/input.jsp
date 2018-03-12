<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8">
<title>权限管理</title>
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
					权限管理
				</h4>
			</div>
			<div class="modal-body" >
				  <form id="authForm" method="post" class="form-horizontal" action="auth/save">
				  		<input type="hidden" value="${auth.id }" name="id"/>
		                <div class="form-group">
		                    <label class="col-lg-3 control-label">权限名称：</label>
		                    <div class="col-lg-5">
		                        <input type="text" class="form-control" name="authName" value="${auth.authName }"/>
		                    </div>
		                </div>
		
		                <div class="form-group">
		                    <label class="col-lg-3 control-label">权限：</label>
		                    <div class="col-lg-5">
		                        <input type="text" class="form-control" name="auth" value="${auth.auth }"/>
		                    </div>
		                </div>
		                <div class="form-group">
		                	<label class="col-lg-3 control-label">状态：</label>
			                <div class="col-lg-5">
					            <select class="form-control" name="status">
					               <option value="0" <c:if test="${auth.status==0 }">selected</c:if>>启用</option>
					               <option value="1" <c:if test="${auth.status==1 }">selected</c:if>>禁止</option>
					            </select>
					        </div>
					        <input type="hidden" name="oldStatus"value="${auth.status}"/>
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
</body>
<script type="text/javascript">

$("#save").on("click", function(){
	   var bootstrapValidator = $("#authForm").data('bootstrapValidator');
	   bootstrapValidator.validate();
});
$(document).ready(function() {
    $('#authForm')
        .bootstrapValidator({
            message: '无效值',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                authName: {
                    message: '无效的权限名称',
                    validators: {
                        notEmpty: {
                            message: '权限名称不能空'
                        },
                        stringLength: {
                            min: 3,
                            max: 10,
                            message: '长度应该在3-10位'
                        }
                    }
                },
                auth: {
                    validators: {
                        notEmpty: {
                            message: '权限不能为空'
                        },
						stringLength: {
                            min: 3,
                            max: 10,
                            message: '长度应该在3-10位'
                        },
                        regexp: {
							regexp: /^[a-zA-Z0-9_\.\:]+$/,
							message: '权限只能由字母、数字、点和下划线、冒号组成'
						},
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
               		menuAjax("auth/list");
               		
               }else{
               		$(".modal-body").mLoading("hide");
               }
            },'json');
        });
});
</script>
</script>
</html>