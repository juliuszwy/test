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
</head>

<body>
	<div class="page-content">
				<div class="page-content-area">
						<div class="row">
						    <div class="col-xs-12">
					               
									<div class="input-group date  col-md-11"  style="margin-top:0px positon:relative">
										<span class="input-group-addon" style="width: 120px">用户：</span> 
						           		<select id="tokenSerach" class="form-control">
							            </select>
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
		filter_EQS_token:$("#tokenSerach").val(),
		filter_GED_createDate:$("#start").val(),
		filter_LTD_createDate:$("#end").val()
  };
  return temp;
 };
$.extend($.fn.bootstrapTable.defaults, $.fn.bootstrapTable.locales['zh-CN']);
var $table = $('#table');
function initTable(){
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
                  title: 'Token',
                  field: 'token',
                  align: 'center',
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
                   	halign:'center',
                   	footerFormatter: function(value){
                 		 var count = 0;
				        for (var i in value) {
				            count += value[i].requestSucCount;
				        }
				        return count;
                 	}
                },
                {
                    title: '直接下发数',
                    field: 'oneHandCount',
                    align: 'center',
                   	halign:'center',
                   		footerFormatter: function(value){
                 		 var count = 0;
				        for (var i in value) {
				            count += value[i].oneHandCount;
				        }
				        return count;
                 	}
                },
                  {
                    title: '上游下发数',
                    field: 'id',
                    align: 'center',
                   	halign:'center',
                   	formatter:function(value,row,index){  
	                    return row.requestSucCount-row.oneHandCount
              		},
                  	footerFormatter: function(value){
                		 var count = 0;
			       		 for (var i in value) {
			        	    count += (value[i].requestSucCount-value[i].oneHandCount);
			       		 }
			        	return count;
                 	}
                },
                {
                    title: '请求上游失败数',
                    field: 'twoHandErrCount',
                    align: 'center',
                   	halign:'center',
                   		footerFormatter: function(value){
                 		 var count = 0;
				        for (var i in value) {
				            count += value[i].twoHandErrCount;
				        }
				        return count;
                 	}
                }
    	 ]
});
}
function InitResourceNameSelect() {
	 var selectObjName = $("#tokenSerach");
            $.ajax({
              url: "user/token_name",
              type: "get",
              dataType: "json",
              success: function (result) {
	              	var json = eval(result);
	              	selectObjName.append( $("<option></option>"));
	              	for(var i=0;i<json.length;i++){
	              		var optionName = $("<option></option>").val(json[i].id).html(json[i].name);
	              		selectObjName.append(optionName);
	              	}
	              
	          }
         });
};
$(document).ready(function () {
	  InitResourceNameSelect();  
	  	initTable();        
      $("#search").bind("click", function(){
      		$table.bootstrapTable('refresh');  
      });
      });
</script>
</html>
