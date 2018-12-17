<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/admin/header.jsp"%>
<!-- 右侧主体开始 -->
<div class="page-content">
	<div class="content">
		<!-- 右侧内容框架，更改从这里开始 -->
		<form class="layui-form xbs" action="">
			<div class="layui-form-pane" style="text-align: center;">
				<div class="layui-form-item" style="display: inline-block;">
					<label class="layui-form-label xbs768">查找</label>
					
					<div class="layui-input-inline">
						<input type="text" name="uname" value="${user.uname }" placeholder="请输入用户名"
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
		<button class="layui-btn" 
			onclick="window.location.href='/bidding/admin/member-add.jsp'">
			<!-- member_add('添加用户','/bidding/admin/member-add.jsp','600','500') -->
			<i class="layui-icon">&#xe608;</i>添加
		</button>
		<span class="x-right" style="line-height: 40px">共有数据：${userCount } 条</span></xblock>
		<table class="layui-table">
			<thead>
				<tr>
					<th><input type="checkbox" name="" value=""></th>
					<th>ID</th>
					<th>用户名</th>
					<th>密码</th>
					<th>真实姓名</th>
					<th>性别</th>
					<th>手机号码</th>
					<th>邮箱</th>
					<th>是否删除</th>
					<th>加入时间</th>
					<th>项目性质</th>

					<th>操作</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${ulist.list }" var="user">
				<tr>
					
						<td><input type="checkbox" value="1" name=""></td>
						<td>${user.userid }</td>
						<td>${user.uname}</td>
						<td>${user.pwd }</td>
						<td>${user.name }</td>
						<td><c:if test="${user.sex==0 }">女</c:if><c:if test="${user.sex==1 }">男</c:if> </td>
						<td>${user.tel }</td>
						<td>${user.email }</td>
						<td><c:if test="${user.isdelete==0 }">否</c:if><c:if test="${user.isdelete==1 }">是</c:if></td>
						<td>${user.createtime }</td>
						<td><c:if test="${user.flag==0 }">招标</c:if><c:if test="${user.flag==1 }">投标</c:if><c:if test="${user.flag==2 }">招标并投标</c:if></td>

						<td class="td-manage">
							<!--<a style="text-decoration:none" onclick="member_stop(this,'10001')" href="javascript:;" title="停用">-->
							<!--<i class="layui-icon">&#xe601;</i>--> <!--</a>--> <a
							title="编辑" href="javascript:;"
							onclick="window.location.href='/bidding/admin/loadByUserid?userid=${user.userid }'"
							class="ml-5" style="text-decoration: none"> <i
								class="layui-icon">&#xe642;</i>
						</a> <!--<a style="text-decoration:none"  onclick="member_password('修改密码','member-password.html','10001','600','400')"-->
							<!--href="javascript:;" title="修改密码">--> <!--<i class="layui-icon">&#xe631;</i>-->
							<!--</a>--> <a title="删除" href="/bidding/admin/ruanDelete?userid=${user.userid }" style="text-decoration: none">
								<i class="layui-icon">&#xe640;</i>
						</a>
						</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="x-right">
		<c:forEach items="${ulist.pageView }" var="p">
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
	
	function x_admin_close(){
	    /* var index = parent.layer.getFrameIndex(window.name);
	    parent.location.href='/admin/selectAllUser';
	    parent.layer.close(index); */
		window.parent.location.reload();
		var index = parent.layer.getFrameIndex(window.name);
		parent.layer.close(index);
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