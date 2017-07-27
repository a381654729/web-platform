<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/bootstrap-table.css" type="text/css">
        <link rel="stylesheet" href="css/index.css" type="text/css">
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/plugins/bootstrap-table.js"></script>
        <script src="js/plugins/bootstrap-table-zh-CN.js"></script>
        <script src="js/plugins/bootbox.js"></script>
        <script src="js/index.js"></script>
        <script type="text/javascript">
            
        </script>
    </head>

    <body>
        <!--导航栏-->
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand">恒润科技</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#"><span class="glyphicon glyphicon-user"/> 个人信息</a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-log-out"/> 登出</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container-fluid">
            <div class="row">
                <!--侧边栏-->
                <div class="col-sm-2">
                    <ul class="nav nav-pills nav-stacked text-center">
                        <li class="active"><a data-toggle="pill" href="#">用户管理</a></li>
                        <li><a data-toggle="pill" href="#">权限管理</a></li>
                    </ul>
                </div>
                <div class="col-sm-10">
                    <div class="panel panel-default panel-primary">
                        <div class="panel-heading">用户管理</div>
                        <!--操作区-->
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-sm-1">
                                </div>
                                <div class="col-sm-9">
                                    <div class="btn-group" id="toolbar">
                                        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#newUserModal">新增</button>
                                        <button type="button" class="btn btn-warning" onclick="load()">修改</button>
                                        <button type="button" class="btn btn-danger" onclick="deleteUser1()">删除</button>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-sm-1">
                                </div>
                                <div class="col-sm-8">
                                    <table id="tb_user" class="table table-bordered">
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--版权区-->
            <footer class="container-fluid text-center">
                <label>Copyright 1998-2017 by <a href="http://www.hirain.com">Hirain</a> All Rights Resered.</label>
            </footer>
           
            <div id="deleteUserModal" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-body">
                            <h5>确认要删除这些用户吗？</h5>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" onclick="deleteUser()">确定</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        </div>
                    </div>
                </div>
            </div>

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
                                    <input type="text" class="form-control" name="name" id="userName" placeholder="请输入姓名">
                                </div>
                                <div class="form-group">
                                    <label for="address">Address:</label>
                                    <input type="text" class="form-control" name="address" id="userAddress" placeholder="住址">
                                </div>
                                <div class="form-group">
                                    <label for="email">Email:</label>
                                    <input type="email" class="form-control" name="email" id="userEmail"placeholder="Email">
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

            <div class="alert alert-warning hide" id="warning">
                <a href="#" class="close" data-dismiss="alert" arial-label="close">&times;</a>
                <strong>警告;</strong>请选择至少一行进行删除
            </div>
    </body>

</html>