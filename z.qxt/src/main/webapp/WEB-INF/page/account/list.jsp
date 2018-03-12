<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<base href="${contextPath }/" />
<html>
<head>
<title>用户列表</title>
<script>
</script>
</head>

<body>
	<div class="page-content">
				<div class="page-content-area">
						<div class="row">
						    <div class="col-xs-12">
								<div id="toolbar" class="btn-group">
									<div class="input-group col-md-5" style="margin-top:0px positon:relative">
										        <span class="input-group-addon">用户ID：</span> 
									            <input type="text" class="form-control" id="userIdSearch" placeholder="请输入字段名"/>  
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
function getParams(params) {
  var temp = {
  		limit:params.limit,
		offset: params.offset,
		filter_EQI_agentId:"${param['agentId']}",
		filter_EQS_userId:$("#userIdSearch").val()
  };
  return temp;
 };
$.extend($.fn.bootstrapTable.defaults, $.fn.bootstrapTable.locales['zh-CN']);
var $table = $('#table');
    $table.bootstrapTable({
    url: "account/list?json", 
    dataType: "json",
    queryParams:getParams,
    pagination: true, //分页
    sidePagination: "server", //服务端处理分页
    toolbar:"#toolbar",
    columns: [
                {
                  title: '用户ID',
                  field: 'userId',
                  align: 'center',
                }, 
                {
                    title: '微信ID',
                    field: 'weixinId',
                    align: 'center',
                   	halign:'center',
                },
                {
                    title: '所属渠道',
                    field: 'qudaoId',
                    align: 'center',
                   	halign:'center',
                   	formatter:function(value,row,index){  
                    	var e ;
                        if(value==0)
	                       e = '自推'; 
	                    else
	                       e = value; 
	                    return e;  
              		} 
                },
                {
                    title: '有效(是／否)',
                    field: 'active',
                    align: 'center',
                   	halign:'center',
                   	formatter:function(value,row,index){  
                    	var e ;
                        if(value==0)
	                       e = '是'; 
	                    else
	                       e = '否'; 
	                    return e;  
              		} 
                },
                {
                    title: '创建时间',
                    field: 'createDateStr',
                    align: 'center',
                   	halign:'center',
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
