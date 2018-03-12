<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../../common/taglibs.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8">
<title>代理商</title>
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
					代理商列表
				</h4>
			</div>
			<div class="modal-body" >
				  <form id="userForm" method="post" class="form-horizontal" action="agent/save">
				  		<input type="hidden" value="${user.id }" name="id"/>
				  		<input type="hidden" value="1" name="property"/>
				  		<input type="hidden" value="0" name="parent"/>
				  		<input type="hidden" value="${user.agentId }" name="agentId"/>
		                <div class="form-group">
		                    <label class="col-lg-3 control-label">名称：</label>
		                    <div class="col-lg-5">
		                        <input type="text" class="form-control" name="name" value="${user.name }"/>
		                    </div>
		                </div>
		                <c:if test="${not empty user.id}">
							  <div class="form-group">
			                    <label class="col-lg-3 control-label">ID：</label>
			                    <div class="col-lg-5">
			                        <input type="text" class="form-control"  value="${user.agentId }" disabled="disabled"/>
			                    </div>
			                </div>
						</c:if>
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
		                    <label class="col-lg-3 control-label">游戏ID：</label>
		                    <div class="col-lg-5">
		                        <input type="text" class="form-control" name="gameId" value="${user.gameId }" <c:if test="${not empty user.id}">disabled</c:if>/>
		                    </div>
		                </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">email：</label>
                            <div class="col-lg-5">
                                <input type="input" class="form-control" name="email" value="${user.email }"/>
                            </div>
                        </div>
                         <div class="form-group">
                            <label class="col-lg-3 control-label">phone：</label>
                            <div class="col-lg-5">
                                <input type="input" class="form-control" name="phone" value="${user.phone }"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">结算比例：</label>
                            <div class="col-lg-5">
                                <input type="input" class="form-control" name="balanceScale" value="${user.balanceScale }"/>
                            </div>
                        </div>
                        
                         <div class="form-group">
                            <label class="col-lg-3 control-label">推荐代理提成时间范围(月 0代表没有回扣)：</label>
                            <div class="col-lg-5">
                                <input type="input" class="form-control" name="recommendMonth" value="${user.recommendMonth }"/>
                            </div>
                        </div>
                        
                         <div class="form-group">
                            <label class="col-lg-3 control-label">推荐代理流水提成回扣：</label>
                            <div class="col-lg-5">
                                <input type="input" class="form-control" name="recommendScale" value="${user.recommendScale }"/>
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
				        <div class="form-group">
		                    <label class="col-lg-3 control-label">角色：</label>
		                    <div class="col-lg-7" id="jsid">
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
$.ajax({
		 type: "POST",
		 url: "role/all",
         success: function(data){
               var html = ''; 
               $.each(data, function(commentIndex, comment){
                     html += "<label class=\"checkbox-inline\"><input type=\"checkbox\"name=\"roleIdLists\" value=\""+
                     					comment['id']+"\" id=\"js_"+comment["id"]+"\">"+comment['name']+"</label>";
               });
               $('#jsid').html(html);
                <c:forEach var="auth" items="${user.groups }">
                		$('#js_${auth.id}').attr("checked","checked");
				</c:forEach>
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
		                email:{
		                     validators: {
		                         emailAddress: {
			                        message: '无效的email地址'
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
		                gameId:{
		                	validators: {
		                         notEmpty: {
		                            message: '游戏ID不能空'
		                         },
		                         remote: {
			                        type: 'POST',
			                        url: 'account/repeat',
			                        message: '游戏ID不存在或者已经被绑定代理商账户'
			                    }
		                    }
		                },
		                recommendMonth:{
		                	validators: {
		                         notEmpty: {
		                            message: '推荐代理提成时间范围不能为空'
		                         },
		                         numeric: {message: '只能输入数字'},  
		                    }
		                },
		                recommendScale:{
		                	validators: {
		                         notEmpty: {
		                            message: '推荐代理流水回扣不能为空'
		                         },
		                         regexp: {
									regexp: /^0\.[1-9]\d{0,2}$/,
									message: '荐代理流水回扣应大于0小于1且小于3位的小数'
								}
		                    }
		                },
		                rechangeDiscount:{
		                	validators: {
		                         notEmpty: {
		                            message: '充值折扣不能空'
		                         },
		                         regexp: {
									regexp: /^0\.[1-9]\d{0,2}$/,
									message: '充值折扣应大于0小于1且小于3位的小数'
								}
		                    }
		                },
		                balanceScale:{
		                	validators: {
		                         notEmpty: {
		                            message: '结算比例'
		                         },
		                         regexp: {
									regexp: /^(0\.[1-9]\d{0,2})$/,
									message: '结算比例应大于0小于1且小于3位的小数'
								},
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
		            	},
		            	roleIdLists: {
		                    validators: {
		                        choice: {
		                         	min: 1,
		                        	message: '至少选择一个角色'
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
		               		menuAjax("agent/list");
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