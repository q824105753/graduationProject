<%@include file="/site/header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="carDeta">
     <div class="carLeft">
      <div id="DB_gallery">
	
        
        <div class="DB_thumSet">
        	<img src="/site/images/comment.jpg" />
            
        </div>
          
      </div><!--DB_gallery end-->
     </div><!--carLeft-->
     
     <div class="carRight">
     
     
        <form action="/insertMessage" method="post">
        <div align="center">	
        
        <div style="margin: 20px"><h2>发表评论</h2></div>
        
        
        <div style="margin: 20px;text-align: center" >
            <textarea rows="10" cols="50" placeholder="不能少于5个字" name="comment"></textarea>
        </div>
        
       	<div style="margin: 20px 0px 20px;text-align: center" >
        	<input type="submit" value="发表评论">
        </div>

        	
        </div>
  		</form>
  		
  		
     </div><!--carRight/-->
     <div class="clearfix"></div>
    </div><!--carDeta/-->
	
	
	<div class="carDeta">
     <div class="carLeft">
      <div id="DB_gallery">
	
        
        <div class="DB_thumSet">
        	
        	<c:forEach items="${mlist }" var="m">
				<div style="margin: 20px;text-align: left""><h3>${m.user.uname }</h3></div>
				<div style="margin: 20px 0px 20px;text-align: left"" >
					${m.comment }
				</div>
			</c:forEach>
            
        </div>
          
      </div><!--DB_gallery end-->
     </div><!--carLeft-->
     
     <div class="clearfix"></div>
    </div><!--carDeta/-->
	
	
	

<%@include file="/site/footer.jsp"%>