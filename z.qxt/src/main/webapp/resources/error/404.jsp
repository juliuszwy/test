<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%response.setStatus(200);%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>404</title>
 <style type="text/css">
 .par{
 background: url("${contextPath}/resources/error/images/error_bg.jpg") repeat-x scroll 0 0 #67ACE4;
 }
#container {
    margin: 0 auto;
    padding-top: 50px;
    text-align: center;
    width: 560px;
}
#container img {
    border: medium none;
    margin-bottom: 50px;
}
#container .error {
    height: 200px;
    position: relative;
}
#container .error img {
    bottom: -50px;
    position: absolute;
    right: -50px;
}
#container .msg {
    margin-bottom: 65px;
}
#cloud {
    background: url("${contextPath}/resources/error/images/error_cloud.png") repeat-x scroll 0 0 transparent;
    bottom: 0;
    height: 170px;
    width: 100%;
}
</style>
</head>
<body>
<!-- 代码 开始 -->
<div class="par">
<div id="container"><img class="png" src="${contextPath}/resources/error/images/404.png" /> <img class="png msg" src="${contextPath}/resources/error/images/404_msg.png" />
  <p><a href="${ contextPath}/login"><img class="png" src="${contextPath}/resources/error/images/404_to_index.png" /></a> </p>
</div>
<div id="cloud" class="png"></div>
</div>
<!-- 代码 结束 -->

 
</body>
</html>