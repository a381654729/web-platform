<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

        <header class="main-header">
            <a href="blank" class="logo">
                    <span class="logo-mini"><b>HR</b></span>
                    <span class="logo-lg"><b>HiRain</b></span>
                </a>
            <nav class="navbar navbar-static-top">
                <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                        <span class="sr-only">切换导航栏</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>
                <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">
                        <li><a href="#" onclick="load();return false;"><i class="fa fa-user"></i> <shiro:principal/></a></li>
                        <li><a href="#" data-toggle="modal" data-target="#password-modal"><i class="fa fa-lock"></i> 修改密码</a></li>
                        <li><a href="logout"><i class="fa fa-sign-out"></i> 退出</a></li>
                    </ul>
                </div>
            </nav>
        </header>

        <div class="modal fade" id="info-modal" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">个人信息维护</h4>
                    </div>
                    <div class="modal-body">
                        <form role="form" id="info-form">
                            <input type="text" class="form-control" name="info-id" id="info-id" style="display: none">
                            <div class="form-group">
                                <label for="name">Name:</label>
                                <input type="text" class="form-control" name="info-name" id="info-name" required>
                            </div>
                            <div class="form-group">
                                <label for="address">地址</label>
                                <input type="text" class="form-control" name="info-address" id="info-address">
                            </div>
                            <div class="form-group">
                                <label for="email">Email:</label>
                                <input type="email" class="form-control" name="info-email" id="info-email">
                            </div>
                        </form>
                        <p id="info-error" style="color: red; text-align:center"></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" onclick="saveUser();">确定</button>
                        <button type="button" class="btn btn-dafault" data-dismiss="modal">取消</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="password-modal" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">个人信息维护</h4>
                    </div>
                    <div class="modal-body">
                        <form role="form" id="info-form">
                            <div class="form-group">
                                <label for="pwd-old">原 密码:</label>
                                <input type="password" class="form-control" name="pwd-old" id="pwd-old" required
                                    autofocus>
                            </div>
                            <div class="form-group">
                                <label for="pwd-old">新 密码:</label>
                                <input type="password" class="form-control" name="pwd-new" id="pwd-new" required>
                            </div>
                            <div class="form-group">
                                <label for="pwd-confirm">确认密码</label>
                                <input type="password" class="form-control" name="pwd-confirm" id="pwd-confirm" required>
                            </div>
                        </form>
                        <p id="pwd-error" style="color: red; text-align:center"></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" onclick="changePwd();">确定</button>
                        <button type="button" class="btn btn-dafault" data-dismiss="modal">取消</button>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $(function () {
                $('#info-modal').on('hidden.bs.modal', function () {
                    $('#info-id').val('');
                    $('#info-name').val('');
                    $('#info-address').val('');
                    $('#info-email').val('');
                    $('#info-error').html('');
                });
                $('#password-modal').on('hidden.bs.modal', function () {
                    $('#pwd-id').val('');
                    $('#pwd-new').val('');
                    $('#pwd-old').val('');
                    $('#pwd-confirm').val('');
                    $('#pwd-error').html('');
                })
            });
            function changePwd() {
                var newpwd = $('#pwd-new').val();
                var confirmpwd = $('#pwd-confirm').val();
                var oldpwd = $('#pwd-old').val();
                if (oldpwd == null || oldpwd == "") {
                    $('#pwd-error').html('原密码不能为空');
                    $('#pwd-old').focus();
                } else {
                    if (newpwd != confirmpwd) {
                        $('#pwd-error').html('新密码和确认密码不一致');
                        $('#pwd-confirm').focus();
                    } else {
                        var params = [
                            {
                                name: 'oldpwd',
                                value: $('#pwd-old').val()
                            },
                            {
                                name: 'newpwd',
                                value: $('#pwd-new').val()
                            }
                        ];
                        $.ajax({
                            type: 'post',
                            url: 'user/changePwd',
                            data: params,
                            success: function (rdata) {
                                if (rdata.result == "success") {
                                    $('#password-modal').modal('hide');
                                    location.href="logout";
                                } else {
                                    $('#pwd-error').html(rdata.msg);
                                }
                            }, error: function (rdata) {
                                $('#pwd-error').html('更新密码出错');
                            }
                        })
                    }
                }
            }
            function load() {
                $.ajax({
                    type: 'post',
                    url: "user/loginUser",
                    success: function (rdata) {
                        $('#info-id').val(rdata.id);
                        $('#info-name').val(rdata.username);
                        $('#info-address').val(rdata.address);
                        $('#info-email').val(rdata.email);
                        $("#info-modal").modal('show');
                    },
                    error: function (rdata) {
                        alert("获取用户信息出错");
                    }
                });
            }

            function saveUser() {
                var params = [{
                    name: 'id',
                    value: $('#info-id').val()
                },
                {
                    name: 'username',
                    value: $('#info-name').val()
                },
                {
                    name: 'address',
                    value: $('#info-address').val()
                },
                {
                    name: 'email',
                    value: $('#info-email').val()
                }
                ];
                $.ajax({
                    type: 'post',
                    url: 'user/update',
                    data: params,
                    success: function (rdata) {
                        if (rdata.result == "success") {
                            // $('#info-error').html("更新成功");
                            $('#info-modal').modal('hide');
                        } else if (rdata.result == "fail") {
                            $('#info-error').html(rdata.msg);
                        }
                    }, error: function (rdata) {
                        $('#info-error').html("更新个人信息出错");
                    }
                });
            }
        </script>