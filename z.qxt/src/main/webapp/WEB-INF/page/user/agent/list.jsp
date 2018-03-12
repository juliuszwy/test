<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../../common/taglibs.jsp" %>
<base href="${contextPath }/" />
<html>
<head>
<title>管理员</title>
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
										        <span class="input-group-addon">名称：</span> 
									            <input type="text" class="form-control" id="loginSearch" placeholder="请输入字段名"/>  
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
  		filter_EQI_property:1,
  		limit:params.limit,
		offset: params.offset,
		filter_LIKES_name:$("#loginSearch").val()
  };
  return temp;
 };
$.extend($.fn.bootstrapTable.defaults, $.fn.bootstrapTable.locales['zh-CN']);
var $table = $('#table');
function initTable() {  
   // $table.bootstrapTable('destroy');  
    $table.bootstrapTable({
    url: "agent/list?json", 
    dataType: "json",
    queryParams:getParams,
    pagination: true, //分页
    pageSize: 15,      //每页的记录行数（*）
    pageList: [15, 25, 50, 100], 
    sidePagination: "server", //服务端处理分页
    toolbar:"#toolbar",
    columns: [
     			{
                  title: '创建时间',
                  field: 'createDateStr',
                  align: 'left'
                },
                {
                  title: '名称',
                  field: 'name',
                  align: 'center',
                }, 
                
                {
                    title: '登陆名',
                    field: 'loginName',
                    align: 'center',
                   	halign:'center',
                },
                {
                    title: 'ID',
                    field: 'agentId',
                    align: 'center',
                   	halign:'center',
                },
                {
                    title: '角色组',
                    field: 'groupNames',
                    align: 'center',
                   	halign:'center',
                }, 
                {
                    title: '游戏ID',
                    field: 'gameId',
                    align: 'center',
                   	halign:'center',
                },
                {
                    title: '邮箱',
                    field: 'email',
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
                    title: '账户卡片',
                    field: 'cardCount',
                    align: 'center',
                   	halign:'center',
                },
                {
                    title: '结算比例',
                    field: 'balanceScale',
                    align: 'center',
                   	halign:'center',
                },
                {
                    title: '推荐代理<br/>提成周期(月)',
                    field: 'recommendMonth',
                    align: 'center',
                   	halign:'center',
                },
                {
                    title: '推荐代理<br/>流水回扣',
                    field: 'recommendScale',
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
	                       e = '<span >启用</span>'; 
	                    else
	                       e = '<span style="color:red">禁止</span>'; 
	                    return e;  
              		} 
                },
                {
                    title: '操作',
                    field: 'id',
                    align: 'center',
                    formatter:function(value,row,index){  
	                   var a = '<a href="#"  onclick="return edit(\''+ row.id + '\')">编辑</a> ';  
	               /*     var b = '<a href="#"  onclick="return qudao(\''+ row.id + '\')">渠道</a> ';   */
	                   var c = '<a href="#"  onclick="return nextAgent(\''+ row.id + '\',\''+ row.name + '\')">推荐代理</a> ';  
	                   var d = '<a href="#"  onclick="return avtivityCode(\''+ row.agentId + '\',\''+ row.name + '\')">活动码</a> ';  
	                   return a+c+d;  
              		} 
         		}
    	 ]
});
}
function edit(id){
	var url = "agent/"+id+"/edit";
	showModal(url);
	return false;
}

function avtivityCode(id,name){
	var url = "/agent/activity/code/history?agentId="+id;
	insideSkip(1, "活动码-"+name, url)
	return false;
}

function nextAgent(id,name){
	var url = "/agent/next/list?floor=2&filter_EQS_parent="+id
	insideSkip(1, "推荐代理-"+name, url)
	return false;
}

function qudao(id){
	var url = "agent/"+id+"/edit";
	showModal(url);
	return false;
}
function add(){
	var url = "agent/add";
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
