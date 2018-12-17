<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/admin/header.jsp"%>
        <!-- 右侧主体开始 -->
        <div class="page-content">
          <div class="content" >
            <!-- 右侧内容框架，更改从这里开始 -->
            <form class="layui-form form-control" action="/bidding/admin/updateTender" method="post">
            <div style="margin:auto 200px auto 250px">
              <input type="hidden" id="tenderid" name="tenderid" value="${tender.tenderid }">  
              <input type="hidden" id="companyid" name="companyid" value="${tender.companyid }">  
              <input type="hidden" id="tendername" name="tendername" value="${tender.tendername }">  
              <input type="hidden" id="finishtime" name="finishtime" value="${tender.finishtime1 }">  
              <input type="hidden" id="isdelete" name="isdelete" value="${tender.isdelete }">  
              <input type="hidden" id="bidid" name="bidid" value="${tender.bidid }">  
              <input type="hidden" id="state" name="state" value="${tender.state }">  

				<div class="layui-form-item">
					<label class="layui-form-label">招标商</label>
					<div class="layui-input-inline">
						<select name="companyid" id="companyid" lay-filter="aihao" disabled="disabled">
							<option value="">请选择</option>
							<c:forEach items="${zlist }" var="z">
								<option value="${z.companyid }" <c:if test="${z.companyid==tender.companyid }">selected</c:if> >${z.companyname }</option>
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
                               autocomplete="off" class="layui-input" value="${tender.tendername }"  disabled="disabled">
                    </div>
                </div>
                
                <div class="layui-form-item">
                    <label for="createtime" class="layui-form-label">
                        <span class="x-red">*</span>投标完成时间
                    </label>
                    <div class="layui-input-inline">
                        <input type="datetime-local" id="finishtime" name="finishtime" required="" lay-verify="finishtime"
                               autocomplete="off" class="layui-input" value="${tender.finishtime1 }"  disabled="disabled">
                    </div>
                </div>

				<div class="layui-form-item">
                    <label class="layui-form-label">是否删除</label>
                    <div class="layui-input-block">
                        <input type="radio" disabled="disabled" name="isdelete" value="1" title="是" class="del" <c:if test="${tender.isdelete==1 }">checked</c:if> >
                        <input type="radio" disabled="disabled" name="isdelete" value="0" title="否" class="del" <c:if test="${tender.isdelete==0 }">checked</c:if> >
                    </div>
                </div>

                <div class="layui-form-item">
					<label class="layui-form-label">审核状态</label>
					<div class="layui-input-inline">
						<select name="checkid" id="checkid" lay-filter="aihao">
							<option value="">请选择</option>
							<c:forEach items="${clist }" var="c">
								<option value="${c.checkid }" <c:if test="${c.checkid==tender.checkid }">selected</c:if> >${c.state }</option>
							</c:forEach>
						</select>
					</div>
				</div>

				<div class="layui-form-item">
					<label class="layui-form-label">招标项目</label>
					<div class="layui-input-inline">
						<select name="bidid" id="bidid" lay-filter="bidid" disabled="disabled">
							<option value="">请选择</option>
							<c:forEach items="${nlist }" var="t">
								<option value="${t.noticeid }" <c:if test="${t.noticeid==tender.bidid }">selected</c:if> >${t.itemname }</option>
							</c:forEach>
						</select>
					</div>
				</div>
                
                <div class="layui-form-item">
                    <label class="layui-form-label">签约状态</label>
                    <div class="layui-input-block" >
                        <input type="radio" disabled="disabled" name="state" value="1" title="已签约" class="del" <c:if test="${tender.state==1 }">checked</c:if> >
                        <input type="radio" disabled="disabled" name="state" value="0" title="未签约" class="del" <c:if test="${tender.state==0 }">checked</c:if> >
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