<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/header.jsp"%>

<section id="video" class="parallax-section" style="background-color: black">
	<div class="container">
		<div class="row">

			<div class="wow fadeInUp col-md-6 col-sm-10" data-wow-delay="1.3s">
				<div style="text-align: center;">
	        			<table class="table table-bordered" style="text-align: center;">
	    					<tr style="color: white">
		        				<th>序号</th>
						        <th style="text-align: center;">项目名称</th>
						        <th style="text-align: center;">开始时间</th>
						        <th style="text-align: center;">截止时间</th>
						        <th style="text-align: center;">操作</th>
	    					</tr>
	    					<c:forEach items="${page.list }" var="b" varStatus="d" >
	    						<tr style="color: white">
	    							<td style="text-align: center;">${d.index+1 }</td>
	    							<td style="text-align: center;">
		    							<p style="color: white">
											<a href="javascript:;"  onclick="item(${b.noticeid})">${b.itemname }</a>
										</p>
									</td>
	    							<td style="text-align: center;">${b.noticebegintime }</td>
	    							<td style="text-align: center;">${b.noticestoptime }</td>
	    							<td style="text-align: center;"> <a href="javascript:;" onclick="tender(${b.noticeid})">投标</a> </td>
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
			<div class="wow fadeInUp col-md-6 col-sm-10" data-wow-delay="1.6s">
				<div class="embed-responsive embed-responsive-16by9">
					<img src="images/video.png">
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


<meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" 457-hidden="true"> &times;</button>
                <h4 class="modal-title" id="myModalLabel">
                    <span>招标详情</span>
                </h4>
            </div>
            <div class="modal-body">
                <form action="insertuser" id="carfm" role="form" class="form-horizontal" enctype="multipart/form-data">

                    <div class="form-group" align="center">
                        <h4 id="itemname"></h4>
                    </div>

					<div class="form-group" align="right">
						<span><p>开始时间：</p><p id="noticebegintime">2018/02/20</p></span>
                    </div>
                    
                    <div class="form-group" align="center" style="margin: 10px">
                        	<span><div id="detail1"></div></span>
                    </div>
                    
                    <div class="form-group" align="right">
                        	<span>招标商：<p id="companyname">2018/04/20</p></span>
                    </div>
                    
                    <div class="form-group" align="right">
                        	<span><p>负责人：</p><p id="username">2018/04/20</p></span>
                    </div>
                    
                    <div class="form-group" align="right">
                        	<span><p>结束时间：</p><p id="noticestoptime">2018/04/20</p></span>
                    </div>
                    
                    

                </form>
            </div>
        </div><!-- /.modal-content -->

    </div><!-- /.modal -->
</div>


<meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" 457-hidden="true"> &times;</button>
                <h4 class="modal-title" id="myModalLabel">
                    <span>撰写投标申请</span>
                </h4>
            </div>
            <div class="modal-body">
                <form action="" id="tenderfm" role="form" class="form-horizontal" enctype="multipart/form-data">
                    <input type="hidden" name="bidid" id="bidid"/>

                    <div class="form-group">
                        <label for="tendername" class="control-label col-sm-3">投标项目名称</label>
                         <div class="col-sm-4">
                            <input type="text" class="form-control" name="tendername" id="tendername">
                        </div>
                    </div>

					<!-- <div class="form-group">
                        <label for="bidid" class="control-label col-sm-3">招标项目</label>
                        <div class="col-sm-4">
                             <select name="bidid" id="bidid" class="form-control">
                                <option value="">选择招标项目</option>
                            </select>
                        </div>
                    </div> -->
                    
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


<!-- =========================
     SCRIPTS   
============================== -->

<script src="js/jquery.js"></script>
<script type="text/javascript">

function item(noticeid){
	$.post("frontNotice", {"noticeid":noticeid}, function (data) {
		console.log("232323");
		$('#itemname').text(data.notice.itemname);
		$('#noticebegintime').text(data.notice.noticebegintime);
		$('#noticestoptime').text(data.notice.noticestoptime);
		$('#companyname').text(data.notice.company.companyname);
		$('#username').text(data.notice.user.name);
		$('#detail1').text(data.notice.detail);
		
		
	},'json');
	
	$('#myModal').modal('show'); 
}

function loadNotice(noticeid) {    //加载招标项目
    $.post("/bidding/noticeList", {}, function (data) {
        $('#bidid').prop('length', 1);
        $.each(data.noticeList, function (idx, obj) {
            $('#bidid').append("<option value='" + obj.noticeid + "'>" + obj.itemname + "</option>");
        });
        $('#bidid').val(noticeid);   //把传过来的noticeid让他被选中状态
    }, 'json');
};

function tender(noticeid){
	$('#tenderfm')[0].reset();
	$.post("frontNotice", {"noticeid":noticeid}, function (data) {

		console.log("232323");
		$('#bidid').val(noticeid);
		$('#tendername').val(data.notice.itemname);
		
	},'json');
	$('#myModal2').modal('show'); 
	loadNotice();
}

$(function(){

	$('#submintTender').click(function () { //提交按钮的事件
	    
		//用ajkx的请求方式   参数为 整个form表单
    	$.post('/bidding/insertTenderFront', $('#tenderfm').serialize(), function (data) {
    		console.log(data.row);
            if (data.row > 0) {
                alert("添加投标申请成功");
                $('#myModal2').modal('hide');
                window.location.href="/bidding/selectAllNoticeFront";
            } else {
                alert("添加投标申请失败");
            }
        }, 'json');

	});
	
})

</script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.parallax.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/smoothscroll.js"></script>
<script src="js/wow.min.js"></script>
<script src="js/custom.js"></script>

</body>
</html>