<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../../../common/taglibs.jsp" %>
<base href="${contextPath }/" />
<html>
<head>
<title>管理员</title>
<script>
</script>
</head>

<body>
<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
				&times;
			</button>
			<h4 class="modal-title" id="myModalLabel">
				代码
			</h4>
		</div>
		<div class="modal-body" >
			<div class="row">
		    <div class="col-xs-12">
				<div id="toolbar3" class="btn-group">
					<div class="input-group col-md-5" style="margin-top:0px positon:relative">
						        <span class="input-group-addon">代码：</span> 
					            <input type="text" class="form-control" id="codeSearch" placeholder="请输入字段名"/>  
					            <span class="input-group-btn">  
					               <button class="btn btn-info btn-search" id="search3">查找</button>  
					            </span>  
					 </div> 
				</div>
				<table id="table3" >
				</table>
			</div>
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
		filter_EQS_code:$("#codeSearch").val(),
		'filter_EQS_moreCodeActivity.id':'${param["activityId"]}'
  };
  return temp;
 };
$.extend($.fn.bootstrapTable.defaults, $.fn.bootstrapTable.locales['zh-CN']);
var $table = $('#table3');
function initTable() {  
   // $table.bootstrapTable('destroy');  
    $table.bootstrapTable({
    url: "agent/mCode/input?json", 
    dataType: "json",
    queryParams:getParams,
    pagination: true, //分页
    pageSize: 10,      //每页的记录行数（*）
    pageList: [10, 25, 50, 100], 
    sidePagination: "server", //服务端处理分页
    toolbar:"#toolbar3",
    columns: [
                {
                  title: '代码',
                  field: 'code',
                  align: 'center',
                },
                {
                    title: '使用用户',
                    field: 'userId',
                    align: 'center',
                   	halign:'center',
                   	formatter:function(value,row,index){  
                    	var e  = value;
                        if(value==0)
	                       e = '未使用'; 
	                    return e;  
              		} 
                },
                {
                    title: '使用时间',
                    field: 'useDateStr',
                    align: 'center',
                   	halign:'center',
                }
                
    	 ]
});
}
$(document).ready(function () {          
      initTable();  
      $("#search3").bind("click", function(){
      		$table.bootstrapTable('refresh');  
      });  
      
});  
</script>
</html>
