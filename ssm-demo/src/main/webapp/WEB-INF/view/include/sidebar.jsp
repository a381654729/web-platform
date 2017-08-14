 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
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
                            <shiro:hasPermission name="query"><li id="shiro"><a href="permission"><i class="fa fa-user-secret"></i> 权限管理</a></li></shiro:hasPermission>
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
                            <li id="ontime"><a href="ontime"><i class="fa fa-balance-scale"></i> 实时监控</a></li>
                            <li id="tree"><a href="tree"><i class="fa fa-tree"></i> 树形结构</a></li>
                            <!-- <li><a href="#"><i class="fa fa-database"></i> 数据管理</a></li> -->
                        </ul>
                    </li>
                    <!-- <li id="chart">
                        <a href="chart">
                                <i class="fa fa-area-chart"></i> <span>图形展示</span>
                            </a>
                    </li> -->
                    <li class="treeview">
                        <a href="#">
                            <i class="fa fa-area-chart"></i> <span>图形展示</span>
                            <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li id="chart"><a href="chart"><i class="fa fa-pie-chart"></i> 基本图形</a></li>
                            <li id="dchart"><a href="dchart"><i class="fa fa-line-chart"></i> 动态添加</a></li>
                        </ul>
                    </li>
                </ul>
            </section>
        </aside>