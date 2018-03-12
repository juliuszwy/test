<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<body>
		<ul class="nav nav-list">
			<li class="active">
				 <a href="javascript:void(0);"  url="/order/product"  onclick="menuSkip(this)" id="home">
				 	<i class="menu-icon fa fa-home"></i>
					<span class="menu-text"> 首页 </span>
				 </a>
				<b class="arrow"></b>
			</li>
			
					<li class="hsub">
						<a href="javascript:void(0);"  class="dropdown-toggle">
							<i class="menu-icon fa fa-pencil-square-o"></i>
							<span class="menu-text"> 日志管理 </span>
							<b class="arrow fa fa-angle-down"></b>
						</a>
						<b class="arrow"></b>
						<ul class="submenu">
							<li class="">
								<a href="javascript:void(0);" url="/order/list"  onclick="menuSkip(this)">
									<i class="menu-icon fa fa-caret-right"></i>
									<span class="menu-text"> 订单记录</span>
								</a>
								<b class="arrow"></b>
							</li>
						</ul>
					</li>
					<li>
						 <a href="javascript:void(0);"  url="/user/rePwd"  onclick="menuSkip(this)">
						 	<i class="menu-icon fa fa-home"></i>
							<span class="menu-text">修改密码</span>
						 </a>
						<b class="arrow"></b>
					</li>
				</ul>
			</li>
		</ul>
		<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
			<i class="ace-icon fa fa-arrow-left" data-icon1="ace-icon fa fa-arrow-left" data-icon2="ace-icon fa fa-arrow-right"></i>
		</div>
</body>
</html>
