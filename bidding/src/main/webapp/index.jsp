<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/header.jsp"%>


<!-- =========================
    INTRO SECTION   
============================== -->



<!-- =========================
    OVERVIEW SECTION   
============================== -->
<section id="overview" class="parallax-section" style="background-color: black">
	<div class="container">
		<div class="row">

			<div class="wow fadeInUp col-md-6 col-sm-6" data-wow-delay="0.6s" >
				<div style="text-align: center;">
	        			<table class="table table-bordered" style="text-align: center;">
	    					<tr style="color: white">
		        				<th>序号</th>
						        <th style="text-align: center;">项目名称</th>
						        <th style="text-align: center;">状态</th>
						        <th style="text-align: center;">结束时间</th>
	    					</tr>
	    					<c:forEach items="${page.list }" var="t" varStatus="d" >
	    						<tr style="color: white">
	    							<td style="text-align: center;">${d.index+1 }</td>
	    							<td style="text-align: center;">
		    							<p style="color: white">
											<a href="javascript:;" onclick="loadCompact(${t.tenderid })">${t.tendername }</a>
										</p>
									</td>
	    							<td style="text-align: center;">已签约</td>
	    							<td style="text-align: center;">${t.finishtime }</td>
	    						</tr>
	    					</c:forEach>
						</table>
	        		</div>
	        		<div class="pull-right">
						<span class="r inb_a page_b" style="color: white"> 
							<c:forEach items="${page.pageView }" var="p">
								${p }
							</c:forEach>
						</span>
					</div>
				
			</div>
					
			<div class="wow fadeInUp col-md-6 col-sm-6" data-wow-delay="0.9s">
				<img src="images/overview-img.jpg" class="img-responsive" alt="Overview">
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



<meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" 457-hidden="true"> &times;</button>
                <h4 class="modal-title" id="myModalLabel" style="text-align: center">
                    <span style="text-align: center">合同</span>
                </h4>
            </div>
            <div class="modal-body">
                <form action="" id="compactFm" role="form" class="form-horizontal" enctype="multipart/form-data">
					
					<div style="margin: 35px 20px 20px 20px">
						<h4>
							依照《中华人民共和国合同法》、《中华人民共和国建筑法》及其他有关法律、行政法规，遵循平等、自愿、公平和诚实信用的原则，双方就本建设工程施工事项协商一致，订立本合同。 
						</h4>
						<div style="margin: 10px">
						<span>招标公司：</span><span id="bidCompanyName"></span>
						</div>
						<div style="margin: 10px">
							<span>投标公司：</span><span id="tenderCompanyName"></span>
						</div>
						<div style="margin: 10px">
							<span>工程名称：</span><span id="itemName"></span>
						</div>
						<div style="margin: 10px">
							<span>工程概括：</span><span id="detail1"></span>
						</div>
						<div style="margin: 10px">
							<span>创建时间：</span><span id="creattime"></span>
						</div>
						<div style="margin: 10px">
							<span>开工日期：</span><span id="starttime"></span>
						</div>
						<div style="margin: 10px">
							<span>竣工日期：</span><span id="stoptime"></span>
						</div>
						<div style="margin: 10px">
							<span>合同价款：</span><span id="money"></span><span>元</span>
						</div>
						<div style="margin: 10px">
							<input type="hidden" id="tenderid" name="tenderid">
							<input type="hidden" id="starttime1" name="starttime">
							<input type="hidden" id="stoptime1" name="stoptime">
						</div>
					</div>
					

                </form>
            </div>
        </div><!-- /.modal-content -->

    </div><!-- /.modal -->
</div>


<!-- Back top -->
<a href="#back-top" class="go-top"><i class="fa fa-angle-up"></i></a>


<!-- =========================
     SCRIPTS   
============================== -->
<script src="js/jquery.js"></script>
<script type="text/javascript">
function loadCompact(tenderid){
	$.post("/bidding/loadCompact", {"tenderid":tenderid}, function (data) {
		$('#bidCompanyName').text(data.bidCompanyName);
		$('#tenderCompanyName').text(data.tenderCompanyName);
		$('#itemName').text(data.itemName);
		$('#detail1').text(data.detail1);
		$('#starttime').text(data.starttime);
		$('#stoptime').text(data.stoptime);
		$('#tenderid').val(data.tenderid);
		$('#starttime1').text(data.starttime);
		$('#stoptime1').text(data.stoptime);
		$('#creattime').text(data.creattime);
		$('#money').text(data.money);
		
	},'json');
	$('#myModal').modal('show'); 
}
/* $(function(){
	$('#submintCompact').click(function () { //提交按钮的事件
		//用ajkx的请求方式   参数为 整个form表单
    	if (confirm("你确定签订合同么？")) {
    		$.post('/bidding/insertCompact', $('#compactFm').serialize(), function (data) {
        		console.log(data.row);
                if (data.row > 0) {
                    alert("签订合同成功");
                    $('#myModal').modal('hide');
                    window.location.href="/bidding/selectAllByState";
                } else {
                    alert("签订合同失败");
                }
            }, 'json');
    	}
	});
}) */
</script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.parallax.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/smoothscroll.js"></script>
<script src="js/wow.min.js"></script>
<script src="js/custom.js"></script>

</body>
</html>