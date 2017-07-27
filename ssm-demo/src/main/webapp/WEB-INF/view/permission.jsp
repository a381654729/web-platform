<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
    <html>

    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
      <%@include file="include/include.jsp"%>
        <link rel="stylesheet" href="css/bootstrap-table.css" type="text/css">
        <script src="js/plugins/bootstrap-table.js"></script>
        <script src="js/plugins/bootstrap-table-zh-CN.js"></script>
        <script src="js/plugins/bootbox.js"></script>
        <title>
          权限管理
        </title>
        <script>
          $(function () {
            $('#shiro').addClass("active");
            $("#shiro").parent().parent().addClass("active");
            tableInit();
          });
          function tableInit() {
            $('#tb_role').bootstrapTable({
              url: 'role/getRole',
              method: 'get',
              dataType: 'json',
              sortable: false,
              queryParams: {},
              striped: true,
              pagination: true,                   //是否显示分页（*）
              sidePagination: "client",           //分页方式：client客户端分页，server服务端分页（*）
              pageNumber: 1,                       //初始化加载第一页，默认第一页
              pageSize: 10,                       //每页的记录行数（*）
              pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
              minimumCountColumns: 2,             //最少允许的列数
              uniqueId: "id",
              columns: [
                {
                  checkbox: true
                },
                {
                  field: 'cname',
                  title: '角色名称',
                  width: 100
                },
                {
                  field: 'description',
                  title: '备注',
                  width: 200
                }
              ]
            });
          }
        </script>
    </head>

    <body class="hold-transition skin-blue-light sidebar-mini">
      <div class="wrapper">
        <%@include file="include/header.jsp"%>
          <%@include file="include/sidebar.jsp"%>
            <div class="content-wrapper">
              <section class="content-header">
                <h2>权限管理</h2>
              </section>
              <section class="content">
                <div class="row">
                  <div class="col-xs-12">
                    <div class="box">
                      <div class="box-header">
                        <h3 class="box-title">权限组列表</h3>
                      </div>
                      <div class="box-body">
                        <div class="text-center">
                          <shiro:hasPermission name="add">
                            <button type="button" class="btn btn-primary btn-flat" data-toggle="modal" data-target="#newUserModal">新增</button>
                          </shiro:hasPermission>
                          <shiro:hasPermission name="update">
                            <button type="button" class="btn btn-warning btn-flat" onclick="load()">修改</button>
                          </shiro:hasPermission>
                          <shiro:hasPermission name="del">
                            <button type="button" class="btn btn-danger btn-flat" onclick="deleteUser()">删除</button>
                          </shiro:hasPermission>
                        </div>
                        <p></p>
                        <div>
                          <table id="tb_role" class="table table-bordered table-hover">
                          </table>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </section>
            </div>
            <%@include file="include/footer.jsp"%>
      </div>
    </body>

    </html>