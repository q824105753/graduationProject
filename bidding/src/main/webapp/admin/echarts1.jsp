<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/admin/header.jsp"%>
        <!-- 右侧主体开始 -->
        <div class="page-content">
          <div class="content">
            <!-- 右侧内容框架，更改从这里开始 -->
            <blockquote class="layui-elem-quote">
                特别声明：ECharts，一个纯 Javascript 的图表库，可以流畅的运行在 PC 和移动设备上，兼容当前绝大部分浏览器（IE8/9/10/11，Chrome，Firefox，Safari等），底层依赖轻量级的 Canvas 类库 ZRender，提供直观，生动，可交互，可高度个性化定制的数据可视化图表。如需使用，详细了解可以访问官网 <a href="http://echarts.baidu.com/" style="color:red">ECharts</a>。 x-admin不承担任何版权问题。
            </blockquote>
            <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
            <div id="main" style="width: 100%;height:400px;"></div>
            <blockquote class="layui-elem-quote">
                注意：本案例的Echarts图表库由cdn引入，需要在线才能正常使用，如想离想，请至Echarts官网下载。
            </blockquote>
            <!-- 右侧内容框架，更改从这里结束 -->
          </div>
        </div>
        <!-- 右侧主体结束 -->
    </div>
    <!-- 中部结束 -->
    <!-- 底部开始 -->
    <div class="footer">
        <div class="copyright">Copyright ©2017 x-admin v2.3 All Rights Reserved. 本后台系统由X前端框架提供前端技术支持</div>  
    </div>
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
        
        <script src="http://cdn.bootcss.com/echarts/3.3.2/echarts.min.js" charset="utf-8"></script>
        <script type="text/javascript" src="./js/echarts-for-x-admin.js"></script>

        <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'),'echarts-for-x-admin');

        // 指定图表的配置项和数据
        var option = {
            title: {
                text: '折线图堆叠'
            },
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data:['邮件营销','联盟广告','视频广告','直接访问','搜索引擎']
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            toolbox: {
                feature: {
                    saveAsImage: {}
                }
            },
            xAxis: {
                type: 'category',
                boundaryGap: false,
                data: ['周一','周二','周三','周四','周五','周六','周日']
            },
            yAxis: {
                type: 'value'
            },
            series: [
                {
                    name:'邮件营销',
                    type:'line',
                    stack: '总量',
                    data:[120, 132, 101, 134, 90, 230, 210]
                },
                {
                    name:'联盟广告',
                    type:'line',
                    stack: '总量',
                    data:[220, 182, 191, 234, 290, 330, 310]
                },
                {
                    name:'视频广告',
                    type:'line',
                    stack: '总量',
                    data:[150, 232, 201, 154, 190, 330, 410]
                },
                {
                    name:'直接访问',
                    type:'line',
                    stack: '总量',
                    data:[320, 332, 301, 334, 390, 330, 320]
                },
                {
                    name:'搜索引擎',
                    type:'line',
                    stack: '总量',
                    data:[820, 932, 901, 934, 1290, 1330, 1320]
                }
            ]
        };


        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
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