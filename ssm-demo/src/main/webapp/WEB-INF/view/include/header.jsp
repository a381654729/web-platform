<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
        <!DOCTYPE html>
        <html>

        <body>
            <header class="main-header">
                <a href="#" class="logo">
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
                            <li><a href="logout"><i class="fa fa-sign-out"></i> 退出</a></li>
                        </ul>
                    </div>
                </nav>
            </header>

            <!-- <div class="userInfoModal" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">修改个人信息</h4>
                        </div>
                        <div class="modal-body">
                            <form role="form" id="userInfo" onsubmit="submit()">
                                <input type="text" class="form-control" name="id" id="id" style="display: none">
                                <div class="form-group">
                                    <label for="name">姓名：</label>
                                    <input type="text" class="form-control" name="username" id="username">
                                </div>
                                <div class="form-group">
                                    <label for="password">密码：</label>
                                    <input type="password" class="form-control" name="password" id="password">
                                </div>
                                <div class="form-group">
                                    <label for="confirm">确认密码：</label>
                                    <input type="password" class="form-control" name="confirm" id="confirm">
                                </div>
                                <div class="form-group">
                                    <label for="address">Address:</label>
                                    <input type="text" class="form-control" name="address" id="userAddress" placeholder="住址">
                                </div>
                                <div class="form-group">
                                    <label for="email">Email:</label>
                                    <input type="email" class="form-control" name="email" id="userEmail" placeholder="Email">
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" onclick="update()">确定</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        </div>
                    </div>
                </div>
            </div> -->

        </body>

        </html>