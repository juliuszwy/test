<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<base href="${contextPath }/" />
<html>
<head>
<title>日志转化</title>
<link rel="stylesheet" href="resources/plugs/bootstrap-datetimepicker.min.css"/>
<link rel="stylesheet" href="resources/plugs/bootstrap-select.css" />
<script src="resources/plugs/bootstrap-select.js" ></script>
<script type="text/javascript" src="resources/plugs/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="resources/plugs/bootstrap-datetimepicker.zh-CN.js"></script>
<script>
</script>
<style type="text/css">
td{
	max-width: none;
}
</style>
</head>

<body>
	<div class="page-content">
				<div class="page-content-area">
						<div class="row">
						    <div class="col-xs-12">
					               
									<div class="input-group date  col-md-11"  style="margin-top:0px positon:relative">
					                	<span class="input-group-addon" style="width: 120px">开始时间：</span> 
					                    <input class="form-control form_datetime_start" size="16" type="text" value=""  id="start">
					                    <span class="input-group-addon"  style="width: 120px">结束时间：</span> 
					                    <input class="form-control form_datetime_end" id ="end"size="16" type="text" value="" >
					                    <span class="input-group-btn" >  
									         <button class="btn btn-info btn-search" id="search">查找</button>  
									    </span>  
					                </div>
					                
								<table id="table">
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
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
        showMeridian: 1,
         minView:2,
        format: 'yyyy-mm-dd'
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
         minView:2,
        format: 'yyyy-mm-dd'
    });
    
function getParams(params) {
  var temp = {
  		limit:params.limit,
		offset: params.offset,
		filter_GED_createDate:$("#start").val(),
		filter_LTD_createDate:$("#end").val()
  };
  return temp;
 };
$.extend($.fn.bootstrapTable.defaults, $.fn.bootstrapTable.locales['zh-CN']);
var $table = $('#table');
    $table.bootstrapTable({
    url: "countLog/list?json", 
    dataType: "json",
    queryParams:getParams,
     showFooter:true,
    pagination: true, //分页
    sidePagination: "server", //服务端处理分页
    toolbar:"#toolbar",
    columns: [
    			{
                  title: '时间',
                  field: 'createDate',
                  align: 'left',
                  formatter:function(value,row,index){  
	                    return new Date(value).Format("yyyy-MM-dd");  
              		} 
              		,
                   	footerFormatter: function(value){
                 		 return "总计";
                 	}
                }, 
                {
                  title: '总请求数',
                  field: 'requestCount',
                  align: 'center',
                  footerFormatter: function(value){
                 		 var count = 0;
				        for (var i in value) {
				            count += value[i].requestCount;
				        }
				        return count;
                 	}
                }, 
                {
                    title: '成功数',
                    field: 'requestSucCount',
                    align: 'center',
                   	footerFormatter: function(value){
                 		 var count = 0;
				        for (var i in value) {
				            count += value[i].requestSucCount;
				        }
				        return count;
                 	}
                },
                {
                    title: '成功率',
                    field: 'requestSucCount',
                    align: 'center',
                    formatter:function(value,row,index){  
	                    return (value/row.requestCount).toFixed(2)*100+"%";
              		},
                   	footerFormatter: function(value){
                 		 var count = 0;
                 		 var count1 = 0;
				        for (var i in value) {
				            count += value[i].requestSucCount;
				              count1 += value[i].requestCount;
				        }
				        return (count/count1).toFixed(2)*100+"%";
                 	}
                }
    	 ]
});

$(document).ready(function () {          
    $("#search").bind("click", function(){
    		$table.bootstrapTable('refresh');  
    });
});
</script>
</html>
