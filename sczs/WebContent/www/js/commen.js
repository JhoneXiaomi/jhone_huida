 

// get orderId 
function getOrderId(){
	
	var now = new Date();
	var year = now.getFullYear();
	var month =(now.getMonth() + 1).toString();
	var day = (now.getDate()).toString();
	var hour = (now.getHours()).toString();
	var minute = (now.getMinutes()).toString();
	var second = (now.getSeconds()).toString();
	var ms = (now.getMilliseconds()).toString();
	if (month.length == 1) {
	    month = "0" + month;
	}
	if (day.length == 1) {
	    day = "0" + day;
	}
	if (hour.length == 1) {
	    hour = "0" + hour;
	}
	if (minute.length == 1) {
	    minute = "0" + minute;
	}
	  if (second.length == 1) {
	    second = "0" + second;
	} 
	var dateTime = year + month +  day + hour + minute + second + ms;
	
	return dateTime;
	}
	
function getOrder(){
	
	 var orderId =  getOrderId();
	 var clientName= $("input[name='clientName']").val();
	 var phone= $("input[name='phone']").val();
	 var acreage= $("input[name='acreage']").val();
	 var branchCompany= $('#branchCompany').val();
	 console.info("orderId"+orderId,"clientName"+clientName+"phone"+phone+"acreage"+acreage+"branchCompany"+branchCompany);
	 if(!clientName.match(/^\s*$/) && phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/) && !acreage.match(/^\s*$/)){
		 
		 alert("afds");
		 $.ajax({
				type : "POST",
				dataType : "json",
				async: false,
				url : "saveOrder",
				data : {'branchCompany':branchCompany,'orderId':orderId,'clientName':clientName,'phone':phone,'acreage':acreage,'sourceType':'免费申请'},
				success : function(data) {
					if (data.data == "ok") {
						alert("请您稍等，稍后会有客服人员为您服务!");
					}else{
						alert("保存失败");
					}
				}
			});  
	 }else if(clientName.match(/^\s*$/)){
		 alert("对不起,请正确填写姓名!");
	 }else if(!phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/)){
		 alert("对不起，请正确填写电话格式!");
	 }else if(acreage.match(/^\s*$/)){
		 alert("对不起,请填请正确天填写房屋面积!");
	 }
}