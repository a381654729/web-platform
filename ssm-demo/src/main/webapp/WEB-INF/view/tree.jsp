<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <DOCTYPE html>
    <html>

    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
        name="viewport">
      <%@include file="include/include.jsp"%>
        <script type="text/javascript" src="js/echarts/echarts-2.2.7.js"></script>
        <style type="text/css">
          .user-chart {
            height: 400px;
          }
        </style>
        <script type="text/javascript">
          $(function () {
            $("#tree").addClass('active');
            $("#tree").parent().parent().addClass('active');
            $("#tree").html('<a href="javascript:void(0);"><i class="fa fa-tree"></i> 树形结构</a>');
            loadTree();
          });

          function loadTree() {

            // 基于准备好的dom，初始化echarts图表

          }
        </script>
    </head>

    <body class="hold-transition skin-blue-light sidebar-mini">
      <div class="wrapper">
        <%@include file="include/header.jsp"%>
          <%@include file="include/sidebar.jsp"%>
            <div class="content-wrapper">
              <section class="content-header">
                <h2>树形结构</h2>
              </section>
              <section class="content">
                <div class="row">
                  <div class="col-md-6">
                    <div class="box">
                      <div class="box-header">
                        <h3 class="box-title">最简树形结构</h3>
                      </div>
                      <div class="box-body">
                        <div id="simple" class="user-chart">
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </section>
            </div>
            <%@include file="include/footer.jsp"%>
      </div>
      <script type="text/javascript">
          require.config({
            paths: {
              echarts: 'js/echarts'
            }
          });
          require([
            'echarts',
            'echarts/chart/tree'
          ], function (ec) {
            var myChart = ec.init(document.getElementById('simple'), 'macarons');

            var option = {
              title: {
                text: '树图',
                subtext: '虚构数据'
              },
              // toolbox: {
              //   show: true,
              //   feature: {
              //     mark: { show: true },
              //     dataView: { show: true, readOnly: false },
              //     restore: { show: true },
              //     saveAsImage: { show: true }
              //   }
              // },
              calculable: false,

              series: [
                {
                  name: '树图',
                  type: 'tree',
                  orient: 'vertical',  // vertical horizontal
                  rootLocation: { x: 'center', y: 50 }, // 根节点位置  {x: 100, y: 'center'}
                  nodePadding: 1,
                  itemStyle: {
                    normal: {
                      label: {
                        show: false,
                        formatter: "{b}"
                      },
                      // lineStyle: {
                      //   color: '#48b',
                      //   shadowColor: '#000',
                      //   shadowBlur: 3,
                      //   shadowOffsetX: 3,
                      //   shadowOffsetY: 5,
                      //   type: 'curve' // 'curve'|'broken'|'solid'|'dotted'|'dashed'

                      // }
                    },
                    emphasis: {
                      label: {
                        show: true
                      }
                    }
                  },

                  data: [
                    {
                      name: '根节点',
                      value: 6,
                      children: [
                        {
                          name: '节点1',
                          value: 4,
                          children: [
                            {
                              name: '叶子节点1',
                              value: 4
                            },
                            {
                              name: '叶子节点2',
                              value: 4
                            },
                            {
                              name: '叶子节点3',
                              value: 2
                            },
                            {
                              name: '叶子节点4',
                              value: 2
                            },
                            {
                              name: '叶子节点5',
                              value: 2
                            },
                            {
                              name: '叶子节点6',
                              value: 4
                            }
                          ]
                        },
                        {
                          name: '节点2',
                          value: 4,
                          children: [{
                            name: '叶子节点7',
                            value: 4
                          },
                          {
                            name: '叶子节点8',
                            value: 4
                          }]
                        },
                        {
                          name: '节点3',
                          value: 1,
                          children: [
                            {
                              name: '叶子节点9',
                              value: 4
                            },
                            {
                              name: '叶子节点10',
                              value: 4
                            },
                            {
                              name: '叶子节点11',
                              value: 2
                            },
                            {
                              name: '叶子节点12',
                              value: 2
                            }
                          ]
                        }
                      ]
                    }
                  ]
                }
              ]
            };
            myChart.setOption(option);
          });

          // 为echarts对象加载数据
      </script>
    </body>

    </html>