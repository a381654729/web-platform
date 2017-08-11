var rchart;
var data = [];
function realtime() {
  rchart = echarts.init(document.getElementById('data'));
  var options = {
    title: {
      text: '动态数据 + 时间坐标轴'
    },
    tooltip: {
      trigger: 'axis',
      formatter: function (params) {
        params = params[0];
        return params.name + ": " + params.value[1];
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
      data: data
    }]
  };
  rchart.setOption(options);
  setInterval('getData();', 1000);
}

function getData() {
  var options = rchart.getOption();
  $.ajax({
    type: 'POST',
    async: false,
    url: 'chart/realtime',
    data: {},
    dataType: 'json',
    success: function (rdata) {
      for (var i = 0; i < rdata.length; i++) {
        data.shift();
        data.push({
          name: rdata[i].date,
          vaule: [
            rdata[i].date,
            Math.round(rdata[i].value)
          ]
        });
      }
      rchart.setOption({
        series: [{
          data: data
        }]
      });
    },
    error: function (rdata) {
    }
  });
}
