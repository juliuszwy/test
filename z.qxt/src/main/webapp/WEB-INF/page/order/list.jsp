<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<base href="${contextPath }/" />
<html>
<head>
<title>订单详情</title>
<link rel="stylesheet" href="resources/plugs/bootstrap-datetimepicker.min.css"/>
<link rel="stylesheet" href="resources/plugs/bootstrap-select.css" />
<script src="resources/plugs/bootstrap-select.js"></script>
<script type="text/javascript" src="resources/plugs/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="resources/plugs/bootstrap-datetimepicker.zh-CN.js"></script>
<script>
</script>
</head>

<body>
	<div class="page-content">
				<div class="page-content-area">
						<div class="row">
						    <div class="col-xs-12">
					                <div class="input-group col-md-10" >
								        <span class="input-group-addon" style="width: 120px">平台订单：</span> 
							            <input type="text" class="form-control" id="orderSearch" placeholder="请输入字段名"/> 
							            <span class="input-group-addon" style="width: 120px">第三方订单号：</span> 
						           		<input type="text" class="form-control" id="orderWxSearch" placeholder="请输入字段名"/> 
						           		<span class="input-group-addon"  style="width: 120px">用户ID：</span> 
							            <input type="text" class="form-control" id="userIdSearch" placeholder="请输入字段名"/> 
									</div>
									<div class="input-group col-md-10">
								        <span class="input-group-addon"  style="width: 120px">微信ID：</span> 
							            <input type="text" class="form-control" id="wxIdSearch" placeholder="请输入字段名"/> 
							            <span class="input-group-addon"  style="width: 120px">渠道：</span> 
						           		<input type="text" class="form-control" id="qudaoSearch" placeholder="请输入字段名"/> 
						           		
						           		<span class="input-group-addon"  style="width: 120px">支付类型：</span> 
							            <select id="payTypeSerach" class="form-control">
							            	<option value="">全部</option>
							                <option value="0">平台下发</option>
							            	<option value="1">代理商账户转扣</option>
							            </select>
									</div>
									<div class="input-group date  col-md-11"  style="margin-top:0px positon:relative">
					                	<span class="input-group-addon" style="width: 120px">开始时间：</span> 
					                    <input class="form-control form_datetime_start" size="16" type="text" value=""  id="start">
					                    <span class="input-group-addon"  style="width: 120px">结束时间：</span> 
					                    <input class="form-control form_datetime_end" id ="end"size="16" type="text" value="" >
					                     <span class="input-group-addon"  style="width: 120px">状态：</span> 
					                     <select id="statusSerach" class="form-control">
							            	<option value="">全部</option>
							                <option value="0">充值成功</option>
							            	<option value="1">未充值</option>
							            	<option value="2">充值失败</option>
							            </select>
					                    <span class="input-group-btn" >  
									         <button class="btn btn-info btn-search" id="search">查找</button>  
									    </span>  
					                </div>
								<table id="table" >
								</table>
							</div>
						</div>
				</div>
		</div>
</body>
<script type="text/javascript">
function sumFormatter(){
	return 8;
}
$('.form_datetime_start').datetimepicker({	
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
        showMeridian: 1,
        format: 'yyyy-mm-dd hh:ii:ss'
    });
    $('.form_datetime_end').datetimepicker({	
       language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
        showMeridian: 1,
        format: 'yyyy-mm-dd hh:ii:ss'
    });
    
 //得到查询的参数
function getParams(params) {
  var temp = {
  		limit:params.limit,
		offset: params.offset,
		filter_EQS_orderNo:$("#orderSearch").val(),
		filter_EQS_wxPayOrderNo:$("#orderWxSearch").val(),
		/* agentId:$("#agentIdSearch").val(), */
		filter_GED_createDate:$("#start").val(),
		filter_LTD_createDate:$("#end").val(),
		filter_EQI_type:1,
		filter_EQS_userId:$("#userIdSearch").val(),
		filter_EQS_weixinId:$("#wxIdSearch").val(),
		filter_EQS_qudaoId:$("#qudaoSearch").val(),
		filter_EQI_payType:$("#payTypeSerach").val(),
		filter_EQI_status:$("#statusSerach").val(),
		
  };
  return temp;
};

