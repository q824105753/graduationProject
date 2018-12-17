<%@include file="/site/header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="carDeta">
     <div class="carLeft">
      <div id="DB_gallery">
	
        
        <div class="DB_thumSet">
        	<img src="/site/images/confirmOrder.jpg" />
            
        </div>
          
      </div><!--DB_gallery end-->
     </div><!--carLeft-->
     
     <div class="carRight">
     
     <div align="center" style="text-align: left;margin: 30px ">
				
        		<div >
        			
        			<form action="#" method="post" id="submitOrder" role="form" >
        				
        				<div style="font-size: 20px;color: red;margin: 10px" >
        					请确认订单
        				</div>
        				
	        			<div class="form-group" style="font-size: 15px;">
	                        <label>车辆名称</label>
	                         <div>
	                            <input type="text" class="label-control" disabled="disabled" value="${car.cname }">
	        					<input type="hidden" name="cid" value="${car.cid }">
	                        </div>
	                    </div>
	                    
	                    <div class="form-group" style="font-size: 15px;">
	                        <label>租赁天数</label>
	                         <div>
	                            <input type="text" name="daycount" id="daycount" disabled="disabled" value="${daycount }">
	                        </div>
	                    </div>
	                    
	                     <div class="form-group" style="font-size: 15px;">
	                        <label>总价</label>
	                         <div>
	                            <input type="text" name="totalprice" class="label-control" disabled="disabled" value="${totalprice }">
	                        </div>
	                    </div>
	                    
	                     <div class="form-group" style="font-size: 15px;">
	                        <label>备注</label>
	                         <div>
	                        	<textarea rows="6" cols="23" name="note" class="label-control" placeholder="请输入不少于10个字">
	                        		
	                        	</textarea>
	                        </div>
	                    </div>
        			
        				<div class="form-group" style="font-size: 15px;">
	                         <div>
	                            <input type="button" onclick="submitOrder();" class="label-control" value="提交订单">
	                        </div>
	                    </div>
        				
        				
        			</form>
                    
        		</div>
			</div>
  		
     </div><!--carRight/-->
     <div class="clearfix"></div>
    </div><!--carDeta/-->


<%@include file="/site/footer.jsp"%>