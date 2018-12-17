<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<title>New Event</title>
<meta name="description" content="">
<meta name="author" content="">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/owl.theme.css">
<link rel="stylesheet" href="css/owl.carousel.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">

<!-- Google Font -->
<link href='http://fonts.useso.com/css?family=Poppins:400,500,600' rel='stylesheet' type='text/css'>

</head>
<body data-spy="scroll" data-offset="50" data-target=".navbar-collapse">

<!-- =========================
     PRE LOADER       
============================== -->
<div class="preloader">

	<div class="sk-rotating-plane"></div>

</div>


<!-- =========================
     NAVIGATION LINKS     
============================== -->
<div class="navbar navbar-fixed-top custom-navbar" role="navigation" >
	<div class="container">

		<!-- navbar header -->
		<div class="navbar-header">
			<button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
				<span class="icon icon-bar"></span>
				<span class="icon icon-bar"></span>
				<span class="icon icon-bar"></span>
			</button>
			<a href="#" class="navbar-brand">New Event 招标网</a>
		</div>

		<div class="collapse navbar-collapse">

			<ul class="nav navbar-nav navbar-right">
				<li><a href="/bidding/selectAllByState" class="smoothScroll">首页</a></li>
				<li><a href="/bidding/selectAllNoticeFront" class="smoothScroll">招标公告</a></li>
				<li><a href="/bidding/selectAllTenderFront" class="smoothScroll">投标申请</a></li>
				<li><a href="/bidding/goodCompany" class="smoothScroll">优秀合作商</a></li>
				
				<c:choose>
					<c:when test="${sessionScope.user.name != null }">
						<li><a href="javascript:;" class="smoothScroll">欢迎，${sessionScope.user.name }</a></li>
						<li><a href="/bidding/login.jsp" class="smoothScroll">退出</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="/bidding/login.jsp" class="smoothScroll">登录</a></li>
					</c:otherwise>
				</c:choose>
			</ul>

		</div>

	</div>
</div>
