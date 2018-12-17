<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE jsp>
<jsp lang="zh-cn">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>鑫舆汇</title>

    <!-- Bootstrap -->
    <link href="/site/css/bootstrap.min.css" rel="stylesheet">
    <link href="/site/css/bootstrap.css" rel="stylesheet">
    <link href="/site/css/nav.css" rel="stylesheet">
    <link href="/site/css/css.css" rel="stylesheet">
    <style>
     .slider{max-width:1920px;text-align:center;}
    </style>
    
  </head>
  <body>
    <div class="heads">
     <div class="top">
      <span class="headerLeft">
      	<%
				       Cookie[] cs = request.getCookies();
				       boolean b = false;
				       String username = "";
				       if(cs!=null){
				    	   for(Cookie c:cs){
					    	   if(c.getName().equals("user")){
					    		   b = true;
					    		   username = c.getValue();
					    		   break;
					    	   }
					       }
				       }
				      
				       if(b){
				    	   %>
				    	   <div style="margin: 2px;font-size: 20px">
				    	   		<a href="javascript:;" style="color: red">[您好]</a>&nbsp;
			    		   		<a href="javascript:;" onclick="logout()" style="color: red">[退出]</a>
				    	   </div>
			    		   <%  
				       }else{
				    	   %>
			    		   	<div style="margin: 2px;font-size: 20px">
			    		   		<a href="javascript:;" onclick="login()" style="color: red;">[登录]</a>&nbsp;
		                		<a href="javascript:;" onclick="register()" style="color: red">[免费注册]</a>
			    		   	</div>
			    		   <% 
				       }
				%>
      </span>
      <span class="headerRight"><img src="/site/images/phone.png" width="273" height="19" /></span>
     </div><!--top/-->
    </div><!--heads/-->
    <h1 class="xlogo">
     <a href="/site/index.jsp"><img src="/site/images/logo.png" width="210" height="77" /></a>
    </h1>
    <nav class="nav-collapse" style="text-align: center;">
      <ul>
        <li class="navCur"><a href="/site/index.jsp">首页</a></li>
        <li><a href="/frontRecommend">推荐车源</a>
         <div class="chilNav">
          <div class="row chilNavCar">
          
            
            <div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img data-src="holder.js/300x300" src="http://localhost:8080/uploadimg/奥迪Q7.jpg"
						alt="...">
					<div class="caption">
						<h4>奥迪Q7</h4>
						<p>500/天</p>
						<p>
							<a href="/frontProinfo?cid=1" class="more">查看更多&gt;&gt;</a>
						</p>
					</div>
				</div>
			</div>
			
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img data-src="holder.js/300x300" src="http://localhost:8080/uploadimg/奥迪A1.jpg"
						alt="...">
					<div class="caption">
						<h4>奥迪A1</h4>
						<p>123/天</p>
						<p>
							<a href="/frontProinfo?cid=7" class="more">查看更多&gt;&gt;</a>
						</p>
					</div>
				</div>
			</div>
			
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img data-src="holder.js/300x300" src="http://localhost:8080/uploadimg/奔驰R级.jpg"
						alt="...">
					<div class="caption">
						<h4>奔驰R级</h4>
						<p>111/天</p>
						<p>
							<a href="/frontProinfo?cid=8" class="more">查看更多&gt;&gt;</a>
						</p>
					</div>
				</div>
			</div>
			
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img data-src="holder.js/300x300" src="http://localhost:8080/uploadimg/宝马2系.jpg"
						alt="...">
					<div class="caption">
						<h4>宝马2系</h4>
						<p>111/天</p>
						<p>
							<a href="/frontProinfo?cid=31" class="more">查看更多&gt;&gt;</a>
						</p>
					</div>
				</div>
			</div>
         
            
          </div><!--row/-->
         </div><!--chilNav/-->
        </li>
        <li><a href="/frontCarList">选车中心</a></li>
        <li><a href="/frontOrderlist" >订单/还车</a></li>
<!--         <li><a href="javascript:;" onclick="frontOrderList();">查看订单</a></li> -->
        <li><a href="/selectAllMessage">发表评论</a></li>
        <li><a href="/site/contact.jsp">联系我们</a></li>
      </ul>
     </nav>
     <div class="heights">&nbsp;</div>