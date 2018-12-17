$(function () {
	
	
	
	/*function loadc1(c1id) {    //加载一级分类
        $.post("/c1List", {}, function (data) {
            $('#c1id').prop('length', 1);    //清空一下下拉列表
            $.each(data.c1list, function (idx, obj) {  //遍历传过来的的集合
            	//给下拉列表赋值  value为c1id  显示的文字为c1的名称
                $('#c1id').append("<option value='" + obj.c1id + "'>" + obj.c1name + "</option>");  
            });
            $('#c1id').val(c1id);   //把传过来的c1id让他被选中状态
        }, 'json');
    };
    
    function loadc2(c2id) {    //加载二级分类
        $.post("/c2List", {}, function (data) {
            $('#c2id').prop('length', 1);
            $.each(data.c2list, function (idx, obj) {
                $('#c2id').append("<option value='" + obj.c2id + "'>" + obj.c2name + "</option>");
            });
            $('#c2id').val(c2id);   //把传过来的c2id让他被选中状态
            
        }, 'json');
    };*/
	
    function queryDelCar() {//显示车辆
        $('#cardeltbl tr:not(:first)').remove();  //让整个列表除了第一行的表头都删除  重新加载数据
        //用ajkx的方式显示数据   参数为页面上pagecount控件的value值
        $.post("/carDelList", {"pagecount":$('#pagecount').val()}, function (data) {
            $.each(data.clist.dataList, function (idx, obj) {//遍历传过来的集合
            	//拼接数据
                var tr = "<tr>" +      
                    "<td>" + (idx + 1) + "</td>" +
                    "<td>" + obj.cname + "</td>" +
                    "<td>" + obj.c1.c1name + "</td>" +
                    "<td>" + obj.c2.c2name + "</td>" +
                    "<td>" + obj.platenumber + "</td>" +
                    "<td>" + obj.buytime + "</td>" +
                    "<td>" + (obj.cflag == 1 ? "租赁中" : "空闲") + "</td>" +
                    "<td>" + obj.price + "</td>" +
                    "<td><img src="+ obj.carimg +" width='80px' height='50px'></td>" +
                    "<td>" + (obj.isdel == 1 ? "是" : "否") + "</td>" +
                    "<td>" + "<a href='#' class='btn btn-info delbtn1' data-cid='" + obj.cid + "'>删除</a>&nbsp;&nbsp;" +
                    "" + "<a href='#' class='btn btn-default resetbtn1' data-cid='" + obj.cid + "'>恢复</a>" + "</td>" +
                    "</tr>";
                $('#cardeltbl').append(tr);//让拼好的数据加到页面上table上
                $('#pagecount').prop("value",data.clist.currentPage);//设置页面上pagecount控件的value值为当前页面的页数
                pagemax = data.clist.totalPage;//设置一个全局变量页数的最大值供之后使用
            });
        }, 'json');
    }

    $('#cardellink').click(function (event) {//点击页面上的按钮的一个事件
        event.preventDefault();  //阻止默认行为
        $('.page-inner').load(this.href, null, function () {      //把URL中的内容取出来放到指定选择器中
        	queryDelCar();   //显示数据
        	/*$('#addcarbtn').click(function () {  // 添加按钮的事件
        		 $('#carfm')[0].reset();   //清空整个form表单中的数据
        		 $('#myModal').modal('show');    //显示模态框
              //加载一级 二级分类的下拉列表
        		 loadc1();
        		 loadc2();
        	 });*/


            $('#cardeltbl').delegate('a.delbtn1', 'click', function (event) { //委托事件
                event.preventDefault;   //阻止默认行为
                //用ajkx的方式   参数为 cid
                $.post('/delcar', {cid: $(event.target).data('cid')}, function (data) {
                    if (data.row > 0) {   //如果传过来的row大于0 则显示删除成功 并且在查询一遍车辆列表
                        alert("删除车辆成功");
                        queryDelCar();
                    } else {
                        alert("删除车辆失败");//如果传过来的row不大于0 则显示删除失败
                    }
                }, 'json');
            });

            $('#cardeltbl').delegate('a.resetbtn1', 'click', function (event) {   //委托事件
                event.preventDefault;   //阻止默认行为
              //用ajkx的方式   参数为 cid
                $.post('/resetDelcar', {cid: $(event.target).data('cid')}, function (data) {
                	if (data.row > 0) {   //如果传过来的row大于0 则显示恢复成功 并且在查询一遍车辆列表
                        alert("恢复车辆成功");
                        queryDelCar();
                    } else {
                        alert("恢复车辆失败");//如果传过来的row不大于0 则显示恢复失败
                    }
                }, 'json');
            });

           
            /*$('#submintcar').click(function () { //提交按钮的事件
                if ("" == $('#cid').val()) {  //判断cid是否有值  如果没有值 就添加   有值就是修改
                	//用ajkx的请求方式   参数为 整个form表单
                    $.post('/insertcar', $('#carfm').serialize(), function (data) { 
                    	//判断传过来的row如果大于0 则显示添加成功 并且隐藏模态框 再查询一次车辆列表
                        if (data.row > 0) { 
                            alert("添加车辆成功");
                            $('#myModal').modal('hide');
                            queryDelCar();
                        } else {
                            alert("添加车辆失败");
                        }
                    }, 'json');
                } else {
                    $.post('/updatecar', $('#carfm').serialize(), function (data) {
                        if (data.row > 0) {
                            alert("修改车辆成功");
                            $('#myModal').modal('hide');
                            queryDelCar();
                        } else {
                            alert("修改车辆失败");
                        }
                    }, 'json');
                }
            });*/
            
            //分页
            $('#first').click(function () {  //显示首页的一个点击事件
             	$('#pagecount').prop("value",1);   //设置pagecount控件的value值为1
            	queryDelCar();   //并且再查询车辆列表
            })
            $('#before').click(function () {  //上一页
            	//判断pagecount控件的value值是否为1  
                if ($('#pagecount').prop("value") == 1) {  
                	$('#pagecount').prop("value",1);  //如果等于1 设置pagecount控件的value值为1
                } else {
                	//否则，设置pagecount控件的value值为当前页数减1
                	$('#pagecount').prop("value",(Number)($('#pagecount').prop("value"))-1);
                }
                queryDelCar();
            })
            $('#later').click(function () {  //下一页
            	//判断pagecount控件的value值是否为总页数
                if ($('#pagecount').prop("value") == pagemax) {  
                	$('#pagecount').prop("value",pagemax);//如果等于最大页数，设置pagecount控件的value值为总页数
                } else {
                	//否则，设置pagecount控件的value值为当前页数加1
                	$('#pagecount').prop("value",(Number)($('#pagecount').prop("value"))+1);
                }
                queryDelCar();
            })
            $('#last').click(function () {  //尾页
            	$('#pagecount').prop("value",pagemax);//设置pagecount控件的value值为总页数
            	queryDelCar();
            })
            

        },'json');
    });
})