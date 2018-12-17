<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <!-- 右侧主体开始 -->
        <div class="page-content">
          <div class="content" >
            <!-- 右侧内容框架，更改从这里开始 -->
            	<div>
            		${noticeDetail }
            	</div>
            <!-- 右侧内容框架，更改从这里结束 -->
          </div>
        </div>
        <!-- 右侧主体结束 -->
    </div>
    <!-- 中部结束 -->
    <script>
    //百度统计可去掉
    var _hmt = _hmt || [];
    (function() {
      var hm = document.createElement("script");
      hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
      var s = document.getElementsByTagName("script")[0]; 
      s.parentNode.insertBefore(hm, s);
    })();
    
    function x(){
    	
    	$.post('/bidding/admin/insert',,function(data){
    	   
    	},'json')
    		var index = parent.layer.getFrameIndex(window.name);
        	parent.location.href="/bidding/admin/selectAllUser";
        	parent.layer.close(index);
 
         

//    	var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
//    	window.parent.location.reload(); //刷新父页面
//    	parent.layer.close(index);  // 关闭layer
    }
    </script>
</body>
</html>