<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="head.jsp" %>    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<!--top start-->
	<div style="left: 0" id="container" class="top">
		<div class="container visible-sm visible-xs">
			<div id="tab_main_nav_container" class="clearfix">
	            <div class="logo fl">
				  <a href="javascript:void(0)"><img src="${MhomeLo.value }" alt="logo" class="img-responsive"/></a>
				</div>
	            <button type="button" class="cname fl" id="CurrCompany"><i class="icon-dr"></i></button>
	            <div class="xlcity ctiya">
	            	<ul class="citys">
	                	<a href="http://www.xz27800.com"><li>北京</li></a>
	                    <a href="http://msjz1.xz27800.com"><li>石家庄</li></a>
	                    <a href="http://www1.xzzstj.com"><li>天津</li></a>
	                    <a href="http://mjn1.xz27800.com"><li>济南</li></a>
	                    <a href="http://mty1.xz27800.com"><li>太原</li></a>
	                    <a href="http://mbd1.xz27800.com"><li>保定</li></a>
	                    <a href="http://mzz1.xz27800.com"><li>郑州</li></a>
	                    <a href="http://mhf1.xz27800.com"><li>合肥</li></a>
	                    <a href="http://mts1.xz27800.com"><li>唐山</li></a>
	                    <a href="http://mlf1.xz27800.com"><li>廊坊</li></a>
	                    <a href="http://mcz1.xz27800.com"><li>沧州</li></a>
	                    <a href="http://mcq1.xz27800.com"><li>重庆</li></a>
	                </ul>
	            </div>
				<div id="tab_main_nav_mobile" class="visible-xs visible-sm fl" style="padding-right:0;display:inline-block; margin-top:18px;">
					<img class="hover" alt="Menu" src="${ctx }/mobile/images/menu_icon.png" id="nav_mobile">
				</div>
			</div>
		</div>
	</div>
	<!--top end-->
	<script>
	
	/* 为分站添加点击事件 */
	var currentBCompany = '${branchCompany}';
	if(currentBCompany=='bjxz'){
		$("#CurrCompany").text('北京站');
	}
	if(currentBCompany=='tjxz'){
		$("#CurrCompany").text('天津站');
	}
	if(currentBCompany=='lfxz'){
		$("#CurrCompany").text('廊坊站');
	}
	if(currentBCompany=='sjzxz'){
		$("#CurrCompany").text('石家庄站');
	}
	if(currentBCompany=='tsxz'){
		$("#CurrCompany").text('唐山站');
	}
	if(currentBCompany=='bdxz'){
		$("#CurrCompany").text('保定站');
	}
	if(currentBCompany=='cqxz'){
		$("#CurrCompany").text('重庆站');
	}
	if(currentBCompany=='hfxz'){
		$("#CurrCompany").text('合肥站');
	}
	if(currentBCompany=='jnxz'){
		$("#CurrCompany").text('济南站');
	}
	if(currentBCompany=='tyxz'){
		$("#CurrCompany").text('太原站');
	}
	if(currentBCompany=='zzxz'){
		$("#CurrCompany").text('郑州站');
	}
	if(currentBCompany=='czxz'){
		$("#CurrCompany").text('沧州站');
	}
	</script>
</body>
</html>