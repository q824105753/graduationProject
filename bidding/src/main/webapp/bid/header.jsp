<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<div class="container">
    <div class="logo"><a href="/bidding/bid/index">招标信息管理系统</a></div>
    <div class="open-nav"><i class="iconfont">&#xe699;</i></div>
    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;"><c:if test="${sessionScope.admin!=null}">${sessionScope.admin.aname }</c:if>
            	<c:if test="${sessionScope.user!=null}">${sessionScope.user.uname }</c:if>
            </a>
            <dl class="layui-nav-child"> <!-- 二级菜单 -->
                <dd><a <c:if test="${sessionScope.admin!=null}">href="bidding/login/adminlogin.jsp"</c:if>
                 <c:if test="${sessionScope.user!=null}">href="bidding/login/bidlogin.jsp"</c:if>
                >退出</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item"><a href="/bidding/login.jsp">前台首页</a></li>
    </ul>
</div>

<!-- 中部开始 -->
    <div class="wrapper">
    
   
<!-- 左侧菜单开始 -->
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">
            <li class="list" current>
                <a href="/bidding/bid/index">
                    <i class="iconfont">&#xe761;</i>
                    欢迎页面
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
            </li>
            <li class="list">
                <a href="javascript:;">
                    <i class="iconfont">&#xe70b;</i>
                    用户管理
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a href="/bidding/bid/selectUser" rel="external nofollow">
                            <i class="iconfont">&#xe6a7;</i>
                            用户列表
                        </a>
                    </li>
                    
                    <li>
                        <a href="member-view.html">
                            <i class="iconfont">&#xe6a7;</i>
                            浏览记录
                        </a>
                    </li>
                </ul>
            </li>
            <li class="list" >
                <a href="javascript:;">
                    <i class="iconfont">&#xe6a3;</i>
                    公司管理
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a href="/bidding/bid/selectCompany">
                            <i class="iconfont">&#xe6a7;</i>
                            公司列表
                        </a>
                    </li>
                </ul>
            </li>
            <li class="list" >
                <a href="javascript:;">
                    <i class="iconfont">&#xe6a3;</i>
                    招标公告管理
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu" style="display:none">
                    <li>
                        <a href="/bidding/bid/selectNotice">
                            <i class="iconfont">&#xe6a7;</i>
                            招标公告列表
                        </a>
                    </li>
                    
                    <li>
                        <a href="/bidding/bid/selectByNoticeDel">
                            <i class="iconfont">&#xe6a7;</i>
                            招标公告删除
                        </a>
                    </li>
                </ul>
            </li>
            
            <li class="list" >
                <a href="javascript:;">
                    <i class="iconfont">&#xe6a3;</i>
                    投标申请管理
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu" style="display:none">
                    <li>
                        <a href="/bidding/bid/selectTender">
                            <i class="iconfont">&#xe6a7;</i>
                            投标申请列表
                        </a>
                    </li>
                   <li>
                        <a href="/bidding/bid/toSoftDeleteTender">
                            <i class="iconfont">&#xe6a7;</i>
                            投标申请删除列表
                        </a>
                    </li>
                </ul>
            </li>
            
            
            <li class="list" >
                <a href="javascript:;">
                    <i class="iconfont">&#xe6a3;</i>
                    系统统计
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu" style="display:none">
                    <li>
                        <a href="/bidding/bid/echarts1.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            拆线图
                        </a>
                    </li>
                    <li>
                        <a href="/bidding/bid/echarts2.html">
                            <i class="iconfont">&#xe6a7;</i>
                            柱状图
                        </a>
                    </li>
                    <li>
                        <a href="/bidding/bid/echarts3.html">
                            <i class="iconfont">&#xe6a7;</i>
                            地图
                        </a>
                    </li>
                    <li>
                        <a href="/bidding/bid/echarts4.html">
                            <i class="iconfont">&#xe6a7;</i>
                            饼图
                        </a>
                    </li>
                    <li>
                        <a href="/bidding/bid/echarts5.html">
                            <i class="iconfont">&#xe6a7;</i>
                            k线图
                        </a>
                    </li>
                    <li>
                        <a href="/bidding/bid/echarts6.html">
                            <i class="iconfont">&#xe6a7;</i>
                            仪表图
                        </a>
                    </li>
                </ul>
            </li>
            
        </ul>
    </div>
</div>
<!-- 左侧菜单结束 -->
   