<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/bid/header.jsp"%>
<!-- 右侧主体开始 -->
<div class="page-content">
	<div class="content">
		<!-- 右侧内容框架，更改从这里开始 -->
		<form class="layui-form form-control" action="/bidding/bid/insertCompany"
			method="post">
			<div style="margin: auto 200px auto 250px">
				<div class="layui-form-item">
					<label for="L_email" class="layui-form-label"> <span
						class="x-red">*</span>公司名称
					</label>
					<div class="layui-input-inline">
						<input type="text" id="companyname" name="companyname" required=""
							autocomplete="off" class="layui-input">
					</div>
					<div class="layui-form-mid layui-word-aux">
						<span class="x-red"></span>
					</div>
				</div>


				<!-- <div class="layui-form-item">
					<label class="layui-form-label">省</label>
					<div class="layui-input-inline">
						<select name="provinceid" id="provinceid" lay-filter="">
							<option>请选择省</option>
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">市</label>
					<div class="layui-input-inline">
						<select name="cityid" id="cityid" lay-filter="">
							<option>请选择市</option>
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">区</label>
					<div class="layui-input-inline">
						<select name="" id="" lay-filter="">
							<option>请选择区</option>
						</select>
					</div>
				</div> -->
				
				
				
				<div class="layui-form-item">
					<label for="L_email" class="layui-form-label"> <span
						class="x-red">*</span>公司地址
					</label>
					<div class="layui-input-inline">
						<input type="text" id="addressname" name="addressname" required=""
							autocomplete="off" class="layui-input">
					</div>
					<div class="layui-form-mid layui-word-aux">
						<span class="x-red"></span>
					</div>
				</div>
				
				
				<div class="layui-form-item">
					<label for="name" class="layui-form-label"> <span
						class="x-red">*</span>公司电话
					</label>
					<div class="layui-input-inline">
						<input type="text" id="tel" name="tel" required=""
							lay-verify="tel" autocomplete="off" class="layui-input">
					</div>
				</div>


				<div class="layui-form-item">
					<label class="layui-form-label">负责人</label>
					<div class="layui-input-inline">
						<select name="userid" id="userid" lay-filter="aihao">
							<option value="">请选择</option>
							<c:forEach items="${ulist }" var="u">
								<option value="${u.userid }">${u.name }</option>
							</c:forEach>
						</select>
					</div>
				</div>

				<div class="layui-form-item">
					<label for="L_repass" class="layui-form-label"> </label> <input
						type="submit" class="layui-btn" lay-filter="add" value="提交">
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
$(function () {
	   $.post('/bidding/admin/plist',{},function (data) {
		   
	       //data返回一个json数组，通过遍历的方式追加到下拉列表里
	       /* $('#provinceid').append("<option>请选择省</option>"); */
	       $.each(data,function (idx,obj) {
	           var opt = "<option value='"+obj.provinceid+"'>"+obj.name+"</option>";//创建一个DOM节点，相当于下行代码
	           //var opt =
	           $('#provinceid').append(opt);
	       });
	   },'json');
	   $('#provinceid').change(function () {
	       $.post('/bidding/admin/clist',{'provinceid':this.value},function (data) {
	           //
	           $('#cityid').prop('length',0);//先清空市
	           /* $('#cityid').append("<option>请选择市</option>"); */
	           $.each(data.clist,function (idx,obj) {
	               var opt = "<option value='"+obj.cityid+"'>"+obj.name+"</option>";
	               $('#cityid').append(opt);
	           });
	       },'json');
	   });
	});
 
    </script>

</body>
</html>