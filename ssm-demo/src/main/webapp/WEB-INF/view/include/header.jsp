<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

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
