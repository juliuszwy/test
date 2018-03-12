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
				渠道列表
			</h4>
			</div>
			<div class="modal-body" >
				  <form id="channelForm" method="post" class="form-horizontal" action="channel/save">
				  <input type="hidden" name="${channel.channelId }"/>
		                <div class="form-group">
		                    <label class="col-lg-3 control-label">名称：</label>
		                    <div class="col-lg-5">
		                        <input type="text" class="form-control" name="name" value="${channel.name }"/>
		                    </div>
		                </div>
		                <div class="form-group">
		                    <label class="col-lg-3 control-label">手机号码：</label>
		                    <div class="col-lg-5">
		                        <input type="text" class="form-control" name="tel" value="${channel.tel}"/>
		                    </div>
		                </div>

		                <div class="form-group">
		                	<label class="col-lg-3 control-label">状态：</label>
			                <div class="col-lg-5">
					            <select class="form-control" name="status">
					               <option value="0" <c:if test="${channel.status==0 }">selected</c:if>>启用</option>
					               <option value="1" <c:if test="${channel.status==1 }">selected</c:if>>禁止</option>
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
	   var bootstrapValidator = $("#channelForm").data('bootstrapValidator');
	   bootstrapValidator.validate();
});

	    $('#channelForm')
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
	                tel: {
	                     validators: {
	                         notEmpty: {
	                            message: '手机号不能为空'
	                         },
	                         regexp: {
								regexp: /^1[34578]\d{9}$/,
								message: '请填写正确手机号'
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
	               		menuAjax("channel/list");
	               }else{
	               		$(".modal-body").mLoading("hide");
	               }
	            },'json');
	        });
</script>
</body>

</html>