<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set value="${pageContext.request.contextPath}" var="ctx" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<title>新洲新站PC首页</title>
<link rel="stylesheet" type="text/css" href="${ctx }/www/css/style.css" />
<script type="text/javascript" src="${ctx }/www/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${ctx }/www/js/pptBox.js"></script>
<script type="text/javascript" src="${ctx }/www/js/commen.js"></script>
<!--底部报价 js-->
<script src="${ctx }/www/js/jquery-1.10.2.min.js" type="text/javascript"></script>
<script>
		  var jq = jQuery.noConflict();
	</script>
<script type="text/javascript" src="${ctx }/www/js/db_01.js"></script>
<script type="text/javascript" src="${ctx }/www/js/GlobalProvinces.js"></script>
<script src="${ctx }/www/js/bdzxbj_bottom_new.js" type="text/javascript"></script>
<!--底部报价 js-->
</head>

<body>
<!--邀请框  start-->
	<input type="hidden" id="branchCompany" value="${branchCompany }"/>
	<div class="tan_body" id="popFormtan" style="display: none;">
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
								name="clientName" placeholder="请输入您的姓名"
								class="tan_left_input"></li>
							<li><p>房屋面积:</p>
								<span class="color_gold">*</span><input type="text"
								name="acreage" placeholder="请输入房屋面积" class="tan_left_input"></li>
							<li><p>手机号码:</p>
								<span class="color_gold">*</span><input type="text"
								name="phone" placeholder="请输入您的手机号码"
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
<!-- 邀请框end -->

	<!--头部 start-->
	<jsp:include page="public/header.jsp" />
	<!--头部 end-->
	<div class="clear"></div>


	<div class="main w1200">
		<input type="hidden" id="branchCompany" value="${branchCompany }"/>
	    <input type="hidden" name="orderId" id="orderId"/>
		<div class="zt_center">
			<div class="zt_center_ri">
				<h3>
					免费获取装修报价<span>（*请仔细填写以下相关信息）</span>
				</h3>
				<form class="zt_cent_form">
					<p>
						<font>&nbsp;*&nbsp;</font>您的称呼：<input type="text" name="clientName" id="clientName"
							class="hz_name" /><span>请填写您的姓名</span>
					</p>
					<p>
						<font>&nbsp;*&nbsp;</font>联系电话：<input type="text" name="phone"
							class="hz_name" /><span>请输入您的联系电话</span>
					</p>
					<p class="mar-le">
						装修面积：<input type="text" name="acreage" class="hz_name" />
					</p>
					<p class="mar-le">
						您的户型： <select name="houseType" id="houseType" class="info_hx">
							<option class="opcol" value="0" selected>请选择</option>
							<option value="一室一厅">一室一厅</option>
							<option value="一室两厅">一室两厅</option>
							<option value="两室两厅">两室两厅</option>
							<option value="其他">其他</option>
						</select>
					</p>

					<p class="mar-le">
						装修风格： <select name="style" id="style" class="info_hx">
							<option class="opcol" value="0" selected>请选择</option>
							<option value="现代简约">现代简约</option>
							<option value="经典欧式">经典欧式</option>
							<option value="田园风格">田园风格</option>
						</select>
					</p>

					<p class="mar-le">
						预算范围： <select name="budget" id="budget" class="info_hx">
							<option class="opcol" value="0" selected>请选择</option>
							<option value="2-3万">2-3万</option>
							<option value="3-5万">3-5万</option>
							<option value="5-8万">5-8万</option>
						</select>
					</p>

					<p class="mar-le bzxx">
						备注信息：
						<textarea name="note" id="note"
							style="width: %; height: px;" class="info_bzxx_box"></textarea>
					</p>

					<p>
						<input type="button"  value=" 免费申请 " class="sq_submit" onclick="submitOrder()"> <br />
						<span>*为了你的利益及我们的口碑，你的隐私将被严格保密。</span>
					</p>
				</form>
			</div>
		</div>






		<div class="clear"></div>
		<!--合作品牌 start-->
		<div class="hzpp">
			<div class="main_title">
				<h2 class="fl">合作品牌</h2>
				<span>/&nbsp;&nbsp;一线大牌让您无忧住新家？</span>
			</div>
			<ul class="clearfix">

				<c:forEach items="${homeCok }" var="coworker" varStatus="status">

					<c:if test="${(status.index+1)%6 != 0 }">
						<li><img src="${coworker.value }" width="182" height="80" />
						</li>
					</c:if>
					<c:if test="${(status.index+1)%6 == 0 }">
						<li class="no_mar"><a href="javascript:void(0)"> <img
								src="${coworker.value }" width="195" height="80" />
						</a></li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
		<!--合作品牌 end-->

	</div>

	<div class="clear"></div>
	<!--footer start-->
	<jsp:include page="public/fotter.jsp" />
	<!--footer end-->

	<div class="clear"></div>

