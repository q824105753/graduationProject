$(function () {
    function queryC1() {
        $('#c1tbl tr:not(:first)').remove();
        $.post("/c1List", {}, function (data) {
            $.each(data.c1list, function (idx, obj) {
                var tr = "<tr>" +
                    "<td>" + (idx + 1) + "</td>" +
                    "<td>" + obj.c1name + "</td>" +
                    "<td>" + "<a href='#' class='btn btn-info delbtn1' data-c1id='" + obj.c1id + "'>删除</a>&nbsp;&nbsp;" +
                    "" + "<a href='#' class='btn btn-default loadbtn1' data-c1id='" + obj.c1id + "'>编辑</a>" + "</td>" +
                    "</tr>";
                $('#c1tbl').append(tr);
            });
            	
        }, 'json');
    }


    $('#c1link').click(function (event) {
        event.preventDefault();  //阻止默认行为
        $('.page-inner').load(this.href, null, function () {      //把URL中的内容取出来放到指定选择器中
            queryC1();

            $('#addc1btn').click(function () {
                $('#c1fm')[0].reset();
                $('#myModal1').modal('show');
            });


            $('#c1tbl').delegate('a.delbtn1', 'click', function (event) {
                event.preventDefault;
                $.post('/delc1', {c1id: $(event.target).data('c1id')}, function (data) {
                    if (data.row > 0) {
                        alert("删除一级分类成功");
                        queryC1();
                    } else {
                        alert("删除一级分类失败");
                    }
                }, 'json');
            });

            $('#c1tbl').delegate('a.loadbtn1', 'click', function (event) {
                event.preventDefault;
                $.post('/loadc1', {c1id: $(event.target).data('c1id')}, function (data) {
                	console.log("---------"+data.c1id);
                    $('#c1id').val(data.category1.c1id);
                    $('#c1name').val(data.category1.c1name);
                    $('#myModal1').modal('show');
                }, 'json');
            });

           
            $('#submintc1').click(function () {
                console.log($('#c1id').val());
                if ("" == $('#c1id').val()) {
                    $.post('/insertc1', $('#c1fm').serialize(), function (data) {
                        if (data.row > 0) {
                            alert("添加一级分类成功");
                            $('#myModal1').modal('hide');
                            queryC1();
                        } else {
                            alert("添加一级分类失败");
                        }
                    }, 'json');
                } else {
                    $.post('/updatec1', $('#c1fm').serialize(), function (data) {
                        if (data.row > 0) {
                            alert("修改一级分类成功");
                            $('#myModal1').modal('hide');
                            queryC1();
                        } else {
                            alert("修改一级分类失败");
                        }
                    }, 'json');
                }
            });


        },'json');
    });
})