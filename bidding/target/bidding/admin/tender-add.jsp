<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/admin/header.jsp"%>
        <!-- 右侧主体开始 -->
        <div class="page-content">
          <div class="content" >
            <!-- 右侧内容框架，更改从这里开始 -->
            <form class="layui-form form-control" action="/bidding/admin/insertTender" method="post">
            <div style="margin:auto 200px auto 250px">
                

				<div class="layui-form-item">
					<label class="layui-form-label">招标商</label>
					<div class="layui-input-inline">
						<select name="companyid" id="companyid" lay-filter="aihao">
							<option value="">请选择</option>
							<c:forEach items="${zlist }" var="z">
								<option value="${z.companyid }"  >${z.companyname }</option>
							</c:forEach>
						</select>
					</div>
				</div>

                <div class="layui-form-item">
                    <label for="itemname" class="layui-form-label">
                        <span class="x-red">*</span>项目名称
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="tendername" name="tendername" required="" lay-verify="tendername"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                
                <div class="layui-form-item">
                    <label for="createtime" class="layui-form-label">
                        <span class="x-red">*</span>投标完成时间
                    </label>
                    <div class="layui-input-inline">
                        <input type="datetime-local" id="finishtime" name="finishtime" required="" lay-verify="finishtime"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>

				<div class="layui-form-item">
                    <label class="layui-form-label">是否删除</label>
                    <div class="layui-input-block">
                        <input type="radio" name="isdelete" value="1" title="是" class="del">
                        <input type="radio" name="isdelete" value="0" title="否" checked="" class="del">
                    </div>
                </div>

                <div class="layui-form-item">
					<label class="layui-form-label">审核状态</label>
					<div class="layui-input-inline">
						<select name="checkid" id="checkid" lay-filter="aihao">
							<option value="">请选择</option>
							<c:forEach items="${clist }" var="c">
								<option value="${c.checkid }">${c.state }</option>
							</c:forEach>
						</select>
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">招标商</label>
					<div class="layui-input-inline">
						<select name="bidid" id="bidid" lay-filter="bidid">
							<option value="">请选择</option>
							<c:forEach items="${tlist }" var="t">
								<option value="${t.companyid }"  >${t.companyname }</option>
							</c:forEach>
						</select>
					</div>
				</div>
                
                <div class="layui-form-item">
                    <label class="layui-form-label">签约状态</label>
                    <div class="layui-input-block">
                        <input type="radio" name="state" value="1" title="已签约" class="del">
                        <input type="radio" name="state" value="0" title="未签约" checked="" class="del">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label for="L_repass" class="layui-form-label">
                    </label>
                    <input type="submit" class="layui-btn" lay-filter="add"  value="提交">
                </div>
                </div>
            </form>
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