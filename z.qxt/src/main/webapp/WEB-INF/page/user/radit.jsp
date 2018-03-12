<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<base href="${contextPath }/" />
 <script type="text/javascript" src="resources/js/jquery-3.1.0.min.js"></script>
<html>
<head>
<title>菜单列表</title>
<script>
	/* $(document).ready(function() {
		window.location.href="${contextPath }/login";
	}); */
</script>
<link rel="stylesheet" href="resources/plugs/bootstrap-table.css">
</head>
<body>
		<div class="page-content">
				<div class="page-content-area">
						<div class="page-header">
							<h1>
								管理员
								<small>
									<i class="ace-icon fa fa-angle-double-right"></i>
									overview &amp; stats
								</small>
							</h1>
						</div><!-- /.page-header -->
						<div class="row">
							<div id="toolbar" class="btn-group">
								 <button id="btn_add" type="button" class="btn btn-default">
								 <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
								 </button>
								 <button id="btn_edit" type="button" class="btn btn-default">
								 <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
								 </button>
								 <button id="btn_delete" type="button" class="btn btn-default">
								 <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
								 </button>
							</div>
							<table id="table" >
							</table>
						</div>
				</div>
		</div>
</body>
<script src="resources/plugs/bootstrap-table.js"></script>
<script src="resources/plugs/bootstrap-table-zh-CN.js"></script>
<script type="text/javascript">
	$('#table').bootstrapTable({
	toolbar: '#toolbar',
	striped: true,
	pagination: true,
    columns: [{
        field: 'id',
        title: 'Item ID'
    }, {
        field: 'name',
        title: 'Item Name'
    }, {
        field: 'price',
        title: 'Item Price'
    }],
    data: [{
        id: 1,
        name: 'Item 1',
        price: '$1'
    }, {
        id: 2,
        name: 'Item 2',
        price: '$2'
    }]
});
</script>
</html>
