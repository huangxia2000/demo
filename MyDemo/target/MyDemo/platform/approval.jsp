<%--
  Created by IntelliJ IDEA.
  User: 咸鱼
  Date: 2019/8/22
  Time: 21:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
    <legend>资质审批</legend>
</fieldset>
<div class="demoTable">
    <div class="layui-inline">
        <label class="layui-form-label">申请时间</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input" id="test1" name="qapplytime" placeholder="yyyy-MM-dd">
        </div>
        至
        <div class="layui-input-inline">
            <input type="text" class="layui-input" id="test2" name="qapplytime2" placeholder="yyyy-MM-dd">
        </div>
        <div class="layui-input-inline">
            <form class="layui-form" action="">
                <label class="layui-form-label">状态</label>
                <div class="layui-input-inline">
                    <select name="qstate" id="state" lay-verify="required" lay-search="">
<%--                        <option value="">请选择</option>--%>
                        <option value="1">未审批</option>
                        <option value="2">通过</option>
                        <option value="3">未通过</option>
                    </select>
                </div>
            </form>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">园所名称</label>
            <div class="layui-input-inline">
                <input class="layui-input" name="qname" id="qname" autocomplete="off">
            </div>
        </div>
        <button class="layui-btn" data-type="reload">查询</button>
    </div>
</div>
<table class="layui-hide" id="test" lay-filter="test"></table>



<script src="<%=basePath%>platform/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use('table', function(){
        var table = layui.table;

        table.render({
            elem: '#test'
            ,url: '<%=basePath%>kindergarten/find.action'
            ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            ,id: 'testReload'
            ,page: true
            ,cols: [[
                {field:'qno', title: '园所编号' }
                ,{field:'qname', title: '园所名称' }
                ,{field:'qapplytime', title: '申请时间' }
                ,{field:'qapprovetime', title: '审批时间' }
                ,{field:'state', title: '状态',toolbar: '#qstate'}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo'}
            ]]
        });
        //监听行工具事件
        // 审批按键
        table.on('tool(test)', function(obj){
            var data = obj.data;
            //console.log(obj)
            if(obj.event === 'edit'){
                //进入审批弹窗界面
              com(data.qno);
            }
        });
        var $ = layui.$, active = {
            reload: function(){
                var qapplytime = $('#test1');
                var qapplytime2 = $('#test2');
                var qstate = $('#state');
                var qname = $('#qname');
                //执行重载
                table.reload('testReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        "qapplytime":qapplytime.val(),
                        "qapplytime2":qapplytime2.val(),
                        "qstate": qstate.val(),
                        "qname":qname.val()
                    }
                }, 'data');
            }
        };

    //ajax返回return的
    function com(qno) {
        $.ajax({
            url:"<%=basePath%>kindergarten/qon.action",
            type: "POST",
            data:{qno: qno},
            success : function(Tblqualify){
                //审批弹窗
                layer.open({
                    type: 1
                    ,title: '园所审批'
                    ,closeBtn: false
                    ,area: '300px;'
                    ,shade: 0.8
                    ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                    ,btn: ['允许', '拒绝']
                    ,btnAlign: 'c'
                    ,moveType: 1 //拖拽模式，0或者1
                    ,content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">' +
                        '幼儿园名称:&nbsp;&nbsp;' +Tblqualify.qname+
                        '<br>' +
                        '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;法人:&nbsp;&nbsp;' +Tblqualify.qpeople+
                        '<br>' +
                        '法人身份证:&nbsp;&nbsp;' +Tblqualify.qidcard+
                        '<br>' +
                        '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;地址:&nbsp;&nbsp;' +Tblqualify.qadress+
                        '<br>' +
                        '&nbsp;&nbsp;&nbsp;联系电话:&nbsp;&nbsp;'+Tblqualify.qphone+
                        '<br>' +
                        '办学许可证:&nbsp;&nbsp;' +Tblqualify.qschool+
                        '<br>' +
                        '卫生许可证:&nbsp;&nbsp;' +Tblqualify.qheath+
                        '<br>' +
                        '消防许可证:&nbsp;&nbsp;' +Tblqualify.qfire+
                        '<br>' +
                        '组织代码证:&nbsp;&nbsp;' +Tblqualify.qorganize+
                        '<br>' +
                        '税务登记证:&nbsp;&nbsp;' +Tblqualify.qtax+
                        '<br>' +
                        '</div>'
                    ,btn1: function(index, layero){
                       //审批通过
                        approval(qno,2);
                        layer.close(index);
                        }
                   ,btn2: function(index, layero){
                        //审批未通过
                        approval(qno,3);
                   }
                });

            }
        });
    }
    //ajax返回return的
    function approval(qno,state) {
        $.ajax({
            url: "<%=basePath%>kindergarten/state.action",
            type: "POST",
            data:{qno: qno,
                qstate: state},
            success : function(res){
                //执行重载
                table.reload('testReload', {

                });
            }
        });
    }
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
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">审批</a>
</script>
<script type="text/html" id="qstate">
    {{#  if(d.qstate ==1){ }}
    未审批
    {{# }if(d.qstate ==2) { }}
    通过
    {{# }if(d.qstate ==3) { }}
    未通过
    {{#  } }}
</script>

</body>
</html>
