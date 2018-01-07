<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include.jsp" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${ctx}/www/css/style.css" />



<script type="text/javascript" src="${ctx}/www/js/db_01.js"></script>
<script type="text/javascript" src="${ctx}/www/js/jquery-1.10.2.min.js"></script>

</head>

<body>

	<!--邀请框  start-->
	<input type="hidden" id="branchCompany" value="${branchCompany }"/>
	<div class="tan_body" id="popFormtan" style="display: none; z-index: 9999">
		<div class="tan_main">
			<div class="tan_main_m">
				<div class="tan_top">
					<a><img src="${ctx}/www/images/top01.png"
						style="display: inline;"></a>
					<div class="tan_top_right">
						<a class="popFormCloseBtntan" href="javascript:void(0);"><img
							src="${ctx}/www/images/top_right.jpg"></a>
					</div>
				</div>
				<div class="tan_left">
					<h2>装修计算器</h2>
					<p class="ff_title">
						今天已有<font>628</font>位业主获得报价
					</p>
					<form id="tanForm" action="" method="post">
						<ul class="tan_left_b">
							<li><p>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:</p>
								<span class="color_gold">*</span><input type="text"
								name="clientName1" placeholder="请输入您的姓名"
								class="tan_left_input"></li>
							<li><p>房屋面积:</p>
								<span class="color_gold">*</span><input type="text"
								name="acreage1" placeholder="请输入房屋面积" class="tan_left_input"></li>
							<li><p>手机号码:</p>
								<span class="color_gold">*</span><input type="text"
								name="phone1" placeholder="请输入您的手机号码"
								class="tan_left_input"></li>
							<li><!-- <input type="text" name="data[url]" value=""
								style="display: none;"> <input type="hidden"
								name="submit" value="提交">  --><input type="button"
								value="开始报价" class="ff_red_btn" onclick="submitOrder()" id="lb_submitButton"></li>
						</ul>
					</form>
				</div>
				<div class="tan_right">
					<a><img src="${ctx}/www/images/right_1.png"
						style="display: inline;"></a>
					<!--<p>关注官方微信</p> 
      <h2 style="margin-top:0px;">400-0940-100</h2>-->
					<p>
						<b>周一至周末8:00-23:00</b>
					</p>
					<h2 class="tan_right_h2"
						style="margin-top: 10px; padding-top: 10px;">
						<a
							href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn"
							onclick="openZoosUrl();return false;" target="_blank"
							style="color: #FD3331;">立刻咨询客服</a>
					</h2>
				</div>
			</div>
		</div>
	</div>



	<script>
		var checkSubmitFlg = false; //全局变量防止提交两次
		function showtan() {
			var popFormtan = document.getElementById("popFormtan");
			popFormtan.style.display = "block";

		}
		var itime = 30000;
		$(".popFormCloseBtntan").click(function() {
			setTimeout('showtan()', itime);
			itime += 10000;
			$("#popFormtan").fadeOut();
	
		});
		
		function submitOrder(){
			
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
			var clientName= $("input[name='clientName1']").val();
			 var phone= $("input[name='phone1']").val();
			 var acreage= $("input[name='acreage1']").val();
			 var branchCompany= $('#branchCompany').val();
			 console.info("orderId"+orderId,"clientName"+clientName+"phone"+phone+"acreage"+acreage+"branchCompany"+branchCompany);
			 var reg = /^\d+\.?\d*$/;//用于判断面积是否为数字
			 var acreages=$.trim(acreage);//房屋面积去空格
			 if(branchCompany==""||branchCompany==null){
				 branchCompany="bjxz";
			 }
			 if(checkSubmitFlg==false&&!clientName.match(/^\s*$/) && phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/)&&reg.test(acreages)){
				 checkSubmitFlg = true; 
				 $.ajax({
						type : "POST",
						dataType : "json",
						url : "${ctx}/saveOrderByOtherway",
						data : {'branchCompany':branchCompany,'orderId':orderId,'clientName':clientName,'phone':phone,'acreage':acreage,'sourceType':'在线订单(邀请框)'},
						success : function(data) {
							if (data.data == "ok") {
								alert("请您稍等，稍后会有客服人员为您服务!");
								$("#popFormtan").hide();
							}else{
								alert("保存失败");
							}
						}
					});  
			 }else if(clientName.match(/^\s*$/)){
				 alert("对不起,请正确填写姓名!");
			 }else if(!phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/)){
				 alert("对不起，请正确填写电话格式!");
			 }else if(!reg.test(acreages)){
				 alert("对不起,请正确填写房屋面积!");
			 }else if(checkSubmitFlg){
				 alert("已经提交您的信息,稍后会有客服人员为您服务!")
			 }
		}
		
		$(document).ready(function() {
			if (getCookie("Browse") == "idea") {

			} else {
				setTimeout('showtan()', 10000);//1000毫秒后弹出根据自己的需要设置时间

			}
			if(checkSubmitFlg){
				$("#popFormtan").hide();
			}
		})
	</script>


	<!--邀请框 end-->



	<div class="clear"></div>
</html>