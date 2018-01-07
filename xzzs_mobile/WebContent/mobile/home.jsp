<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="public/head.jsp"%>

<!-- request.getScheme() 获取的协议   request.getServerName() 获取的是服务器的名字  request，getSerPort()获取的是 服务器的端口号 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport"
	content="initial-scale=1, maximum-scale=3, minimum-scale=1, user-scalable=no" />
<meta name="format-detection" content="telephone=no" />
<title>${statScinterHomeSeoTitle.value }</title>
<meta name="description" content="${statScinterHomeSeoDesc.value }" />
<meta name="keywords" content="${statScinterhomeSeoKeyword.value }" />

<link href="${ctx }/mobile/css/style.css" rel="stylesheet"
	type="text/css" />
<!--分站 右侧导航 引用js-->
<script type="text/javascript"
	src="${ctx }/mobile/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${ctx }/mobile/js/mobile_menu.js"></script>
<script type="text/javascript" src="${ctx }/mobile/js/main_menu.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("button").click(function() {
			$(".xlcity").toggle();
		});
	});
</script>

<script type="text/javascript"
	src="${ctx }/mobile/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${ctx }/mobile/js/owl.carousel.js"></script>
<script type="text/javascript">
	$(function() {
		$('#owl-demo').owlCarousel({
			items : 1,
			navigation : true,
			navigationText : [ "上一个", "下一个" ],
			autoPlay : true,
			stopOnHover : true
		}).hover(function() {
			$('.owl-buttons').show();
		}, function() {
			$('.owl-buttons').hide();
		});
	});
</script>
</head>

