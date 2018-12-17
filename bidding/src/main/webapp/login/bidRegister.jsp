<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<base href="/">
<head>
    <meta charset="UTF-8">
    <title>后台登录-X-admin1.1</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="/favicon.ico" type="/image/x-icon" />
    <link rel="stylesheet" href="/bidding/admin/assets/css/font.css">
    <link rel="stylesheet" href="/bidding/admin/assets/css/xadmin.css">
    <link rel="stylesheet" href="/bidding/admin/assets/css/swiper.min.css">
    <script type="text/javascript" src="/bidding/admin/assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="/bidding/admin/assets/js/swiper.jquery.min.js"></script>
    <script src="/bidding/admin/assets/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/bidding/admin/assets/js/xadmin.js"></script>


</head>
<body>
<!-- 顶部开始 -->


<!-- 中部开始 -->
    <div class="wrapper">
    


    
    
        <div style="margin: auto 200px auto 250px;">
        <div class="login-logo" style="text-align: left"><h1>招标人注册</h1></div>
        <form class="layui-form layui-form-pane" action="/bidding/bidRegister" method="post">
            
            <div class="layui-form-item">
            <label class="login-title" for="name">真实姓名</label>
            <div class="layui-form-item">
                <div class="layui-input-inline login-inline">
                  <input type="text" name="name" lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
                </div>
            </div>
            </div>
            
            <div class="layui-form-item">
            <label class="login-title" for="uname">帐号</label>
            <div class="layui-form-item">
                <div class="layui-input-inline login-inline">
                  <input type="text" name="uname" lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
                </div>
            </div>
            </div>
            
            <div class="layui-form-item">
            <label class="login-title" for="pwd">密码</label>
            <div class="layui-form-item">
                <div class="layui-input-inline login-inline">
                  <input type="password" name="pwd" lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
                </div>
            </div>
            </div>
            
            <div class="layui-form-item">
             <label class="login-title">性别</label>
             <div class="layui-form-item">
                <div class="layui-input-inline">
                 	<input type="radio" name="sex" value="1" title="男" class="del">
                    <input type="radio" name="sex" value="0" title="女" checked="" class="del">
                </div>
           	 </div>    
           	 </div>    
           	 
           	 <div class="layui-form-item">
           	 <label class="login-title">身份</label>
             <div class="layui-form-item">
                <div class="layui-input-inline">
                 	<input type="radio" name="flag" value="0" title="招标" class="del">
                    <input type="radio" name="flag" value="2" title="招投标" checked="" class="del">
                </div>
           	 </div> 
           	 </div> 
                
                <div class="layui-form-item">
              <label class="login-title" for="tel">电话号码</label>
            <div class="layui-form-item">
                <div class="layui-input-inline login-inline">
                  <input type="tel" name="tel" lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
                </div>
            </div>
            
             <label class="login-title" for="email">邮箱</label>
            <div class="layui-form-item">
                <div class="layui-input-inline login-inline">
                  <input type="email" name="email" lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
                </div>
            </div>   
            </div>   
            
            
            
            <button class="btn btn-warning pull-right" lay-submit lay-filter="" type="submit">注册</button>
            
            
        </form>
        </div>
  
	<div class="bg-changer">
        <div class="swiper-container changer-list">
            <div class="swiper-wrapper">
                <div class="swiper-slide"><img class="item" src="./images/a.jpg" alt=""></div>
                <div class="swiper-slide"><img class="item" src="./images/b.jpg" alt=""></div>
                <div class="swiper-slide"><img class="item" src="./images/c.jpg" alt=""></div>
                <div class="swiper-slide"><img class="item" src="./images/d.jpg" alt=""></div>
                <div class="swiper-slide"><img class="item" src="./images/e.jpg" alt=""></div>
                <div class="swiper-slide"><img class="item" src="./images/f.jpg" alt=""></div>
                <div class="swiper-slide"><img class="item" src="./images/g.jpg" alt=""></div>
                <div class="swiper-slide"><img class="item" src="./images/h.jpg" alt=""></div>
                <div class="swiper-slide"><img class="item" src="./images/i.jpg" alt=""></div>
                <div class="swiper-slide"><img class="item" src="./images/j.jpg" alt=""></div>
                <div class="swiper-slide"><img class="item" src="./images/k.jpg" alt=""></div>
                <div class="swiper-slide"><span class="reset">初始化</span></div>
            </div>
        </div>
        <div class="bg-out"></div>
        <div id="changer-set"><i class="iconfont">&#xe696;</i></div>   
    </div>
    
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