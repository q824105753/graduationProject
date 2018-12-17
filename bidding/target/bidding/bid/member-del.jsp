<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/bid/header.jsp"%>
<!-- 右侧主体开始 -->
<div class="page-content">
	<div class="content">
		<!-- 右侧内容框架，更改从这里开始 -->
		<form class="layui-form xbs" action="">
			<div class="layui-form-pane" style="text-align: center;">
				<div class="layui-form-item" style="display: inline-block;">
					<label class="layui-form-label xbs768">日期范围</label>
					<div class="layui-input-inline xbs768">
						<input class="layui-input" placeholder="开始日" id="LAY_demorange_s">
					</div>
					<div class="layui-input-inline xbs768">
						<input class="layui-input" placeholder="截止日" id="LAY_demorange_e">
					</div>
					<div class="layui-input-inline">
						<input type="text" name="username" placeholder="请输入用户名"
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
		<button class="layui-btn layui-btn-danger" onclick="recoverAll()">
			<i class="layui-icon">&#xe640;</i>批量恢复
		</button>
		<span class="x-right" style="line-height: 40px">共有数据：88 条</span></xblock>
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
					<th>状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ulist }" var="user">
					<tr>
						<td><input type="checkbox" value="1" name=""></td>
						<td>${user.userid }</td>
						<td>${user.uname}</td>
						<td>${user.pwd }</td>
						<td>${user.name }</td>
						<td>${user.sex }</td>
						<td>${user.tel }</td>
						<td>${user.email }</td>
						<td>${user.isdelete }</td>
						<td>${user.createtime }</td>
						
						<td class="td-status"><span
							class="layui-btn layui-btn-danger layui-btn-mini"> 已删除 </span></td>
						<td class="td-manage"><a style="text-decoration: none"
							onclick="window.location.href='/bidding/admin/updateDel?userid=${user.userid }'" href="javascript:;"
							title="恢复"> <i class="layui-icon">&#xe618;</i>
						</a> <a title="彻底删除" href="javascript:;" /admin/delByUserid
							onclick="window.location.href='/bidding//admin/delByUserid?userid=${user.userid }'" style="text-decoration: none">
								<i class="layui-icon">&#xe640;</i>
						</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- 右侧内容框架，更改从这里结束 -->
	</div>
</div>
<!-- 右侧主体结束 -->
</div>
<!-- 中部结束 -->
<!-- 底部开始 -->
<div class="footer">
	<div class="copyright">Copyright ©2017 x-admin v2.3 All Rights
		Reserved. 本后台系统由X前端框架提供前端技术支持</div>
</div>
<!-- 底部结束 -->
<!-- 背景切换开始 -->
<div class="bg-changer">
	<div class="swiper-container changer-list">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<img class="item" src="./images/a.jpg" alt="">
			</div>
			<div class="swiper-slide">
				<img class="item" src="./images/b.jpg" alt="">
			</div>
			<div class="swiper-slide">
				<img class="item" src="./images/c.jpg" alt="">
			</div>
			<div class="swiper-slide">
				<img class="item" src="./images/d.jpg" alt="">
			</div>
			<div class="swiper-slide">
				<img class="item" src="./images/e.jpg" alt="">
			</div>
			<div class="swiper-slide">
				<img class="item" src="./images/f.jpg" alt="">
			</div>
			<div class="swiper-slide">
				<img class="item" src="./images/g.jpg" alt="">
			</div>
			<div class="swiper-slide">
				<img class="item" src="./images/h.jpg" alt="">
			</div>
			<div class="swiper-slide">
				<img class="item" src="./images/i.jpg" alt="">
			</div>
			<div class="swiper-slide">
				<img class="item" src="./images/j.jpg" alt="">
			</div>
			<div class="swiper-slide">
				<img class="item" src="./images/k.jpg" alt="">
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

	//批量恢复提交
	function recoverAll() {
		layer.confirm('确认要批量恢复吗？', function(index) {
			//捉到所有被选中的，发异步进行恢复
			layer.msg('恢复成功', {
				icon : 1
			});
		});
	}

	/*用户-恢复*/
	function member_recover(obj, id) {
		layer.confirm('确认要恢复吗？', function(index) {
			//发异步删除数据
			$(obj).parents("tr").remove();
			layer.msg('已恢复!', {
				icon : 1,
				time : 1000
			});
		});
	}
	/*用户-彻底删除*/
	function member_unset(obj, id) {
		layer.confirm('彻底删除无法恢复，确认要删除数据吗？', function(index) {
			//发异步删除数据
			$(obj).parents("tr").remove();
			layer.msg('已彻底删除', {
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