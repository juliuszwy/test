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
					多码活动
				</h4>
			</div>
			<div class="modal-body" >
				  <form id="singleForm" method="post" class="form-horizontal" action="agent/more/save">
				  		<input type="hidden" name="type" value="1"/>
		                <div class="form-group">
		                    <label class="col-lg-3 control-label">活动主题：</label>
		                    <div class="col-lg-5">
		                        <input type="text" class="form-control" name="theme"/>
		                    </div>
		                </div>
						<div class="form-group">
		                	<label class="col-lg-3 control-label">适用人群：</label>
			                <div class="col-lg-5">
					            <select class="form-control" name="cardType">
					               <option value="0" >新手</option>
					               <option value="1" >老用户</option>
					            </select>
					        </div>
				        </div>
				        <div class="form-group">
		                	<label class="col-lg-3 control-label">归属渠道：</label>
			                <div class="col-lg-5">
					            <select class="form-control" name="qudaoId">
					            </select>
					        </div>
				        </div>
		                <div class="form-group">
		                    <label class="col-lg-3 control-label">生成代码数：</label>
		                    <div class="col-lg-5">
		                        <input type="text" class="form-control" name="maxUsage"/>
		                    </div>
		                </div>
		                
		                 <div class="form-group">
                            <label class="col-lg-3 control-label">每个用户获得的卡片数：</label>
                            <div class="col-lg-5">
                                <input type="text" class="form-control" name="cardCount"/>
                            </div>
                        </div>
                       <jsp:include page="../../common/activityCommon.jsp"></jsp:include>
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
	   var bootstrapValidator = $("#singleForm").data('bootstrapValidator');
	   bootstrapValidator.validate();
});

    
$(document).ready(function() {
	var obj = $("select[name='qudaoId']");
	$.post('channel/names',function(data){
		  obj.append("<option value='0'>平台</option>");
	      for(var i=0; i<data.length;i++){     
	              obj.append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
	      }  
	}); 
});
    $('#singleForm')
        .bootstrapValidator({
            message: '无效值',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                theme: {
                    message: '无效的活动主题',
                    validators: {
                        notEmpty: {
                            message: '活动主题不能空'
                        },
                        stringLength: {
                            min: 3,
                            max: 10,
                            message: '长度应该在3-10位'
                        }
                    }
                },
                maxUsage:{
                	validators: {
                         notEmpty: {
                            message: '最大使用人数不能空'
                         },
                         regexp: {
							regexp: /^[1-9][0-9]*$/,
							message: '请填写大于1的数字'
						},
                    }
                },
                cardCount:{
                	validators: {
                         notEmpty: {
                            message: '使用获得卡片数不能为空'
                         },
                         regexp: {
							regexp: /^[1-9][0-9]*$/,
							message: '请填写大于1的数字'
						},
                    }
                },
                startDate:{
                	validators: {
                         notEmpty: {
                            message: '开始时间不能为空'
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
            	
               if(result.result==0){
               		alert("创建成功");
               		$("#myModal").modal('hide');
               		menuAjax("agent/activity");
               }else {
               		if(result.result==1)
               			alert("账户余额不足，请尽快充值");
               		else
               			alert("服务器开小差了");
               		$(".modal-body").mLoading("hide");
               }
            },'json');
        });
    	
</script>
</body>

</html>