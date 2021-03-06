<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../../common/taglibs.jsp" %>
<base href="${contextPath }/" />
<html>
<head>
<title>排名送卡片活动</title>
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
										        <span class="input-group-addon">主题：</span> 
									            <input type="text" class="form-control" id="themeSerach" placeholder="请输入字段名"/>  
									            <span class="input-group-btn">  
									               <button class="btn btn-info btn-search" id="search">查找</button>  
									               <button class="btn btn-info btn-search" style="margin-left:3px" onclick="add()">添加</button>  
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
		filter_LIKES_theme:$("#themeSerach").val()
  };
  return temp;
 };
$.extend($.fn.bootstrapTable.defaults, $.fn.bootstrapTable.locales['zh-CN']);
var $table = $('#table');
function initTable() {  
   // $table.bootstrapTable('destroy');  
    $table.bootstrapTable({
    url: "activity/ranking/list?json", 
    dataType: "json",
    queryParams:getParams,
    pagination: true, //分页
    pageSize: 15,      //每页的记录行数（*）
    pageList: [15, 25, 50, 100], 
    sidePagination: "server", //服务端处理分页
    toolbar:"#toolbar",
    columns: [
   				 {
                  title: '宣传图',
                  field: 'id',
                  align: 'center',
                  formatter:function(value,row,index){ 
	                    return "<img src=\""+row.imgUrl+"\" style=\"height: 20px;width: 20px\" />"
              		} 
                },
     			{
                  title: '创建时间',
                  field: 'createDate',
                  align: 'left',
                  formatter:function(value,row,index){  
                    	var value ;
                        if(value==""||value==null)
	                       return  '不限时'; 
	                    return new Date(value).Format("yyyy-MM-dd hh:mm:ss");  
              		} 
                },
                {
                  title: '主题',
                  field: 'theme',
                  align: 'left',
                }, 
                {
                  title: '排名类型',
                  field: 'rankType',
                  align: 'center',
                  formatter:function(value,row,index){  
                   		var value ;
                        if(value==0)
                         	return '充值排名'; 
                        else if(value==1)
                        	return '消费排名';
              		} 
                }, 
                {
                  title: '名额',
                  field: 'numberPeople',
                  align: 'center',
                 },
                {
                  title: '送卡片数',
                  field: 'sendCardCount',
                  align: 'center',
                }, 
                {
                  title: '奖励有效领取时间（天）',
                  field: 'awardVoidTime',
                  align: 'center',
                }, 
                {
                  title: '奖励通告描述',
                  field: 'awardDescription',
                  align: 'left',
                }, 
               {
                    title: '活动开始时间',
                    field: 'startDate',
                    align: 'center',
                   	halign:'center',
                  	formatter:function(value,row,index){  
                   		var value ;
                        if(value==""||value==null)
                         return '不限时'; 
                    	return new Date(value).Format("yyyy-MM-dd hh:mm:ss");  
              		} 
                }, 
                {
                    title: '活动结束时间(天)',
                    field: 'endDate',
                    align: 'center',
                   	halign:'center',
                   	formatter:function(value,row,index){  
                    	var value ;
                        if(value==""||value==null)
	                       return  '不限时'; 
	                    return new Date(value).Format("yyyy-MM-dd hh:mm:ss");  
              		} 
                },
                {
                    title: '宣传图URL',
                    field: 'imgUrl',
                    align: 'center',
                   	halign:'center'
                }
    	 ]
});
}

function add(){
	var url = "activity/ranking/input";
	showModal(url);
}
$(document).ready(function () {          
      initTable();  
      $("#search").bind("click", function(){
      		$table.bootstrapTable('refresh');  
      });  
});  
</script>
</html>
