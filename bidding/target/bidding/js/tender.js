$(function(){

	$('#submintTender').click(function () { //提交按钮的事件
	    if ("" == $('#tenderid').val()) {  //判断tenderid是否有值  如果没有值 就添加   有值就是修改
	    	//用ajkx的请求方式   参数为 整个form表单
	    	$.post('/bidding/insertTenderFront', $('#tenderfm').serialize(), function (data) {
	    		console.log(data.row);
                if (data.row > 0) {
                    alert("添加投标申请成功");
                    $('#myModal').modal('hide');
                    window.location.href="/bidding/selectAllTenderFront";
                } else {
                    alert("添加投标申请失败");
                }
            }, 'json');
	        
	    } else {
	    	$.post('/bidding/updateTenderFront', $('#tenderfm').serialize(), function (data) {
	    		console.log(data.row);
                if (data.row > 0) {
                    alert("修改投标申请成功");
                    $('#myModal').modal('hide');
                    window.location.href="/bidding/selectAllTenderFront";
                } else {
                    alert("修改投标申请失败");
                }
            }, 'json');
	        
	    }
	});
	
})
