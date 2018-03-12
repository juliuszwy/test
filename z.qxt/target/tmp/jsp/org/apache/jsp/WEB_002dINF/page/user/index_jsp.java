package org.apache.jsp.WEB_002dINF.page.user;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/WEB-INF/page/user/../common/taglibs.jsp");
  }

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_shiro_principal_nobody;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_shiro_principal_property_nobody;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_set_var_value_nobody;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_shiro_principal_nobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_shiro_principal_property_nobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_c_set_var_value_nobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_shiro_principal_nobody.release();
    _jspx_tagPool_shiro_principal_property_nobody.release();
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
      out.write("\r\n");
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">\r\n");
      out.write("<html>\r\n");
      out.write("  <head>\r\n");
      out.write("    <title>系统</title>\r\n");
      out.write("   <base href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${contextPath }", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/\" />\r\n");
      out.write("    <meta http-equiv=\"Content-Type\" content=\"text/html;charset=utf-8\" />\r\n");
      out.write("\t<style type=\"text/css\">\r\n");
      out.write("\t\tbody {\r\n");
      out.write("\t\t\tfont: 12px/20px \"微软雅黑\", \"宋体\", Arial, sans-serif, Verdana, Tahoma;\r\n");
      out.write("\t\t\tpadding: 0;\r\n");
      out.write("\t\t\tmargin: 0;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t.cs-west {\r\n");
      out.write("\t\t\t  width:180px; padding:0px;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t.cs-north {\r\n");
      out.write("\t\t\theight:40px;\r\n");
      out.write("\t\t\toverflow:hidden;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t.cs-north-bg {\r\n");
      out.write("\t\t\twidth: 100%;\r\n");
      out.write("\t\t\theight: 100%;\r\n");
      out.write("\t\t\tbackground: url(resources/js/easyui/themes/bootstrap/images/header_bg.png) repeat-x;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t.cs-north-logo {\r\n");
      out.write("\t\t\theight: 30px;\r\n");
      out.write("\t\t\tmargin: 10px 0px 20px 5px;\r\n");
      out.write("\t\t\tdisplay: inline-block;\r\n");
      out.write("\t\t\tcolor:#0E2D5F;\r\n");
      out.write("\t\t\tfont-size:20px;\r\n");
      out.write("\t\t\tfont-weight:bold;\r\n");
      out.write("\t\t\ttext-decoration:none;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t.cs-north-info {\r\n");
      out.write("\t\t\tposition: absolute;\r\n");
      out.write("\t\t\tcolor: #777;\r\n");
      out.write("\t\t\ttop: 10px;\r\n");
      out.write("\t\t\tright: 30px;\r\n");
      out.write("\t\t\tdisplay: inline-block;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t.accordion .accordion-header-selected {\r\n");
      out.write("\t\t  background: #D4D4D4;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t.cs-navi-tab {\r\n");
      out.write("\t\t\tfont-size: 12px;\r\n");
      out.write("\t\t\tfont-weight: bold;\r\n");
      out.write("\t\t\tcolor: #777;\r\n");
      out.write("\t\t\theight: 16px;\r\n");
      out.write("\t\t\tline-height: 16px;\r\n");
      out.write("\t\t\twidth: 120px;\r\n");
      out.write("\t\t\tpadding: 5px 0 5px 20px;\r\n");
      out.write("\t\t\tdisplay: block;\r\n");
      out.write("\t\t\ttext-decoration:none;\r\n");
      out.write("\t\t}\r\n");
      out.write("</style>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("function addTab(title, url){\r\n");
      out.write("\tif ($('#tabs').tabs('exists', title)) {\r\n");
      out.write("\t\t$('#tabs').tabs('select', title);//选中并刷新\r\n");
      out.write("\t\tvar currTab = $('#tabs').tabs('getSelected');\r\n");
      out.write("\t\tvar url = $(currTab.panel('options').content).attr('src');\r\n");
      out.write("\t\tif(url != undefined && currTab.panel('options').title != 'Home') {\r\n");
      out.write("\t\t\t$('#tabs').tabs('update',{\r\n");
      out.write("\t\t\t\ttab:currTab,\r\n");
      out.write("\t\t\t\toptions:{\r\n");
      out.write("\t\t\t\t\tcontent:createFrame(url)\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t})\r\n");
      out.write("\t\t}\r\n");
      out.write("\t} else {\r\n");
      out.write("\t\tvar content = createFrame(url);\r\n");
      out.write("\t\t$('#tabs').tabs('add',{\r\n");
      out.write("\t\t\ttitle:title,\r\n");
      out.write("\t\t\tcontent:content,\r\n");
      out.write("\t\t\tclosable:true\r\n");
      out.write("\t\t});\r\n");
      out.write("\t}\r\n");
      out.write("\ttabClose();\r\n");
      out.write("}\r\n");
      out.write("function createFrame(url) {\r\n");
      out.write("\tvar s = '<iframe scrolling=\"auto\" frameborder=\"0\" src=\"' + url + '\" style=\"width:100%;height:100%;\"></iframe>';\r\n");
      out.write("\treturn s;\r\n");
      out.write("}\r\n");
      out.write("function tabClose() {\r\n");
      out.write("\t/*双击关闭TAB选项卡*/\r\n");
      out.write("\t$(\".tabs-inner\").dblclick(function(){\r\n");
      out.write("\t\tvar subtitle = $(this).children(\".tabs-closable\").text();\r\n");
      out.write("\t\t$('#tabs').tabs('close',subtitle);\r\n");
      out.write("\t})\r\n");
      out.write("\t/*为选项卡绑定右键*/\r\n");
      out.write("\t$(\".tabs-inner\").bind('contextmenu',function(e){\r\n");
      out.write("\t\t$('#mm').menu('show', {\r\n");
      out.write("\t\t\tleft: e.pageX,\r\n");
      out.write("\t\t\ttop: e.pageY\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\tvar subtitle =$(this).children(\".tabs-closable\").text();\r\n");
      out.write("\t\t$('#mm').data(\"currtab\",subtitle);\r\n");
      out.write("\t\t$('#tabs').tabs('select',subtitle);\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t});\r\n");
      out.write("}\t\t\r\n");
      out.write("//绑定右键菜单事件\r\n");
      out.write("function tabCloseEven() {\r\n");
      out.write("\t//刷新\r\n");
      out.write("\t$('#mm-tabupdate').click(function(){\r\n");
      out.write("\t\tvar currTab = $('#tabs').tabs('getSelected');\r\n");
      out.write("\t\tvar url = $(currTab.panel('options').content).attr('src');\r\n");
      out.write("\t\tif(url != undefined && currTab.panel('options').title != 'Home') {\r\n");
      out.write("\t\t\t$('#tabs').tabs('update',{\r\n");
      out.write("\t\t\t\ttab:currTab,\r\n");
      out.write("\t\t\t\toptions:{\r\n");
      out.write("\t\t\t\t\tcontent:createFrame(url)\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t})\r\n");
      out.write("\t\t}\r\n");
      out.write("\t})\r\n");
      out.write("\t//关闭当前\r\n");
      out.write("\t$('#mm-tabclose').click(function(){\r\n");
      out.write("\t\tvar currtab_title = $('#mm').data(\"currtab\");\r\n");
      out.write("\t\t$('#tabs').tabs('close',currtab_title);\r\n");
      out.write("\t})\r\n");
      out.write("\t//全部关闭\r\n");
      out.write("\t$('#mm-tabcloseall').click(function(){\r\n");
      out.write("\t\t$('.tabs-inner span').each(function(i,n){\r\n");
      out.write("\t\t\tvar t = $(n).text();\r\n");
      out.write("\t\t\tif(t != 'Home') {\r\n");
      out.write("\t\t\t\t$('#tabs').tabs('close',t);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t});\r\n");
      out.write("\t//关闭除当前之外的TAB\r\n");
      out.write("\t$('#mm-tabcloseother').click(function(){\r\n");
      out.write("\t\tvar prevall = $('.tabs-selected').prevAll();\r\n");
      out.write("\t\tvar nextall = $('.tabs-selected').nextAll();\t\t\r\n");
      out.write("\t\tif(prevall.length>0){\r\n");
      out.write("\t\t\tprevall.each(function(i,n){\r\n");
      out.write("\t\t\t\tvar t=$('a:eq(0) span',$(n)).text();\r\n");
      out.write("\t\t\t\tif(t != 'Home') {\r\n");
      out.write("\t\t\t\t\t$('#tabs').tabs('close',t);\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tif(nextall.length>0) {\r\n");
      out.write("\t\t\tnextall.each(function(i,n){\r\n");
      out.write("\t\t\t\tvar t=$('a:eq(0) span',$(n)).text();\r\n");
      out.write("\t\t\t\tif(t != 'Home') {\r\n");
      out.write("\t\t\t\t\t$('#tabs').tabs('close',t);\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t});\r\n");
      out.write("\t//关闭当前右侧的TAB\r\n");
      out.write("\t$('#mm-tabcloseright').click(function(){\r\n");
      out.write("\t\tvar nextall = $('.tabs-selected').nextAll();\r\n");
      out.write("\t\tif(nextall.length==0){\r\n");
      out.write("\t\t\t//msgShow('系统提示','后边没有啦~~','error');\r\n");
      out.write("\t\t\talert('后边没有啦~~');\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tnextall.each(function(i,n){\r\n");
      out.write("\t\t\tvar t=$('a:eq(0) span',$(n)).text();\r\n");
      out.write("\t\t\t$('#tabs').tabs('close',t);\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t});\r\n");
      out.write("\t//关闭当前左侧的TAB\r\n");
      out.write("\t$('#mm-tabcloseleft').click(function(){\r\n");
      out.write("\t\tvar prevall = $('.tabs-selected').prevAll();\r\n");
      out.write("\t\tif(prevall.length==0){\r\n");
      out.write("\t\t\talert('到头了，前边没有啦~~');\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tprevall.each(function(i,n){\r\n");
      out.write("\t\t\tvar t=$('a:eq(0) span',$(n)).text();\r\n");
      out.write("\t\t\t$('#tabs').tabs('close',t);\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t});\r\n");
      out.write("\t//退出\r\n");
      out.write("\t$(\"#mm-exit\").click(function(){\r\n");
      out.write("\t\t$('#mm').menu('hide');\r\n");
      out.write("\t})\r\n");
      out.write("}\r\n");
      out.write("function logout(){\r\n");
      out.write("\t$.messager.confirm('退出', '您确定现在退出吗？', function(r){\r\n");
      out.write("\t\tif(r) {\r\n");
      out.write("\t\t\twindow.location.href=\"logout\";\r\n");
      out.write("\t\t}\r\n");
      out.write("\t});\r\n");
      out.write("}\r\n");
      out.write("function resetPWD(){\r\n");
      out.write("\tshowMyWindow('修改密码', 'user/resetPwd', 420, 200);\r\n");
      out.write("}\r\n");
      out.write("$(function() {\r\n");
      out.write("\ttabCloseEven();\r\n");
      out.write("\t$('.cs-navi-tab').click(function() {\r\n");
      out.write("\t\tvar $this = $(this);\r\n");
      out.write("\t\tvar href = $this.attr('src');\r\n");
      out.write("\t\tvar title = $this.text();\r\n");
      out.write("\t\taddTab(title, href);\r\n");
      out.write("\t});\r\n");
      out.write("});\r\n");
      out.write("</script>\r\n");
      out.write("  </head>\r\n");
      out.write("\t<body class=\"easyui-layout\">\r\n");
      out.write("\t\t<div region=\"north\" border=\"true\" class=\"cs-north\">\r\n");
      out.write("\t\t\t<div class=\"cs-north-bg\">\r\n");
      out.write("\t\t\t\t<img src=\"resources/image/title.png\" style=\"margin-left:4px \">\r\n");
      out.write("\t\t\t\t<div class=\"cs-north-logo\">通道管理系统</div>\r\n");
      out.write("\t\t\t\t<div class=\"cs-north-info\">\r\n");
      out.write("\t\t\t\t\t您好,");
      if (_jspx_meth_shiro_principal_0(_jspx_page_context))
        return;
      out.write('[');
      if (_jspx_meth_shiro_principal_1(_jspx_page_context))
        return;
      out.write("]\r\n");
      out.write("\t\t\t\t\t<a href=\"javascript:resetPWD()\" class=\"easyui-linkbutton\" data-options=\"plain:true\" >修改密码</a>\r\n");
      out.write("\t\t\t\t\t<a href=\"javascript:logout();\" class=\"easyui-linkbutton\" data-options=\"plain:true\" >退出</a>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div region=\"west\" border=\"true\" split=\"true\" title=\"菜单导航\" class=\"cs-west\">\r\n");
      out.write("\t\t\t<div class=\"easyui-accordion\" fit=\"false\" border=\"false\">\r\n");
      out.write("\t\t\t\t<div title=\"用户管理\" style=\"padding:10px;\" iconCls=\"icon-auth\">\r\n");
      out.write("\t\t\t\t\t<a href=\"javascript:void(0);\" src=\"user/list\" class=\"cs-navi-tab\">帐号列表</a>\r\n");
      out.write("\t\t\t\t\t<a href=\"javascript:void(0);\" src=\"role/list\" class=\"cs-navi-tab\">角色列表</a>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div title=\"cp管理\" style=\"padding:10px;\" iconCls=\"icon-auth\" selected=\"true\">\r\n");
      out.write("\t\t\t\t\t<a href=\"javascript:void(0);\" src=\"cpInfo/list\" class=\"cs-navi-tab\">cp列表</a>\r\n");
      out.write("\t\t\t\t\t<a href=\"javascript:void(0);\" src=\"cpInfo/list1\" class=\"cs-navi-tab\">kkk</a>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div title=\"通道管理\" style=\"padding:10px;\" iconCls=\"icon-auth\" selected=\"false\">\r\n");
      out.write("\t\t\t\t\t<a href=\"javascript:void(0);\" src=\"spInfo/list\" class=\"cs-navi-tab\">sp管理</a>\r\n");
      out.write("\t\t\t\t\t<a href=\"javascript:void(0);\" src=\"sge/list\" class=\"cs-navi-tab\">单通道管理</a>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div> \r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div id=\"mainPanle\" region=\"center\" border=\"true\" border=\"false\">\r\n");
      out.write("\t\t\t <div id=\"tabs\" class=\"easyui-tabs\"  fit=\"true\" border=\"false\" >\r\n");
      out.write("\t            <div title=\"首页\">\r\n");
      out.write("\t\t\t\t<div class=\"cs-home-remark\">\r\n");
      out.write("\t\t\t\t\t<h1>欢迎登录支付管理系统!</h1> <br />\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t        </div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div region=\"south\" border=\"false\" id=\"south\"><center></center></div>\r\n");
      out.write("\t\t<div id=\"mm\" class=\"easyui-menu cs-tab-menu\">\r\n");
      out.write("\t\t\t<div id=\"mm-tabupdate\">刷新</div>\r\n");
      out.write("\t\t\t<div class=\"menu-sep\"></div>\r\n");
      out.write("\t\t\t<div id=\"mm-tabclose\">关闭</div>\r\n");
      out.write("\t\t\t<div id=\"mm-tabcloseother\">关闭其他</div>\r\n");
      out.write("\t\t\t<div id=\"mm-tabcloseall\">关闭全部</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</body>\r\n");
      out.write("</html>\r\n");
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

  private boolean _jspx_meth_shiro_principal_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  shiro:principal
    org.apache.shiro.web.tags.PrincipalTag _jspx_th_shiro_principal_0 = (org.apache.shiro.web.tags.PrincipalTag) _jspx_tagPool_shiro_principal_property_nobody.get(org.apache.shiro.web.tags.PrincipalTag.class);
    _jspx_th_shiro_principal_0.setPageContext(_jspx_page_context);
    _jspx_th_shiro_principal_0.setParent(null);
    _jspx_th_shiro_principal_0.setProperty("name");
    int _jspx_eval_shiro_principal_0 = _jspx_th_shiro_principal_0.doStartTag();
    if (_jspx_th_shiro_principal_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_shiro_principal_property_nobody.reuse(_jspx_th_shiro_principal_0);
      return true;
    }
    _jspx_tagPool_shiro_principal_property_nobody.reuse(_jspx_th_shiro_principal_0);
    return false;
  }

  private boolean _jspx_meth_shiro_principal_1(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  shiro:principal
    org.apache.shiro.web.tags.PrincipalTag _jspx_th_shiro_principal_1 = (org.apache.shiro.web.tags.PrincipalTag) _jspx_tagPool_shiro_principal_nobody.get(org.apache.shiro.web.tags.PrincipalTag.class);
    _jspx_th_shiro_principal_1.setPageContext(_jspx_page_context);
    _jspx_th_shiro_principal_1.setParent(null);
    int _jspx_eval_shiro_principal_1 = _jspx_th_shiro_principal_1.doStartTag();
    if (_jspx_th_shiro_principal_1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_shiro_principal_nobody.reuse(_jspx_th_shiro_principal_1);
      return true;
    }
    _jspx_tagPool_shiro_principal_nobody.reuse(_jspx_th_shiro_principal_1);
    return false;
  }
}
