<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>

    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
        name="viewport">
      <%@include file="include/include.jsp"%>
        <script type="text/javascript" src="js/plugins/echarts.js"></script>
        <script>
          $(function () {
            $('#ontime').addClass('active');
            $('#ontime').parent().parent().addClass('active');
            $('#ontime').html('<a href="javascript:void(0)"><i class="fa fa-balance-scale"></i> 实时监控</a>');
            // load();
            // realtime();
          });
          var timeId;
          function stop(){
            clearInterval(timeId);
          }
          function loadLine() {
            var myChart = echarts.init(document.getElementById('data'));
            var names = [];
            var scores = [];
            myChart.showLoading();
            timeId=setInterval(function () {
              var lastData=[]
              if(names.length>0){
                lastData={
                  'time':names[names.length-1],
                  'value':scores[names.length - 1],
                };
              }
              $.ajax({
                type: 'POST',
                async: true,
                url: 'chart/realtime',
                data:lastData,
                dataType:'json',
                success: function (rdata) {
                  if (rdata) {
                    for (var i = 0; i < rdata.length; i++) {
                      if(names.length>200){
                        names.shift();
                        scores.shift();
                      }
                      names.push(rdata[i].time);
                      scores.push(Math.round(rdata[i].value));
                    }
                    myChart.hideLoading();
                    myChart.setOption({
                      title: {
                        text: '折线图',
                        x: 'center'
                      },
                      tooltip: {
                        trigger: 'axis',
                      },
                      legend: {
                        orient: 'vertical',
                        x: 'left',
                        data: ['成绩']
                      },
                      xAxis: {
                        data: names,
                        splitLine: {
                          show: false
                        }
                      },
                      yAxis: {
                        type: 'value',
                        boundaryGap: [0, '100%'],
                        splitLine: {
                          show: false
                        },
                      },
                      series: [{
                        name: '成绩',
                        type: 'line',
                        stack: '总量',
                        data: scores
                      }]
                    });
                  }
                }
              });
            }, 1000);
          }





          var data1 = [];
          var now = +new Date(1997, 9, 3);
          var oneDay = 24 * 3600 * 1000;
          var value = Math.random() * 1000;
          for (var i = 0; i < 1000; i++) {
            data1.push(randomData());
          }
          function load() {

            var myChart = echarts.init(document.getElementById('data-flow'));
            myChart.setOption({
              title: {
                text: '动态数据 + 时间坐标轴'
              },
              tooltip: {
                trigger: 'axis',
                formatter: function (params) {
                  params = params[0];
                  var date = new Date(params.name);
                  return date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear() + ' : ' + params.value[1];
                },
                axisPointer: {
                  animation: false
                }
              },
              xAxis: {
                type: 'time',
                splitLine: {
                  show: false
                }
              },
              yAxis: {
                type: 'value',
                boundaryGap: [0, '100%'],
                splitLine: {
                  show: false
                }
              },
              series: [{
                name: '模拟数据',
                type: 'line',
                showSymbol: false,
                hoverAnimation: false,
                data: data1
              }]
            });

            setInterval(function () {
              for (var i = 0; i < 5; i++) {
                data1.shift();
                data1.push(randomData());
              }
              myChart.setOption({
                series: [{
                  data: data1
                }]
              });
            }, 1000);
          }

          function randomData() {
            now = new Date(+now + oneDay);
            value = value + Math.random() * 21 - 10;
            return {
              name: now.toString(),
              value: [
                [now.getFullYear(), now.getMonth() + 1, now.getDate()].join('/'),
                Math.round(value)
              ]
            }
          }
        </script>
    </head>

    <body class="hold-transition skin-blue-light sidebar-mini">
      <div class="wrapper">
        <%@include file="include/header.jsp"%>
          <%@include file="include/sidebar.jsp"%>
            <div class="content-wrapper">
              <section class="content-header">
                <h2>实时监控</h2>
              </section>
              <section class="content">
                <div class="row">
                  <div class="col-xs-12">
                    <div class="box">
                      <div class="box-header">
                        <h3 class="box-title">实时获取后台数据</h3>
                      </div>
                      <div class="box-body">
                        <button type="button" class="btn btn-primary btn-flat" onclick="loadLine()">开始监控</button>
                        <button type="button" class="btn btn-danger btn-flat" onclick="stop()">停止监控</button>
                        <div id="data" style="height: 400px">
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-xs-12">
                    <div class="box">
                      <div class="box-header">
                        <h3 class="box-title">数据实时监控</h3>
                      </div>
                      <div class="box-body">
                        <div id="data-flow" style="height: 400px">
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </section>
            </div>
      </div>
      <%@include file="include/footer.jsp"%>
    </body>

    </html>