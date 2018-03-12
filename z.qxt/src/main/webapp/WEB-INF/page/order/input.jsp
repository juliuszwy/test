<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8">
<title>订单 </title>
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
					创建订单
				</h4>
			</div>
			<div class="modal-body" >
				  <form id="orderForm" method="post" class="form-horizontal" action="order/wxPay">
		                <div class="form-group">
		                    <label class="col-lg-3 control-label">卡片数量：</label>
		                    <div class="col-lg-5">
		                        <input type="text" class="form-control" name="cardCount" value="${param['card']}" readonly="readonly"/>
		                    </div>
		                </div>
		                <div class="form-group">
		                    <label class="col-lg-3 control-label">价格：</label>
		                    <div class="col-lg-5">
		                        <input type="text" class="form-control" name="price" value="${param['price']}"readonly="readonly"/>
		                    </div>
		                </div>
<!-- 		                <div class="form-group">
		                    <label class="col-lg-3 control-label">用户ID：</label>
		                    <div class="col-lg-5">
		                        <input type="text" class="form-control" name="userId" />
		                    </div>
		                </div>
 -->		          </form>
		          <div style="text-align: center;display: none;" id="qrDiv">
		          	<span style="font-size: 30px;color: #A2B5CD">请打开微信客户端扫描下方二维码完成支付！！！</span>
		          	<div>
		          		<img src="" id="qrCode"/>
		          	</div>
		          </div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" id="close">关闭
				</button>
				<button type="button" class="btn btn-primary" id="save">
					确认
				</button>
			</div>
		</div>
   </div>
</body>
<script type="text/javascript">

var interval ;
var out_no;
$("#save").on("click", function(){
	   var bootstrapValidator = $("#orderForm").data('bootstrapValidator');
	   bootstrapValidator.validate();
});
$("#close,.close").on("click", function(){
	     clearInterval(interval);
});

$(document).ready(function() {
    $('#orderForm')
        .bootstrapValidator({
            message: '无效值',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                /* userId: {
                    message: '无效的用户ID',
                    validators: {
                        notEmpty: {
                            message: '用户ID不能空'
                        },
                        stringLength: {	
                            min: 6,
                            max: 6,
                            message: '长度应该在6位'
                        },
                        remote: {
                            type: 'POST',
							url: 'account/isExists',
							message: '用户ID不存在',
							delay:500
						},
                    }
                } */
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
            $.post($form.attr('action'), $form.serialize(), function(data) {
               $(".modal-body").mLoading("hide");
               if(data.result==0){
               		//$('input[name="userId"]').attr("readonly","readonly");
               		var path = data.path;
               		path = "resources/qrImg/"+new Date().Format("yyyy-MM-dd")+"/"+path+".png";
               		$("#qrDiv").css('display','block'); 
               		$("#qrCode").attr("src",path);
               		setTimeout(
               			function() {
               				interval = setInterval(
               					function serachWxResult(){
									 $.post("order/orderquery",{"out_trade_no":data.path}, function(data) {
										 if(data.result==0){
									          clearInterval(interval);
									          $("#myModal").modal('hide');
									          menuAjax("order/success");
									     }else if(data.result == 2){
								       		  clearInterval(interval);
								       		  $("#myModal").modal('hide');
								       		  menuAjax("order/error");
									     }
									})
								},2000);
               		}, 5000)
               }else{
               		alert("服务器开小差了！！！！");
               		$("#myModal").modal('hide');
               }
            },'json');
        });
});

</script>
</script>
</html>