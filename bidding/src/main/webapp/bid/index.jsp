<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/bid/header.jsp"%>
        <!-- 右侧主体开始 -->
        <div class="page-content">
          <div class="content">
            <!-- 右侧内容框架，更改从这里开始 -->
            <blockquote class="layui-elem-quote">
                欢迎：<c:if test="${sessionScope.admin!=null}">${sessionScope.admin.aname }</c:if>
            	<c:if test="${sessionScope.user!=null}">${sessionScope.user.uname }</c:if>登录！
            </blockquote>
            <fieldset class="layui-elem-field layui-field-title site-title">
              <legend><a name="default">信息统计</a></legend>
            </fieldset>
            <table class="layui-table">
                <thead>
                    <tr>
                        <th>统计</th>
                        <th>招标公告</th>
                        <th>投标申请</th>
                        <th>用户</th>
                        <th>公司</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>总数</td>
                        <td>${noticeCount }</td>
                        <td>${tenderCount }</td>
                        <td>${userCount }</td>
                        <td>${companyCount }</td>
                    </tr>
                    <tr>
                        <td>今日</td>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td>昨日</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                    </tr>
                    <tr>
                        <td>本周</td>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td>本月</td>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                    </tr>
                </tbody>
            </table>

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
                <div class="swiper-slide"><img class="item" src="/bidding/admin/assets/images/a.jpg" alt=""></div>
                <div class="swiper-slide"><img class="item" src="/bidding/admin/assets/images/b.jpg" alt=""></div>
                <div class="swiper-slide"><img class="item" src="/bidding/admin/assets/images/c.jpg" alt=""></div>
                <div class="swiper-slide"><img class="item" src="/bidding/admin/assets/images/d.jpg" alt=""></div>
                <div class="swiper-slide"><img class="item" src="/bidding/admin/assets/images/e.jpg" alt=""></div>
                <div class="swiper-slide"><img class="item" src="/bidding/admin/assets/images/f.jpg" alt=""></div>
                <div class="swiper-slide"><img class="item" src="/bidding/admin/assets/images/g.jpg" alt=""></div>
                <div class="swiper-slide"><img class="item" src="/bidding/admin/assets/images/h.jpg" alt=""></div>
                <div class="swiper-slide"><img class="item" src="/bidding/admin/assets/images/i.jpg" alt=""></div>
                <div class="swiper-slide"><img class="item" src="/bidding/admin/assets/images/j.jpg" alt=""></div>
                <div class="swiper-slide"><img class="item" src="/bidding/admin/assets/images/k.jpg" alt=""></div>
                <div class="swiper-slide"><span class="reset">初始化</span></div>
            </div>
        </div>
        <div class="bg-out"></div>
        <div id="changer-set"><i class="iconfont">&#xe696;</i></div>
    </div>
    <!-- 背景切换结束 -->
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