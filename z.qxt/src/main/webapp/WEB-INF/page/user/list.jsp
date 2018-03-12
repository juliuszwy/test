<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<base href="${contextPath }/" />
<html>
<head>
<title>管理员</title>
<script>
</script>
</head>

<body>
	<jsp:include page="../common/pageFromCommon.jsp"></jsp:include>
</body>
<script type="text/javascript">
function getParams(params) {
  var temp = {
  		filter_EQI_property:0,
  		limit:params.limit,
		offset: params.offset,
		filter_EQS_loginName:$("#loginSearch").val()
  };
  return temp;
};
$.extend($.fn.bootstrapTable.defaults, $.fn.bootstrapTable.locales['zh-CN']);
var $table = $('#table');
    $table.bootstrapTable({
    url: "user/list?json", 
    dataType: "json",
    queryParams:getParams,
    pagination: true, //分页
    sidePagination: "server", //服务端处理分页
    toolbar:"#toolbar",
    columns: [
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
                    title: '短信业务状态',
                    field: 'smsStatus',
                    align: 'center',
                    formatter:function(value,row,index){  
                    	var e ;
                    	alert(value)
                        if(value==0)
	                       e = '<span >开通</span>'; 
	                    else
	                       e = '<span style="color:red">暂停</span>'; 
	                    return e;  
              		} 
                },
                 {
                    title: 'API业务状态',
                    field: 'apiStatus',
                    align: 'center',
                    formatter:function(value,row,index){  
                    	var e ;
                        if(value==0)
	                       e = '<span >开通</span>'; 
	                    else
	                       e = '<span style="color:red">暂停</span>'; 
	                    return e;  
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
                    title: '操作',
                    field: 'id',
                    align: 'center',
                    formatter:function(value,row,index){  
	                   var e = '<a href="#"  onclick="return edit(\''+ row.id + '\')">编辑</a> ';  
	                   
	                   return e;  
              		} 
         		}
    	 ]
});
function edit(id){
	var url = "user/"+id+"/edit";
	showModal(url);
	return false;
}
function add(){
	var url = "user/add";
	showModal(url);
}
</script>
</html>
