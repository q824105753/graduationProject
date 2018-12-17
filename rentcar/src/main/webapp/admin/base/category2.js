$(function () {

    function queryC2() {
        $('#c2tbl tr:not(:first)').remove();
        $.post("/c2List", {}, function (data) {
            $.each(data.c2list, function (idx, obj) {
                var tr = "<tr>" +
                    "<td>" + (idx + 1) + "</td>" +
                    "<td>" + obj.c2name + "</td>" +
                    "<td>" +
                    "<a href='#' class='btn btn-info delbtn2' data-c2id='" + obj.c2id + "'>删除</a>&nbsp;&nbsp;" +
                    "<a href='#' class='btn btn-default loadbtn2' data-c2id='" + obj.c2id + "'>编辑</a>" +
                    "</td>" +
                    "</tr>";
                $('#c2tbl').append(tr);
            });
        }, 'json');

    }

    $('#c2link').click(function (event) {
        event.preventDefault();
        $(".page-inner").load(this.href, null, function () {
            //等Category2.jsp加载完毕后取出数据
            queryC2();

            //绑定二级分类添加按钮
            $('#addc2btn').click(function () {
//                    $('#c2name').prop('value', "");
                $('#c2fm')[0].reset();
                $('#myModal2').modal('show');
                //加载一级分类
                loadc1();
            });

            $('#c2tbl').delegate('a.delbtn2', 'click', function (event) {
                event.preventDefault();
                $.post("/delc2", {c2id: $(event.target).data('c2id')}, function (data) {
                    if (data.row > 0) {
                        alert("删除二级分类成功");
                        queryC2();
                    } else {
                        alert("删除二级分类失败");
                    }
                }, 'json');
            });


            $('#c2tbl').delegate('a.loadbtn2', 'click', function (event) {
                //根据C2ID把一条记录取出来显示到表单中
                $.post('/loadc2', {c2id: $(event.target).data('c2id')}, function (data) {
                    $('#c2fm')[0].reset();
                    $('#c2name').val(data.category2.c2name);
                    $('#c2id').val(data.category2.c2id);
                    $('#myModal2').modal('show');
                }, 'json');
            });


            $('#submintc2').click(function () {

                if ("" == $('#c2id').val()) {    //判断c2id是否有值
                    $.post('/insertc2', $('#c2fm').serialize(), function (data) {  //如果没有值执行添加操作


                        if (data.row > 0) {
                            alert("添加二级分类成功");
                            $('#myModal2').modal('hide');
                            queryC2();
                        } else {
                            alert("添加二级分类失败");
                        }
                    }, 'json');
                } else {
                    $.post('/updatec2', $('#c2fm').serialize(), function (data) {  //如果有值执行修改操作
                        if (data.row > 0) {
                            alert("修改二级分类成功");
                            $('#myModal2').modal('hide');
                            queryC2();
                        } else {
                            alert("修改二级分类失败");
                        }
                    }, 'json');
                }
            });
        });
    });
})