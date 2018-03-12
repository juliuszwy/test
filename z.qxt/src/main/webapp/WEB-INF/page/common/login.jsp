<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../common/taglibs.jsp" %>
<base href="${contextPath }/" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
 <meta charset=utf-8 />
 <meta http-equiv="X-UA-Compatible" content="IE=6">
 <meta name="renderer" content="webkit|ie-comp|ie-stand">
 <script type="text/javascript" src="resources/js/jquery-3.1.0.min.js"></script>
</head>
<body>
</body>
<script type="text/javascript">
 		//window.location.href='/login?methodname=FindAllComp'
	 		top.window.location = "/login";
	 		window.event.returnValue=false;
	 		//location.href="/login"
	 		//window.open("/login",'_self');
 </script>
</html>