function tableInit() {
    $('table').bootstrapTable({
        url: 'user/getUser',
        method: 'get',
        dataType: 'json',
        sortable: false,
        queryParams: {},
        // toolbar: '#toolbar',                //工具按钮用哪个容器
        striped: true,                      //是否显示行间隔色
        pagination: true,                   //是否显示分页（*）
        sortable: false,                     //是否启用排序
        sidePagination: "client",           //分页方式：client客户端分页，server服务端分页（*）
        pageNumber: 1,                       //初始化加载第一页，默认第一页
        pageSize: 10,                       //每页的记录行数（*）
        pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
        minimumCountColumns: 2,             //最少允许的列数
        uniqueId: "id",                     //每一行的唯一标识，一般为主键列
        columns: [{
            checkbox: true
        }, {
            field: 'id',
            title: '序号'
        }, {
            field: 'name',
            title: '姓名'
        }, {
            field: 'address',
            title: '地址'
        }, {
            field: 'email',
            title: 'Email'
        },]
    });
}
function createAndUpdate() {
    var params = $("#newForm").serializeArray();
    $.ajax({
        type: 'POST',
        url: 'user/create',
        data: params,
        success: function (data) {
            $('#tb_user').bootstrapTable('refresh');
            $('#newUserModal').modal('hide');
        },
        error: function (data) {
            if (data['operate'] == 'update') {
                alert('修改用户错误');
            } else if (data['operate'] == 'create') {
                alert('新增用户错误');
            }
        }
    })
}

function load() {
    var currentRow = getSelection()[0];
    if (currentRow != null) {
        $('#newUserModal').modal('show');
        $("#userId").val(currentRow.id);
        $('#userName').val(currentRow.name);
        $('#userAddress').val(currentRow.address);
        $('#userEmail').val(currentRow.email);
    }
}

function getSelection() {
    return $.map($('#tb_user').bootstrapTable('getSelections'), function (row) {
        return row;
    });
}

function confirmDelete() {
    var userIds = getSelection();
    if (userIds.length == 0) {
        alert("请选择至少一个用户。")
    } else {
        $('#deleteUserModal').modal();
    }
}

function deleteUser() {
    var userIds = getSelection();
    $.each(userIds, function (index, data) {
        var postdata = { id: data.id };
        $.ajax({
            url: 'user/delete',
            type: 'post',
            data: postdata,
            cache: false,
            success: function (rdata) {
                if (rdata.result == 'success') {
                    $('#tb_user').bootstrapTable('refresh');
                } else {
                    alert('删除失败');
                }
                $('#deleteUserModal').modal('hide');
            },
            error: function (rdata) {
                alert('删除失败');
                $('#deleteUserModal').modal('hide');
            }
        });
    });
}

function deleteUser1() {
    var userIds = getSelection();
    if (userIds.length == 0) {
        bootbox.alert("请选择至少一个用户。");
    } else {
        bootbox.confirm({
            message: "确认要删除这些用户吗？",
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
                    $.each(userIds, function (index, data) {
                        var postdata = { id: data.id };
                        $.ajax({
                            url: 'user/delete',
                            type: 'post',
                            data: postdata,
                            cache: false,
                            success: function (rdata) {
                                if (rdata.result == 'success') {
                                    $('#tb_user').bootstrapTable('refresh');
                                } else {
                                    bootbox.alert("删除失败");
                                }
                            },
                            error: function (rdata) {
                                bootbox.alert("删除失败");
                            }
                        });
                    });
                }
            }
        });
    }
}

$(function () {
    tableInit();

    $("#newUserModal").on("hidden.bs.modal", function () {
        $("#newForm input").val("");
    });

    // $('#warning').alert('close');
}); 