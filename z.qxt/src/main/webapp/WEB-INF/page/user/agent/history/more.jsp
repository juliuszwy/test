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
		<div class="row">
		    <div class="col-xs-12">
				<div id="toolbar2" class="btn-group">
					<div class="input-group col-md-5" style="margin-top:0px positon:relative">
						        <span class="input-group-addon">主题：</span> 
					            <input type="text" class="form-control" id="themeSearch2" placeholder="请输入字段名"/>  
					            <span class="input-group-btn">  
					               <button class="btn btn-info btn-search" id="search2">查找</button>  
					            </span>  
					 </div> 
				</div>
				<table id="table2" >
				</table>
			</div>
		</div>
</body>
<script type="text/javascript">
 //得到查询的参数
function getParams(params) {
  var temp = {
  		limit:params.limit,
		offset: params.offset,
		filter_LIKES_theme:$("#themeSearch2").val()
  };
  return temp;
 };
$.extend($.fn.bootstrapTable.defaults, $.fn.bootstrapTable.locales['zh-CN']);
var $table2 = $('#table2');
function initTable() {  
   // $table.bootstrapTable('destroy');  
    $table2.bootstrapTable({
    url: "agent/mCode/list?json", 
    dataType: "json",
    queryParams:getParams,
    pagination: true, //分页
    pageSize: 15,      //每页的记录行数（*）
    pageList: [15, 25, 50, 100], 
    sidePagination: "server", //服务端处理分页
    toolbar:"#toolbar2",
    columns: [
                {
                  title: '主题',
                  field: 'theme',
                  align: 'center',
                },
                {
                    title: '适用范围',
                    field: 'cardType',
                    align: 'center',
                   	halign:'center',
                   	formatter:function(value,row,index){  
                    	var e ;
                        if(value==0)
	                       e = '新用户'; 
	                    else
	                       e = '老用户'; 
	                    return e;  
              		} 
                },
                {
                    title: '所属渠道',
                    field: 'qudaoId',
                    align: 'center',
                   	halign:'center',
                   	formatter:function(value,row,index){  
                    	var e ;
                        if(value==0)
	                       e = '平台'; 
	                    else
	                       e = value; 
	                    return e;  
              		} 
                },
                {
                    title: '代码总数',
                    field: 'maxUsage',
                    align: 'center',
                   	halign:'center',
                }, 
                {
                    title: '使用数',
                    field: 'usageCount',
                    align: 'center',
                   	halign:'center',
                },
                {
                    title: '使用获得卡片数',
                    field: 'cardCount',
                    align: 'center',
                   	halign:'center',
                }, 
                {
                    title: '活动开始时间',
                    field: 'startDateStr',
                    align: 'center',
                   	halign:'center',
                }, 
                {
                    title: '活动结束时间',
                    field: 'endDateStr',
                    align: 'center',
                   	halign:'center',
                   	formatter:function(value,row,index){  
                        if(value=='')
	                       value = '不限时'; 
	                    return value;  
              		} 
                },
                {
                    title: '状态',
                    field: 'status',
                    align: 'center',
                    formatter:function(value,row,index){  
                    	var e ;
                        if(value==0)
	                       e = '<span >启用</span>'; 
	                    else
	                       e = '<span style="color:red">禁止</span>'; 
	                    return e;  
              		} 
                },
                {
                    title: '创建时间',
                    field: 'createDateStr',
                    align: 'center',
                   	halign:'center'
                },
                {
                    title: '操作',
                    field: 'id',
                    align: 'center',
                    formatter:function(value,row,index){  
	                   var e = '<a href="#"  onclick="return queryCodes(\''+ row.id + '\')">查询代码</a> ';  
	                   return e;  
              		} 
         		}
    	 ]
});
}
function queryCodes(id){
	var url = "agent/mCode/input?activityId="+id;
	showModal(url);
	return false;
}
$(document).ready(function () {          
      initTable();  
      $("#search2").bind("click", function(){
      		$table2.bootstrapTable('refresh');  
      });  
      
});  
</script>
</html>
