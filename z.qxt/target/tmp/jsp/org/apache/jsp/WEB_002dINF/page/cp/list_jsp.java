package org.apache.jsp.WEB_002dINF.page.cp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class list_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/WEB-INF/page/cp/../common/taglibs.jsp");
  }

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_set_var_value_nobody;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_c_set_var_value_nobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_c_set_var_value_nobody.release();
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\r');
      out.write('\n');
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      if (_jspx_meth_c_set_0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("<link rel=\"shortcut icon\" type=\"image/x-icon\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${contextPath }", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/resources/image/favicon.ico\" />\r\n");
      out.write("<link href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${contextPath }", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/resources/js/easyui/themes/gray/easyui.css\" rel=\"stylesheet\"/>\r\n");
      out.write("<link href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${contextPath }", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/resources/js/easyui/themes/icon.css\" rel=\"stylesheet\"/>\r\n");
      out.write("<link href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${contextPath }", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/resources/css/common.css\" rel=\"stylesheet\"/>\r\n");
      out.write("<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${contextPath }", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/resources/js/jquery-1.8.0.min.js\"></script>\r\n");
      out.write("<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${contextPath }", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/resources/js/easyui/jquery.easyui.min.js\"></script>\r\n");
      out.write("<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${contextPath }", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/resources/js/easyui/locale/easyui-lang-zh_CN.js\"></script>\r\n");
      out.write("<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${contextPath }", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/resources/js/common.js\"></script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=\"utf-8\">\r\n");
      out.write("<title>CP管理 | CP列表</title>\r\n");
      out.write("<base href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${contextPath }", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/\" />\r\n");
      out.write("<script>\r\n");
      out.write("$(document).ready(function() {\r\n");
      out.write("   });\r\n");
      out.write("function doSearch(){    \r\n");
      out.write("    $('#tt').datagrid('load', {    \r\n");
      out.write("         filter_LIKES_name: $('#name').val()    \r\n");
      out.write("    });\r\n");
      out.write("}\r\n");
      out.write("function add(){\r\n");
      out.write("    showMyWindow('CP管理 | 新增CP', 'cpInfo/add', 500,320);\r\n");
      out.write("}\r\n");
      out.write("function edit(rowIndex){\r\n");
      out.write("\tvar row = $('#tt').datagrid('getSelected');\r\n");
      out.write("\tif (row){\r\n");
      out.write("\t\tshowMyWindow('CP管理 | 编辑CP', 'cpInfo/'+row.id+'/update', 500,320);\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function del(){\r\n");
      out.write("\tvar row = $('#tt').datagrid('getSelected');\r\n");
      out.write("    if (row){\r\n");
      out.write("\t   showConfirm(market.content.title, market.content.confirm, function(){\r\n");
      out.write("\t\t  $.post('cpInfo/'+row.id+'/delete', function(data) {\r\n");
      out.write("\t\t  \tif (data.return_code == '1') {\r\n");
      out.write("\t\t\t\ttop.showMsg(market.content.title, data.return_msg, alert);\r\n");
      out.write("\t\t\t\t$(\"#tt\").datagrid('reload');\r\n");
      out.write("\t\t\t} else {\r\n");
      out.write("\t\t\t\t$.messager.alert(market.content.title, data.return_msg);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t  });\r\n");
      out.write("\t   });\r\n");
      out.write("    } else {\r\n");
      out.write("    \tshowMsg(market.content.title, market.content.tips, alert);\r\n");
      out.write("    }\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function formatStatus(value,row,index){\r\n");
      out.write("\tif (value==\"1\") {\r\n");
      out.write("\t\treturn '<font color=\"#FF0000\">暂停</font> ';\r\n");
      out.write("\t} else {\r\n");
      out.write("\t\treturn '启用';\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function formatterdate(val, row) {\r\n");
      out.write("\tif (val != null) {\r\n");
      out.write("\tvar date = new Date(val);\r\n");
      out.write("\treturn date.getFullYear() + '-' + (date.getMonth() + 1) + '-'\r\n");
      out.write("\t+ date.getDate();\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body class=\"cmp-list-body\">\r\n");
      out.write("<div id=\"tb\" style=\"padding:3px\">\r\n");
      out.write("    <span>角色名称:</span>    \r\n");
      out.write("    <input id=\"name\" style=\"line-height:20px;border:1px solid #ccc\">\r\n");
      out.write("    <a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" iconCls=\"icon-search\" plain=\"true\" onclick=\"doSearch();\">查询</a> \r\n");
      out.write("    <a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" iconCls=\"icon-add\" plain=\"true\" onclick=\"add();\">新增</a>\r\n");
      out.write("    <a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" iconCls=\"icon-remove\" plain=\"true\" onclick=\"del();\">删除</a>\r\n");
      out.write("    <a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" iconCls=\"icon-save\" plain=\"true\" onclick=\"edit();\">修改</a>\r\n");
      out.write("</div>\r\n");
      out.write("<table id=\"tt\" class=\"easyui-datagrid\" title=\"角色管理 | 帐号列表\" iconCls=\"icon-save\" \r\n");
      out.write("\turl=\"cpInfo/list?json\" toolbar=\"#tb\" rownumbers=\"true\" singleSelect=\"true\" pagination=\"true\" fitColumns=\"true\" pageSize=\"15\" pageList=\"[15,30,60,80,100]\" >    \r\n");
      out.write("    <thead>\r\n");
      out.write("        <tr>\r\n");
      out.write("        \t<th align=\"center\" width=\"8%\" field=\"serialNo\">编号</th> \r\n");
      out.write("            <th align=\"center\" width=\"8%\" field=\"name\">CP名称</th> \r\n");
      out.write("            <th align=\"center\" width=\"8%\" field=\"createTime\" formatter=\"formatterdate\">创建时间</th>\r\n");
      out.write("             <th align=\"center\" width=\"8%\" field=\"payUnitCpDay\" >日限</th>\r\n");
      out.write("              <th align=\"center\" width=\"8%\" field=\"payUnitCpMonth\" >月限</th>\r\n");
      out.write("          \t<th align=\"center\" width=\"5%\" field=\"status\" formatter=\"formatStatus\">状态</th>\r\n");
      out.write("        </tr>\r\n");
      out.write("    </thead>   \r\n");
      out.write("</table>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_set_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:set
    org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_set_0 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _jspx_tagPool_c_set_var_value_nobody.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
    _jspx_th_c_set_0.setPageContext(_jspx_page_context);
    _jspx_th_c_set_0.setParent(null);
    _jspx_th_c_set_0.setVar("contextPath");
    _jspx_th_c_set_0.setValue((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    int _jspx_eval_c_set_0 = _jspx_th_c_set_0.doStartTag();
    if (_jspx_th_c_set_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_set_var_value_nobody.reuse(_jspx_th_c_set_0);
      return true;
    }
    _jspx_tagPool_c_set_var_value_nobody.reuse(_jspx_th_c_set_0);
    return false;
  }
}
