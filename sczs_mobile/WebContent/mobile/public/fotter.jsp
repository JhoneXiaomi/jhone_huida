<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

	<div class="mFooter">
	  <ul>
	    <li class="on"><a href="${pageContext.request.contextPath}/" ><img src="${ctx }/mobile/images/1.png"><p>网站首页</p></a></li>
	    <li><a href="${pageContext.request.contextPath}/Morder"><img src="${pageContext.request.contextPath}/mobile/images/2.png"><p>申请报价</p></a></li>
	    <li>
	    	<c:if test="${branchCompany == 'bjsc' }"> 
	    		<a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn"><img src="${ctx }/mobile/images/3.png"><p>在线咨询</p></a>
	    	</c:if>
	    	<c:if test="${branchCompany == 'tssc' }"> 
	    		<a href="sms:${MhomeTp.value }"><img src="${ctx }/mobile/images/3.png"><p>在线咨询</p></a>
	    	</c:if>
	    	<c:if test="${branchCompany == 'tjsc' }"> 
	    		<a href="sms:${MhomeTp.value }"><img src="${ctx }/mobile/images/3.png"><p>在线咨询</p></a>
	    	</c:if>
	    	<c:if test="${branchCompany == 'lfsc' }"> 
	    		<a href="sms:${MhomeTp.value }"><img src="${ctx }/mobile/images/3.png"><p>在线咨询</p></a>
	    	</c:if>
	    	<c:if test="${branchCompany == 'sjzsc' }"> 
	    		<a href="sms:${MhomeTp.value }"><img src="${ctx }/mobile/images/3.png"><p>在线咨询</p></a>
	    	</c:if>
	    	<c:if test="${branchCompany == 'hssc' }"> 
	    		<a href="sms:${MhomeTp.value }"><img src="${ctx }/mobile/images/3.png"><p>在线咨询</p></a>
	    	</c:if>
	    	<c:if test="${branchCompany == 'bdsc' }"> 
	    		<a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn"><img src="${ctx }/mobile/images/3.png"><p>在线咨询</p></a>
	    	</c:if>
	    	<c:if test="${branchCompany == 'tysc' }"> 
	    		<a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn"><img src="${ctx }/mobile/images/3.png"><p>在线咨询</p></a>
	    	</c:if>
	    </li>
	    <li><a href="tel:${MhomeTp.value }"><img src="${pageContext.request.contextPath}/mobile/images/4.png"><p>电话预约</p></a></li>
	  </ul>
	</div>
<!-- 手机邀请框start -->
<style>
.invitewin{display: none; z-index: 2147483647; left: 50%; top: 40%; margin-top: -124px; visibility: visible; margin-left: -150px; position: fixed !important;}
.invitewin_m{width: 300px; height: 248px; position: relative; background-image:url(${ctx}/mobile/images/tan001.png);}
.invitewin_x{left: 247px; top: 94px; width: 30px; height: 30px; position: absolute; cursor: pointer; line-height: 0px; }
.invitewin_l{left: 20px; top: 182px; width: 123px; height: 38px; text-align: center; color: rgb(255, 255, 255); line-height: 0px; font-size: 18px; position: absolute; z-index: 0; cursor: pointer; background-image:url(${ctx}/mobile/images/tan02.png);}
.invitewin_r{left: 148px; top: 182px; width: 123px; height: 38px; position: absolute; cursor: move; background-image:url(${ctx}/mobile/images/tan03.png);}

.inpname{ position:absolute; left:30px; top:100px;}
.inpname input{ height:28px; border:solid 1px #bbb7b7; width:155px; border-radius:8px;}
.inptel{ position:absolute; left:30px; top:140px;}
.inptel input{ height:28px; border:solid 1px #cecece; width:155px; border-radius:8px;}
</style>

<div id="invitewin" class="invitewin" >
		<div  class="invitewin_m">
			<div  class="invitewin_x"></div>
            
            <div class="inpname">
              姓 名：<input type="text" id="yqkName"/>
            </div>
            
            <div class="inptel">
              电 话：<input type="text" id="yqkPhone" />
            </div>
            
</div>
<a class="invitewin_r" target="_blank" style="cursor: auto;" href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn"></a>
<div class="invitewin_l" onclick="yqkSubmit();">
</div>
</div>
<script>
function showtan(){
	var poptan=document.getElementById("invitewin");
	poptan.style.display="block";
	 
   }
   var itime = 10000;
$(".invitewin_x").click(function(){
			setTimeout('showtan()',itime);
			 itime += 5000;
			$("#invitewin").fadeOut();
			});
$(document).ready(function(){
setTimeout('showtan()',5000);//1000毫秒后弹出根据自己的需要设置时间
  })
  
  var checkSubmitFlg = false; //全局变量防止提交两次
  function yqkSubmit(){
	/*------orderId start-------*/
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
	var orderId = year + month +  day + hour + minute + second + ms;
	/*--------orderId end-------*/
	var yqkName=document.getElementById("yqkName").value;
	var yqkPhone=document.getElementById("yqkPhone").value;
	var branchCompany = '${branchCompany}';
	if(yqkName.match(/^\s*$/)){
		 alert("用户名不能为空，请填写用户名!");
		 return false;
	 }
	 if(!yqkPhone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/)){
		 alert("手机号格式不正确，请重新填写手机号!");
		 return false;
	 }
	 if(checkSubmitFlg==false){
		 checkSubmitFlg = true; 
		$.ajax({
			type : "POST",
			dataType : "json",
			url : "${pageContext.request.contextPath}/saveMOrder",
			data : {'branchCompany':branchCompany,'sourceType':'手机邀请框','orderId':orderId,'clientName':yqkName,'phone':yqkPhone,},
			success : function(data) {
				if (data.data == "ok") {
					alert("您的订单已经提交成功，稍后会将有工作人员联系你！");
		 			$("#invitewin").hide();
				}else{
					alert("保存失败");
				}
			}
		});  
	 }
}
</script> 
<!-- 手机邀请框end -->
</body>
</html>