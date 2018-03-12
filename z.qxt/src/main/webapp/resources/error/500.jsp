<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%response.setStatus(200);%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <style type="text/css">
        
        a
        {
            color: #75C6D9;
            text-decoration: none;
        }
        
        h3
        {
            margin-bottom: 1%;
        }
        
        
        li a:hover
        {
            color: #fff;
        }
        
        .center
        {
            text-align: center;
        }
        
        /* Search Bar Styling */
        form > *
        {
            vertical-align: middle;
        }
        
        .srchBtn
        {
            border: 0;
            border-radius: 7px;
            padding: 0 17px;
            background: #e74c3c;
            width: 99px;
            border-bottom: 5px solid #c0392b;
            color: #fff;
            height: 65px;
            font-size: 1.5rem;
            cursor: pointer;
        }
        
        .srchBtn:active
        {
            border-bottom: 0px solid #c0392b;
        }
        
        .srchFld
        {
            border: 0;
            border-radius: 7px;
            padding: 0 17px;
            max-width: 404px;
            width: 40%;
            border-bottom: 5px solid #bdc3c7;
            height: 60px;
            color: #7f8c8d;
            font-size: 19px;
        }
        
        .srchFld:focus
        {
            outline-color: rgba(255, 255, 255, 0);
        }
        
        /* 404 Styling */
        .header
        {
            font-size: 13rem;
            font-weight: 700;
            margin: 2% 0 2% 0;
            text-shadow: 0px 3px 0px #7f8c8d;
        }
        
        /* Error Styling */
        .error
        {
            margin: -70px 0 2% 0;
            font-size: 7.4rem;
            text-shadow: 0px 3px 0px #7f8c8d;
            font-weight: 100;
        }
  </style>
  </head>
  <body>
  <section class="center">
        <article>
            <h1 class="header">
                500</h1>
            <p class="error">
                ERROR</p>
        </article>
        <article>
            <h3>
                My Suggestions.</h3>
            <ul>
                <li><a href="${ contextPath}/login" style="font-size: 30px">Home</a></li>
                <li><a href="">Portfolio</a></li>
            </ul>
        </article>
    </section>
  </body>
</html>
