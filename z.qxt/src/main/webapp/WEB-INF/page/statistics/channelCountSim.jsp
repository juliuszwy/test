<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<base href="${contextPath }/" />
<html>
<head>
<title>订单详情</title>
<link rel="stylesheet" href="resources/plugs/bootstrap-select.css" />
<script src="resources/plugs/bootstrap-select.js"></script>
<script>
</script>
</head>
<body>
	<div class="page-content">
			<div class="page-content-area">
					<div class="row">
					    <div class="col-xs-12">
							<div id="toolbar" class="btn-group">
				                <div class="input-group date  col-md-5"  style="margin-top:0px positon:relative">
				                	<span class="input-group-addon" style="width: 120px">渠道ID：</span> 
						            <input type="text" class="form-control" id="qudaoIdSearch" placeholder="请输入字段名"/> 
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
 //得到查询的参数
function getParams(params) {
  var temp = {
  		limit:params.limit,
		offset: params.offset,
		filter_EQS_qudaoId:$("#qudaoIdSearch").val(),
		filter_EQS_agentId:"${param['agentId']}",
		filter_EQD_date:"${param['date']}",
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
    url: "channelCount/list?json", 
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
                    title: '渠道ID',
                    field: 'qudaoId',
                    align: 'center',
                   	halign:'center',
                   	footerFormatter: function(){
                  		return "总计";
                  	}
                },
                {
                    title: '扫码数',
                    field: 'scanNum',
                    align: 'center',
                   	halign:'center',
                   	footerFormatter: function(value){
                 		 var count = 0;
				        for (var i in value) {
				            count += value[i].scanNum;
				        }
				        return count;
                 	}
                },
                {
                    title: '激活数(扫码)',
                    field: 'scanActivateNum',
                    align: 'center',
                   	halign:'center',
                   	footerFormatter: function(value){
                 		 var count = 0;
				        for (var i in value) {
				            count += value[i].scanActivateNum;
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
                    title: '推广成功总用户',
                    field: 'activatedNum',
                    align: 'center',
                   	halign:'center',
                  	footerFormatter: function(value){
                		 var count = 0;
				        for (var i in value) {
				            count += value[i].activatedNum;
				        }
				        return count;
	                 }
                },
                {
                    title: '流水',
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
                    title: '时间',
                    field: 'dateStr',
                    align: 'center',
                   	halign:'center'
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
