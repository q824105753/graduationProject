<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 <div class="footer">
     <p>
      <a href="/site/index.jsp">首页</a>
      <a href="/frontRecommend">推荐车源</a>
      <a href="/frontCarList">选车中心</a>
      <a href="/frontOrderlist">订单/还车</a>
      <a href="/selectAllMessage">发表评论</a>
      <a href="/site/contact.jsp" style="border:0;">联系我们</a>
     </p>
     <p>CopyRight © 2014 鑫舆汇 All Rights Reserved.</p>
     <p>沪ICP备 12007626号-1 公安备案号</p>
     <p>版权所有：上海市闵行区吴中路1189号2A展示区</p>
    </div><!--footer/-->
    
    <!--客服代码 start-->
     <div class="kefu">
       <div class="kefuBack">
        <img src="/site/images/fuchuang.png" width="25" height="147" class="keLeft" />
        <div class="kefuRight">
          <div class="kefuRightBox">
            地址：上海市闵行区吴中路1189号2A展示区<br />
            电话：021-51966819<br />
            客服QQ：<a href="http://wpa.qq.com/msgrd?v=3&uin=2445638917&site=qq&menu=yes" target="_blank" title="点击在线咨询">2445638917</a> <br />
           <span class="kefuRightClick">&nbsp;</span>
          </div><!--kefuRightBox/-->
        </div><!--kefuRight/-->
       </div><!--kefuBack/-->
      </div><!--kefu-->
     <div class="pinggu">
      &nbsp;
     </div><!--pinggu/-->
     <div class="pingguClick">&nbsp;</div>
    <!--客服代码 end-->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/site/js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/site/js/bootstrap.min.js"></script>
    <script src="/site/js/js.js"></script>
    
    <script type="text/javascript">
    	function submitOrder(){
    		if (confirm("你确定提交订单么？")) {
    			$.post('/submitOrder?daycount='+$('#daycount').val(), $('#submitOrder').serialize(), function (data) {
    				if (data.row > 0) {
                        alert("提交订单成功");
                        window.location.href="/frontOrderlist";
                    } else {
                        alert("提交订单失败");
                    }
        		}, 'json');
    		}
    		
    	}
    	function frontOrderList(){
    		window.location.href="/frontOrderlist";
    	}
    	function register(){
    		window.location.href="/toRegister";	
    	}
    	
    	function login(){
    		window.location.href="/toLogin";
    	}
    	
    	function logout(){
    		window.location.href="/logout";
    	}
    	
    	function jian(){
    		var daycount = (Number)($('#daycount').val());
    		if(daycount<=1){
    			$('#daycount').prop("value","1");
    		}
    		if(daycount>1){
    			$('#daycount').prop("value",daycount-1);
    		}
    	}
    	function jia(){
    		var daycount = (Number)($('#daycount').val());
    		$('#daycount').prop("value",daycount+1); 
    	}
    	
   
	</script>

    <!--响应式导航-->
    <script>
      var navigation = responsiveNav(".nav-collapse", {
        animate: true,                    // Boolean: Use CSS3 transitions, true or false
        transition: 284,                  // Integer: Speed of the transition, in milliseconds
        label: "Menu",                    // String: Label for the navigation toggle
        insert: "after",                  // String: Insert the toggle before or after the navigation
        customToggle: "",                 // Selector: Specify the ID of a custom toggle
        closeOnNavClick: false,           // Boolean: Close the navigation when one of the links are clicked
        openPos: "relative",              // String: Position of the opened nav, relative or static
        navClass: "nav-collapse",         // String: Default CSS class. If changed, you need to edit the CSS too!
        navActiveClass: "js-nav-active",  // String: Class that is added to <html> element when nav is active
        jsClass: "js",                    // String: 'JS enabled' class which is added to <html> element
        init: function(){},               // Function: Init callback
        open: function(){},               // Function: Open callback
        close: function(){}               // Function: Close callback
      });
    </script>
     <!--banner焦点轮换-->
     <script src="/site/js/jquery.excoloSlider.js"></script>
     <script>
		$(function () {
		$("#sliderA").excoloSlider();
		});
	 </script>
     <!--图片左右滚动-->
     <script type="text/javascript" src="/site/js/slider.js"></script>
	<script type="text/javascript">
	$(function(){
		//默认状态下左右滚动
		$("#s1").xslider({
			unitdisplayed:4,
			movelength:1,
			unitlen:300,
			autoscroll:30000
		});
	})
	</script>

  </body>
</html>