<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

  <head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" >
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/ionicons.min.css">
    <link rel="stylesheet" type="text/css" href="css/AdminLTE.min.css">
    <link rel="stylesheet" type="text/css" href="css/_all-skins.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  </head>

  <body class="hold-transition login-page">
    <div class="login-box">
      <div class="login-logo">
        <a href="#"><b>Hirain</b></a>
      </div>

      <div class="login-box-body">
        <p class="login-box-msg">请登录</p>

        <form action="login" method="post">
          <div class="form-group has-feedback">
            <input type="text" class="form-control" id="username" name="username" placeholder="用户名">
            <span class="fa fa-user form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <input type="password" class="form-control" id="password" name="password" autocomplete = "new-password" placeholder="密码">
            <span class="fa fa-lock form-control-feedback"></span>
          </div>
          <div class="row">
            <div class="col-xs-8">
            </div>
            <div class="col-xs-4">
              <button type="submit" class="btn btn-primary btn block btn-flat">登录</button>
            </div>
          </div>
          <c:if test="${msg!=null}">
				<p style="color: red; text-align:center">${msg}</p>
			</c:if>	
        </form>
      </div>
	</div>
  </body>

</html>