<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE HTML>
<html>
	<head>
		<base href="${contextPath }/" />
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="">
        <meta name="keywords" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <title></title>  
        
        <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.1/css/font-awesome.min.css">
		<link rel="shortcut icon" type="image/x-icon" href="resources/images/favicon.ico" />
		<link rel="stylesheet" href="resources/plugs/bootstrap-table.css">
		<link rel="stylesheet" href="resources/plugs/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="resources/plugs/bootstarpValidator/bootstrapValidator.css">
		
        <link rel="stylesheet" href="resources/plugs/ace/assets/css/font-awesome.min.css" />
        <link rel="stylesheet" href="resources/plugs/ace/assets/css/ace.min.css" />
        
		<link rel="stylesheet" href="resources/plugs/ace/assets/css/ace-rtl.min.css" />
		<link rel="stylesheet" href="resources/plugs/ace/assets/css/ace-skins.min.css" />
		<link rel="stylesheet" href="resources/css/jquery.mloading.css" />
		
		<style type="text/css">
        	.modal-dialog { 
			    position: absolute; 
			    top: 0; 
			    bottom: 0; 
			    left: 0; 
			    right: 0; 
			} 
			@media (min-width: 768px){.modal-dialog {
					max-width:900px;
					max-height: 700px;
				}
			}
			.modal-content { 
			    /*overflow-y: scroll; */ 
			    position: absolute; 
			    top: 0; 
			    bottom: 0; 
			    width: 100%; 
			} 

			.modal-body { 
			    overflow-y: auto; 
			    position: absolute; 
			    top: 55px; 
			    bottom: 65px; 
			    width: 100%; 
			} 

			.modal-header .close {margin-right: 15px;} 

			.modal-footer {
			    position: absolute; 
			    width: 100%; 
			    bottom: 0; 
			}
			
        </style>
		
        <script type="text/javascript" src="resources/js/jquery-3.1.0.min.js"></script>
        <script type="text/javascript" src="resources/js/jquery-ui.min.js"></script>
        <script type="text/javascript" src="resources/plugs/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="resources/plugs/bootstarpValidator/bootstrapValidator.js"></script>
        <script type="text/javascript" src="resources/plugs/bootstarpValidator/language/zh_CN.js"></script>
       
        <script src="resources/plugs/ace/assets/js/ace-extra.min.js"></script>
        <script src="resources/plugs/ace/assets/js/ace-elements.min.js"></script>
		<script src="resources/plugs/ace/assets/js/ace.min.js"></script>
		<script src="resources/js/jquery.mloading.js"></script>
		<script src="resources/js/common/common.js"></script>
		
		
		
        <!--[if lt IE 9]>
          <script src="theme/js/html5shiv.min.js"></script>
          <script src="theme/js/respond.min.js"></script>
        <![endif]-->
        
        <script type="text/javascript">
        </script>
    </head>
    <body class="skin-1">
        <div class="navbar navbar-default" role="navigation" id="navbar">
	          <script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed');}catch(e){}
			  </script>
			  <div class="navbar-container" id="navbar-container">
				  	<button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler">
						<span class="sr-only">Toggle sidebar</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<div class="navbar-header pull-left">
						<a href="#" class="navbar-brand">
							<small>
								<i class="icon-leaf"></i>
								MAKEJOY
							</small>
						</a>
					</div>
					<div class="navbar-buttons navbar-header pull-right" role="navigation">
						<ul class="nav ace-nav">
						
							<li class="light-blue">
								<a data-toggle="dropdown" href="#" class="dropdown-toggle">
									<span class="user-info">
										<small>welcome  </small>
										<shiro:principal property="name"/>[<shiro:principal/>]
									</span>
	
									<i class="ace-icon fa fa-caret-down"></i>
								</a>
	
								<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								
									<li class="divider"></li>
									<li>
										<a href="/logout">
											<i class="ace-icon fa fa-power-off"></i>
											退出
										</a>
									</li>
								</ul>
							</li>
						</ul><!-- /.ace-nav -->
					</div><!-- /.navbar-header -->
			</div>
		</div>
        <div class="main-container" id="main-container">
			<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed');}catch(e){}
			</script>
			<div id="sidebar" class="sidebar   responsive">
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'fixed');}catch(e){}
				</script>
				<c:if test="${admin.property==0}">
					<jsp:include page="sidebar/admin.jsp"></jsp:include>
				</c:if>
				<c:if test="${admin.property==1}">
					<jsp:include page="sidebar/agent.jsp"></jsp:include>
				</c:if>
			    
			    <script type="text/javascript">
					try{ace.settings.check('sidebar' , 'collapsed');}catch(e){}
				</script>
			</div>
	     	<div class="main-content">
		        <div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>
						<ul class="breadcrumb">
							<li >
								<i class="ace-icon fa fa-home home-icon"></i>
							</li>
							<li class="active" onclick="disabled()">Dashboard</li>
						</ul><!-- /.breadcrumb -->
				</div>
				<div>
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		       			data-backdrop="static" aria-labelledby="myModalLabel" aria-hidden="true"> 
		       		</div>
		      		<div id="dataDiv">
					</div>
				</div>
		   </div>	
		  	
           <div class="footer">
			    <div class="footer-inner">
				<!-- #section:basics/footer -->
					<div class="footer-content">
						<span class="bigger-120">
							<span class="blue bolder">PUSH</span>
							Copyright © 麻将管理平台
						</span>
	
						&nbsp; &nbsp;
						<span class="action-buttons">
							<a href="#">
								<i class="ace-icon fa fa-twitter-square light-blue bigger-150"></i>
							</a>
							<a href="#">
								<i class="ace-icon fa fa-facebook-square text-primary bigger-150"></i>
							</a>
							<a href="#">
								<i class="ace-icon fa fa-rss-square orange bigger-150"></i>
							</a>
						</span>
					</div>
			    </div>
		   </div>
			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
    </body>
    <script src="resources/plugs/bootstrap-table.js"></script>
<script src="resources/plugs/bootstrap-table-zh-CN.js"></script>
<script type="text/javascript">

$("#myModal").on("hide.bs.modal", function() {
    $(this).removeData("modal"); 
});   
var showModal = function(remote) {
  if (remote != "") {    
  		$("#myModal").load(remote, function() {
  			$("#myModal").draggable({
					cursor: "move",
					handle: '.modal-header'
				});
     		 $("#myModal").modal('show');  
  		});  
	} 
}; 
$(document).ready(function() {
	$("[data-toggle='tooltip']").tooltip();
	$("#home").click();
});
</script>
</html>