<%@page pageEncoding="UTF-8" contentType="text/html; utf-8" %>

<h2>用户列表
    <button class="btn btn-info" data-target="#myModal" id="adduserbtn">添加</button>
</h2>


<table class="table table-bordered table-striped" id="usertbl">
    <tr>
        <th>序号</th>
        <th>用户名</th>
        <th>密码</th>
        <th>真是姓名</th>
        <th>身份证号码</th>
        <th>手机号码</th>
        <th>操作</th>
    </tr>

</table>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" 457-hidden="true"> &times;</button>
                <h4 class="modal-title" id="myModalLabel">
                    <span>用户</span>
                </h4>
            </div>
            <div class="modal-body">
                <form action="insertuser" id="userfm" role="form" class="form-horizontal">
                    <input type="hidden" name="uid" id="uid"/>

                    <div class="form-group">
                        <label for="uname" class="control-label col-sm-3">用户名</label>
                         <div class="col-sm-4">
                            <input type="text" class="form-control" name="uname" id="uname">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="password" class="control-label col-sm-3">密码</label>
                         <div class="col-sm-4">
                            <input type="text" class="form-control" name="password" id="password">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="realname" class="control-label col-sm-3">真实姓名</label>
                         <div class="col-sm-4">
                            <input type="text" class="form-control" name="realname" id="realname">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="idnumber" class="control-label col-sm-3">身份证号码</label>
                         <div class="col-sm-4">
                            <input type="text" class="form-control" name="idnumber" id="idnumber">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="utel" class="control-label col-sm-3">手机号码</label>
                         <div class="col-sm-4">
                            <input type="text" class="form-control" name="utel" id="utel">
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="submintuser">确定</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div><!-- /.modal-content -->

    </div><!-- /.modal -->
</div>