<%@include file="/site/header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<h4 class="h4Title">搜索</h4>
<div class="selectBox">
	<form action="frontCarList" method="post">
		<table width="100%">
			<tr>

				<td class="sel1"><h5 class="h5Title">车名：</h5></td>
				<td width="250px"><input type="text" id="cname" name="cname" placeholder="请输入车辆名称"
					value="${car.cname }"></td>

				<td class="sel1"><h5 class="h5Title">品牌：</h5></td>
				<td width="150px"><select name="c2id" id="c2id">
						<option value="0">请选择品牌</option>
						<c:forEach items="${c2 }" var="c2">
							<option value="${c2.c2id }"
								<c:if test="${car.c2id==c2.c2id }"> selected="selected" </c:if>>${c2.c2name}</option>
						</c:forEach>
				</select></td>

				<td class="sel1"><h5 class="h5Title">车型：</h5></td>
				<td width="150px"><select name="c1id" id="c1id">
						<option value="0">请选择车型</option>
						<c:forEach items="${c1 }" var="c1">
							<option value="${c1.c1id }"
								<c:if test="${car.c1id==c1.c1id }"> selected="selected" </c:if>>${c1.c1name}</option>
						</c:forEach>
				</select></td>

				<td>
					<div class="btn-group">
						<button type="submit" class="btn btn-default"
							style="font-weight: 800; color: #000;">&nbsp;&nbsp;&nbsp;搜&nbsp;索&nbsp;&nbsp;&nbsp;</button>
					</div>
				</td>
		</table>
		<!--/-->
	</form>
</div>
<!--selectBox/-->
<!--selectCar-->
<div id="Car">
	<div class="row">

		<c:forEach items="${page.list }" var="c">
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img data-src="holder.js/300x300" src="${c.carimg }"
						alt="...">
					<div class="caption">
						<h4>${c.cname }</h4>
						<p>￥${c.price }/天</p>
						<p>
							<a href="/frontProinfo?cid=${c.cid }" class="more">查看更多&gt;&gt;</a>
						</p>
					</div>
				</div>
			</div>
			<!--col-sm-6 col-md-2/-->
		</c:forEach>

	</div>
	<!--row/-->
	<div class="pull-right">
	<span class="r inb_a page_b"> <c:forEach
			items="${page.pageView }" var="p">
				${p }
				</c:forEach>
	</span>
</div>
</div>
<!--Car/-->
<!--selectCar-->

<%@include file="/site/footer.jsp"%>