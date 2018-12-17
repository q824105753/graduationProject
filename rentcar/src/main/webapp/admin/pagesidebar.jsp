<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="page-sidebar">
    <a class="logo-box" href="/admin/index.jsp">
        <span>鑫舆汇后台管理</span>
        <i class="icon-radio_button_unchecked" id="fixed-sidebar-toggle-button"></i>
        <i class="icon-close" id="sidebar-toggle-button-close"></i>
    </a>
    <div class="page-sidebar-inner">
        <div class="page-sidebar-menu">
            <ul class="accordion-menu">
                
                
                <c:choose>
                    	<c:when test="${sessionScope.admin.arealname != null }">
                    	
                    	    <li><a href="javascript:;"><i class="menu-icon icon-inbox"></i><span>您好,${sessionScope.admin.arealname }</span></a></li>
                        	<li><a href="admin/login.jsp"><i class="menu-icon icon-show_chart"></i>退出登录</a></li>
                        	
                 <li>
                    <a href="javascript:void(0)">
                        <i class="menu-icon icon-flash_on"></i><span>分类管理</span><i class="accordion-icon fa fa-angle-left"></i>
                    </a>
                    <ul class="sub-menu">
                        <li><a href="/admin/base/category1.jsp" id="c1link">一级分类</a></li>
                        <li><a href="/admin/base/category2.jsp" id="c2link">二级分类</a></li>
                    </ul>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <i class="menu-icon icon-layers"></i><span>车辆列表</span><i class="accordion-icon fa fa-angle-left"></i>
                    </a>
                    <ul class="sub-menu">
                       <li><a href="/admin/base/car.jsp" id="carlink">车辆管理</a></li>
                       <li><a href="/admin/base/car-del.jsp" id="cardellink">删除车辆管理</a></li>
                       <!-- <li><a href="/carList?pagecount=1" id="carlink">车辆管理</a></li> -->
                        
                        <!-- <li><a href="layout-collapsed-sidebar.html">图片轮播</a></li> -->
                    </ul>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <i class="menu-icon icon-code"></i><span>订单列表</span><i class="accordion-icon fa fa-angle-left"></i>
                    </a>
                    <ul class="sub-menu">
                        <li><a href="/admin/base/order.jsp" id="orderlink">订单管理</a></li>
                    </ul>
                </li>
                <li>
                    <a href="javascript:void(0)">
                        <i class="menu-icon icon-format_list_bulleted"></i><span>用户列表</span><i class="accordion-icon fa fa-angle-left"></i>
                    </a>
                    <ul class="sub-menu">
                        <li><a href="/admin/base/user.jsp" id="userlink">用户管理</a></li>
                    </ul>
                </li>
                        	
                        </c:when>
                        <c:otherwise>
  							<li><a href="login.jsp"><i class="menu-icon icon-inbox"></i><span>请登录</span></a></li>
        				</c:otherwise>
                </c:choose>
                
                
                
                
                
                
                
                <li class="menu-divider"></li>
                <li>
                    <a href="/admin/index.jsp">
                        <i class="menu-icon icon-help_outline"></i><span>Documentation</span>
                    </a>
                </li>
                <li>
                    <a href="/admin/index.jsp">
                        <i class="menu-icon icon-public"></i><span>Changelog</span><span class="label label-danger">1.0</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>
