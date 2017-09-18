<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
        name="viewport">
      <%@include file="include/include.jsp"%>
        <link rel="stylesheet" href="css/bootstrap-table.css" type="text/css">
        <script src="js/plugins/bootstrap-table.js"></script>
        <script src="js/plugins/bootstrap-table-zh-CN.js"></script>
        <script src="js/plugins/bootbox.js"></script>
        <title>
          权限管理
        </title>
        <script>
          $(function () {
            $('#shiro').addClass("active");
            $("#shiro").parent().parent().addClass("active");
            $("#shiro").html('<a href="javascript:void(0)"><i class="fa fa-user-secret"></i> 权限管理</a>');
            tableInit();

            $('#add-modal').on('hidden.bs.modal', function () {
              $('#add-form input').val("");
              $('#add-form textarea').val("");
              $('#tb_permission').bootstrapTable('destroy');
            });

            $('#update-modal').on('hidden.bs.modal', function () {
              $('#update-form input').val("");
              $('#update-form textarea').val("");
              $('#tb_update').bootstrapTable('uncheckAll'); 
            });
          });
          function tableInit() {
            $('#tb_role').bootstrapTable({
              url: 'role/getRole',
              method: 'get',
              dataType: 'json',
              sortable: false,
              queryParams: {},
              striped: true,
              pagination: true,                   //是否显示分页（*）
              sidePagination: "client",           //分页方式：client客户端分页，server服务端分页（*）
              pageNumber: 1,                       //初始化加载第一页，默认第一页
              pageSize: 10,                       //每页的记录行数（*）
              pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
              minimumCountColumns: 2,             //最少允许的列数
              uniqueId: "id",
              columns: [
                {
                  radio: true
                },
                {
                  field: 'cname',
                  title: '角色名称',
                  width: 100
                },
                {
                  field: 'description',
                  title: '备注',
                },
                {
                  field:'permissionList',
                  title:'拥有权限',
                  formatter:function(value,row,index){
                    var str="";
                    if(JSON.stringify(value)!='[]'){
                      for(var i=0;i<value.length;i++){
                        str=str+value[i].cname+',';
                      }
                      str=str.substr(0,str.length-1);
                    }
                    return str;
                  }
                }
              ]
            });
            $('#tb_update').bootstrapTable({
              url: 'role/getPermission',
              method: 'get',
              dataType: 'json',
              sortable: false,
              queryParams: {},
              striped: false,
              pagination: false,
              uniqueId: 'id',
              columns: [
                {
                  checkbox: true
                },
                {
                  field: 'id',
                  title: '序号',
                },
                {
                  field: 'cname',
                  title: '权限名称',
                },
                {
                  field: 'description',
                  title: '备注'
                }
              ]
            });
          }
          function addRole() {
            $('#tb_permission').bootstrapTable({
              url: 'role/getPermission',
              method: 'get',
              dataType: 'json',
              sortable: false,
              queryParams: {},
              striped: true,
              pagination: false,
              uniqueId: 'id',
              columns: [
                {
                  checkbox: true
                },
                {
                  field: 'id',
                  title: '序号',
                },
                {
                  field: 'cname',
                  title: '权限名称',
                },
                {
                  field: 'description',
                  title: '备注'
                }
              ]
            });
            $('#add-modal').modal('show');
          }

          function updateRole() {
            $('#update-modal').modal('show');
            var rows = getSelection($('#tb_role'));
            $('#update-form #id').val(rows[0].id);
            $('#update-form #cname').val(rows[0].cname);
            $('#update-form #description').val(rows[0].description);

            // $('#tb_update').bootstrapTable('check', 0);
            $.ajax({
              url: 'role/getPermissionOfRole',
              type: 'post',
              data: { 'id': rows[0].id },
              dataType: 'json',
              async: false,
              success: function (rdata) {
                if(rdata){
                  for(var i=0;i< rdata.length;i++){
                    $('#tb_update').bootstrapTable('checkBy',{field:'id',values: [rdata[i]]});
                  }
                }
              }
            });

          }


          function add() {
            var rows = getSelection($('#tb_permission'));
            var str = "";
            for (var i = 0; i < rows.length; i++) {
              str = str + rows[i].id + ",";
            }
            str = str.substring(0, str.length - 1);
            $('#permissionId').val(str);

            var params = $('#add-form').serializeArray();
            $.ajax({
              type: 'post',
              url: 'role/create',
              data: params,
              success: function (rdata) {
                $('#add-modal').modal('hide');
                $('#tb_role').bootstrapTable('refresh');
              },
              error: function (rdata) {
                alert('新增角色出错');
              }
            });
          }

          function update(){
            var rows=getSelection($('#tb_update'));
            var str="";
            for(var i=0;i<rows.length;i++){
              str=str+rows[i].id+",";
            }
            str=str.substring(0,str.length-1);
            $('#update-form #permissionId').val(str);
            var params=$('update-form').serializeArray();
            $.ajax({
              type:'post',
              url:'role/update',
              data:params,
              success:function(rdata){
                $('#update-modal').modal('hide');
                $('#tb_role').bootstrapTable('refresh');
              },
              error:function(rdata){
                alert('更新角色出错');
              }
            })
          }

          function getSelection($table) {
            return $.map($table.bootstrapTable('getSelections'), function (row) {
              return row;
            });
          }

          function deleteRole() {
            var rows = getSelection($('#tb_role'));
            if (rows.length > 0) {
              bootbox.confirm({
                message: '确认要删除这些角色吗?',
                buttons: {
                  // bootbox默认cancel在左，confirm在右，这和windows系统的使用习惯相反
                  cancel: {
                    label: '确定',
                    className: 'btn-primary'
                  },
                  confirm: {
                    label: '取消',
                    className: 'btn-default'
                  }
                },
                callback: function (result) {
                  if (!result) {
                    $.each(rows, function (index, data) {
                      var postdata = { id: data.id };
                      $.ajax({
                        type: 'post',
                        url: 'role/delete',
                        data: postdata,
                        success: function (rdata) {
                          if (rdata.result == 'success') {
                            $('#tb_role').bootstrapTable('refresh');
                          } else {
                            bootbox.alert("删除失败");
                          }
                        },
                        error: function (rdata) {
                          bootbox.alert(rdata.responseText);
                        }
                      });
                    });
                  }
                }
              });
            } else {
              bootbox.alert("请至少选择一个角色");
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
                <h2>权限管理</h2>
              </section>
              <section class="content">
                <div class="row">
                  <div class="col-xs-12">
                    <div class="box">
                      <div class="box-header">
                        <h3 class="box-title">权限组列表</h3>
                      </div>
                      <div class="box-body">
                        <div class="text-center">
                          <shiro:hasPermission name="add">
                            <button type="button" class="btn btn-primary btn-flat" onclick="addRole()">新增</button>
                          </shiro:hasPermission>
                          <shiro:hasPermission name="update">
                            <button type="button" class="btn btn-warning btn-flat" onclick="updateRole()">修改</button>
                          </shiro:hasPermission>
                          <shiro:hasPermission name="del">
                            <button type="button" class="btn btn-danger btn-flat" onclick="deleteRole()">删除</button>
                          </shiro:hasPermission>
                        </div>
                        <p></p>
                        <div>
                          <table id="tb_role" class="table table-bordered table-hover">
                          </table>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </section>
            </div>
            <%@include file="include/footer.jsp"%>
              <div id="add-modal" class="modal fade" role="dialog">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                      <h4>新增用户角色</h4>
                    </div>
                    <div class="modal-body">
                      <form role="form" id="update-form">
                        <input type="text" class="form-control" name="id" id="roleId" style="display: none">
                        <div class="form-group">
                          <label for="name">Name:</label>
                          <input type="text" class="form-control" name="cname" id="cname" required>
                        </div>
                        <div class="form-group">
                          <label for="description">备注:</label>
                          <textarea class="form-control" rows="3" name="description" id="description"></textarea>
                        </div>
                        <input type="text" class="form-control" name="permissionId" id="permissionId" style="display: none">
                      </form>
                      <div class="text-center" style="height: 200px">
                        <table id="tb_permission" class="table table-bordered table-hover">
                        </table>
                      </div>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-primary" onclick="add()">确定</button>
                      <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    </div>
                  </div>
                </div>
              </div>

              <div id="update-modal" class="modal fade" role="dialog">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                      <h4>更新用户角色</h4>
                    </div>
                    <div class="modal-body">
                      <form role="form" id="update-form">
                        <input type="text" class="form-control" name="id" id="roleId" style="display: none">
                        <div class="form-group">
                          <label for="name">Name:</label>
                          <input type="text" class="form-control" name="cname" id="cname">
                        </div>
                        <div class="form-group">
                          <label for="description">备注:</label>
                          <textarea class="form-control" rows="3" name="description" id="description"></textarea>
                        </div>
                        <input type="text" class="form-control" name="permissionId" id="permissionId" style="display: none">
                      </form>
                      <div class="text-center" style="height: 200px">
                        <table id="tb_update" class="table table-bordered table-hover">
                        </table>
                      </div>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-primary" onclick="update()">确定</button>
                      <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    </div>
                  </div>
                </div>
              </div>
      </div>

    </body>

    </html>