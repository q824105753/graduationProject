<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/admin/header.jsp"%>
<!-- 右侧主体开始 -->
<div class="page-content">
	<div class="content">
		<!-- 右侧内容框架，更改从这里开始 -->
		<form class="layui-form xbs" action="/bidding/admin/selectAllTenderByPage">
			<div class="layui-form-pane" style="text-align: center;">
				<div class="layui-form-item" style="display: inline-block;">
					<label class="layui-form-label xbs768">查找</label>
					<div class="layui-input-inline">
						<input type="text" name="tendername" value="${tender1.tendername }" placeholder="请输入项目名称"
							autocomplete="off" class="layui-input">
					</div>
					<div class="layui-input-inline" style="width: 80px">
						<button class="layui-btn" lay-submit="" lay-filter="sreach">
							<i class="layui-icon">&#xe615;</i>
						</button>
					</div>
				</div>
			</div>
		</form>
		<xblock>
		<button class="layui-btn layui-btn-danger" onclick="delAll()">
			<i class="layui-icon">&#xe640;</i>批量删除
		</button>
		
		<span class="x-right" style="line-height: 40px">共有数据：${tenderCount } 条</span></xblock>
		<table class="layui-table">
			<thead>
				<tr>
					<th><input type="checkbox" name="" value=""></th>
					<th>ID</th>
					<th>投标商</th>
					<th>投标项目名称</th>
					<th>投标项目负责人</th>
					<th>投标完成时间</th>
					<th>是否删除</th>
					<th>审核状态</th>
					<th>招标项目</th>
					<th>签约状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${tlist.list }" var="tender">
				<tr>
					<td><input type="checkbox" value="1" name=""></td>
					<td>${tender.tenderid }</td>
					<td>${tender.company.companyname }</td>
					<td>${tender.tendername }</td>
					<td>${tender.user.name }</td>
					<td>${tender.finishtime }</td>
					<td><c:if test="${tender.isdelete==0 }">否</c:if><c:if test="${tender.isdelete==1 }">是</c:if></td>
					<td>${tender.check.state }</td>
					<td>${tender.notice.itemname }</td>
					<td><c:if test="${tender.state==0 }">未签约</c:if><c:if test="${tender.state==1 }">已签约</c:if></td>

					<td class="td-manage">
						<!--<a style="text-decoration:none" onclick="member_stop(this,'10001')" href="javascript:;" title="停用">-->
						<!--<i class="layui-icon">&#xe601;</i>--> <!--</a>--> <a
						title="编辑" href="javascript:;"
						onclick="window.location.href='/bidding/admin/loadTender?tenderid=${tender.tenderid}'"
						class="ml-5" style="text-decoration: none"> <i
							class="layui-icon">&#xe642;</i>
					</a> 
					<a title="删除" href="javascript:;"
							onclick="window.location.href='/bidding/admin/softDelTender?tenderid=${tender.tenderid}'" style="text-decoration: none">
								<i class="layui-icon">&#xe640;</i>
						</a>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="x-right">
		<c:forEach items="${tlist.pageView }" var="p">
			${p }
		</c:forEach>
		</div>
		<!-- 右侧内容框架，更改从这里结束 -->
	</div>
</div>
<!-- 右侧主体结束 -->
</div>
<!-- 中部结束 -->
<!-- 底部开始 -->
<%@include file="/admin/footer.jsp"%>
<!-- 底部结束 -->
<!-- 背景切换开始 -->
<div class="bg-changer">
	<div class="swiper-container changer-list">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<img class="item" src="/bidding/admin/assets/images/a.jpg" alt="">
			</div>
			<div class="swiper-slide">
				<img class="item" src="/bidding/admin/assets/images/b.jpg" alt="">
			</div>
			<div class="swiper-slide">
				<img class="item" src="/bidding/admin/assets/images/c.jpg" alt="">
			</div>
			<div class="swiper-slide">
				<img class="item" src="/bidding/admin/assets/images/d.jpg" alt="">
			</div>
			<div class="swiper-slide">
				<img class="item" src="/bidding/admin/assets/images/e.jpg" alt="">
			</div>
			<div class="swiper-slide">
				<img class="item" src="/bidding/admin/assets/images/f.jpg" alt="">
			</div>
			<div class="swiper-slide">
				<img class="item" src="/bidding/admin/assets/images/g.jpg" alt="">
			</div>
			<div class="swiper-slide">
				<img class="item" src="/bidding/admin/assets/images/h.jpg" alt="">
			</div>
			<div class="swiper-slide">
				<img class="item" src="/bidding/admin/assets/images/i.jpg" alt="">
			</div>
			<div class="swiper-slide">
				<img class="item" src="/bidding/admin/assets/images/j.jpg" alt="">
			</div>
			<div class="swiper-slide">
				<img class="item" src="/bidding/admin/assets/images/k.jpg" alt="">
			</div>
			<div class="swiper-slide">
				<span class="reset">初始化</span>
			</div>
		</div>
	</div>
	<div class="bg-out"></div>
	<div id="changer-set">
		<i class="iconfont">&#xe696;</i>
	</div>
