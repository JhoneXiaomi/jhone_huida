<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/head.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>	
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
		<link rel="bookmark" type="image/x-icon" href="${ctx }/mobile/images/minTitle.png"/>
		<link rel="shortcut icon" href="${ctx }/mobile/images/minTitle.png"/>
		<link rel="icon" href="${ctx }/mobile/images/minTitle.png"/>
		<link href="${ctx }/mobile/css/style.css" rel="stylesheet" type="text/css"/>
		<script type="text/javascript" src="${ctx }/mobile/js/jquery-1.10.2.min.js"></script>
		<title></title>
		<script type="text/javascript">
		$(document).ready(function(){
			var branchCompany = '${sessionScope.branchCompany}';
			$("#checkBut").bind("click",function(){
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
				 var orderId = dateTime;
				 var clientName= $("input[name='clientName']").val();
				 var phone= $("input[name='phone']").val();
				 if(clientName.match(/^\s*$/)){
					 alert("用户名不能为空，请填写用户名!");
					 return false;
				 }
				 if(!phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/)){
					 alert("手机号格式不正确，请重新填写手机号!");
					 return false;
				 }
				 $.ajax({
						type : "POST",
						dataType : "json",
						url : "${pageContext.request.contextPath}/MsaveOrder",
						data : {'branchCompany':branchCompany,'orderId':orderId,'clientName':clientName,'phone':phone},
						success : function(data) {
							if (data.data == "ok") {
								alert("您的订单已经提交成功，稍后会将有工作人员联系你！");
							}else{
								alert("保存失败");
							}
						}
					});  
			});
			});
		</script>
	</head>
<body>
	<div class="pinpaigushi_warp">
	  <div class="pinpai_con">
	    <div class="pinpai_img">
	      <img src="${ctx }/mobile/images/pinpaigushi/pinpai_01.jpg" />
	      <img src="${ctx }/mobile/images/pinpaigushi/pinpai_02.jpg" />
	      <img src="${ctx }/mobile/images/pinpaigushi/pinpai_03.jpg" />
	      <img src="${ctx }/mobile/images/pinpaigushi/pinpai_04.jpg" />
	      <img src="${ctx }/mobile/images/pinpaigushi/pinpai_05.jpg" />
	      <img src="${ctx }/mobile/images/pinpaigushi/pinpai_06.jpg" />
	      <img src="${ctx }/mobile/images/pinpaigushi/pinpai_07.jpg" />
	      <img src="${ctx }/mobile/images/pinpaigushi/pinpai_08.jpg" />
	      <img src="${ctx }/mobile/images/pinpaigushi/pinpai_09.jpg" />
	     </div>
	      <div class="pinpai_sjs">
	        <ul class="clearfix">
	         <li><a href=""><img src="${ctx }/mobile/images/56fdc9c7d8849.jpg" /><span>赵玉旗</span></a></li>
	         <li><a href=""><img src="${ctx }/mobile/images/56fdc9d644d04.jpg" /><span>赵玉旗</span></a></li>
	         <li><a href=""><img src="${ctx }/mobile/images/56fdc9184ebda.jpg" /><span>赵玉旗</span></a></li>
	         <li><a href=""><img src="${ctx }/mobile/images/56fdccace5594.jpg" /><span>赵玉旗</span></a></li>
	         <li><a href=""><img src="${ctx }/mobile/images/56fdca018b7e2.jpg" /><span>赵玉旗</span></a></li>
	         <li><a href=""><img src="${ctx }/mobile/images/56fdc9c7d8849.jpg" /><span>赵玉旗</span></a></li>
	        </ul>
	      </div>
	    <div class="pinpai_img">
	      <img src="${ctx }/mobile/images/pinpaigushi/pinpai_11.jpg" />
	      <img src="${ctx }/mobile/images/pinpaigushi/pinpai_12.jpg" />
	      <img src="${ctx }/mobile/images/pinpaigushi/pinpai_13.jpg" />
	      <img src="${ctx }/mobile/images/pinpaigushi/pinpai_14.jpg" />
	    </div>
	    
	    <div class="pinpai_inp">
	      <div class="pp_inp_images"><img src="${ctx }/mobile/images/pinpaigushi/pinpai_15.jpg" /></div>
	      <div class="pp_inp_input">
	        <form>
	           <input type="text" name="clientName" placeholder="输入姓名：" class="inp_name"/>
	           <input type="text"  name="phone" placeholder="输入手机：" class="inp_tel"/>
	           <input id="checkBut" type="button" value="提交" class="inp_tijiao"/>
	        </form>
	      </div>
	    </div>
	    
	  </div>
	</div>

	${sessionScope.statistics.value }
	${sesscionScope.angqiao.value }
</body>
</html>