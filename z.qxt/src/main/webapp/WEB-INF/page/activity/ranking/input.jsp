<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../../common/taglibs.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8">
<title>排名活动</title>
<base href="${contextPath }/" />
<link rel="stylesheet" href="resources/plugs/fileinput/fileinput.min.css"/>
<script src="resources/plugs/fileinput/fileinput.min.js"></script>
<script type="text/javascript" src="resources/plugs/fileinput/zh.js"></script>
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
					充值赠送活动
				</h4>
			</div>
			<div class="modal-body" >
				  <form id="singleForm" method="post" class="form-horizontal" action="activity/ranking/save">
				  		<input type="hidden" name="type" value="2"/>
				  		<input type="hidden" name="status" value="0"/>
				  		<input type="hidden" name="agentId" value="0"/>
				  		<input type="hidden" name="qudaoId" value="0"/>
				  		
		                <div class="form-group">
		                    <label class="col-lg-3 control-label">活动主题：</label>
		                    <div class="col-lg-5">
		                        <input type="text" class="form-control" name="theme" />
		                    </div>
		                </div>
						<div class="form-group">
		                	<label class="col-lg-3 control-label">排名类型</label>
			                <div class="col-lg-5">
					          	<select name="rankType" >
					          		<option value="0">充值</option>
					          	</select>
					        </div>
				        </div>
				         <div class="form-group">
		                    <label class="col-lg-3 control-label">名额：</label>
		                    <div class="col-lg-5">
		                        <input type="text" class="form-control" name="numberPeople" />
		                    </div>
		                </div>
		                <div class="form-group">
		                    <label class="col-lg-3 control-label">奖励数（卡片）：</label>
		                    <div class="col-lg-5">
		                        <input type="text" class="form-control" name="sendCardCount" />
		                        
		                    </div>
		                </div>
		                
		                 <div class="form-group">
		                    <label class="col-lg-3 control-label">奖励有效领取期限（天）：</label>
		                    <div class="col-lg-5">
		                        <select name="awardVoidTime" >
					          		<option value="3">3天</option>
					          		<option value="10">10天</option>
					          		<option value="30">30天</option>
					          	</select>
		                    </div>
		                </div>
				        <div class="form-group">
		                    <label class="col-lg-3 control-label">奖励通知描述：</label>
		                    <div class="col-lg-7">
		                        <textarea class="form-control" rows="3" name ="awardDescription"></textarea>
		                    </div>
		                </div>
				        <jsp:include page="../../common/activityCommon.jsp"></jsp:include>
				        <input type="hidden" class="form-control" name="imgUrl"  id="fileName"/>
				         <div class="form-group">
		                	<label class="col-lg-3 control-label">图片</label>
			                <div class="col-lg-7">
					            <input id="file-rankingImg" type="file" name= "file" >
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
    initFileInput("file-rankingImg", "/activity/img/upload?pathName=ranking","fileName");
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
                startDateStr:{
                	validators: {
                         notEmpty: {
                            message: '开始时间不能为空'
                         }
                    }
                },
                numberPeople:{
                	validators: {
                         notEmpty: {
                            message: '名额不能为空'
                         },
                         numeric: {message: '只能是数字'}
                    }
                },
                sendCardCount:{
                	validators: {
                         notEmpty: {
                            message: '奖励数不能为空'
                         },
                         numeric: {message: '只能是数字'}
                    }
                }
                ,awardDescription:{
                	validators: {
                         notEmpty: {
                            message: '奖励通知不能为空'
                         },
                        stringLength: {
                         min: 8,
                         max: 70,
                         message: '长度必须在8到70之间'
                     },
                    }
                }
            }
        }).on('success.form.bv', function(e) {
        	var fileName = $("#fileName").val();
        	if(fileName==""){
        		alert("请先上传文件!!!");
        		return;
        	}
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
               if(result==0){
               		alert("创建成功");
               		$("#myModal").modal('hide');
               		menuAjax("activity/ranking/list");
               }else {
              		 if(result==1){
              		 	alert("已有该类型活动时间交集！！！");
              		 }else
               			alert("服务器开小差了");
               		$(".modal-body").mLoading("hide");
               }
            },'json');
        });
    	});
</script>
</body>

</html>