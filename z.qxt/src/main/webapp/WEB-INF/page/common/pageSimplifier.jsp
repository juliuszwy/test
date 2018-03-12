<%@page import="cp.pay.mj.common.DataGridModel"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%

	DataGridModel pageData= (DataGridModel)request.getAttribute("page");
	Integer pageSize = pageData.getPageSize();
	Integer totalPages = pageData.getTotalPages();
	Integer pageNo = pageData.getPage();
	int pages = pageData.getTotalSliders();
	long totalRecords =pageData.getTotalRows() ;
%>

<!--分页开始-->
<div class="pagelist">
	<input type="hidden" value="<%=pageNo%>" id="pageNo" name="pageNo"/> 
	<%
		if (totalPages > 1) {
	%>
	<ul>

		<%
			if (pageNo == 1) {
		%>
		<li class="cancelCursor">首页</li><li class="cancelCursor">上页</li>
		<%
			} else {
		%>
		
		<li class="cancelCursor" onclick="changePage(this,'1','<%=pageSize%>','<%=totalRecords%>');">首页</li>
		<li class="cancelCursor" onclick="changePage(this,'<%=pageNo - 1%>','<%=pageSize%>','<%=totalRecords%>');">上页</li>
		<%
			}
		%>
		<%
			Integer startPage = pageNo - pages / 2;
				if (startPage < 1) {
					startPage = 1;
				}
				Integer endPage = startPage + pages;
				if (endPage > totalPages) {
					endPage = totalPages;
				}
				for (int i = startPage; i <= endPage; i++) {
					if (i == pageNo) {
		%>
			<li class="currentPage cancelCursor" pagesize="<%=pageSize%>" currentpage="<%=pageNo %>" totalcount="<%=totalRecords %>"><%=pageNo %></li>
		<%
			} else {
		%>
			<li onclick="changePage(this,'<%=i %>','<%=pageSize%>','<%=totalRecords %>');"><%=i %></li>
		<%
			}
				}
		%>

		<%
			if (pageNo == totalPages) {
		%>
		<li class="cancelCursor">下页</li><li class="cancelCursor">尾页</li>
		<%
			} else {
		%>
		<li class="cancelCursor" onclick="changePage(this,'<%=pageNo + 1%>','<%=pageSize%>','<%=totalRecords%>');">下页</li>
		<li class="cancelCursor" onclick="changePage(this,'<%=totalPages %>','<%=pageSize%>','<%=totalRecords%>');">尾页</li>
		<%
			}
		%>
		<li class="textInput"><div><input type="text" onkeyup="javascript:this.value=this.value.replace(/\D/g,'');" value="" class="MInputTT W50"></div></li>
		<li onclick="jumpPage(this,'<%=totalPages %>','<%=pageSize%>','<%=totalRecords%>');">跳页</li>
		<li class="cancelCursor">共<%=totalPages %>页</li>
		<li class="cancelCursor">共<%= totalRecords%>条记录</li>
	</div>
	<%
		}
	%>
</div>
<!-- 分页结束 -->



