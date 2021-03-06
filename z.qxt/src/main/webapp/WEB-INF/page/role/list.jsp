<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<base href="${contextPath }/" />
<html>
<head>
<title>菜单列表</title>
<script>
</script>
</head>

<body>
	<jsp:include page="../common/pageFromCommon.jsp"></jsp:include>
</body>
<script type="text/javascript">
$.extend($.fn.bootstrapTable.defaults, $.fn.bootstrapTable.locales['zh-CN']);
var $table = $('#table');
    $table.bootstrapTable({
    url: "role/list?json", 
    dataType: "json",
    pagination: true, //分页
    sidePagination: "server", //服务端处理分页
    toolbar:"#toolbar",
    columns: [
                {
                  title: '角色名称',
                  field: 'name',
                  align: 'center',
                }, 
                {
                    title: '拥有权限',
                    field: 'authNames',
                    align: 'left',
                   	halign:'center',
                    formatter:function(value,row,index){  
	                  var length = value.length;
	                  var valuexs = value;
	                   if(length>20){
	                   		valuexs = value.substring(0,20)+".........";
	                   }
	                   return "<div data-toggle=\"tooltip\" data-placement=\"right\" title=\""+value+"\">"+valuexs+"</div>";  
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
	                   var d = '<a href="#" mce_href="#" onclick="del(\''+ row.id +'\')">删除</a> ';  
	                   return e+d;  
              		} 
         		}
    	 ]
});
function edit(id){
	var url = "role/"+id+"/edit";
	showModal(url);
	return false;
}
function add(){
	var url = "role/add";
	showModal(url);
}
</script>
</html>
