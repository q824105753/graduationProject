<%@page pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@include file="/admin/pagesidebar.jsp" %> --%>
<h2>删除车辆列表
    <!-- <button class="btn btn-info" data-target="#myModal" id="addcarbtn">添加</button> -->
</h2>
<script>
function upload(){
	alert("1111")
		var options = {
			url : "/upload",
			type : "post",
			dataType : "json",
			success : function(data){
				
				$("#carimg").attr("value",data);
				
			}
	}
</script>

<table class="table table-bordered table-striped" id="cardeltbl">
    <tr>
        <th>序号</th>
        <th>车辆名称</th>
        <th>一级分类</th>
        <th>二级分类</th>
        <th>车牌号</th>
        <th>购买时间</th>  
        <th>状态</th>
        <th>日租价格</th>
        <th>车辆图片</th>
        <th>是否删除</th>
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
<meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
<!-- 模态框（Modal） -->
<!-- <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" 457-hidden="true"> &times;</button>
                <h4 class="modal-title" id="myModalLabel">
                    <span>车辆</span>
                </h4>
            </div>
            <div class="modal-body">
                <form action="insertuser" id="carfm" role="form" class="form-horizontal" >
                    <input type="hidden" name="cid" id="cid"/>

                    <div class="form-group">
                        <label for="cname" class="control-label col-sm-3">车辆名称</label>
                         <div class="col-sm-4">
                            <input type="text" class="form-control" name="cname" id="cname">
                        </div>
                    </div>

					<div class="form-group">
                        <label for="c1id" class="control-label col-sm-3">一级分类</label>
                        <div class="col-sm-4">
                             <select name="c1id" id="c1id" class="form-control">
                                <option value="">选择一级分类</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="c2id" class="control-label col-sm-3">二级分类</label>
                        <div class="col-sm-4">
                             <select name="c2id" id="c2id" class="form-control">
                                <option value="">选择二级分类</option>
                            </select>
                        </div>
                    </div>
                    

                    <div class="form-group">
                        <label for="platenumber" class="control-label col-sm-3">车牌号</label>
                         <div class="col-sm-4">
                            <input type="text" class="form-control" name="platenumber" id="platenumber">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="buytime" class="control-label col-sm-3">购买时间</label>
                         <div class="col-sm-4">
                            <input type="date" class="form-control" name="buytime" id="buytime">
                        </div>
                    </div>

					<div class="form-group">
                        <label for="cflag" class="control-label col-sm-3">状态</label>
                        <div class="btn-group col-sm-7" data-toggle="buttons">
                            <label> <input type="radio" name="cflag" value="1">是</label>
                            <label> <input type="radio" name="cflag" value="0">否</label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="price" class="control-label col-sm-3">日租价格</label>
                         <div class="col-sm-4">
                            <input type="text" class="form-control" name="price" id="price">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="carimg" class="control-label col-sm-3">车辆图片</label>
                         <div class="col-sm-4">
                         	<input type="file" onchange="upload()" name="carimgs" multiple="multiple">
                         	<img alt="" src="">
                            <input type="hidden" name="carimg" id="carimg">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="isdel" class="control-label col-sm-3">是否删除</label>
                        <div class="btn-group col-sm-7" data-toggle="buttons">
                            <label> <input type="radio" name="isdel" value="1">是</label>
                            <label> <input type="radio" name="isdel" value="0">否</label>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="submintcar">确定</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div> --><!-- /.modal-content -->

    </div><!-- /.modal -->
</div>