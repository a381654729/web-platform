<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <!DOCTYPE html>
    <html>

    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
        name="viewport">
      <%@include file="include/include.jsp"%>
        <script type="text/javascript" src="js/plugins/echarts.js"></script>
        <script type="text/javascript" src="js/plugins/world.js"></script>
        <style type="text/css">
          .user-chart {
            height: 300px;
          }
        </style>
    </head>

    <body class="hold-transition skin-blue-light sidebar-mini">
      <div class="wrapper">
        <%@include file="include/header.jsp"%>
          <%@include file="include/sidebar.jsp"%>
            <div class="content-wrapper">
              <section class="content-header">
                <h2>动态添加</h2>
              </section>
              <section class="content">
                <div class="row">
                  <div class="col-md-4">
                    <div class="box">
                      <div class="box-header">
                        <h3 class="box-title">图1</h3>
                      </div>
                      <div class="box-body">
                        <div id="chart1" class="user-chart">
                          <button type="button" class="btn btn-default btn-flat" onclick="addChart('chart1')">选择图形</button>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-4">
                    <div class="box">
                      <div class="box-header">
                        <h3 class="box-title">图2</h3>
                      </div>
                      <div class="box-body">
                        <div id="chart2" class="user-chart">
                          <button type="button" class="btn btn-default btn-flat" onclick="addChart('chart2')">选择图形</button>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-4">
                    <div class="box">
                      <div class="box-header">
                        <h3 class="box-title">图3</h3>
                      </div>
                      <div class="box-body">
                        <div id="chart2" class="user-chart">
                          <button type="button" class="btn btn-default btn-flat" onclick="addChart('chart3')">选择图形</button>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </section>
            </div>
            <%@ include file="include/footer.jsp"%>
      </div>
      <div id="addchart-modal" class="modal fade" role="dialog">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">添加图表</h4>
            </div>
            <div class="modal-body">
              <input type="text" class="form-control" name="chart-id" id="chart-id" style="display: none">
              <label>图形类型</label>
              <select id="chart-type" name="chart-type" class="form-control">
                <option>折线图</option>
                <option>柱状图</option>
                <option>饼状图</option>
              </select>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-primary" onclick="perform()">确定</button>
              <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
          </div>
        </div>
      </div>
      <script type="text/javascript">
        $(function(){
          $('#dchart').addClass('active');
          $('#dchart').parent().parent().addClass('active');
          $('#dchart').html('<a href="javascript:void(0)"><i class="fa fa-line-chart"></i> 动态添加</a>')
        });

        function addChart(id){
          $('#chart-id').val(id);
          $('#addchart-modal').modal('show');
        }
        function perform(){
          var chartId=$('#chart-id').val();
          var chartType=$('#chart-type').val();
        }
      </script>
    </body>

    </html>