<body>
	<!--top start-->
	<div style="left: 0" id="container" class="top">
		<div class="container visible-sm visible-xs">
			<div id="tab_main_nav_container" class="clearfix">

				<div class="logo fl">
					<a href="${ctx }/"><img src="${MhomeLo.value }" alt="logo"
						class="img-responsive" /></a>
				</div>

				<button type="button" class="cname fl" id="but_company"></button>
				<img src="${ctx }/mobile/images/xinzhou_company.png"
					style="margin-top: 15px" />
				<div class="fl" id="welBranchCompany"></div>
				<div class="xlcity ctiya">
					<ul class="citys">
						<a href="http://m.xz27800.com"><li>北京</li></a>
						<a href="http://msjz.xz27800.com"><li>石家庄</li></a>
						<a href="http://m.xzzstj.com"><li>天津</li></a>
						<a href="http://mty.xz27800.com"><li>太原</li></a>
						<a href="http://mlf.xz27800.com"><li>廊坊</li></a>
						<a href="http://mbd.xz27800.com"><li>保定</li></a>
						<a href="http://m.0531zhuangshi.com"><li>济南</li></a>
						<a href="http://mzz.xz27800.com"><li>郑州</li></a>
						<!--  <a href="http://mhf.xz27800.com"><li>合肥</li></a> -->
						<a href="http://mts.xz27800.com"><li>唐山</li></a>
						<a href="http://mcz.xz27800.com"><li>沧州</li></a>
						<!-- <a href="javascript:void(0)"><li>重庆</li></a> -->
					</ul>
				</div>
				<div id="tab_main_nav_mobile" class="visible-xs visible-sm fl"
					style="padding-right: 0; display: inline-block; margin-top: 18px;">
					<img class="hover" alt="Menu"
						src="${ctx }/mobile/images/menu_icon.png" id="nav_mobile">
				</div>
				<div class="head_yy head_tel fl">
					<span>工商执照</span>
					<p>
						<a href="${ctx}/businessLicense.jsp"><img
							src="${ctx }/www/images/national_emblem_light.png" /></a>
					</p>
				</div>
			</div>
		</div>
	</div>
	<!--top end-->


	<div style="right: -100%;" id="tab_main_nav_mobile_container" class="">
		<!-- 右上角S -->
		<ul>
			<li class="search">
				<div style="display: none;" id="tab_main_nav_close_mobile" class="">
					<img class="hover" alt="Menu"
						src="${ctx }/mobile/images/mobile_menu_closes1.png"
						id="need_help_mobile" />
				</div>
			</li>
			<li class="hasmore"><a href="${ctx }/">首页</a></li>
			<li class="hasmore"><a href="javascript:void(0)">装修套餐</a><span
				class="nav_ch"><em class="jiantou">&nbsp;</em></span>
				<ul class="nav_sub_list" style="display: none;">

					<li class="title"><c:if test="${branchCompany == 'bjxz'}">

							<a href="${ctx }/newActivity">555套餐</a>
						</c:if> <c:if test="${branchCompany == 'tjxz'}">

							<a href="${ctx }/newActivity">555套餐</a>
						</c:if> <c:if test="${branchCompany == 'bdxz'}">

							<a href="${ctx }/newActivity">55套餐</a>
						</c:if> <c:if test="${branchCompany == 'lfxz'}">

							<a href="${ctx }/newActivity">555套餐</a>
						</c:if> <c:if test="${branchCompany == 'tyxz'}">

							<a href="${ctx }/newActivity">555套餐</a>
						</c:if> <c:if test="${branchCompany == 'sjzxz'}">

							<a href="${ctx }/newActivity">555套餐</a>
						</c:if> <c:if test="${branchCompany == 'tsxz'}">

							<a href="${ctx }/newActivity">555套餐</a>
						</c:if> <c:if test="${branchCompany == 'hfxz'}">

							<a href="${ctx }/newActivity">555套餐</a>
						</c:if> <c:if test="${branchCompany == 'czxz'}">

							<a href="${ctx }/newActivity">555套餐</a>
						</c:if> <c:if test="${branchCompany == 'hsxz'}">

							<a href="${ctx }/newActivity">555套餐</a>
						</c:if></li>
				</ul></li>

			<li class="hasmore"><a href="${ctx }/Mcases/p1">设计案例</a></li>
			<li class="hasmore"><a href="${ctx }/MlistHotBuildingSite/p1">在建工地</a></li>

			<li class="hasmore"><a href="${ctx }/Mdesigner/p1">设计团队</a></li>

			<li class="hasmore"><a href="${ctx }/MdecStrategy/p1">装修攻略</a></li>

			<li class="hasmore"><a href="${ctx }/Morder">在线预约</a></li>

			<li class="hasmore"><a href="${ctx }/mobile/brandDesign.jsp">关于新洲</a>
			</li>

		</ul>
		<!-- 右上角E -->
	</div>


	<!--banner start-->

	<div id="owl-demo" class="owl-carousel">
		<c:forEach items="${MhomeTurn}" var="homeTurn">
			<a class="item" href="${homeTurn.homeimgUrl }" target="_blank"> <img
				src="${homeTurn.homeimgSrc }" alt="${homeTurn.homeimgAlt }"
				name="${homeTurn.homeimgName }" title="${homeTurn.homeimgName }" />
				<b></b>
			</a>
		</c:forEach>
	</div>

	<!--banner end-->

	<div class="leimu">
		<!-- 菜单栏S -->
		<ul class="leimulb clear">

			<%-- <li><a href="${ctx }/Mcases/p1"><img src="${ctx }/mobile/images/inco1.png"/><br/>装修案例</a></li>
			<li><a href="${ctx }/MdecStrategy/p1"><img src="${ctx }/mobile/images/inco2.png"/><br/>装修攻略</a></li> --%>
			<li><c:if test="${branchCompany == 'bjxz'}">
					<a
						href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn"><img
						src="${ctx }/mobile/images/inco3.png" /><br />户型规划</a>
				</c:if> <c:if test="${branchCompany == 'sjzxz'}">
					<a
						href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn"><img
						src="${ctx }/mobile/images/inco3.png" /><br />户型规划</a>
				</c:if> <c:if test="${branchCompany == 'bdxz'}">
					<a
						href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn"><img
						src="${ctx }/mobile/images/inco3.png" /><br />户型规划</a>
				</c:if> <c:if test="${branchCompany == 'tjxz'}">
					<a
						href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn"><img
						src="${ctx }/mobile/images/inco3.png" /><br />户型规划</a>
				</c:if> <c:if test="${branchCompany == 'lfxz'}">
					<a href="tel:${sessionScope.MhomeTp.value }"><img
						src="${ctx }/mobile/images/inco3.png" /><br />户型规划</a>
				</c:if> <c:if test="${branchCompany == 'tyxz'}">
					<a href="tel:${sessionScope.MhomeTp.value }"><img
						src="${ctx }/mobile/images/inco3.png" /><br />户型规划</a>
				</c:if> <c:if test="${branchCompany == 'tsxz'}">
					<a
						href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn"><img
						src="${ctx }/mobile/images/inco3.png" /><br />户型规划</a>
				</c:if> <c:if test="${branchCompany == 'zzxz'}">
					<a
						href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn"><img
						src="${ctx }/mobile/images/inco3.png" /><br />户型规划</a>
				</c:if> <c:if test="${branchCompany == 'hfxz'}">
					<a
						href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn"><img
						src="${ctx }/mobile/images/inco3.png" /><br />户型规划</a>
				</c:if> <c:if test="${branchCompany == 'czxz'}">
					<a
						href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn"><img
						src="${ctx }/mobile/images/inco3.png" /><br />户型规划</a>
				</c:if> <c:if test="${branchCompany == 'hsxz'}">
					<a
						href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn"><img
						src="${ctx }/mobile/images/inco3.png" /><br />户型规划</a>
				</c:if></li>

			<li><c:if test="${branchCompany == 'bjxz'}">
					<a
						href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn"><img
						src="${ctx }/mobile/images/inco4.png" /><br />免费量房</a>
				</c:if> <c:if test="${branchCompany == 'sjzxz'}">
					<a
						href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn"><img
						src="${ctx }/mobile/images/inco4.png" /><br />免费量房</a>
				</c:if> <c:if test="${branchCompany == 'bdxz'}">
					<a
						href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn"><img
						src="${ctx }/mobile/images/inco4.png" /><br />免费量房</a>
				</c:if> <c:if test="${branchCompany == 'tjxz'}">
					<a
						href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn"><img
						src="${ctx }/mobile/images/inco4.png" /><br />免费量房</a>
				</c:if> <c:if test="${branchCompany == 'lfxz'}">
					<a href="tel:${sessionScope.MhomeTp.value }"><img
						src="${ctx }/mobile/images/inco4.png" /><br />免费量房</a>
				</c:if> <c:if test="${branchCompany == 'tyxz'}">
					<a href="tel:${sessionScope.MhomeTp.value }"><img
						src="${ctx }/mobile/images/inco4.png" /><br />免费量房</a>
				</c:if> <c:if test="${branchCompany == 'tsxz'}">
					<a
						href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn"><img
						src="${ctx }/mobile/images/inco4.png" /><br />免费量房</a>
				</c:if> <c:if test="${branchCompany == 'zzxz'}">
					<a
						href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn"><img
						src="${ctx }/mobile/images/inco4.png" /><br />免费量房</a>
				</c:if> <c:if test="${branchCompany == 'hfxz'}">
					<a
						href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn"><img
						src="${ctx }/mobile/images/inco4.png" /><br />免费量房</a>
				</c:if> <c:if test="${branchCompany == 'czxz'}">
					<a
						href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn"><img
						src="${ctx }/mobile/images/inco4.png" /><br />免费量房</a>
				</c:if> <c:if test="${branchCompany == 'hsxz'}">
					<a
						href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn"><img
						src="${ctx }/mobile/images/inco3.png" /><br />户型规划</a>
				</c:if></li>
			<%-- <li><a href="${ctx }/Mdesigner/p1"><img src="${ctx }/mobile/images/inco5.png"/><br/>找设计师</a></li> --%>
			<li><a href="${ctx }/MlistHotBuildingSite/p1"><img
					src="${ctx }/mobile/images/inco6.png" /><br />在建工地</a></li>
			<%-- 			<li>
				<c:if test="${branchCompany == 'bjxz'}">
				
					<a href="${ctx }/mobile/sjzxz_sct.jsp"><img src="${ctx }/mobile/images/inco7.png"/><br/>热门活动</a>
				</c:if>  
				<c:if test="${branchCompany == 'tjxz'}">
				
					<a href="${ctx }/mobile/sjzxz_sct.jsp"><img src="${ctx }/mobile/images/inco7.png"/><br/>热门活动</a>
				</c:if>
				<c:if test="${branchCompany == 'bdxz'}">
				
					<a href="${ctx }/mobile/sjzxz_sct.jsp"><img src="${ctx }/mobile/images/inco7.png"/><br/>热门活动</a>
				</c:if>
				<c:if test="${branchCompany == 'lfxz'}">
				
					<a href="${ctx }/mobile/sjzxz_sct.jsp"><img src="${ctx }/mobile/images/inco7.png"/><br/>热门活动</a>
				</c:if>
				<c:if test="${branchCompany == 'tyxz'}">
				
					<a href="${ctx }/mobile/sjzxz_sct.jsp"><img src="${ctx }/mobile/images/inco7.png"/><br/>热门活动</a>
				</c:if>
				<c:if test="${branchCompany == 'sjzxz'}">
				
					<a href="${ctx }/mobile/sjzxz_sct.jsp"><img src="${ctx }/mobile/images/inco7.png"/><br/>热门活动</a>
				</c:if>
				<c:if test="${branchCompany == 'jnxz'}">
				
					<a href="${ctx }/mobile/sjzxz_sct.jsp"><img src="${ctx }/mobile/images/inco7.png"/><br/>热门活动</a>
				</c:if>
				<c:if test="${branchCompany == 'tsxz'}">
				
					<a href="${ctx }/mobile/sjzxz_sct.jsp"><img src="${ctx }/mobile/images/inco7.png"/><br/>热门活动</a>
				</c:if>
				<c:if test="${branchCompany == 'zzxz'}">
				
					<a href="${ctx }/mobile/sjzxz_sct.jsp"><img src="${ctx }/mobile/images/inco7.png"/><br/>热门活动</a>
				</c:if>
				<c:if test="${branchCompany == 'hfxz'}">
				
					<a href="${ctx }/mobile/sjzxz_sct.jsp"><img src="${ctx }/mobile/images/inco7.png"/><br/>热门活动</a>
				</c:if>
			</li> --%>
			<li><a href="${ctx }/Morder"><img
					src="${ctx }/mobile/images/inco8.png" /><br />在线报名</a></li>
		</ul>
		<!-- 菜单栏E -->
		<div class="clear"></div>
	</div>

	<div class="activity">
		<!-- 家装案例S -->
		<h2 class="xiangmu-title">
			<b>家装案例</b> <i class="title-yinwen">case</i><a
				href="${ctx }/Mcases/p1" class="more fr">more+</a>
		</h2>

		<div class="anli_img clearfix">
			<div class="anli_img_left fl">

				<c:forEach items="${CasesLists}" var="cases" varStatus="status">
					<c:if test="${status.index == 0 }">

						<a target="_blank"
							href="${ctx }/McasesDetail?casesId=${cases.caseId}&designerId=${cases.designerId}"
							class="case-conlb-img"> <img src="${cases.caseThumbImg }" />
						</a>
					</c:if>
				</c:forEach>
			</div>
			<div class="anli_img_right fr">
				<c:forEach items="${CasesLists}" var="cases" varStatus="status">
					<c:if test="${status.index == 1 }">

						<a target="_blank"
							href="${ctx }/McasesDetail?casesId=${cases.caseId}&designerId=${cases.designerId}"
							class="case-conlb-img"> <img src="${cases.caseThumbImg }" />
						</a>
					</c:if>
				</c:forEach>

				<c:forEach items="${CasesLists}" var="cases" varStatus="status">
					<c:if test="${status.index == 2 }">

						<a target="_blank"
							href="${ctx }/McasesDetail?casesId=${cases.caseId}&designerId=${cases.designerId}"
							class="case-conlb-img"> <img
							style="display: block; margin-top: 10px;"
							src="${cases.caseThumbImg }" />
						</a>
					</c:if>
				</c:forEach>
			</div>
		</div>

		<div class="clear"></div>
	</div>

	<div class="activity">
		<!-- 设计团队S -->
		<h2 class="xiangmu-title">
			<b>设计团队</b><i class="title-yinwen">team</i><a
				href="${ctx }/Mdesigner/p1" class="more fr">more+</a>
		</h2>
		<div class="team">
			<ul class="teamlb">
				<c:forEach items="${designerLists }" var="designer" begin="0"
					end="2">

					<li><a
						href="${ctx }/MdesignerDetail?designerId=${designer.designerId}"
						class="teamlb-con"> <img src="${designer.designerPhotoImg }"
							alt="${designer.designerName }" />
					</a>
						<div class="team-name">
							<span class="team-name-left fl team-hui">${designer.designerName }</span>
							<a href="${ctx }/Morder?designerName=${designer.designerName}"
								class="team-name-left fl team-shen"><i></i>预约</a>
						</div></li>
				</c:forEach>
			</ul>
		</div>
		<!-- 设计团队E -->
		<div class="clear"></div>
	</div>

	<div class="activity">
		<!-- 装修新闻S -->
		<h2 class="xiangmu-title">
			<b>装修攻略</b> <i class="title-yinwen"></i> <a href="${ctx}/Mnews/p1"
				class="more fr">more+</a>
		</h2>
		<div class="hot">
			<ul class="hotlb">
				<c:forEach items="${decStrategyList}" var="news" begin="0" end="3">

					<li><a href="${ctx }/MnewsDetail?newsId=${news.newsId}"
						class="hotlb-con"> <img src="${news.thumbImg }" />
							<div class="hot-wenzi">【${news.title }】</div>
					</a></li>
				</c:forEach>
			</ul>
		</div>
		<!-- 热装小区E -->
		<div class="clear"></div>
	</div>

	<div class="clear"></div>

	<c:forEach items="${activitys }" var="activity" begin="0" end="0">
		<div class="huodong">
			<c:choose>

				<c:when test="${fn:length(activity.contents)> 10 }">
					<a href="${ctx }/MactivityDetail?newsId=${activity.newsId}"> <img
						src="${activity.thumbImg }" alt="${activity.title }" />
					</a>
				</c:when>
				<c:otherwise>
					<a href="javascript:void(0)"> <img src="${activity.thumbImg }"
						alt="${activity.title }" />
					</a>
				</c:otherwise>
			</c:choose>
		</div>
	</c:forEach>
	<div class="activity">
		<!-- 在建工地S -->
		<h2 class="xiangmu-title">
			<b>在建工地</b><i class="title-yinwen">Working</i><a
				href="${ctx}/MlistHotBuildingSite/p1" class="more fr">more+</a>
		</h2>

		<div class="jzzn">
			<div class="jzzn_top">
				<ul class="clearfix">
					<c:forEach items="${hotBuildings }" var="building" begin="0"
						end="3">

						<li><a
							href="${ctx }/MshowBuildingSite?siteId=${building.id }"> <img
								src="${building.siteThumbImg }" />
						</a></li>
					</c:forEach>
				</ul>
			</div>
			<h2 class="xiangmu-title">
				<b>新洲简介</b><i class="title-yinwen">team</i>
			</h2>

			<div class="jzzn">
				<div class="jzzn_top">
					<ul class="clearfix">
						<div>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
							北京新洲装饰集团成立于1998年，介导绿色装饰新概念，始终坚持“以人为本”，实用、美观、品位，以质量求生存、以信誉求发展、以团结高效的工作热情为宗旨、以完善的服务创企业信誉。公司采取“竞争优先”机制，长期严格培养出一批高素质、高效率、稳固的施工队伍、精心设计、精心完善服务，取得了良好的社会效益，赢得了新老客户的一致信赖和赞誉，并形成了公司以“回头客”为主体的客户网络。
							公司决心格守“高品质、低价位、更环保”的经营宗旨，为保证消费者权益不受侵犯，并有所在建材市场第三方认证和双重监理，全程跟踪服务。公司郑重向客户承诺：绿色环保材料，统一配送，材料透明，工程量透明报价透明，统一质量标准、统一服务规范，并负责保修，终身维护。
							新洲装饰凭借雄厚的实力和星级服务必将向您奉献和谐完美的作品，公司全体同仁愿以加倍的努力、积极进取的敬业精神为社会各界创造出美好舒适的环境。
						
					</ul>
				</div>
			</div>
			<div class="jzzn_bottom">
				<h3>免费申请新洲装饰专属服务</h3>
				<p>快速申请，拒绝家装猫腻，全屋环保，装修从此安心省心放心</p>
				<input type="text" name="clientName" class="jzzn_name"
					placeholder="您的姓名：" /> <input type="text" name="phone"
					class="jzzn_tel" placeholder="您的电话：" /> <input type="text"
					name="address" class="jzzn_lp" placeholder="您的楼盘：" /> <input
					type="text" name="acreage" class="jzzn_mj" placeholder="房屋面积：" />
				<input type="button" class="baoming" id="checkBut" value="免费报价" />
			</div>
		</div>
		<!-- 家装指南E -->
		<div class="clear"></div>
	</div>

	<!-- fotter begin-->
	<jsp:include page="public/fotter.jsp" />
	<!-- fotter end -->

	<script type="text/javascript">
		var now = new Date();
		var year = now.getFullYear();
		var month = (now.getMonth() + 1).toString();
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
		var dateTime = year + month + day + hour + minute + second + ms;
		$("#checkBut").bind("click", function() {
			var orderId = dateTime;
			var clientName = $("input[name='clientName']").val();
			var phone = $("input[name='phone']").val();
			var address = $("input[name='address']").val();
			var acreage = $("input[name='acreage']").val();
			var sourceType = "快速报价(手机站)";
			var branchCompany = '${branchCompany}';
			if (clientName == null) {
				alert("用户名不能为空，请填写用户名!");
				return false;
			}
			if (!phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/)) {
				alert("手机号格式不正确，请重新填写手机号!");
				return false;
			}
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "${pageContext.request.contextPath}/MsaveOrder",
				data : {
					'branchCompany' : branchCompany,
					'sourceType' : sourceType,
					'orderId' : orderId,
					'clientName' : clientName,
					'phone' : phone,
					'address' : address,
					'acreage' : acreage
				},
				success : function(data) {
					if (data.data == "ok") {
						alert("您的订单已经提交成功，稍后会将有工作人员联系你！");
					} else {
						alert("保存失败");
					}
				}
			});

		});

		/* 为分站添加点击事件 */
		var currentBCompany = '${branchCompany}';
		if (currentBCompany == 'bjxz') {
			$("#but_company").text("北京");
		}
		if (currentBCompany == 'tjxz') {
			$("#but_company").text("天津");
		}
		if (currentBCompany == 'lfxz') {
			$("#but_company").text("廊坊");
		}
		if (currentBCompany == 'sjzxz') {
			$("#but_company").text("石家庄");
		}
		if (currentBCompany == 'tsxz') {
			$("#but_company").text("唐山");
		}
		if (currentBCompany == 'bdxz') {
			$("#but_company").text("保定");
		}
		if (currentBCompany == 'cqxz') {
			$("#but_company").text("重庆");
		}
		if (currentBCompany == 'hfxz') {
			$("#but_company").text("合肥");
		}
		if (currentBCompany == 'jnxz') {
			$("#but_company").text("济南");
		}
		if (currentBCompany == 'tyxz') {
			$("#but_company").text("太原");
		}
		if (currentBCompany == 'zzxz') {
			$("#but_company").text("郑州");
		}
		if (currentBCompany == 'czxz') {
			$("#but_company").text("沧州");
		}
	</script>
</body>
</html>