<%@include file="/site/header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!--selectCar-->
    <div id="Car">
     <div class="row">
     
     <c:forEach items="${clist }" var="c">
     <div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img data-src="holder.js/300x300" src="${c.carimg }"
						alt="...">
					<div class="caption">
						<h4>${c.cname }</h4>
						<p>${c.price }/天</p>
						<p>
							<a href="frontProinfo?cid=${c.cid }" class="more">查看更多&gt;&gt;</a>
						</p>
					</div>
				</div>
			</div>
	</c:forEach>	

          </div><!--row/-->
    </div><!--Car/--> 
    <!--selectCar-->
   <%@include file="/site/footer.jsp"%>