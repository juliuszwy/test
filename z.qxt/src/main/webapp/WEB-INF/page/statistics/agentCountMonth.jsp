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
							<div id="toolbar" class="btn-group">
				                <div class="input-group date  col-md-11"  style="margin-top:0px positon:relative">
				                	<span class="input-group-addon" style="width: 120px">开始时间：</span> 
				                    <input class="form-control form_datetime_start" size="16" type="text" value=""  id="start">
				                    <span class="input-group-addon" style="width: 120px">结束时间：</span> 
				                    <input class="form-control form_datetime_end" id ="end"size="16" type="text" value="" >
									<span class="input-group-btn">  
						               <button class="btn btn-info btn-search" id="search">查找</button>  
						            </span>  
				                </div>
							</div>
							<table id="table" >
							</table>
						</div>
					</div>
				</div>
		</div>
</body>
<script type="text/javascript">
$('.form_datetime_start').datetimepicker({	
	        language:  'zh-CN',
	        weekStart: 1,  
	        autoclose: true,  
	        startView: 3,  
	        minView: 3,  
	        forceParse: false,  
	        format: 'yyyy-mm'
	});
    $('.form_datetime_end').datetimepicker({	
         language:  'zh-CN',
        weekStart: 1,
		autoclose: 1,
		startView: 3,
		forceParse: 0,
        showMeridian: 1,
         minView: 3,  
        format: 'yyyy-mm'
    });
 //得到查询的参数
function getParams(params) {
	var start,end ="";
	if($("#start").val()!=""){
		start = $("#start").val()+"-01";
	}
	if($("#end").val()!=""){
		end = $("#end").val()+"-01";
	}
  var temp = {
  		limit:params.limit,
		offset: params.offset,
		filter_EQS_agentId:"${param['agentId']}",
		/* agentId:$("#agentIdSearch").val(), */
		
		filter_GED_date:start,
		filter_LTD_date:end,
		filter_EQI_dataType:1,
		order: params.order,//排序
        sort:params.sort//排序字段
  };
  return temp;
};
$.extend($.fn.bootstrapTable.defaults, $.fn.bootstrapTable.locales['zh-CN']);
var $table = $('#table');
function initTable() {  
   // $table.bootstrapTable('destroy');  
    $table.bootstrapTable({
    url: "agentCount/list?json", 
    dataType: "json",
    queryParams:getParams,
      showFooter:true,
    pagination: true, //分页
    pageSize: 15,      //每页的记录行数（*）
    pageList: [15, 25, 50, 100], 
    sidePagination: "server", //服务端处理分页
    toolbar:"#toolbar",
    columns: [
     			{
                    title: '时间',
                    field: 'date',
                    align: 'center',
                   	halign:'center',
                   	formatter:function(value,row,index){ 
	                    return new Date(value).Format("yyyy-MM");  
              		} ,
                   	footerFormatter: function(value){
                 		 return "总计";
                 	}
                },
                {
                    title: '代理商Id',
                    field: 'agentId',
                    align: 'center',
                   	halign:'center',
                   	
                },
                {
                    title: '新增',
                    field: 'newUser',
                    align: 'center',
                   	halign:'center',
                   footerFormatter: function(value){
                 		 var count = 0;
				        for (var i in value) {
				            count += value[i].newUser;
				        }
				        return count;
                 	}
                },
                {
                    title: '直属用户充值流水',
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
                    title: '转扣金额',
                    field: 'turnPrice',
                    align: 'center',
                   	halign:'center',
                   		footerFormatter: function(value){
                 		 var count = 0;
				        for (var i in value) {
				            count += value[i].turnPrice;
				        }
				        return count;
                 	}
                },
                /* {
                    title: '活跃数(扫码)',
                    field: 'scanActiveNum',
                    align: 'center',
                   	halign:'center',
                   	sortable : true
                }, */
                {
                    title: '充值卡片数',
                    field: 'addCardCount',
                    align: 'center',
                   	halign:'center',
                   	footerFormatter: function(value){
                 		 var count = 0;
				        for (var i in value) {
				            count += value[i].addCardCount;
				        }
				        return count;
                 	}
                }
               
    	 ]
});
}
$(document).ready(function () {          
      initTable();  
      $("#search").bind("click", function(){
      		$table.bootstrapTable('refresh');  
      });  
     
});  


</script>
</html>