$.extend($.fn.bootstrapTable.defaults, $.fn.bootstrapTable.locales['zh-CN']);
var $table = $('#table');
function initTable() {  
   // $table.bootstrapTable('destroy');  
    $table.bootstrapTable({
    url: "order/list?json", 
    dataType: "json",
    queryParams:getParams,
    showFooter:true,
    pagination: true, //分页
    pageSize: 15,      //每页的记录行数（*）
    pageList: [1, 25, 50, 100], 
    sidePagination: "server", //服务端处理分页
    toolbar:"#toolbar",
    columns: [
                
                 {
                  title: '订单生成时间',
                  field: 'createDateStr',
                  align: 'left',
                  footerFormatter: function(){
                  	return "总计";
                  }
                }, 
                {
                  title: '订单号',
                  field: 'orderNo',
                  align: 'left',
                }, 
                {
                  title: '第三方订单号',
                  field: 'wxPayOrderNo',
                  align: 'left',
                }, 
                {
                    title: '用户ID',
                    field: 'userId',
                    align: 'center',
                   	halign:'center'
                },
                 {
                    title: '微信ID',
                    field: 'weixinId',
                    align: 'center',
                   	halign:'center'
                },
                {
                    title: '代理商ID',
                    field: 'agentId',
                    align: 'center',
                   	halign:'center',
                   	formatter:function(value,row,index){  
                    	var e ;
                        if(value==0)
	                       e = '<span >未绑定代理商</span>'; 
	                    else 
	                       e = value; 
	                    return e;  
              		}
                },
                  {
                    title: '渠道',
                    field: 'qudaoId',
                    align: 'center',
                   	halign:'center',
                   	formatter:function(value,row,index){  
                    	var e ;
                        if(value=='0')
	                       e = '-'; 
	                    else 
	                       e = value; 
	                    return e;  
              		}
                },
                
                {
                    title: '卡片数量',
                    field: 'cardCount',
                    align: 'center',
                   	halign:'center',
                   	footerFormatter: function(value){
                 		 var count = 0;
				        for (var i in value) {
				            count += value[i].cardCount;
				        }
				        return count;
                 	}
                },
                {
                    title: '价格',
                    field: 'price',
                    align: 'center',
                   	halign:'center',
                   	footerFormatter: function(value){
                  		  var count = 0;
					        for (var i in value) {
					            count += value[i].price;
					        }
					        return count;
                 	}
                   	
                },
                {
                    title: '支付类型',
                    field: 'payType',
                    align: 'center',
                    formatter:function(value,row,index){  
                    	var e ;
                        if(value==0)
	                       e = '<span >平台下发</span>'; 
	                    else if(value==1)
	                       e = '<span style="">代理商下发</span>'; 
	                    return e;  
              		} 
                },
                {
                    title: '状态',
                    field: 'status',
                    align: 'center',
                    formatter:function(value,row,index){  
                    	var e ;
                        if(value==0)
	                       e = '<span >充值成功</span>'; 
	                    else if(value==1)
	                       e = '<span style="">未支付</span>'; 
	                    else 
	                       e = '<span style="color:red">充值失败</span>'; 
	                    return e;  
              		} 
                }
    	 ]
});
}
function details(id){
	var url = "agent/"+id+"/edit";
	showModal(url);
	return false;
}
$(document).ready(function () {          
      initTable();  
      $("#search").bind("click", function(){
      		$table.bootstrapTable('refresh');  
      });  
      /* if(${admin.property==1&&admin.parent==0}){
      	  var obj = $("#agentIdSearch");
	      $.ajax({
	              url: "user/childAgents",
	              type: "get",
	              dataType: "json",
	              success: function (result) {
	              	var json = eval(result);
	              	obj.append( $("<option></option>"));
	              	for(var i=0;i<json.length;i++){
	              		var optionSerial = $("<option></option>").val(json[i].value).html(json[i].text);
	              		obj.append(optionSerial);	
	              	}
	              }
	           });
       } */
});  

</script>
</html>
