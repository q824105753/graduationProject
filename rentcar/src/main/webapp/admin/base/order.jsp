<%@page pageEncoding="UTF-8" contentType="text/html; utf-8" %>

<h2>订单列表
    <!-- <button class="btn btn-info" data-target="#myModal" id="addorderbtn">添加</button> -->
</h2>

<table class="table table-bordered table-striped" id="ordertbl">
    <tr>
        <th>序号</th>
        <th>用户名</th>
        <th>车辆名称</th>
        <th>订单状态</th>
        <th>下单时间</th>
        <th>起始时间</th>
        <th>结束时间</th>
        <th>总价</th>
        <th>备注</th>
        <th>操作</th>
    </tr>

</table>

<div class="pull-right">

	<input type="button" id="first" name="first" value="<<">
    <input type="button" id="before" name="before" value="<">
<input type="text" id="pagecount" name="pagecount" value="1" style="width: 30px;text-align: center">
	<input type="button" id="later" name="later" value=">">
    <input type="button" id="last" name="last" value=">>">

</div>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" 457-hidden="true"> &times;</button>
                <h4 class="modal-title" id="myModalLabel">
                    <span>订单</span>
                </h4>
            </div>
            <div class="modal-body">
                <form action="" id="orderfm" role="form" class="form-horizontal">
                    <input type="hidden" name="oid" id="oid"/>

                    <div class="form-group">
                        <label for="uid" class="control-label col-sm-3">用户编号</label>
                        <div class="col-sm-4">
                            <select name="uid" id="uid" class="form-control">
                                <option value="">选择用户</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="cid" class="control-label col-sm-3">车辆编号</label>
                        <div class="col-sm-4">
                             <select name="cid" id="cid" class="form-control">
                                <option value="">选择车辆</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="oflag" class="control-label col-sm-3">订单状态</label>
                        <div class="btn-group col-sm-7" data-toggle="buttons">
                            <label> <input type="radio" name="oflag" value="1">是</label>
                            <label> <input type="radio" name="oflag" value="0">否</label>
                        </div>
                    </div>

                   <div class="form-group">
                        <label for="otime" class="control-label col-sm-3">下单时间</label>
                        <div class="col-sm-4">
                            <input type="datetime-local" class="form-control" name="otime" id="otime" >
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="begin" class="control-label col-sm-3">起始时间</label>
                        <div class="col-sm-4">
                            <input type="datetime-local" class="form-control" name="begin" id="begin">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="end" class="control-label col-sm-3">结束时间</label>
                        <div class="col-sm-4">
                            <input type="datetime-local" class="form-control" name="end" id="end">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="totalprice" class="control-label col-sm-3">总价</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="totalprice" id="totalprice">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="note" class="control-label col-sm-3">备注</label>
                        <div class="col-sm-4">
                            <textarea name="note" id="note" cols="30" rows="10"></textarea>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="submintorder">确定</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div><!-- /.modal-content -->

    </div><!-- /.modal -->
</div>