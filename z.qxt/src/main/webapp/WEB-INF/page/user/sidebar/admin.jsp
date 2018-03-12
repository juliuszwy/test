<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<body>
		<ul class="nav nav-list">
			<li class="active">
				 <a href="javascript:void(0);"  url="/user/home"  onclick="menuSkip(this,'fa  fa-home')" id="home">
				 	<i class="menu-icon fa  fa-home"></i>
					<span class="menu-text"> 首页 </span>
				 </a>
				 <b class="arrow"></b>
			</li>
			<li class="hsub">
				<a href="javascript:void(0);"  class="dropdown-toggle">
					<i class="menu-icon fa fa-users"></i>
					<span class="menu-text"> 账户管理 </span>
					<b class="arrow fa fa-angle-down"></b>
				</a>
				<b class="arrow"></b>
				<ul class="submenu">
					<li class="">
						<a href="javascript:void(0);" url="/user/list"  onclick="menuSkip(this,'fa fa-users')">
							<i class="menu-icon fa fa-caret-right"></i>
							<span class="menu-text"> 管理员</span>
						</a>
						<b class="arrow"></b>
					</li>

					<li class="">
						<a href="javascript:void(0);" url="/user/master/list"  onclick="menuSkip(this,'fa fa-users')">
							<i class="menu-icon fa fa-caret-right"></i>
							<span class="menu-text">金主</span>
						</a>

						<b class="arrow"></b>
					</li>
					
				</ul>
			</li>
		    <li class="hsub">
				<a href="javascript:void(0);"  class="dropdown-toggle">
					<i class="menu-icon fa fa-eye"></i>
					<span class="menu-text"> 日志 </span>
					<b class="arrow fa fa-angle-down"></b>
				</a>
				<b class="arrow"></b>
				<ul class="submenu">
					<li class="">
						<a href="javascript:void(0);" url="/log/list"  onclick="menuSkip(this,'fa fa-eye')">
							<i class="menu-icon fa fa-caret-right"></i>
							<span class="menu-text"> 请求日志</span>
						</a>
						<b class="arrow"></b>
					</li>
					<li class="">
						<a href="javascript:void(0);" url="/countLog/list"  onclick="menuSkip(this,'fa fa-eye')">
							<i class="menu-icon fa fa-caret-right"></i>
							<span class="menu-text"> 日志转化</span>
						</a>
						<b class="arrow"></b>
					</li>
				</ul>
			</li>
			<!--
			<li class="hsub">
				<a href="javascript:void(0);"  class="dropdown-toggle">
					<i class="menu-icon  fa fa-bookmark"></i>
					<span class="menu-text"> 活动管理 </span>
					<b class="arrow fa fa-angle-down"></b>
				</a>
				<b class="arrow"></b>
				<ul class="submenu">
					<li class="">
						<a href="javascript:void(0);" url="/activity/recharge/list"  onclick="menuSkip(this,'fa fa-bookmark')">
							<i class="menu-icon fa fa-caret-right"></i>
							<span class="menu-text">充值活动</span>
						</a>
						<b class="arrow"></b>
					</li>
					<li class="">
						<a href="javascript:void(0);" url="/activity/ranking/list"  onclick="menuSkip(this,'fa fa-bookmark')">
							<i class="menu-icon fa fa-caret-right"></i>
							<span class="menu-text">排名活动</span>
						</a>
						<b class="arrow"></b>
					</li>
					
				</ul>
			</li>
			<li class="hsub">
				<a href="javascript:void(0);"  class="dropdown-toggle">
					<i class="menu-icon fa fa-pencil-square-o"></i>
					<span class="menu-text"> 流水详情 </span>
					<b class="arrow fa fa-angle-down"></b>
				</a>
				<b class="arrow"></b>
				<ul class="submenu">
					<li class="">
						<a href="javascript:void(0);" url="/order/agent/list"  onclick="menuSkip(this,'fa fa-pencil-square-o')">
							<i class="menu-icon fa fa-caret-right"></i>
							<span class="menu-text">代理商充值记录</span>
						</a>
						<b class="arrow"></b>
					</li>
					<li class="">
						<a href="javascript:void(0);" url="/order/list"  onclick="menuSkip(this,'fa fa-pencil-square-o')">
							<i class="menu-icon fa fa-caret-right"></i>
							<span class="menu-text">用户充值订单</span>
						</a>
						<b class="arrow"></b>
					</li>
				</ul>
			</li>
			<li class="hsub">
				<a href="javascript:void(0);"  class="dropdown-toggle">
					<i class="menu-icon fa fa-bar-chart-o"></i>
					<span class="menu-text"> 数据统计 </span>
					<b class="arrow fa fa-angle-down"></b>
				</a>
				<b class="arrow"></b>
				<ul class="submenu">
					<li class="">
						<a href="javascript:void(0);" url="/userCount/list"  onclick="menuSkip(this,'fa fa-bar-chart-o')">
							<i class="menu-icon fa fa-caret-right"></i>
							<span class="menu-text">用户统计(月)</span>
						</a>
						<b class="arrow"></b>
					</li>
					<li class="">
						<a href="javascript:void(0);" url="agentCount/list"  onclick="menuSkip(this,'fa fa-bar-chart-o')">
							<i class="menu-icon fa fa-caret-right"></i>
							<span class="menu-text">渠道推广分析(天 )</span>
						</a>
						<b class="arrow"></b>
					</li>
				</ul>
			</li>
			<li class="active">
				 <a href="javascript:void(0);"  url="/user/home"  onclick="menuSkip(this,'fa  fa-home')" id="home">
				 	<i class="menu-icon fa  fa-home"></i>
					<span class="menu-text"> 账单(月) </span>
				 </a>
				 <b class="arrow"></b>
			</li> -->
		</ul>
		<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
			<i class="ace-icon fa fa-arrow-left" data-icon1="ace-icon fa fa-arrow-left" data-icon2="ace-icon fa fa-arrow-right"></i>
		</div>
</body>
</html>
