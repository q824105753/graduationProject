<%@include file="/site/header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
			
			
			<%-- <c:if test="${clistSize }>0"> --%>
				<div align="center" style="text-align: center;margin: 70px">
					<div style="font-size: 20px;color: red;margin: 15px" >
	        			您租赁的车辆如下：
	        		</div>
	        		<table class="table table-bordered table-striped" style="text-align: center;">
		        		<c:forEach items="${clist }" var="c">
		        			<tr>
		        				<td>${c.cname }</td>
		        				<td><a href="/frontReturnCar?cid=${c.cid }" >归还车辆</a> </td>
		        			</tr>
		        		</c:forEach>
	        		</table>
				</div>	
			<%-- </c:if> --%>
			
			<div align="center" style="text-align: center;margin: 70px">
				<div style="font-size: 20px;color: red;margin: 15px" >
        			您好${user.realname },下面是您的订单
        		</div>
        		<div style="text-align: center;">
        			<table class="table table-bordered table-striped" style="text-align: center;">
    					<tr>
	        				<th>序号</th>
					        <th style="text-align: center;">车辆名称</th>
					        <th style="text-align: center;">订单状态</th>
					        <th style="text-align: center;">下单时间</th>
					        <th style="text-align: center;">起始时间</th>
					        <th style="text-align: center;">结束时间</th>
					        <th style="text-align: center;">总价</th>
					        <th style="text-align: center;">备注</th>
    					</tr>
    					<c:forEach items="${olist }" var="o" varStatus="d" >
    						<tr>
    							<td style="text-align: center;">${d.index+1 }</td>
    							<td style="text-align: center;">${o.car.cname }</td>
    							<td style="text-align: center;">${o.oflag ==1 ?"已付款" : "未付款" }</td>
    							<td style="text-align: center;">${o.otime }</td>
    							<td style="text-align: center;">${o.begin }</td>
    							<td style="text-align: center;">${o.end }</td>
    							<td style="text-align: center;">${o.totalprice }</td>
    							<td style="text-align: center;">${o.note }</td>
    						</tr>
    					</c:forEach>
					</table>
        		</div>
			</div>



<%@include file="/site/footer.jsp"%>