<script type="text/javascript" src="${ctx}/www/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript">
	//提交订单
	function submitOrder(){
		var clientName= $("input[name='clientName']").val();
		var phone = $.trim($("input[name='phone']").val());
		var acreage = $.trim($("input[name='acreage']").val());
		var houseType = $("#houseType").val();
		var style = $("#style").val();
		var budget = $("#budget").val();
		var note = $("#note").val();
		var branchCompany= $('#branchCompany').val();
		var orderId = getOrderId();
		console.info("orderId"+orderId,"clientName"+clientName+"phone"+phone+"acreage"+acreage+"branchCompany"+branchCompany);
		var reg = /^\d+\.?\d*$/;//用于判断面积是否为数字
		if(clientName==""||clientName==null){
			 alert("对不起,请填写姓名!");
		 }else if(clientName.match(/^\s*$/)){
			 alert("对不起,请正确填写姓名!");
		 }else if(phone==""||phone==null){
			 alert("对不起，请填写电话!");
		 }else if(!phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/)){
			 alert("对不起，请正确填写电话格式!");
		 }else if(reg.test(acreage)||acreage==""){
			 $.ajax({
					type : "POST",
					dataType : "json",
					url : "${ctx}/saveOrderByOtherway",
					data : {'branchCompany':branchCompany,'orderId':orderId,'clientName':clientName,'phone':phone,'acreage':acreage,'sourceType':'百度竞价'
						,'style':style,'budget':budget,'note':note,'houseType':houseType},
					success : function(data) {
						if (data.data == "ok") {
							alert("请您稍等，稍后会有客服人员为您服务!");
						}else{
							alert("保存失败");
						}
					}
				});  
		 }else if(!reg.test(acreage)){
			 alert("对不起，请正确填装修面积!");
		 }
	}
	
	/* 为分站添加点击事件 */
	 var currentBCompany = '${branchCompany}';
	    if(currentBCompany=='bjxz'){
	    	$("#CurrCompany").text('北京站');
	    	$("#where").attr("alt","北京新洲装饰公司");
	    }
	    if(currentBCompany=='tjxz'){
	    	$("#CurrCompany").text('天津站');
	    	$("#where").attr("alt","天津新洲装饰公司");
	    }
	    if(currentBCompany=='lfxz'){
	    	$("#CurrCompany").text('廊坊站');
	    	$("#where").attr("alt","廊坊新洲装饰公司");
	    }
	    if(currentBCompany=='sjzxz'){
	    	$("#CurrCompany").text('石家庄站');
	    	$("#where").attr("alt","石家庄新洲装饰公司");
	    }
	    if(currentBCompany=='tsxz'){
	    	$("#CurrCompany").text('唐山站');
	    	$("#where").attr("alt","唐山新洲装饰公司");
	    }
	    if(currentBCompany=='bdxz'){
	    	$("#CurrCompany").text('保定站');
	    	$("#where").attr("alt","保定新洲装饰公司");
	    }
	    if(currentBCompany=='cqxz'){
	    	$("#CurrCompany").text('重庆站');
	    	$("#where").attr("alt","重庆新洲装饰公司");
	    }
	    if(currentBCompany=='hfxz'){
	    	$("#CurrCompany").text('合肥站');
	    	$("#where").attr("alt","合肥新洲装饰公司");
	    }
	    if(currentBCompany=='jnxz'){
	    	$("#CurrCompany").text('济南站');
	    	$("#where").attr("alt","济南新洲装饰公司");
	    }
	    if(currentBCompany=='tyxz'){
	    	$("#CurrCompany").text('太原站');
	    	$("#where").attr("alt","太原新洲装饰公司");
	    }
	    if(currentBCompany=='zzxz'){
	    	$("#CurrCompany").text('郑州站');
	    	$("#where").attr("alt","郑州新洲装饰公司");
	    }
	    if(currentBCompany=='czxz'){
	    	$("#CurrCompany").text('沧州站');
	    	$("#where").attr("alt","沧州新洲装饰公司");
	    }
	    
	    var checkSubmitFlg = false; //全局变量防止提交两次
		function showtan() {
			var popFormtan = document.getElementById("popFormtan");
			popFormtan.style.display = "block";

		}
		var itime = 5000;
		$(".popFormCloseBtntan").click(function() {
			setTimeout('showtan()', itime);
			itime += 8000;
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
			var clientName= $("input[name='clientName']").val();
			 var phone= $("input[name='phone']").val();
			 var acreage= $("input[name='acreage']").val();
			 var branchCompany= $('#branchCompany').val();
			 console.info("orderId"+orderId,"clientName"+clientName+"phone"+phone+"acreage"+acreage+"branchCompany"+branchCompany);
			 var reg = /^\d+\.?\d*$/;//用于判断面积是否为数字
			 var acreages=$.trim(acreage);//房屋面积去空格
			 if(checkSubmitFlg==false&&!clientName.match(/^\s*$/) && phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/)&&reg.test(acreages)){
				 checkSubmitFlg = true; 
				 
				 $.ajax({
						type : "POST",
						dataType : "json",
						url : "${ctx}/saveOrder",
						data : {'branchCompany':branchCompany,'orderId':orderId,'clientName':clientName,'phone':phone,'acreage':acreage,'sourceType':'在线订单'},
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
				setTimeout('showtan()', 5000);//1000毫秒后弹出根据自己的需要设置时间

			}
			if(checkSubmitFlg){
				$("#popFormtan").hide();
			}
		})
	</script>

</body>

</html>