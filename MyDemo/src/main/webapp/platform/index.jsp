<%@ page language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>管理后台</title>
  <link rel="stylesheet" href="<%=basePath%>platform/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">智慧幼儿园管理端</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-right">
      <li class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
      <li class="">欢迎您，admin系统管理员</li>
    </ul>
  </div>

  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item layui-nav-itemed" >
          <a href="javascript:;">园所管理</a>
          <dl class="layui-nav-child">

            <dd><a href="<%=basePath%>platform/approval.jsp" target="main">资质审批</a></dd>
            <dd><a href="<%=basePath%>platform/account.jsp" target="main">园所账号管理</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;">资源管理</a>
          <dl class="layui-nav-child">
            <dd><a href="<%=path%>" target="main">安全教育管理</a></dd>
            <dd><a href="<%=path%>" target="main">视频试题配置</a></dd>
            <dd><a href="<%=path%>" target="main">亲自阅读管理</a></dd>
            <dd><a href="<%=path%>" target="main">平台资讯</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;">系统管理</a>
          <dl class="layui-nav-child">
            <dd><a href="<%=path%>" target="main">角色管理</a></dd>
            <dd><a href="<%=path%>" target="main">权限管理</a></dd>
            <dd><a href="<%=path%>" target="main">日志管理</a></dd>
          </dl>
        </li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->

      <iframe src="" height="100%" width="100%"
              name="main" frameborder="no" border="0">

      </iframe>

  </div>
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    © layui.com - 底部固定区域
  </div>
</div>
<script src="<%=basePath%>platform/layui/layui.js"></script>
<script>
//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;
  
});
</script>
</body>
</html>