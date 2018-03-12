<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8">
<title>我的信息</title>
<base href="${contextPath }/" />
<style>
</style>
</head>
<body>
<div class="modal-body" style="margin-top: 50px">
			  <form id="" method="post" class="form-horizontal">
	                <div class="form-group" >
	                    <label class="col-lg-3 control-label">登陆名：</label>
	                    <div class="col-lg-5">
	                        ${admin.loginName}
	                    </div>
	                </div>
	                <div class="form-group">
	                    <label class="col-lg-3 control-label">名称：</label>
	                    <div class="col-lg-5">
	                        ${admin.name}
	                    </div>
	                </div>
	                <div class="form-group">
	                	 <label class="col-lg-3 control-label"></label>
	                	 <div class="col-lg-5">
	                        <a href="/user/token">接口密钥信息</a>
	                     </div>
	                </div>
	          </form>
		</div>
	
</body>
</html>