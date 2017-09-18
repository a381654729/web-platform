<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <DOCTYPE html>
    <html lang="zh-CN">

    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">

      <title>map demo</title>
      <%@include file="include/include.jsp"%>

      <link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css"/>
      <link rel="stylesheet" href="http://cache.amap.com/lbs/static/AMap.DrivingRender1120.css"/>

      <!-- <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"> 
      <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
      <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->

      <script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=7af59470b18b37f2812eb19b00a1cf14&plugin=AMap.Autocomplete,AMap.PlaceSearch,AMap.Geocoder,AMap.Driving"></script>
      <script type="text/javascript" src="http://cache.amap.com/lbs/static/DrivingRender1230.js"></script>
      <script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>


      <script src="http://webapi.amap.com/ui/1.0/main.js?v=1.0.10"></script>
      
      <script type="text/javascript">
          $(function () {
            $("#map").addClass('active');
            $("#map").parent().parent().addClass('active');
            $("#map").html('<a href="javascript:void(0);"><i class="fa fa-map"></i> 地图展示</a>');
            loadMap();
          });

          function loadMap() {

            // 基于准备好的dom，初始化echarts图表

          }
        </script>

      

      <!-- CSS样式 -->
      <style type="text/css">
     
         
         .row{
             margin-right:15px;
             margin-left:15px;
             
         }
         
         .col-sm-8{
             position:relative;
             padding-right:15px;
             padding-left:15px;
         }
         
         #container{
             max-width:900px;
             height:450px; 
         }


         #tipinput,#Latitude,#Longitude{
            width: 100px;
         }

         .marker {
            color: #ff6600;
            padding: 4px 10px;
            border: 1px solid #fff;
            white-space: nowrap;
            font-size: 12px;
            font-family: "";
            background-color: #0066ff;
         }
      </style>
    </head>


    <body class="hold-transition skin-blue-light sidebar-mini">
      <div class="wrapper">
        <%@include file="include/header.jsp"%>
          <%@include file="include/sidebar.jsp"%>
            <div class="content-wrapper">
              <section class="content-header">
                <h2>地图监控</h2>
              </section>
              <section class="content">
                <div class="row">
                  <div class = "box" style="height:500px">
                  
                    <div class="box-body">
                      <div class="col-sm-8"> 
                        <div id="container" ></div>
                      </div>

                      <div class="col-sm-4">
                        <form role="form">
                          <div class="form-group">
                            <label>请输入关键字：</label>
                            <input id="tipinput"/>

                            <input type="text" readonly="true" value=" 左击地图得到经纬信息" id="lnglat"><br/>
                            <span>地址：</span><span id="result1" ></span>
                          </div>

                          <div>
                            <input id="Longitude" placeholder="经度" type="text" />
                            <input id="Latitude" placeholder="纬度"  type="text" /><br/>
                            <input type="button" value="地址:" onclick="regeocoder2()"/>
                            <span id="result2"></span>
                          </div>

                          <div>
                            <input type="button" class="button" value="添加点标记" id="addMarker"/>
                            <input type="button" class="button" value="撤销点标记" id="undoMarker"/>
                            <input type="button" class="button" value="删除点标记" id="clearMarker"/>
                          </div>

                          <div id="time1"></div> 
                        </form>       
                      </div>
                    </div>
                  </div>  
                </div>
              </section>
            </div>
            <%@include file="include/footer.jsp"%>
      </div>

      <script type="text/javascript">
        // 建立地图
        var map = new AMap.Map('container', {
          resizeEnable: true,
          zoom: 7
        });

        // 地图上的控制插件
        AMap.plugin(['AMap.ToolBar','AMap.Scale','AMap.OverView'],
          function(){
            map.addControl(new AMap.ToolBar());
            map.addControl(new AMap.Scale());
            map.addControl(new AMap.OverView({isOpen:true}));
          });

        //在对话框里输入信息时，匹配产生结果
        var autoOptions = {city: "", //城市，默认全国
          input: "tipinput"
        };

        var auto = new AMap.Autocomplete(autoOptions);
        var placeSearch = new AMap.PlaceSearch({
          map: map
        });  //构造地点查询类

        AMap.event.addListener(auto, "select", select);//注册监听，当选中某条记录时会触发
        function select(e) {
          placeSearch.setCity(e.poi.adcode);
          placeSearch.search(e.poi.name);  //关键字查询查询
        }

        //全局的经纬度坐标
        var lng;
        var lat;

        //为地图注册click事件获取鼠标点击出的经纬度坐标并且读出地址信息
        var clickEventListener = map.on('click', function(e) {
          document.getElementById("lnglat").value = e.lnglat.getLng() + ',' + e.lnglat.getLat();

          lng=e.lnglat.getLng();
          lat=e.lnglat.getLat();

          lnglatXY1 = [ lng,lat]; //已知点坐标

          //逆地理编码
          var geocoder = new AMap.Geocoder({
            radius: 1000,
            extensions: "all"
          });        

          geocoder.getAddress(lnglatXY1, function(status, result) {
              if (status === 'complete' && result.info === 'OK') {
                  geocoder_CallBack1(result);
              }
          });        
          
     
          function geocoder_CallBack1(data) {
          var address = data.regeocode.formattedAddress; //返回地址描述
          document.getElementById("result1").innerHTML = address;
          }
        });

        //根据对话框里输入的经纬度来获取地址
        function regeocoder2() {  //逆地理编码
        lng=parseFloat(document.getElementById("Longitude").value);
        lat=parseFloat(document.getElementById("Latitude").value);
        lnglatXY2 = [lng, lat]; 
        var geocoder = new AMap.Geocoder({
          radius: 1000,
          extensions: "all"
        });        
        geocoder.getAddress(lnglatXY2, function(status, result) {
          if (status === 'complete' && result.info === 'OK') {
              geocoder_CallBack2(result);
          }
        });        
     
        map.setFitView();
        }
        function geocoder_CallBack2(data) {
        var address = data.regeocode.formattedAddress; //返回地址描述
        document.getElementById("result2").innerHTML = address;
        }



        // 定义五个坐标点坐标
        var lnglats = [
        [121.461658,31.203519],
        [114.309558,30.609665],
        [104.0703,30.590752],
        [116.418933,39.850824],
        [103.718738,36.040324]
        ];
        var num=0;
        var markers = [];
        var infoWindows = [];

       

        // 根据上面的坐标信息画坐标点
        AMapUI.loadUI(['overlay/SimpleInfoWindow'], function(SimpleInfoWindow) {
        for (var i = 0, marker; i < lnglats.length; i++) {

          var infoWindow = new SimpleInfoWindow({

            infoTitle: '<strong>列车'+(num+1)+'</strong>',
            infoBody: '<div style="width:350px"><table style="font-size:90%"><tr><td><strong>基本信息:</strong></td></tr><tr><td>车厢车号：</td><td>123</td><td>&nbsp&nbsp配属局段: </td><td>上海</td><td>&nbsp&nbsp司机号: </td><td>5507927</td></tr><tr><td>司机名：</td><td>吕布'+(num+1)+'</td><td>&nbsp&nbsp联系方式: </td><td>————</td></tr><tr><td><strong>实时信息:</strong></td></tr><tr><td>车次：</td><td>123</td><td>&nbsp&nbsp速度: </td><td>300km/h</td><td>&nbsp&nbsp公里标: </td><td>K4287+008</td></tr><tr><td>客货/本补：</td><td>客/本</td><td>&nbsp&nbsp车站号: </td><td>8</td><td>&nbsp&nbsp交路号: </td><td>17</td></tr><tr><td>总重：</td><td>991t</td><td>&nbsp&nbsp计长: </td><td>200m</td><td>&nbsp&nbsp辆数: </td><td>17</td></tr><tr><td><strong>通道状态:</strong></td><td>3G</td></tr></table><span id="time1"></span><span style="width:75px; float:right;"><p style="color:green">》更多信息</p></span></div>',


            //基点指向marker的头部位置
            offset: new AMap.Pixel(0, -31)
          });

          var marker = new AMap.Marker({
            icon: 'http://webapi.amap.com/theme/v1.3/markers/n/mark_b'+(num+1)+'.png',
            position: lnglats[i],
            map: map,
            title:'train'+(num+1),
          });

          marker.infoWin=infoWindow;
          AMap.event.addListener(marker, 'click', function(e){
              this.infoWin.open(map, this.getPosition());
          });

          markers.push(marker);
          infoWindows.push(infoWindow);
          num++;

          map.setFitView();
        };           
        });


        // 添加点标记的按钮函数
        AMap.event.addDomListener(document.getElementById('addMarker'), 'click', function() {
          addMarker();
        }, false);
        // 撤销上一个点标记
        AMap.event.addDomListener(document.getElementById('undoMarker'), 'click', function() {
        if(num>0){
        
            markers[num-1].setMap(null);
            infoWindows[num-1].setMap(null);
            num--;
        }
        else if(num==0){
            
            num=0;}
            
        }, false);
        //清除所有点标记
        AMap.event.addDomListener(document.getElementById('clearMarker'), 'click', function() {
        map.remove(markers);
        map.remove(infoWindows);
        num=0;
        }, false);



        // 实例化点标记
  
        function addMarker() {
        AMapUI.loadUI(['overlay/SimpleInfoWindow'], function(SimpleInfoWindow) {      
          var infoWindow = new SimpleInfoWindow({
              infoTitle: '<strong>列车'+(num+1)+'</strong>',
              infoBody: '<div style="width:350px"><table style="font-size:90%"><tr><td><strong>基本信息:</strong></td></tr><tr><td>车厢车号：</td><td>123</td><td>&nbsp&nbsp配属局段: </td><td>上海</td><td>&nbsp&nbsp司机号: </td><td>5507927</td></tr><tr><td>司机名：</td><td>吕布'+(num+1)+'</td><td>&nbsp&nbsp联系方式: </td><td>————</td></tr><tr><td><strong>实时信息:</strong></td></tr><tr><td>车次：</td><td>123</td><td>&nbsp&nbsp速度: </td><td>300km/h</td><td>&nbsp&nbsp公里标: </td><td>K4287+008</td></tr><tr><td>客货/本补：</td><td>客/本</td><td>&nbsp&nbsp车站号: </td><td>8</td><td>&nbsp&nbsp交路号: </td><td>17</td></tr><tr><td>总重：</td><td>991t</td><td>&nbsp&nbsp计长: </td><td>200m</td><td>&nbsp&nbsp辆数: </td><td>17</td></tr><tr><td><strong>通道状态:</strong></td><td>3G</td></tr></table><span id="time1"></span><span style="width:75px; float:right;"><p style="color:green">》更多信息</p></span></div>',


              //基点指向marker的头部位置
              offset: new AMap.Pixel(0, -31)
            });
          var marker = new AMap.Marker({
            icon: 'http://webapi.amap.com/theme/v1.3/markers/n/mark_b'+(num+1)+'.png',
            position: [lng,lat],
            map: map,
            title:'train'+(num+1),
            clickable:true,
          });

          marker.infoWin=infoWindow;
          AMap.event.addListener(marker, 'click', function(e){
            this.infoWin.open(map, this.getPosition());
          });

          markers[num] = marker;
          infoWindows[num] = infoWindow;
          num++;
          map.setFitView();
        });
        }


        //显示时间
        function mytime(){
        var a = new Date();
        var b = a.toLocaleTimeString();
        var c = a.toLocaleDateString();
        document.getElementById("time1").innerHTML = c+"&nbsp"+b;
        }
        setInterval(function() {mytime()},1000);
      </script>     

    </body>

    </html>