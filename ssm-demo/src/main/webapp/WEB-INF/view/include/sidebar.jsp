<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
    <!DOCTYPE html">
    <html>
    <head>
    </head>

    <body>
        <aside class="main-sidebar">
            <section class="sidebar">
                <ul class="sidebar-menu" data-widget="tree">
                    <li class="header">导航栏</li>
                    <shiro:hasRole name="admin">
                    <li class="treeview">
                        <a href="#">
                                <i class="fa fa-cogs"></i> <span>系统管理</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                        <ul class="treeview-menu">
                            <shiro:hasPermission name="query"><li id="user"><a href="user"><i class="fa fa-users"></i> 用户管理</a></li></shiro:hasPermission>
                            <li><a href="#"><i class="fa fa-user-secret"></i> 权限管理</a></li>
                        </ul>
                    </li>
                    </shiro:hasRole>
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
    </body>

    </html>