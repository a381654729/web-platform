<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <DOCTYPE html>
    <html>

    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
        name="viewport">
      <%@include file="include/include.jsp"%>
        <script type="text/javascript" src="js/plugins/echarts.js"></script>
        <script type="text/javascript" src="js/plugins/world.js"></script>
        <script type="text/javascript" src="js/chart.js"></script>
        <style type="text/css">
          .user-chart {
            height: 400px;
          }

        </style>
    </head>

    <body class="hold-transition skin-blue-light sidebar-mini">
      <div class="wrapper">
        <%@include file="include/header.jsp"%>
          <%@include file="include/sidebar.jsp"%>
            <div class="content-wrapper">
              <section class="content-header">
                <h2>图形展示</h2>
              </section>
              <section class="content">
                <div class="row">
                  <div class="col-md-6">
                    <div class="box">
                      <div class="box-header">
                        <h3 class="box-title">柱状图</h3>
                      </div>
                      <div class="box-body">
                        <!-- <button type="button" class="btn btn-default btn-flat" onclick="loadBar()">显示图形</button> -->
                        <div id="bar" class="user-chart">
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="box">
                      <div class="box-header">
                        <h3 class="box-title">饼状图</h3>
                      </div>
                      <div class="box-body">
                        <!-- <button type="button" class="btn btn-default btn-flat" onclick="loadPie()">显示图形</button> -->
                        <div id="pie" class="user-chart">
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="box">
                      <div class="box-header">
                        <h3 class="box-title">折线图</h3>
                      </div>
                      <div class="box-body">
                        <!-- <button type="button" class="btn btn-default btn-flat" onclick="loadLine()">显示图形</button> -->
                        <div id="line" class="user-chart">
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="box">
                      <div class="box-header">
                        <h3 class="box-title">地图</h3>
                      </div>
                      <div class="box-body">
                        <!-- <button type="button" class="btn btn-default btn-flat" onclick="loadMap()">显示图形</button> -->
                        <div id="map" class="user-chart">
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="box">
                      <div class="box-header">
                        <h3 class="box-title">仪表盘</h3>
                      </div>
                      <div class="box-body">
                        <!-- <button type="button" class="btn btn-default btn-flat" onclick="loadGauge()">显示图形</button> -->
                        <div id="gauge" class="user-chart">
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="box">
                      <div class="box-header">
                        <h3 class="box-title">阶梯图</h3>
                      </div>
                      <div class="box-body">
                        <!-- <button type="button" class="btn btn-default btn-flat" onclick="loadStep()">显示图形</button> -->
                        <div id="step" class="user-chart">
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