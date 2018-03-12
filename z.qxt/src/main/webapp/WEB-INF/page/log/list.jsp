<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<base href="${contextPath }/" />
<html>
<head>
<title>请求日志</title>
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
					                <div class="input-group col-md-10" >
								        <span class="input-group-addon" style="width: 120px">IMSI：</span> 
							            <input type="text" class="form-control" id="imsiSearch" placeholder="请输入字段名"/> 
							            <span class="input-group-addon" style="width: 120px">流水号：</span> 
						           		<input type="text" class="form-control" id="cpmidSearch" placeholder="请输入字段名"/> 
										<c:if test="${admin.property==0 }">
											<span class="input-group-addon" style="width: 120px">用户：</span> 
							           		<select id="tokenSerach" class="form-control">
								            </select>
							            </c:if>
									</div>
									<div class="input-group date  col-md-11"  style="margin-top:0px positon:relative">
					                	<span class="input-group-addon" style="width: 120px">开始时间：</span> 
					                    <input class="form-control form_datetime_start" size="16" type="text" value=""  id="start">
					                    <span class="input-group-addon"  style="width: 120px">结束时间：</span> 
					                    <input class="form-control form_datetime_end" id ="end"size="16" type="text" value="" >
					                    <span class="input-group-addon"  style="width: 120px">状态：</span> 
							            <select id="statusSerach" class="form-control">
							            	<option value="">全部</option>
							                <option value="0">成功</option>
							            </select>
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
    
function getParams(params) {
  var temp = {
  		limit:params.limit,
		offset: params.offset,
		filter_EQS_imsi:$("#imsiSearch").val(),
		filter_EQS_cpmid:$("#cpmidSearch").val(),
		filter_EQI_status:$("#statusSerach").val(),
		filter_GED_createDate:$("#start").val(),
		filter_LTD_createDate:$("#end").val(),
		filter_EQS_token:$("#tokenSerach").val()
  };
  return temp;
 };
$.extend($.fn.bootstrapTable.defaults, $.fn.bootstrapTable.locales['zh-CN']);
var $table = $('#table');
function initTable(){
    $table.bootstrapTable({
    url: "log/list?json", 
    dataType: "json",
    queryParams:getParams,
    pagination: true, //分页
    sidePagination: "server", //服务端处理分页
    toolbar:"#toolbar",
    columns: [
    			{
                  title: '时间',
                  field: 'createDate',
                  align: 'left',
                  formatter:function(value,row,index){  
	                    return new Date(value).Format("yyyy-MM-dd hh:mm:ss");  
              		} 
                }, 
                {
                  title: 'IMSI',
                  field: 'imsi',
                  align: 'left',
                }, 
                {
                    title: 'IMEI',
                    field: 'imei',
                    align: 'left',
                   	halign:'center',
                },
                {
                    title: '流水号',
                    field: 'cpmid',
                    align: 'left',
                   	halign:'center',
                }, 
                {
                    title: '手机号',
                    field: 'phone',
                    align: 'center',
                   	halign:'center',
                }, 
                {
                    title: '状态',
                    field: 'status',
                    align: 'center',
                    formatter:function(value,row,index){  
                    	var e ;
                        if(value==0)
	                       e = '<span >成功</span>'; 
	                    else
	                       e = '<span style="color:red">失败：'+value+'</span>'; 
	                    return e;  
              		} 
               }
    	 ]
});
}
function edit(id){
	var url = "user/"+id+"/edit";
	showModal(url);
	return false;
}
function add(){
	var url = "user/add";
	showModal(url);
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
   var date = new Date();
	$("#start").val(new Date(date.getTime()).Format("yyyy-MM-dd 00:00:00"));
	if(${admin.property==0}){
		InitResourceNameSelect();
	} 
	  
	  initTable();
      $("#search").bind("click", function(){
      		$table.bootstrapTable('refresh');  
      });
      });
</script>
</html>
