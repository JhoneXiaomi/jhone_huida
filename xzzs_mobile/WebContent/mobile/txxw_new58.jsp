<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/head.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1, maximum-scale=3, minimum-scale=1, user-scalable=no"/>
<title>新洲装饰-母情节活动</title>
<link href="${ctx }/mobile/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${ctx }/mobile/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${ctx }/mobile/js/owl.carousel.js"></script>
</head>
<body>
<div class="population">
  <!--<div class="header">
     <img src="${ctx }/mobile/images/banner.jpg" />
  </div>-->
  
  <div class="xztx_ganen">
    <img src="${ctx }/mobile/images/xzganen/xzganen_01.jpg" />
    <img src="${ctx }/mobile/images/xzganen/ganen_02.jpg" />
    <img style="margin-bottom:5px;" src="${ctx }/mobile/images/xzganen/ganen_03.jpg" />
  </div>  
  
   <div class="wybj_form xztx_ganendd">
    <input class="wybj_inp_area_xztxganen" name="clientName1" placeholder="请输入您的姓名" />
       <input class="wybj_inp_area_xztxganen" name="phone1" placeholder="输入号码，报价结果将发送到您的手机"/>
       <div class="tel clearfix">
          <a href="tel:13466399750" style="margin-right:3%; width:49%; float:left"><img src="${ctx }/mobile/images/xzganen/xztx_tel.jpg" style="width:100%;"/></a>
          <a onclick="submitFirst()" style="float:left; width:48%;"><img src="${ctx }/mobile/images/xzganen/xztx_tj.jpg" style="width:100%" /></a>	
       </div>
   </div>
   
    <div class="xztx_ganen">
    <img src="${ctx }/mobile/images/xzganen/xzganen_03.jpg" />
    <img src="${ctx }/mobile/images/xzganen/ganen_06.jpg" />
    <img src="${ctx }/mobile/images/xzganen/xzganen_05.jpg" />
    <img src="${ctx }/mobile/images/xzganen/xzganen_06.jpg" />
    <img src="${ctx }/mobile/images/xzganen/xzganen_07.jpg" />
    <img src="${ctx }/mobile/images/xzganen/ganen_09.jpg" />
    <img src="${ctx }/mobile/images/xzganen/xzganen_10.jpg" />
  </div>
  
  
  
  <div class="wybj_form xztx_ganendd">
   <h3>今天已有<font>387</font>位业主获取了装修预算</h3>
     <form>
       <select onclick=""id="branchCompany" name="branchCompany" class="city_mq">
          <option value="0">请选择您所在的城市</option>
         <option value="bjxz" selected="selected">北京</option>
         <option value="tjxz">天津</option>
         <option value="tsxz">唐山</option>
         <option value="bdxz">保定</option>
         <option value="lfxz">廊坊</option>
         <option value="sjzxz">石家庄</option>
         <option value="czxz">沧州</option>
         <option value="zzxz">郑洲</option>
         <option value="tyxz">太原</option>
         <option value="jnxz">济南</option>
         <option value="hfxz">合肥</option>
         <option value="yjxz">燕郊</option>
         <option value="dcxz">大厂</option>
         <option value="hsxz">衡水</option>
         <option value="ayxz">安阳</option>
         <option value="cqxz">重庆</option>
       </select>

     
       <input class="wybj_inp_area_xztxganen" id="wybj_inp_area" name="clientName" id="clientName" placeholder="请输入您的姓名" />
       
       
       <input class="wybj_inp_area_xztxganen" name="phone" placeholder="输入号码，报价结果将发送到您的手机"/>
       <div class="tel clearfix">
          <a href="tel:13466399750" style="margin-right:3%; width:48%; float:left"><img src="${ctx }/mobile/images/xzganen/xztx_tel.jpg" width="100%" /></a>
          <a onclick="submitXinXi()" style="float:left; width:49%"><img src="${ctx }/mobile/images/xzganen/xztx_tj.jpg" width="100%" /></a>
       </div>
       
       
       <div class="xztx_ganen">
    <img src="${ctx }/mobile/images/xzganen/ganen_12.jpg" /></div>
    </form>
  </div>
  

 
 
</div>
</body>
<script type="text/javascript">
var submitNumber=0;	//防止多次提交
var url=window.location.href;
var lastIndex=url.lastIndexOf("/");
var source=url.substring(lastIndex,url.length);
//提交所有信息的订单
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

function submitXinXi(){
	 var clientName= $("input[name='clientName']").val();
	 var phone= $("input[name='phone']").val();
	 var branchCompany= $('#branchCompany').val();
	 var orderId = year + month +  day + hour + minute + second + ms;
	 console.info("orderId"+orderId,"clientName"+clientName+"phone"+phone+"branchCompany"+branchCompany);
	 if(submitNumber!=0){
			alert("您已提交订单,请您稍等，稍后会有客服人员为您服务!")
	 }else if(branchCompany=="0"){
		 alert("请您选择城市");
	 }else if(clientName.match(/^\s*$/)){
		 alert("对不起,请正确填写姓名!");
	 }else if(!phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/)){
		 alert("对不起，请正确填写电话格式!");
	 }else if(!clientName.match(/^\s*$/) && phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/)){
		submitNumber=submitNumber+1;
		$.ajax({
				type : "POST",
				dataType : "json",
				url : "${pageContext.request.contextPath}/MsaveOrderByOtherway",
				data : {'branchCompany':branchCompany,'orderId':orderId,'clientName':clientName,'phone':phone,'sourceType':'腾讯新闻母情节'+source},
				success : function(data) {
					if (data.data == "ok") {
						alert("请您稍等，稍后会有客服人员为您服务!");
					}else{
						alert("保存失败");
					}
				}
			}); 
    
	 }
};
function submitFirst(){
	 var clientName= $("input[name='clientName1']").val();
	 var phone= $("input[name='phone1']").val();
	 var branchCompany= $('#branchCompany').val();
	 var orderId = year + month +  day + hour + minute + second + ms;
	 console.info("orderId"+orderId,"clientName"+clientName+"phone"+phone+"branchCompany"+branchCompany);
	 if(submitNumber!=0){
			alert("您已提交订单,请您稍等，稍后会有客服人员为您服务!")
	 }else if(branchCompany=="0"){
		 alert("请您选择城市");
	 }else if(clientName.match(/^\s*$/)){
		 alert("对不起,请正确填写姓名!");
	 }else if(!phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/)){
		 alert("对不起，请正确填写电话格式!");
	 }else if(!clientName.match(/^\s*$/) && phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/)){
		submitNumber=submitNumber+1;
		$.ajax({
				type : "POST",
				dataType : "json",
				url : "${pageContext.request.contextPath}/MsaveOrderByOtherway",
				data : {'branchCompany':branchCompany,'orderId':orderId,'clientName':clientName,'phone':phone,'sourceType':'腾讯新闻母情节'+source},
				success : function(data) {
					if (data.data == "ok") {
						alert("请您稍等，稍后会有客服人员为您服务!");
					}else{
						alert("保存失败");
					}
				}
			}); 
   
	 }
};
</script>
</html>