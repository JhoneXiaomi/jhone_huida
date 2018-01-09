<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1, maximum-scale=3, minimum-scale=1, user-scalable=no"/>
<title>三创12周年活动</title>
<script type="text/javascript" src="${ctx }/mobile/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${ctx }/mobile/js/owl.carousel.js"></script>
<link href="${ctx }/mobile/css/style.css" rel="stylesheet" type="text/css">
<link href="${ctx }/mobile/css/txxw12zn.css" rel="stylesheet" type="text/css">
	<style>
		
		body html{
			padding:0;
			margin:0;
		}
		.population{
			font-size:0px;
		}
		.population img{
			width:100%;
		}
		
	</style>
</head>

<body>

<div class="population">
  <!--<div class="header">
     <img src="images/banner.jpg" />
  </div>-->
  
  <div class="xzzn_12">
    <img src="${ctx }/mobile/images/txxw12zn/xzzn_12_01.jpg" />
    <img src="${ctx }/mobile/images/txxw12zn/xzzn_12_02.jpg" />
    <img src="${ctx }/mobile/images/txxw12zn/xzzn_12_03.jpg" />
    <img src="${ctx }/mobile/images/txxw12zn/xzzn_12_04.jpg" />
    <img src="${ctx }/mobile/images/txxw12zn/xzzn_12_05.jpg" />
    <img src="${ctx }/mobile/images/txxw12zn/xzzn_12_06.jpg" />
    <img src="${ctx }/mobile/images/txxw12zn/xzzn_12_07.jpg" />
    <img src="${ctx }/mobile/images/txxw12zn/xzzn_12_08.jpg" />
    <img src="${ctx }/mobile/images/txxw12zn/xzzn_12_09.jpg" />
  </div>
  
  
  
  <div class="wybj_form xzzn_12f">
   <p>今天已有<font>387</font>位业主获取了装修预算</p>
    <form>
       <select id="branchCompany" id="bj_select" name="city" class="city">
         <option value="0">请选择您的房屋所在地</option>
         <option value="bjsc" selected="selected">北京</option>
         <option value="tjsc">天津</option>
         <option value="bdsc">保定</option>
         <option value="tssc">唐山</option>
         <option value="lfsc">廊坊</option>
         <option value="sjzsc">石家庄</option>
         <option value="tysc">太原</option>
         <option value="hssc">衡水</option>
       </select>

     
       <input class="wybj_inp_area_xztxganen" id="wybj_inp_area" placeholder="请输入您的姓名"  name="clientName"/>
       
       
       <input class="wybj_inp_area_xztxganen" placeholder="输入号码，报价结果将发送到您的手机" name="phone"/>
       <div class="xzzn_tel clearfix">
          <a   href="tel:13466399750" style=" width:45%;margin-right:3%; float:left" ><img src="${ctx }/mobile/images/txxw12zn/xztx_tel.jpg" style="width:100%" /></a>
          <a  onclick="submitXinXi()" style=" width:45%;float:left;"><img src="${ctx }/mobile/images/txxw12zn/xztx_tj.jpg" style="width:100%"/></a>
       </div>
       
       
    <div class="xzzn_12">
      <img src="${ctx }/mobile/images/txxw12zn/xzzn_12_11.jpg" />
      <img src="${ctx }/mobile/images/txxw12zn/xzzn_12_12.jpg" />
    </div>
    </form>
  </div>
</div>
<script type="text/javascript">
	var submitNumber=0;	//防止多次提交
	var url=window.location.href;
	var lastIndex=url.lastIndexOf("/");
	var source=url.substring(lastIndex,url.length);
	
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
						url : "${pageContext.request.contextPath}/saveMOrder",
						data : {'branchCompany':branchCompany,'orderId':orderId,'clientName':clientName,'phone':phone,'sourceType':'腾讯新闻12周年'+source},
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
</body>
</html>