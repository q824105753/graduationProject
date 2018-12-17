<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/admin/header.jsp"%>
<!-- 右侧主体开始 -->
<div class="page-content">
	<div class="content">
		<!-- 右侧内容框架，更改从这里开始 -->
		<form class="layui-form form-control"
			action="/bidding/admin/updateUser" method="post">
			<input type="hidden" name="userid" id="userid"
				value="${user.userid }">
			<div style="margin: auto 200px auto 250px">
				<div class="layui-form-item">
					<label for="L_email" class="layui-form-label"> <span
						class="x-red">*</span>登录名
					</label>
					<div class="layui-input-inline">
						<input type="text" id="uname" name="uname" required=""
							lay-verify="uname" autocomplete="off" class="layui-input"
							value="${user.uname }">
					</div>
					<div class="layui-form-mid layui-word-aux">
						<span class="x-red">*</span>将会成为您唯一的登入名
					</div>
				</div>

				<div class="layui-form-item">
					<label for="L_pass" class="layui-form-label"> <span
						class="x-red">*</span>密码
					</label>
					<div class="layui-input-inline">
						<input type="password" id="L_pass" name="pwd" required=""
							lay-verify="pass" autocomplete="off" class="layui-input"
							value="${user.pwd }">
					</div>
					<div class="layui-form-mid layui-word-aux">6到16个字符</div>
				</div>

				<div class="layui-form-item">
					<label for="L_username" class="layui-form-label"> <span
						class="x-red">*</span>真实姓名
					</label>
					<div class="layui-input-inline">
						<input type="text" id="name" name="name" required=""
							lay-verify="nikename" autocomplete="off" class="layui-input"
							value="${user.name }">
					</div>
				</div>


				<div class="layui-form-item">
					<label class="layui-form-label">性别</label>
					<div class="layui-input-block">
						<input type="radio" name="sex" value="1" title="男"
							<c:if test="${user.sex==1 }">checked</c:if> /> <input
							type="radio" name="sex" value="0" title="女"
							<c:if test="${user.sex==0 }">checked</c:if> />
					</div>
				</div>


				<div class="layui-form-item">
					<label for="L_username" class="layui-form-label"> <span
						class="x-red">*</span>电话号码
					</label>
					<div class="layui-input-inline">
						<input type="text" id="tel" name="tel" required=""
							lay-verify="nikename" autocomplete="off" class="layui-input"
							value="${user.tel }">
					</div>
				</div>
				<div class="layui-form-item">
					<label for="L_username" class="layui-form-label"> <span
						class="x-red">*</span>邮箱
					</label>
					<div class="layui-input-inline">
						<input type="text" id="email" name="email" required=""
							lay-verify="nikename" autocomplete="off" class="layui-input"
							value="${user.email }">
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">是否删除</label>
					<div class="layui-input-block">
						<input type="radio" name="isdelete" value="1" title="是"
							class="del" <c:if test="${user.isdelete==1 }">checked</c:if>>
						<input type="radio" name="isdelete" value="0" title="否" checked=""
							class="del" <c:if test="${user.isdelete==0 }">checked</c:if>>
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">项目性质</label>
					<div class="layui-input-block">
						<input type="radio" name="flag" value="0" title="招标" <c:if test="${user.flag==0 }">checked</c:if> class="del">
						<input type="radio" name="flag" value="1" title="投标" <c:if test="${user.flag==1 }">checked</c:if> class="del">
						<input type="radio" name="flag" value="2" title="招标并投标" <c:if test="${user.flag==2 }">checked</c:if> class="del">
					</div>
				</div>

				<div class="layui-form-item">
					<label for="L_username" class="layui-form-label"> <span
						class="x-red">*</span>创建时间
					</label>
					<div class="layui-input-inline">
						<input type="datetime-local" id="createtime" name="createtime" required=""
							lay-verify="nikename" autocomplete="off" class="layui-input"
							value="${user.createtime1 }">
					</div>
				</div>

				<div class="layui-form-item">
					<label for="L_sign" class="layui-form-label"> </label> <input
						type="submit" class="layui-btn" key="set-mine" lay-filter="save"
						value="提交">
				</div>
			</div>
		</form>
		<!-- 右侧内容框架，更改从这里结束 -->
	</div>
</div>
<!-- 右侧主体结束 -->
</div>
<!-- 中部结束 -->
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