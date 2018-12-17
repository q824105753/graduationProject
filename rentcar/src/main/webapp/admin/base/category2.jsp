<%@page pageEncoding="UTF-8" contentType="text/html; utf-8"%>

<h2>
	二级分类列表
	<button class="btn btn-info" data-target="#myModal2" id="addc2btn">新建</button>
</h2>


<table class="table table-bordered table-striped" id="c2tbl">
	<tr>
		<th>序号</th>
		<th>二级分类</th>
		<th>操作</th>
	</tr>

</table>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">
					<span>二级分类</span>
				</h4>
			</div>
			<div class="modal-body">
				<form action="" id="c2fm" role="form" class="form-horizontal">
					<input type="hidden" name="c2id" id="c2id" />

					<div class="form-group">
						<label for="c2name" class="control-label col-sm-3">二级分类</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" name="c2name" id="c2name">
						</div>
					</div>

				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="submintc2">确定</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			</div>
		</div>
		<!-- /.modal-content -->

	</div>
	<!-- /.modal -->
</div>