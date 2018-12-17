<%@page pageEncoding="UTF-8" contentType="text/html; utf-8"%>

<h2>
	一级分类列表
	<button class="btn btn-info" data-target="#myModal1" id="addc1btn">新建</button>
</h2>

<!-- <form class="form-inline" role="form">
    <div class="form-group">
        <input type="text" class="form-control" placeholder="请输入一级分类名称" id="fc1name" name="fc1name">
        <button id="findbtn1" class="btn btn-default" type="button">查找</button>
    </div>
</form> -->

<table class="table table-bordered table-striped" id="c1tbl">
	<tr>
		<th>序号</th>
		<th>一级分类</th>
		<th>操作</th>
	</tr>
</table>

<!-- <div class="pull-right">
	<select name="page1" id="page1" class="form-control">

	</select>
</div> -->

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">
					<span>一级分类</span>
				</h4>
			</div>
			<div class="modal-body">
				<form action="" id="c1fm" role="form" class="form-horizontal">
					<input type="hidden" name="c1id" id="c1id" />

					<div class="form-group">
						<label for="c1name" class="control-label col-sm-3">一级分类</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" name="c1name" id="c1name">
						</div>
					</div>
				</form>
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="submintc1">确定</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			</div>
		</div>
	</div>
	<!-- /.modal-content -->

</div>
<!-- /.modal -->
</div>