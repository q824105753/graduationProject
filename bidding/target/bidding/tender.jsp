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
				<div  style="text-align: left">
					<button class="btn btn-default" id="add" onclick="addNotice()">撰写投标申请</button>
				</div>
				<div style="text-align: center;">
						
	        			<table class="table table-bordered" style="text-align: center;">
	    					<tr style="color: white">
		        				<th>序号</th>
						        <th style="text-align: center;">项目名称</th>
						        <th style="text-align: center;">项目状态</th>
						        <th style="text-align: center;">审核状态</th>
						        <th style="text-align: center;">结束时间</th>
						        <th style="text-align: center;">操作</th>
	    					</tr>
	    					<c:forEach items="${page.list }" var="t" varStatus="d" >
	    						<tr style="color: white">
	    							<td style="text-align: center;">${d.index+1 }</td>
	    							<td style="text-align: center;">
		    							<p style="color: white">
											<c:choose>
												<c:when test="${t.checkid==3&&t.state==0 }"><a href="javascript:;" onclick="compact(${t.tenderid })">${t.tendername }</a></c:when>
												<c:otherwise>${t.tendername }</c:otherwise>
											</c:choose>
										</p>
									</td>
	    							<td style="text-align: center;"> 
	    								<c:if test="${t.state==1 }">已签约</c:if>
	    								<c:if test="${t.state==0 }">未签约</c:if>
	    							</td>
	    							<td style="text-align: center;"> 
	    								<c:if test="${t.checkid==1 }">未审核</c:if>
	    								<c:if test="${t.checkid==2 }">审核中</c:if>
	    								<c:if test="${t.checkid==3 }">已审核</c:if>
	    							</td>
	    							<td style="text-align: center;">${t.finishtime }</td>
	    							<td style="text-align: center;">
	    								<span>
	    									<a title="编辑" href="javascript:;" class="ml-5" onclick="updateNotice(${t.tenderid})" style="text-decoration: none"> 
	    									<span class="glyphicon glyphicon-pencil"></span>
											</a>
		    								<a title="删除" href="javascript:;" onclick="delNotice(${t.tenderid})"  style="text-decoration: none">
												X
											</a>
	    								</span>
	    							</td>
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
				<img src="images/tender.png" class="img-responsive" alt="Overview">
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


<meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" 457-hidden="true"> &times;</button>
                <h4 class="modal-title" id="myModalLabel">
                    <span>投标申请</span>
                </h4>
            </div>
            <div class="modal-body">
                <form action="" id="tenderfm" role="form" class="form-horizontal" enctype="multipart/form-data">
                    <input type="hidden" name="tenderid" id="tenderid"/>

                    <div class="form-group">
                        <label for="tendername" class="control-label col-sm-3">投标项目名称</label>
                         <div class="col-sm-4">
                            <input type="text" class="form-control" name="tendername" id="tendername">
                        </div>
                    </div>

					<div class="form-group">
                        <label for="bidid" class="control-label col-sm-3">招标项目</label>
                        <div class="col-sm-4">
                             <select name="bidid" id="bidid" class="form-control">
                                <option value="">选择招标项目</option>
                            </select>
                        </div>
                    </div>
                    
                   <div class="form-group">
                        <label for="detail" class="control-label col-sm-3">投标申请书</label>
                         <div class="col-sm-4">
                            <textarea rows="" cols=""  id="detail1" name="detail" style="margin: 0px; width: 362px; height: 250px;">
                            	
                            </textarea>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="submintTender">确定</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div><!-- /.modal-content -->

    </div><!-- /.modal -->
</div>


<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
							<span>工程概括：</span><span id="detail2"></span>
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
							<span>合同价款：</span><span id="stoptime"></span><span>500000元</span>
						</div>
						<div style="margin: 10px;text-align: right;">
							<span id="stoptime"></span><span id="username"></span>
						</div>
						<div style="margin: 10px">
							<input type="hidden" id="tenderid1" name="tenderid">
							<input type="hidden" id="starttime1" name="starttime">
							<input type="hidden" id="stoptime1" name="stoptime">
						</div>
					</div>
					<div class="modal-footer">
		                <button type="button" class="btn btn-primary" id="submintCompact">同意签订</button>
		                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
		            </div>

                </form>
            </div>
        </div><!-- /.modal-content -->

    </div><!-- /.modal -->
</div>


<!-- =========================
     SCRIPTS   
============================== -->

<script src="js/jquery.js"></script>
<script type="text/javascript" >

function loadNotice(bidid) {    //加载招标项目
    $.post("/bidding/noticeList", {}, function (data) {
        $('#bidid').prop('length', 1);
        $.each(data.noticeList, function (idx, obj) {
            $('#bidid').append("<option value='" + obj.noticeid + "'>" + obj.itemname + "</option>");
        });
        $('#bidid').val(bidid);   //把传过来的bidid让他被选中状态
    }, 'json');
};

function addNotice(){
	$('#tenderfm')[0].reset();
	$('#myModal').modal('show'); 
	loadNotice();
}

function updateNotice(tenderid){
	$.post("/bidding/loadTenderFront", {"tenderid":tenderid}, function (data) {
		$('#tenderfm')[0].reset();
		console.log(data.tender.bidid);
		loadNotice(data.tender.bidid);
		console.log(data.tender.detail);
		$('#tenderid').val(data.tender.tenderid);
		$('#tendername').val(data.tender.tendername);
		$('#bidid').val(data.tender.bidid);
		$('#detail1').val(data.tender.detail);
	},'json');
	$('#myModal').modal('show'); 
}

function delNotice(tenderid){
	if (confirm("你确定删除么？")) {
		$.post('/bidding/softDelTenderFront', {tenderid: tenderid}, function (data) {
	        if (data.row > 0) {   
	            alert("删除成功");
	            window.location.href="/bidding/selectAllTenderFront";
	        } else {
	            alert("删除失败");
	        }
	    }, 'json');
	}
}




</script>
<script type="text/javascript">
function compact(tenderid){
	$.post("/bidding/compact", {"tenderid":tenderid}, function (data) {
		$('#bidCompanyName').text(data.bidCompanyName);
		$('#tenderCompanyName').text(data.tenderCompanyName);
		$('#itemName').text(data.itemName);
		$('#detail2').text(data.detail1);
		$('#starttime').text(data.starttime);
		$('#stoptime').text(data.stoptime);
		$('#tenderid1').val(tenderid);
		$('#starttime1').text(data.starttime);
		$('#stoptime1').text(data.stoptime);
		$('#username').text(data.username);
		$('#creattime').text(data.creattime);
	},'json');
	$('#myModal2').modal('show'); 
}
$(function(){
	$('#submintCompact').click(function () { //提交按钮的事件
		//用ajkx的请求方式   参数为 整个form表单
    	if (confirm("你确定签订合同么？")) {
    		$.post('/bidding/insertCompact', $('#compactFm').serialize(), function (data) {
        		console.log(data.row);
                if (data.row > 0) {
                    alert("签订合同成功");
                    $('#myModal2').modal('hide');
                    window.location.href="/bidding/selectAllTenderFront";
                } else {
                    alert("签订合同失败");
                }
            }, 'json');
    	}
	});
})
</script>
<script src="js/tender.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.parallax.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/smoothscroll.js"></script>
<script src="js/wow.min.js"></script>
<script src="js/custom.js"></script>

</body>
</html>