<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/header.jsp"%>



<section id="program" class="parallax-section">
	<div class="container">
		<div class="row">

			<div class="wow fadeInUp col-md-12 col-sm-12" data-wow-delay="0.6s">
				<div class="section-title">
					<h2>优秀合作商</h2>
				</div>
			</div>

			<div class="wow fadeInUp col-md-10 col-sm-10" data-wow-delay="0.9s">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
					<li class="active"><a href="#fday" aria-controls="fday" role="tab" data-toggle="tab">招标商</a></li>
					<li><a href="#sday" aria-controls="sday" role="tab" data-toggle="tab">投标商</a></li>
				</ul>
				<!-- tab panes -->
				<div class="tab-content">

					<div role="tabpanel" class="tab-pane active" id="fday">
					
						<c:forEach items="${zlist }" var="z">
							<!-- program speaker here -->
							<div class="col-md-2 col-sm-2">
								<img src="images/program-img2.jpg" class="img-responsive" alt="program">
							</div>
							<div class="col-md-10 col-sm-10">
								<h6>
									<span><i class="fa fa-clock-o"></i>${z.creattime }</span> 
									<span><i class="fa fa-map-marker"></i>${z.address }</span>
								</h6>
								<h3>${z.companyName }</h3>
								<h4>By ${z.userName }</h4>
								<p>${z.itemName }</p>
							</div>
	
							<!-- program divider -->
							<div class="program-divider col-md-12 col-sm-12"></div>
						</c:forEach>
						
					</div>



					<div role="tabpanel" class="tab-pane" id="sday">
						
						<c:forEach items="${tlist }" var="t">
							<!-- program speaker here -->
							<div class="col-md-2 col-sm-2">
								<img src="images/program-img1.jpg" class="img-responsive" alt="program">
							</div>
							<div class="col-md-10 col-sm-10">
								<h6>
									<span><i class="fa fa-clock-o"></i>${t.creattime }</span> 
									<span><i class="fa fa-map-marker"></i>${t.address }</span>
								</h6>
								<h3>${t.companyName }</h3>
								<h4>By ${t.userName }</h4>
								<p>${t.itemName }</p>
							</div>
	
							<!-- program divider -->
							<div class="program-divider col-md-12 col-sm-12"></div>
						</c:forEach>
						
					</div>


				</div>

		</div>
	</div>
</section>




<!-- =========================
    DETAIL SECTION   
============================== -->
<section id="detail" class="parallax-section">
	<div class="container">
		<div class="row">

			<div class="wow fadeInLeft col-md-4 col-sm-4" data-wow-delay="0.3s">
				<i class="fa fa-group"></i>
				<h3>650 Participants</h3>
				<p>Quisque ut libero sapien. Integer tellus nisl, efficitur sed dolor at, vehicula finibus massa. Sed tincidunt metus sed eleifend suscipit.</p>
			</div>

			<div class="wow fadeInUp col-md-4 col-sm-4" data-wow-delay="0.6s">
				<i class="fa fa-clock-o"></i>
				<h3>24 Programs</h3>
				<p>Quisque ut libero sapien. Integer tellus nisl, efficitur sed dolor at, vehicula finibus massa. Sed tincidunt metus sed eleifend suscipit.</p>
			</div>

			<div class="wow fadeInRight col-md-4 col-sm-4" data-wow-delay="0.9s">
				<i class="fa fa-microphone"></i>
				<h3>11 Speakers</h3>
				<p>Quisque ut libero sapien. Integer tellus nisl, efficitur sed dolor at, vehicula finibus massa. Sed tincidunt metus sed eleifend suscipit.</p>
			</div>

		</div>
	</div>
</section>


<!-- Back top -->
<a href="#back-top" class="go-top"><i class="fa fa-angle-up"></i></a>


<!-- =========================
     SCRIPTS   
============================== -->
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.parallax.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/smoothscroll.js"></script>
<script src="js/wow.min.js"></script>
<script src="js/custom.js"></script>

</body>
</html>