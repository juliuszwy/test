<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<base href="${contextPath }/" />
<html>
<head>
<title>渠道</title>
<script>
</script>
</head>

<body>
	<jsp:include page="../common/pageFromCommon.jsp"></jsp:include>
</body>
<script type="text/javascript">
function getParams(params) {
  var temp = {
  		limit:params.limit,
		offset: params.offset,
		filter_LIKES_name:$("#loginSearch").val()
  };
  return temp;
 };
$.extend($.fn.bootstrapTable.defaults, $.fn.bootstrapTable.locales['zh-CN']);
var $table = $('#table');
    $table.bootstrapTable({
    url: "channel/list?json", 
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
                    title: '手机号',
                    field: 'tel',
                    align: 'center',
                   	halign:'center',
                },
                {
                    title: '渠道编号',
                    field: 'channelId',
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
	                   var e = '<a href="#"  onclick="return edit(\''+ row.id + '\')">编辑</a> ';  
	                   var a = '<a href="channel/code?qudaoId='+row.channelId+'">二维码</a> ';  
	                   return e+a;  
              		} 
         		}
    	 ]
});
function edit(id){
	var url = "channel/"+id+"/edit";
	showModal(url);
	return false;
}
function add(){
	var url = "channel/add";
	showModal(url);
}
</script>
</html>
