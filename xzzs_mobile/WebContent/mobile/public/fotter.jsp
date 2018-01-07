<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="head.jsp" %>   
<!DOCTYPE html>
<html>
<body>

	<div class="foot">
		Copyright © 2016  新洲装饰有限公司版权所有<br/>
		中国家居装饰行业百强企业  北京市装饰协会理事单位
		${MhomeAdress.value}
	</div>
	<div style="width:100%; height:50px;"></div>
	
	<div class="foot-nav">
		<ul class="foot-navlb">
			<li><a href="${ctx }/"><img src="${ctx }/mobile/images/foot1.png"><br>首页</a></li>
			<li><a href="${ctx }/Morder"><img src="${ctx }/mobile/images/foot2.png"><br>报价</a></li>
			<li>
			<c:if test="${branchCompany == 'bjxz'}">
					<a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn"><img src="${ctx }/mobile/images/foot3.png"><br>咨询</a>
			</c:if>
			<c:if test="${branchCompany == 'sjzxz'}">
					<a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn"><img src="${ctx }/mobile/images/foot3.png"><br>咨询</a>
			</c:if>
			<c:if test="${branchCompany == 'bdxz'}">
					<a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn"><img src="${ctx }/mobile/images/foot3.png"><br>咨询</a>
			</c:if>
			<c:if test="${branchCompany == 'tjxz'}">
					<a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn"><img src="${ctx }/mobile/images/foot3.png"><br>咨询</a>
			</c:if>
			<c:if test="${branchCompany == 'lfxz'}">
					<a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn"><img src="${ctx }/mobile/images/foot3.png"><br>咨询</a>
			</c:if>
			<c:if test="${branchCompany == 'tyxz'}">
					<a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn"><img src="${ctx }/mobile/images/foot3.png"><br>咨询</a>
			</c:if>
			<c:if test="${branchCompany == 'jnxz'}">
					<a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn"><img src="${ctx }/mobile/images/foot3.png"><br>咨询</a>
			</c:if>
			<c:if test="${branchCompany == 'tsxz'}">
					<a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn"><img src="${ctx }/mobile/images/foot3.png"><br>咨询</a>
			</c:if>
			<c:if test="${branchCompany == 'zzxz'}">
					<a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn"><img src="${ctx }/mobile/images/foot3.png"><br>咨询</a>
			</c:if>
			<c:if test="${branchCompany == 'hfxz'}">
					<a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn"><img src="${ctx }/mobile/images/foot3.png"><br>咨询</a>
			</c:if>
			<c:if test="${branchCompany == 'czxz'}">
					<a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn"><img src="${ctx }/mobile/images/foot3.png"><br>咨询</a>
			</c:if>
			<c:if test="${branchCompany == 'hsxz'}">
					<a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn"><img src="${ctx }/mobile/images/foot3.png"><br>咨询</a>
			</c:if>
			</li>
			<li><a href="tel:${sessionScope.MhomeTp.value }"><img src="${ctx }/mobile/images/foot4.png"><br>电话</a></li>
		</ul>
	</div>
	<div class="fhdb" id="top"><div id="izl_rmenu" class="izl-rmenu"><div class="btn btn-top"></div></div></div>
	<script type="text/javascript" src="${ctx }/mobile/js/zzsc.js"></script>
	${sessionScope.statistics.value }
	${sessionScope.shangqiao.value }



	<!-- 全景样板间 展示 start -->
<style>
.side-bar a,.chat-tips i {background: url(${ctx }/mobile/images/right_bg.png) no-repeat;} 
.side-bar {width: 66px;position: fixed;bottom: 100px;right: 15px;font-size: 0;line-height: 0;z-index: 100;} 
.side-bar a {width: 66px;height: 66px;display: inline-block;background-color: #f00; border-radius:50%;margin-bottom: 2px;} 
.side-bar a:hover {background-color: #669fdd;} 
.side-bar .icon-qq {background-position: 0 -62px;} 
.side-bar .icon-chat {background-position: 0 -130px;position: relative;} 
.side-bar .icon-blog {background-position: 0 -198px;} 
.side-bar .icon-mail {background-position: 0 -266px;} 
.side-bar .icon-chat:hover .chat-tips {display: block;} 
.chat-tips {padding: 20px;border: 1px solid #d1d2d6;position: absolute;right: 78px;top: -55px;background-color: #fff;display: none;} 
.chat-tips i {width: 9px;height: 16px;display: inline-block;position: absolute;right: -9px;top: 80px;background-position:-88px -350px;} 
.chat-tips img {width: 138px;height: 138px;} 
</style>



<div class="side-bar">  
   <!--  <a href="#" class="icon-qq">QQ在线咨询</a>  
    <a href="#" class="icon-chat">微信<div class="chat-tips"><i></i> 
    <img style="width:138px;height:138px;" src="helloweba.jpg" alt="微信订阅号"></div></a>   -->
    <a target="_blank" href="http://720yun.com/t/e2qa32r6onfqe4o6ix?pano_id=ikDcg5c3BR3BlGru" class="icon-blog">全景样板间</a>  
    <!-- <a href="http://www.helloweba.com/gbook.html" class="icon-mail">mail</a>   -->
</div> 
<!-- 全景样板间展厅示 end -->

<style>
 .invitewin{display: none; z-index: 2147483647; left: 50%; top: 40%; margin-top: -124px; visibility: visible; margin-left: -150px; position: fixed !important;}
.invitewin_m{width: 300px; height: 248px; position: relative; background-image:url(${ctx }/mobile/images/tan001.png);}
.invitewin_x{left: 247px; top: 94px; width: 30px; height: 30px; position: absolute; cursor: pointer; line-height: 0px; }
.invitewin_l{left: 20px; top: 182px; width: 123px; height: 38px; text-align: center; color: rgb(255, 255, 255); line-height: 0px; font-size: 18px; position: absolute; z-index: 0; cursor: pointer; background-image:url(${ctx }/mobile/images/tan02.png);}
.invitewin_r{left: 148px; top: 182px; width: 123px; height: 38px; position: absolute; cursor: move; background-image:url(${ctx }/mobile/images/tan03.png);}

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
			url : "${pageContext.request.contextPath}/MsaveOrder",
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
</html>