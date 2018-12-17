$(function () {

    function loaduser(uid) {    //加载用户
        $.post("/userList", {}, function (data) {
            $('#uid').prop('length', 1);
            $.each(data.ulist, function (idx, obj) {
                $('#uid').append("<option value='" + obj.uid + "'>" + obj.uname + "</option>");
            });
            $('#uid').val(uid);   //把传过来的uid让他被选中状态
            
        }, 'json');
    };
    
    function loadcar(cid) {    //加载车辆
        $.post("/carList", {}, function (data) {
            $('#cid').prop('length', 1);
            $.each(data.clist, function (idx, obj) {
                $('#cid').append("<option value='" + obj.cid + "'>" + obj.cname + "</option>");
            });
            $('#cid').val(cid);   //把传过来的cid让他被选中状态
        }, 'json');
    };

    function queryOrder() {
        $('#ordertbl tr:not(:first)').remove();
        $.post("/orderList", {"pagecount":$('#pagecount').val()}, function (data) {
            $.each(data.olist.dataList, function (idx, obj) {
                var tr = "<tr>" +
                    "<td>" + (idx + 1) + "</td>" +
                    "<td>" + obj.user.uname + "</td>" +
                    "<td>" + obj.car.cname + "</td>" +
                    "<td>" + (obj.oflag == 1 ? "已付款" : "未付款") + "</td>" +
                    "<td>" + obj.otime + "</td>" +
                    "<td>" + obj.begin + "</td>" +
                    "<td>" + obj.end + "</td>" +
                    "<td>" + obj.totalprice + "</td>" +
                    "<td>" + obj.note + "</td>" +
                    "<td>" +
                    "<a href='#' class='btn btn-info delbtn2' data-oid='" + obj.oid + "'>删除</a>&nbsp;&nbsp;" +
//                    "<a href='#' class='btn btn-default loadbtn2' data-oid='" + obj.oid + "'>编辑</a>" +
                    "</td>" +
                    "</tr>";
                $('#ordertbl').append(tr);
                $('#pagecount').prop("value",data.olist.currentPage);//设置页面上pagecount控件的value值为当前页面的页数
                pagemax = data.olist.totalPage;//设置一个全局变量页数的最大值供之后使用
                console.log(pagemax+"+++++++++++");
                console.log($('#pagecount').val());
            });

        }, 'json');

    }

    $('#orderlink').click(function (event) {
        event.preventDefault();
        $(".page-inner").load(this.href, null, function () {
            //等Category2.jsp加载完毕后取出数据
        	queryOrder();

            //绑定二级分类添加按钮
            $('#addorderbtn').click(function () {
//                    $('#c2name').prop('value', "");
                $('#orderfm')[0].reset();
                $('#myModal').modal('show');
                //加载
                loaduser();
                loadcar();
            });

            $('#ordertbl').delegate('a.delbtn2', 'click', function (event) {
                event.preventDefault();
                $.post("/delorder", {oid: $(event.target).data('oid')}, function (data) {
                    if (data.row > 0) {
                        alert("删除订单成功");
                        queryOrder();
                    } else {
                        alert("删除订单失败");
                    }
                }, 'json');
            });


            $('#ordertbl').delegate('a.loadbtn2', 'click', function (event) {
                //根据C2ID把一条记录取出来显示到表单中
                $.post('/loadorder', {oid: $(event.target).data('oid')}, function (data) {
                    $('#orderfm')[0].reset();
                    loaduser(data.order.uid);
                    loadcar(data.order.cid);
                    $('input[name=oflag][value=' + data.order.oflag + ']').attr('checked', "checked");
                    $('#otime').val(data.order.otime1);
                    $('#begin').val(data.order.begin1);
                    $('#end').val(data.order.end1);
                    $('#totalprice').val(data.order.totalprice);
                    $('#note').val(data.order.note);
                    $('#oid').val(data.order.oid);
                    $('#myModal').modal('show');
                }, 'json');
            });

          
            $('#submintorder').click(function () {

                if ("" == $('#oid').val()) {    //判断是否有值
                    $.post('/insertorder', $('#orderfm').serialize(), function (data) {  //如果没有值执行添加操作
                    	if (data.row > 0) {
                            alert("添加订单成功");
                            $('#myModal').modal('hide');
                            queryOrder();
                        } else {
                            alert("添加订单失败");
                        }
                    }, 'json');
                } else {
                    $.post('/updateorder', $('#orderfm').serialize(), function (data) {  //如果有值执行修改操作
                        if (data.row > 0) {
                            alert("修改订单成功");	
                            $('#myModal').modal('hide');
                            queryOrder();
                        } else {
                            alert("修改订单失败");
                        }
                    }, 'json');
                }
                
              
                
            });
            
          //分页
            $('#first').click(function () {  //显示首页的一个点击事件
             	$('#pagecount').prop("value",1);   //设置pagecount控件的value值为1
             	queryOrder();   //并且再查询列表
            })
            $('#before').click(function () {  //上一页
            	//判断pagecount控件的value值是否为1  
                if ($('#pagecount').prop("value") == 1) {  
                	$('#pagecount').prop("value",1);  //如果等于1 设置pagecount控件的value值为1
                } else {
                	//否则，设置pagecount控件的value值为当前页数减1
                	$('#pagecount').prop("value",(Number)($('#pagecount').prop("value"))-1);
                }
                queryOrder();
            })
            $('#later').click(function () {  //下一页
            	//判断pagecount控件的value值是否为总页数
                if ($('#pagecount').prop("value") == pagemax) {  
                	$('#pagecount').prop("value",pagemax);//如果等于最大页数，设置pagecount控件的value值为总页数
                } else {
                	//否则，设置pagecount控件的value值为当前页数加1
                	$('#pagecount').prop("value",(Number)($('#pagecount').prop("value"))+1);
                }
                queryOrder();
            })
            $('#last').click(function () {  //尾页
            	$('#pagecount').prop("value",pagemax);//设置pagecount控件的value值为总页数
            	queryOrder();
            })
            
        });
    });
})