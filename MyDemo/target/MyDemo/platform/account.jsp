<%--
  Created by IntelliJ IDEA.
  User: 咸鱼
  Date: 2019/8/22
  Time: 21:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.soft.entity.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="<%=basePath%>platform/layui/css/layui.css"  media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
    <script type="text/javascript" src="<%=basePath%>platform/js/jquery.min.js"></script>

</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>园所管理</legend>
</fieldset>
<div class="demoTable">
    <div class="layui-inline">
        <label class="layui-form-label">审批时间</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input" id="test1" placeholder="yyyy-MM-dd">
        </div>
        至
        <div class="layui-input-inline">
            <input type="text" class="layui-input" id="test2" placeholder="yyyy-MM-dd">
        </div>
        <div class="layui-input-inline">
            <form class="layui-form" action="">
                <label class="layui-form-label">状态</label>
                <div class="layui-input-inline">
                    <select name="modules" lay-verify="required" lay-search="">
                        <option value="">请选择</option>
                        <option value="启用">启用</option>
                        <option value="禁用">禁用</option>
                    </select>
                </div>
            </form>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">园所名称</label>
            <div class="layui-input-inline">
                <input class="layui-input" name="id" id="demoReload" autocomplete="off">
            </div>
        </div>
        <button class="layui-btn" data-type="reload">查询</button>
    </div>
</div>
<button type="button" class="layui-btn layui-btn-normal" onclick="zeng()">新增</button>
<table class="layui-hide" id="test" lay-filter="test"></table>

<script type="text/html" id="barDemo">
    {{#  if(d.state =="禁用"){ }}
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="enable">启用</a>
    {{# }if(d.state =="启用") { }}
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="forbidden">禁用</a>
    {{#  } }}

    <a class="layui-btn layui-btn-xs" lay-event="reset">重置密码</a>
    <a class="layui-btn layui-btn-xs" lay-event="modification">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
</script>

<script src="<%=basePath%>platformlayui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use('table', function(){
        var table = layui.table;

        table.render({
            elem: '#test'
            ,url: '<%=basePath%>shen/queryall.action'
            ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            ,id: 'testReload'
            ,page: true
            ,cols: [[
                {field:'uname', title: '园所编号' }
                ,{field:'uname', title: '园所名称' }
                ,{field:'uname', title: '账户' }
                ,{field:'utime', title: '审批时间' }
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo'}
            ]]
        });
        // 按键修改状态
        table.on('tool(test)', function(obj){
            var data = obj.data;
            //console.log(obj)
            if(obj.event === 'enable'){
                layer.confirm('是否启用', function(index){

                    layer.close(index);
                });
            } else if(obj.event === 'forbidden'){
                layer.confirm('是否禁用', function(index){

                    layer.close(index);
                });
            }else if(obj.event === 'reset'){
                layer.confirm('是否重置密码', function(index){

                    layer.close(index);
                });
            }else if(obj.event === 'modification'){
                layer.confirm('是否修改园所信息', function(index){

                    layer.close(index);
                });
            }else if(obj.event === 'delete'){
                layer.confirm('是否删除该园所', function(index){

                    layer.close(index);
                });
            }
        });
        //监听行工具事件
        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    });
    //日期样式
    layui.use('laydate',function(){
        //时间
        var laydate = layui.laydate;
        laydate.render({
            elem: '#test1'
        });
        laydate.render({
            elem: '#test2'
        });
    });
    function zeng() {
//新增园所弹窗
        $.ajax({
            url: "<%=path%>user/find.action",
            type: "POST",
            success : function(list){

                //审批弹窗
                    layer.open({
                    type: 1
                    ,
                    title: '新增园所'
                    ,
                    closeBtn: false
                    ,
                    area: '300px;'
                    ,
                    shade: 0.8
                    ,
                    id: 'LAY_layuipro' //设定一个id，防止重复弹出
                    ,
                    btn: ['保存', '取消']
                    ,
                    btnAlign: 'c'
                    ,
                    moveType: 1 //拖拽模式，0或者1
                    ,
                    content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">' +
                        '园所名称：' +
                        '<div class="layui-input-inline">' +
                        '<select name="modules" id="chicityid" lay-verify="required" lay-search="" onload="uu()" required="required">' +
                        '</select>' +
                        '</div>' +
                        '<br>' +
                        '账号：' +
                        '<input type="text"  required="required" autocomplete="off">' +
                        '</div>'
                    ,btn1: function(index, layero){
                        alert("允许");
                       var utime = $('#chicityid').val();
                        if("null"!=utime){
                         alert(utime)
                        layer.close(index);
                        }
                    }
                    ,btn2: function(index, layero){
                        alert("拒绝")
                    }
                });
                var items = list;
                if(items != null) {

                    $("#chicityid").empty();
                    $("#chicityid").append("<option value='null'>请选择</option>");
                    $.each(items, function (i, n) {
                        $("#chicityid").append("<option value='" + items[i].utime + "'>" + items[i].utime + "</option>");

                    });
                };
            }
        });
    }
    function cc(utime) {
        $.ajax({
            url: "<%=path%>user/find.action",
            type: "POST",
            data:{},
        });
    }
</script>
</body>
</html>
