<%@include file="/site/header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!--proinfo-->
    <h4 class="h4Title">车辆详情</h4>
    
    <form action="/confirmOrder" method="post">
    <div class="carDeta">
     <div class="carLeft">
      <div id="DB_gallery">
	
        
        <div class="DB_thumSet">
        	<a href="${car.carimg }"><img src="${car.carimg }" /></a>
        </div>
          
      </div><!--DB_gallery end-->
     </div><!--carLeft-->

     
     
     <div class="carRight" >
      <h2 align="center">${car.cname }</h2>
      <input type="hidden" name="cid" value="${car.cid }">
      <table class="tableCar">
       <tr>
        <th style="text-align:right;padding-right:5px;">价格：</th>
        <td><strong class="red"> ${car.price } </strong>元/天</td>
       </tr>
       <tr>
        <th style="text-align:right;padding-right:5px;">车牌号：</th>
        <td>${car.platenumber }</td>
       </tr>
       <!-- <tr>
        <th style="text-align:right;padding-right:5px;">里程：</th>
        <td>7.0万公里</td>
       </tr>
       <tr>
        <th style="text-align:right;padding-right:5px;">年检有效期至：</th>
        <td>2015年1月</td>
       </tr> -->
       
       <tr>
        <th style="text-align:right;padding-right:5px;">车龄：</th>
        <td>${car.buytime }</td>
       </tr>
       
       <tr>
       	<th style="text-align:right;padding-right:5px;">租赁的天数：</th>
       	<td style="text-align:left;padding-right:5px;">
       		<button type="button" class="btn"  style="font-size: 20px" id="reduce" onclick="jian()"> - </button>
       			<input type="text" name="daycount" id="daycount" value="1" style="width: 40px;text-align: center">
       		<button type="button" class="btn" style="font-size: 20px;" id="plus" onclick="javascript:jia();"> + </button>

       	</td>
       </tr>
       
      <tr>
      	<td align="right"><i class="fa fa-star-o"></i><input type="submit" value="确认租赁" class="btn btn-info" style="font-weight: 800; color: gray;"></td>
      </tr>
      
      </table><!--tableCar/-->
     </div><!--carRight/-->
     <div class="clearfix"></div>
    </div><!--carDeta/-->
    </form>



   <%@include file="/site/footer.jsp"%>