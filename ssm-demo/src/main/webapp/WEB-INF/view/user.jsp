<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
            <%@include file="include/include.jsp"%>
                <link rel="stylesheet" href="css/bootstrap-table.css" type="text/css">
                <link rel="stylesheet" href="css/select2.min.css type="text/css">
                <script src="js/plugins/bootstrap-table.js"></script>
                <script src="js/plugins/bootstrap-table-zh-CN.js"></script>
                <script src="js/plugins/bootbox.js"></script>
                <script src="js/plugins/select2.min.js"></script>
                <title>
                    用户管理
                </title>
                <script>
                    $(function () {
                        $("#user").addClass("active");
                        $("#user").parent().parent().addClass("active");
                        tableInit();
                        $("#newUserModal").on("hidden.bs.modal", function () {
                            $("#newForm input").val("");
                        });
                    });
                    function tableInit() {
                        $('#tb_user').bootstrapTable({
                            url: 'user/getUser',
                            method: 'get',
                            dataType: 'json',
                            sortable: false,
                            queryParams: {},
                            // toolbar: '#toolbar',                //工具按钮用哪个容器
                            striped: true,                      //是否显示行间隔色
                            pagination: true,                   //是否显示分页（*）
                            sidePagination: "client",           //分页方式：client客户端分页，server服务端分页（*）
                            pageNumber: 1,                       //初始化加载第一页，默认第一页
                            pageSize: 10,                       //每页的记录行数（*）
                            pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
                            minimumCountColumns: 2,             //最少允许的列数
                            uniqueId: "id",                     //每一行的唯一标识，一般为主键列
                            columns: [{
                                checkbox: true
                            }, {
                                field: 'id',
                                title: '序号'
                            }, {
                                field: 'username',
                                title: '姓名'
                            }, {
                                field: 'address',
                                title: '地址'
                            }, {
                                field: 'email',
                                title: 'Email'
                            },
                            {
                                field: 'roleList',
                                title: '角色组',
                                formatter: function (value, row, index) {
                                    var str = "";
                                    if (JSON.stringify(value) != '[]') {
                                        for (var i = 0; i < value.length; i++) {
                                            str = str + value[i].cname + ',';
                                        }
                                        str = str.substr(0, str.length - 1);
                                    }
                                    return str;
                                }
                            },]
                        });
                    }
                    function createAndUpdate() {
                        var params = $("#newForm").serializeArray();
                        $.ajax({
                            type: 'POST',
                            url: 'user/create',
                            data: params,
                            success: function (data) {
                                $('#newUserModal').modal('hide');
                                $('#tb_user').bootstrapTable('refresh');
                            },
                            error: function (data) {
                                if (data['operate'] == 'update') {
                                    alert('修改用户错误');
                                } else if (data['operate'] == 'create') {
                                    alert('新增用户错误');
                                }
                            }
                        })
                    }

                    function load() {
                        var currentRow = getSelection()[0];
                        if (currentRow != null) {
                            $('#newUserModal').modal('show');
                            $("#userId").val(currentRow.id);
                            $('#userName').val(currentRow.username);
                            $('#userAddress').val(currentRow.address);
                            $('#userEmail').val(currentRow.email);
                        } else {
                            bootbox.alert("请选择至少一个用户。");
                        }
                    }

                    function getSelection() {
                        return $.map($('#tb_user').bootstrapTable('getSelections'), function (row) {
                            return row;
                        });
                    }

                    function confirmDelete() {
                        var userIds = getSelection();
                        if (userIds.length == 0) {
                            alert("请选择至少一个用户。");
                        } else {
                            $('#deleteUserModal').modal();
                        }
                    }

                    function deleteUser() {
                        var userIds = getSelection();
                        if (userIds.length == 0) {
                            bootbox.alert("请选择至少一个用户。");
                        } else {
                            bootbox.confirm({
                                message: "确认要删除这些用户吗？",
                                buttons: {
                                    // bootbox默认cancel在左，confirm在右，这和windows系统的使用习惯相反
                                    cancel: {
                                        label: '确定',
                                        className: 'btn-primary'
                                    },
                                    confirm: {
                                        label: '取消',
                                        className: 'btn-default'
                                    }
                                },
                                callback: function (result) {
                                    if (!result) {
                                        $.each(userIds, function (index, data) {
                                            var postdata = { id: data.id };
                                            $.ajax({
                                                url: 'user/delete',
                                                type: 'post',
                                                data: postdata,
                                                cache: false,
                                                success: function (rdata) {
                                                    if (rdata.result == 'success') {
                                                        $('#tb_user').bootstrapTable('refresh');
                                                    } else {
                                                        bootbox.alert("删除失败");
                                                    }
                                                },
                                                error: function (rdata) {
                                                    bootbox.alert("删除失败");
                                                }
                                            });
                                        });
                                    }
                                }
                            });
                        }
                    }
                </script>
        </head>

        <body class="hold-transition skin-blue-light sidebar-mini">
            <div class="wrapper">
                <%@include file="include/header.jsp"%>
                    <%@include file="include/sidebar.jsp"%>
                        <div class="content-wrapper">
                            <section class="content-header">
                                <h2>用户管理</h2>
                            </section>
                            <section class="content">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="box">
                                            <div class="box-header">
                                                <h3 class="box-title">用户列表</h3>
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
                                                    <table id="tb_user" class="table table-bordered table-hover">
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>

                        <%@include file="include/footer.jsp"%>

                            <div id="newUserModal" class="modal fade" role="dialog">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">新增用户</h4>
                                        </div>
                                        <div class="modal-body">
                                            <form role="form" id="newForm" onsubmit="submit()">
                                                <input type="text" class="form-control" name="id" id="userId" style="display: none">
                                                <div class="form-group">
                                                    <label for="name">Name:</label>
                                                    <input type="text" class="form-control" name="username" id="userName" placeholder="请输入姓名">
                                                </div>
                                                <div class="form-group">
                                                    <label for="address">Address:</label>
                                                    <input type="text" class="form-control" name="address" id="userAddress" placeholder="住址">
                                                </div>
                                                <div class="form-group">
                                                    <label for="email">Email:</label>
                                                    <input type="email" class="form-control" name="email" id="userEmail" placeholder="Email">
                                                </div>
                                                <div class="form-group">
                                                    <label>角色配置</label>
                                                    <select class="form-control select2" multiple="multiple">
                                                        <option>test</option>
                                                        <option>test2</option>
                                                    </select>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-primary" onclick="createAndUpdate()">确定</button>
                                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
            </div>
        </body>

        </html>