</div>
<!-- 背景切换结束 -->
<!-- 页面动态效果 -->

<script>
	layui.use([ 'laydate' ], function() {
		laydate = layui.laydate;//日期插件

		//以上模块根据需要引入
		//

		var start = {
			min : laydate.now(),
			max : '2099-06-16 23:59:59',
			istoday : false,
			choose : function(datas) {
				end.min = datas; //开始日选好后，重置结束日的最小日期
				end.start = datas //将结束日的初始值设定为开始日
			}
		};

		var end = {
			min : laydate.now(),
			max : '2099-06-16 23:59:59',
			istoday : false,
			choose : function(datas) {
				start.max = datas; //结束日选好后，重置开始日的最大日期
			}
		};

		document.getElementById('LAY_demorange_s').onclick = function() {
			start.elem = this;
			laydate(start);
		}
		document.getElementById('LAY_demorange_e').onclick = function() {
			end.elem = this
			laydate(end);
		}

	});

	//批量删除提交
	function delAll() {
		layer.confirm('确认要删除吗？', function(index) {
			//捉到所有被选中的，发异步进行删除
			layer.msg('删除成功', {
				icon : 1
			});
		});
	}
	/*用户-添加*/
	function member_add(title, url, w, h) {
		x_admin_show(title, url, w, h);
	}
	/*用户-查看*/
	function member_show(title, url, id, w, h) {
		x_admin_show(title, url, w, h);
	}

	/*用户-停用*/
	function member_stop(obj, id) {
		layer
				.confirm(
						'确认要停用吗？',
						function(index) {
							//发异步把用户状态进行更改
							$(obj)
									.parents("tr")
									.find(".td-manage")
									.prepend(
											'<a style="text-decoration:none" onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="layui-icon">&#xe62f;</i></a>');
							$(obj)
									.parents("tr")
									.find(".td-status")
									.html(
											'<span class="layui-btn layui-btn-disabled layui-btn-mini">已停用</span>');
							$(obj).remove();
							layer.msg('已停用!', {
								icon : 5,
								time : 1000
							});
						});
	}

	/*用户-启用*/
	function member_start(obj, id) {
		layer
				.confirm(
						'确认要启用吗？',
						function(index) {
							//发异步把用户状态进行更改
							$(obj)
									.parents("tr")
									.find(".td-manage")
									.prepend(
											'<a style="text-decoration:none" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="layui-icon">&#xe601;</i></a>');
							$(obj)
									.parents("tr")
									.find(".td-status")
									.html(
											'<span class="layui-btn layui-btn-normal layui-btn-mini">已启用</span>');
							$(obj).remove();
							layer.msg('已启用!', {
								icon : 6,
								time : 1000
							});
						});
	}
	// 用户-编辑
	function member_edit(title, url, id, w, h) {
		x_admin_show(title, url, w, h);
	}
	/*密码-修改*/
	function member_password(title, url, id, w, h) {
		x_admin_show(title, url, w, h);
	}
	/*用户-删除*/
	function member_del(obj, id) {
		layer.confirm('确认要删除吗？', function(index) {
			//发异步删除数据
			$(obj).parents("tr").remove();
			layer.msg('已删除!', {
				icon : 1,
				time : 1000
			});
		});
	}
</script>
<script>
	//百度统计可去掉
	var _hmt = _hmt || [];
	(function() {
		var hm = document.createElement("script");
		hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
		var s = document.getElementsByTagName("script")[0];
		s.parentNode.insertBefore(hm, s);
	})();
</script>
</body>
</html>