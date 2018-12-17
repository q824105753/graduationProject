$(function () {
    function queryUser() {
        $('#usertbl tr:not(:first)').remove();
        $.post("/userList", {}, function (data) {
            $.each(data.ulist, function (idx, obj) {
                var tr = "<tr>" +
                    "<td>" + (idx + 1) + "</td>" +
                    "<td>" + obj.uname + "</td>" +
                    "<td>" + obj.password + "</td>" +
                    "<td>" + obj.realname + "</td>" +
                    "<td>" + obj.idnumber + "</td>" +
                    "<td>" + obj.utel + "</td>" +
                    "<td>" + "<a href='#' class='btn btn-info delbtn1' data-uid='" + obj.uid + "'>删除</a>&nbsp;&nbsp;" +
                    "" + "<a href='#' class='btn btn-default loadbtn1' data-uid='" + obj.uid + "'>编辑</a>" + "</td>" +
                    "</tr>";
                $('#usertbl').append(tr);
            });
            	
        }, 'json');
    }


    $('#userlink').click(function (event) {
        event.preventDefault();  //阻止默认行为
        $('.page-inner').load(this.href, null, function () {      //把URL中的内容取出来放到指定选择器中
        	queryUser();

            $('#adduserbtn').click(function () {
                $('#userfm')[0].reset();
                $('#myModal').modal('show');
            });


            $('#usertbl').delegate('a.delbtn1', 'click', function (event) {
                event.preventDefault;
                $.post('/deluser', {uid: $(event.target).data('uid')}, function (data) {
                    if (data.row > 0) {
                        alert("删除用户成功");
                        queryUser();
                    } else {
                        alert("删除用户失败");
                    }
                }, 'json');
            });

            $('#usertbl').delegate('a.loadbtn1', 'click', function (event) {
                event.preventDefault;
                $.post('/loaduser', {uid: $(event.target).data('uid')}, function (data) {
                    $('#uid').val(data.user.uid);
                    $('#uname').val(data.user.uname);
                    $('#password').val(data.user.password);
                    $('#realname').val(data.user.realname);
                    $('#idnumber').val(data.user.idnumber);
                    $('#utel').val(data.user.utel);
                    $('#myModal').modal('show');
                }, 'json');
            });

           
            $('#submintuser').click(function () {
                if ("" == $('#uid').val()) {
                    $.post('/insertuser', $('#userfm').serialize(), function (data) {
                        if (data.row > 0) {
                            alert("添加用户成功");
                            $('#myModal').modal('hide');
                            queryUser();
                        } else {
                            alert("添加用户失败");
                        }
                    }, 'json');
                } else {
                    $.post('/updateuser', $('#userfm').serialize(), function (data) {
                        if (data.row > 0) {
                            alert("修改用户成功");
                            $('#myModal').modal('hide');
                            queryUser();
                        } else {
                            alert("修改用户失败");
                        }
                    }, 'json');
                }
            });


        },'json');
    });
})