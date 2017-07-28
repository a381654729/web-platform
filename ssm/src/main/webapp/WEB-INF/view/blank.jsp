<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/ionicons.min.css">
        <link rel="stylesheet" href="css/AdminLTE.min.css">
        <link rel="stylesheet" href="css/_all-skins.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    </head>

    <body class="hold-transition skin-blue-light sidebar-mini">
        <div class="wrapper">
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
                            <li><a href="#"><i class="fa fa-user"></i> 个人信息</a></li>
                            <li><a href="#"><i class="fa fa-sign-out"></i> 退出</a></li>
                        </ul>
                    </div>
                </nav>
            </header>

            <aside class="main-sidebar">
                <section class="sidebar">
                    <ul class="sidebar-menu" data-widget="tree">
                        <li class="header">导航栏</li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-cogs"></i> <span>系统管理</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li id="user"><a href="user.jsp"><i class="fa fa-users"></i> 用户管理</a></li>
                                <li><a href="#"><i class="fa fa-user-secret"></i> 权限管理</a></li>
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-calculator"></i> <span>计算模块</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="#"><i class="fa fa-balance-scale"></i> 模型计算</a></li>
                                <li><a href="#"><i class="fa  fa-cubes"></i> 工况计算</a></li>
                                <li><a href="#"><i class="fa fa-database"></i> 数据管理</a></li>
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-area-chart"></i> <span>图形展示</span>
                            </a>
                        </li>
                    </ul>
                </section>
            </aside>
            <div class="content-wrapper">
                <section class="content-header" id="mainContainer">
                </section>
            </div>
            <footer class="main-footer">
                <div class="pull-right hidden-xs">
                    <b>Version</b> 1.0.0
                </div>
                <strong>Copyright &copy; 1998-2017 <a href="http://www.hirain.com" target="_blank">Hirain</a>.</strong> All
                right reserved.
            </footer>
        </div>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.slimscroll.min.js"></script>
        <script src="js/plugins/fastclick.js"></script>
        <script src="js/adminlte.min.js"></script>
        <script src="js/demo.js"></script>
        <script src="js/blank.js"></script>
    </body>

</html>