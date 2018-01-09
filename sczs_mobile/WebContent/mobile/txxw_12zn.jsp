<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="initial-scale=1, maximum-scale=3, minimum-scale=1, user-scalable=no" />
<title>三创12周年活动</title>
<script type="text/javascript"
	src="${ctx }/mobile/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${ctx }/mobile/js/owl.carousel.js"></script>
<link href="${ctx }/mobile/css/txxw12zns.css" rel="stylesheet"
	type="text/css">
<link href="${ctx }/mobile/css/style.css" rel="stylesheet"
	type="text/css">

</head>

<body>

	<div class="population">

		<div class="sc12znimg">
			<img src="${ctx }/mobile/images/sc12zn/sc12zn_01.jpg" /> <img
				src="${ctx }/mobile/images/sc12zn/sc12zn_02.jpg" /> <img
				src="${ctx }/mobile/images/sc12zn/sc12zn_03.jpg" /> <img
				src="${ctx }/mobile/images/sc12zn/sc12zn_04.jpg" /> <img
				src="${ctx }/mobile/images/sc12zn/sc12zn_05.jpg" /> <a
				onclick="tiao()"><img
				src="${ctx }/mobile/images/sc12zn/sc12zn_06.jpg" /></a> <img
				src="${ctx }/mobile/images/sc12zn/sc12zn_07.jpg" /> <img
				src="${ctx }/mobile/images/sc12zn/sc12zn_08.jpg" /> <img
				src="${ctx }/mobile/images/sc12zn/sc12zn_09.jpg" /> <img
				src="${ctx }/mobile/images/sc12zn/sc12zn_10.jpg" /> <img
				src="${ctx }/mobile/images/sc12zn/sc12zn_11.jpg" />
		</div>

	</div>
	<div class="wybj_form">
		<h3>
			今天已有<font>387</font>位业主报名了活动
		</h3>

		<form>
			<select id="branchCompany" name="branchCompany" name="city"
				class="city">
				<option value="0">请选择您的房屋所在地</option>
				<option value="bjsc" selected="selected">北京</option>
				<option value="tjsc">天津</option>
				<option value="bdsc">保定</option>
				<option value="tssc">唐山</option>
				<option value="lfsc">廊坊</option>
				<option value="sjzsc">石家庄</option>
				<option value="tysc">太原</option>
				<option value="hssc">衡水</option>
				<option value="yjsc">燕郊</option>

			</select> <input class="wybj_inp_area" name="clientName" id="clientName"
				placeholder="请输入您的姓名" /> <input placeholder="输入号码，报价结果将发送到您的手机"
				name="phone" />
			<div class="tel">
				<a href="tel:13466399750"
					style="margin-right: 3%; margin-left: 3%; width: 45%; float: left;"><img
					src="${ctx }/mobile/images/sc12zn/xzhd_12.jpg" style="width: 100%;" /></a>
				<a onclick="submitXinXi()" style="width: 45%; float: left;"><img
					src="${ctx }/mobile/images/sc12zn/xzhd_13.jpg" style="width: 100%;" /></a>
			</div>
			<div class="wyfooter"
				style="margin-top: 3px; height: 35px; line-height: 35px; font-size: 13px; text-align: center; background: #f2f2f2;">
				Copyright @2013-2016 京ICP备13052706号-1 <br> 北京三创国际装饰设计有限公司
			</div>
		</form>

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
	  function tiao(){
		  $("input[name='clientName']").focus();
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
<div style="display:none">
	<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1259850076'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s95.cnzz.com/z_stat.php%3Fid%3D1259850076%26show%3Dpic1' type='text/javascript'%3E%3C/script%3E"));</script>
</div>
</body>
</html>