 <%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/login/loginheader.jsp"%>
    <div class="login-logo"><h1>管理员登录</h1></div>
    <div class="login-box">
        <form class="layui-form layui-form-pane" action="/bidding/adminLogin" method="post">
              
            <h3>登录你的帐号</h3>
            <label class="login-title" for="aname">帐号</label>
            <div class="layui-form-item">
                <label class="layui-form-label login-form"><i class="iconfont">&#xe6b8;</i></label>
                <div class="layui-input-inline login-inline">
                  <input type="text" name="aname" lay-verify="required" placeholder="请输入你的帐号" autocomplete="off" class="layui-input">
                </div>
            </div>
            <label class="login-title" for="apwd">密码</label>
            <div class="layui-form-item">
                <label class="layui-form-label login-form"><i class="iconfont">&#xe82b;</i></label>
                <div class="layui-input-inline login-inline">
                  <input type="password" name="apwd" lay-verify="required" placeholder="请输入你的密码" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="form-actions layui-form-item">
                <button class="btn btn-warning pull-right" lay-submit lay-filter="login"  type="submit">登录</button>
            </div>
            
        </form>
    </div>
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
    <script>
       /*  $(function  () {
            layui.use('form', function(){
              var form = layui.form();
              //监听提交
              form.on('submit(login)', function(data){
                layer.msg(JSON.stringify(data.field),function(){
                    location.href='index.jsp'
                });
                return false;
              });
            });
        }) */
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