<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/bid/header.jsp"%>
        <!-- 右侧主体开始 -->
        <div class="page-content">
          <div class="content" >
            <!-- 右侧内容框架，更改从这里开始 -->
            <form class="layui-form form-control" action="/bidding/bid/updateNotice" method="post">
            <div style="margin:auto 200px auto 250px">
                
                <input type="hidden" id="noticeid" name="noticeid" value="${notice.noticeid }">
                <input type="hidden" id="addressid" name="addressid" value="${notice.address.addressid }">

				<div class="layui-form-item">
					<label class="layui-form-label">招标商</label>
					<div class="layui-input-inline">
						<select name="companyid" id="companyid" lay-filter="aihao">
							<option value="">请选择</option>
							<c:forEach items="${company }" var="company">
								<option value="${company.companyid }" <c:if test="${company.companyid==notice.companyid }">selected</c:if> >${company.companyname }</option>
							</c:forEach>
						</select>
					</div>
				</div>

				<div class="layui-form-item">
                    <label for="noticebegintime" class="layui-form-label">
                        <span class="x-red">*</span>投标开始日
                    </label>
                    <div class="layui-input-inline">
                        <input type="datetime-local" id="noticebegintime" name="noticebegintime" required="" lay-verify="nikename"
                               autocomplete="off" class="layui-input" value="${notice.noticebegintime1 }">
                    </div>
                </div>
                
                <div class="layui-form-item">
                    <label for="noticestoptime" class="layui-form-label">
                        <span class="x-red">*</span>投标结束日
                    </label>
                    <div class="layui-input-inline">
                        <input type="datetime-local" id="noticestoptime" name="noticestoptime" required="" lay-verify="nikename"
                               autocomplete="off" class="layui-input" value="${notice.noticestoptime1 }">
                    </div>
                </div>
                
                <div class="layui-form-item">
					<label for="addressname" class="layui-form-label"> <span
						class="x-red">*</span>投标地址
					</label>
					<div class="layui-input-inline">
						<input type="text" id="addressname" name="addressname" required=""
							autocomplete="off" class="layui-input" value="${notice.address.addressname }">
					</div>
					<div class="layui-form-mid layui-word-aux">
						<span class="x-red"></span>
					</div>
				</div>

                <div class="layui-form-item">
                    <label for="itemname" class="layui-form-label">
                        <span class="x-red">*</span>项目名称
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="itemname" name="itemname" required="" lay-verify="nikename"
                               autocomplete="off" class="layui-input" value="${notice.itemname }">
                    </div>
                </div>

				<%-- <div class="layui-form-item">
					<label class="layui-form-label">负责人</label>
					<div class="layui-input-inline">
						<select name="userid" id="userid" lay-filter="aihao">
							<option value="">请选择</option>
							<c:forEach items="${ulist }" var="u">
								<option value="${u.userid }">${u.name }</option>
							</c:forEach>
						</select>
					</div>
				</div> --%>
                
                

                <div class="layui-form-item">
                    <label class="layui-form-label">是否发布</label>
                    <div class="layui-input-block">
                        <input type="radio" name="isissue" value="1" class="del" title="是" <c:if test="${notice.isissue==1 }">checked</c:if> >
                        <input type="radio" name="isissue" value="0" class="del" title="否" <c:if test="${notice.isissue==0 }">checked</c:if> >
                    </div>
                </div>


                <div class="layui-form-item">
                    <label for="createtime" class="layui-form-label">
                        <span class="x-red">*</span>创建时间
                    </label>
                    <div class="layui-input-inline">
                        <input type="datetime-local" id="createtime" name="createtime" required="" lay-verify="nikename"
                               autocomplete="off" class="layui-input" value="${notice.createtime1 }">
                    </div>
                </div>
                
                <div class="layui-form-item">
                    <label for="createtime" class="layui-form-label">
                        <span class="x-red">*</span>招标详情
                    </label>
                    <div class="layui-input-inline">
                        
                        <textarea rows="5px" cols="100px" name="detail" autocomplete="off" class="layui-textarea" lay-verify="nikename">
                        	${notice.detail }
                        </textarea>
                    </div>
                </div>
                
                
                <div class="layui-form-item">
                    <label class="layui-form-label">是否删除</label>
                    <div class="layui-input-block">
                        <input type="radio" name="isdelete" value="1" title="是" class="del" <c:if test="${notice.isdelete==1 }">checked</c:if> >
                        <input type="radio" name="isdelete" value="0" title="否" checked="" class="del" <c:if test="${notice.isdelete==0 }">checked</c:if> >
                    </div>
                </div>

                <div class="layui-form-item">
                    <label for="L_repass" class="layui-form-label">
                    </label>
                    <button  class="layui-btn" lay-filter="add" onclick="x()" >
                        增加
                    </button>
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