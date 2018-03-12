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
					角色管理
				</h4>
			</div>
			<div class="modal-body" >
				  <form id="roleForm" method="post" class="form-horizontal" action="role/save">
				  		<input type="hidden" value="${role.id }" name="id"/>
		                <div class="form-group">
		                    <label class="col-lg-3 control-label">角色名称：</label>
		                    <div class="col-lg-5">
		                        <input type="text" class="form-control" name="name" value="${role.name }"/>
		                    </div>
		                </div>
		                <div class="form-group">
		                	<label class="col-lg-3 control-label">状态：</label>
			                <div class="col-lg-5">
					            <select class="form-control" name="status">
					               <option value="0"<c:if test="${role.status==0 }">selected</c:if>>启用</option>
					               <option value="1"<c:if test="${role.status==1 }">selected</c:if>>禁止</option>
					            </select>
					        </div>
				        </div>
				        <div class="form-group">
		                    <label class="col-lg-3 control-label">权限：</label>
		                    <div class="col-lg-7" id="qxid">
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
	   var bootstrapValidator = $("#roleForm").data('bootstrapValidator');
	   bootstrapValidator.validate();
});

$(document).ready(function() {
	$.ajax({
		 type: "POST",
		 url: "auth/all",
         success: function(data){
               var html = ''; 
               $.each(data, function(commentIndex, comment){
                     html += "<label class=\"checkbox-inline\"><input type=\"checkbox\"name=\"auths\" value=\""+
                     					comment['id']+"\" id=\"qx_"+comment["id"]+"\">"+comment['authName']+"</label>";
               });
               $('#qxid').html(html);
                <c:forEach var="auth" items="${role.authInfos }">
                		$('#qx_${auth.id}').attr("checked","checked");
				</c:forEach>
				
				
				$('#roleForm')
        .bootstrapValidator({
            message: '无效值',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                name: {
                    message: '无效的角色名称',
                    validators: {
                        notEmpty: {
                            message: '角色名称不能空'
                        },
                        stringLength: {
                            min: 3,
                            max: 10,
                            message: '长度应该在3-10位'
                        }
                    }
                },
                 auths: {
                    validators: {
                        choice: {
                         	min: 1,
                        	message: '至少选择一个权限'
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
               		menuAjax("role/list");
               }else{
               		$(".modal-body").mLoading("hide");
               }
            },'json');
        });
         }
	
	});
    
});
</script>
</body>

</html>