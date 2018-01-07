<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp"%>
<%@ include file="public/shangqiao.jsp"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>${aboutSeoTitleStr.value }</title>
<meta name="keywords" content="${aboutSeoKeywordStr.value }" />
<meta name="description" content="${aboutSeoDescStr.value }" />
<link rel="stylesheet" type="text/css" href="${ctx }/www/css/style.css" />
<!--底部报价 js-->
<script src="${ctx }/www/js/jquery-1.10.2.min.js" type="text/javascript"></script>
<script>
	var jq = jQuery.noConflict();
</script>
<%-- <script type="text/javascript" src="${ctx }/www/js/db_01.js"></script> --%>
<script type="text/javascript" src="${ctx }/www/js/db_01.js"></script>
<script type="text/javascript" src="${ctx }/www/js/commen.js"></script>
<script type="text/javascript" src="${ctx }/www/js/GlobalProvinces.js"></script>
<script src="${ctx }/www/js/bdzxbj_bottom_new.js" type="text/javascript"></script>
<!--底部报价 js-->
<script type="text/javascript"
	src="${ctx }/www/about/js/jquery-1.7.2.min.js"></script>
<script src="${ctx }/www/about/js/jquery.superslide.2.1.1.js"
	type="text/javascript"></script>
<script type="text/javascript" src="${ctx }/www/about/js/navjs.js"></script>
<script type="text/javascript">
	$(function() {
		jQuery(".j-scroll2").slide({
			mainCell : ".b ul",
			effect : "leftLoop",
			vis : 4,
			scroll : 1,
			pnLoop : false
		});
		jQuery(".j-scroll3").slide({
			mainCell : ".b ul",
			effect : "leftMarquee",
			vis : 4,
			interTime : 30,
			autoPlay : true,
			trigger : "click"
		});
	})
</script>

<script src="${ctx }/www/about/js/jquery.mCustomScrollbar.concat.min.js"
	type="text/javascript" charset="utf-8"></script>
<script src="${ctx }/www/about/js/jquery.mCustomScrollbar.js.下载"
	type="text/javascript" charset="utf-8"></script>
<script>
	(function($) {
		$(window).load(function() {
			$(".fgsjj-fr").mCustomScrollbar({
				theme : "minimal"
			});
		});
	})(jQuery);
</script>
</head>

<body>
	<!--头部 start-->
	<jsp:include page="public/header.jsp" />
	<!--头部 end-->
	<div class="clear"></div>
	<!--nav start-->
	<jsp:include page="public/nav.jsp" />
	<!--nav end-->

	<div class="clear"></div>

	<!-- banner start-->
	<!--<div class="ej_ban"></div>-->
	<!--banner end-->
	<div class="clear"></div>

	<div class="pinpai">
		<img src="${ctx }/www/about/images/xzpinpai/pinpaigushi_01.jpg" /> <img
			src="${ctx }/www/about/images/xzpinpai/pinpaigushi_02.jpg" /> <img
			src="${ctx }/www/about/images/xzpinpai/pinpaigushi_03.jpg" /> <img
			src="${ctx }/www/about/images/xzpinpai/pinpaigushi_04.jpg" /> <img
			src="${ctx }/www/about/images/xzpinpai/pinpaigushi_05.jpg" /> <img
			src="${ctx }/www/about/images/xzpinpai/pinpaigushi_06.jpg" />
	</div>

	<div class="sy-products">
		<div class="wd">

			<div class="u-scrollA j-scroll2">
				<div class="b">
					<div class="bnt">
						<a href="javascript:void(0)" class="prev">&lt;</a> <a
							href="javascript:void(0)" class="next">&gt;</a>
					</div>
					<ul class="u-listB clearfix">
						<li>
							<div class="inner">
								<div class="u-img1">
									<a href=""><img
										src="${ctx }/www/about/images/shejishi_01.jpg" /></a>
								</div>
								<div class="u-txt5">
									<a href="">赵利明</a>
								</div>
								<div class="pinpai_zw">首席设计师</div>
								<div
									style="width: 190px; height: 52px; line-height: 26px; overflow: hidden; font-size: 14px; margin-top: 10px;">"用最省钱的办法设计出客户最满意的居室"</div>
							</div>
						</li>
						<li>
							<div class="inner">
								<div class="u-img1">
									<a href=""><img
										src="${ctx }/www/about/images/shejishi_02.jpg" /></a>
								</div>
								<div class="u-txt5">
									<a href="">王园</a>
								</div>
								<div class="pinpai_zw">首席设计师</div>
								<div
									style="width: 190px; height: 52px; line-height: 26px; overflow: hidden; font-size: 14px; margin-top: 10px;">"用最省钱的办法设计出客户最满意的居室"</div>
							</div>
						</li>
						<li>
							<div class="inner">
								<div class="u-img1">
									<a href=""><img
										src="${ctx }/www/about/images/shejishi_03.jpg" /></a>
								</div>
								<div class="u-txt5">
									<a href="">张建新</a>
								</div>
								<div class="pinpai_zw">优秀设计师</div>
								<div
									style="width: 190px; height: 52px; line-height: 26px; overflow: hidden; font-size: 14px; margin-top: 10px;">"用最省钱的办法设计出客户最满意的居室"</div>
							</div>
						</li>
						<li>
							<div class="inner">
								<div class="u-img1">
									<a href=""><img
										src="${ctx }/www/about/images/shejishi_04.jpg" /></a>
								</div>
								<div class="u-txt5">
									<a href="">李忠良</a>
								</div>
								<div class="pinpai_zw">设计总监</div>
								<div
									style="width: 190px; height: 52px; line-height: 26px; overflow: hidden; font-size: 14px; margin-top: 10px;">"用最省钱的办法设计出客户最满意的居室"</div>
							</div>
						</li>
						<li>
							<div class="inner">
								<div class="u-img1">
									<a href=""><img
										src="${ctx }/www/about/images/shejishi_05.jpg" /></a>
								</div>
								<div class="u-txt5">
									<a href="">赵利明</a>
								</div>
								<div class="pinpai_zw">首席设计师</div>
								<div
									style="width: 190px; height: 52px; line-height: 26px; overflow: hidden; font-size: 14px; margin-top: 10px;">"用最省钱的办法设计出客户最满意的居室"</div>
							</div>
						</li>
						<li>
							<div class="inner">
								<div class="u-img1">
									<a href=""><img
										src="${ctx }/www/about/images/shejishi_01.jpg" /></a>
								</div>
								<div class="u-txt5">
									<a href="">赵利明</a>
								</div>
								<div class="pinpai_zw">首席设计师</div>
								<div
									style="width: 190px; height: 52px; line-height: 26px; overflow: hidden; font-size: 14px; margin-top: 10px;">"用最省钱的办法设计出客户最满意的居室"</div>
							</div>
						</li>
						<li>
							<div class="inner">
								<div class="u-img1">
									<a href=""><img
										src="${ctx }/www/about/images/shejishi_02.jpg" /></a>
								</div>
								<div class="u-txt5">
									<a href="">赵利明</a>
								</div>
								<div class="pinpai_zw">首席设计师</div>
								<div
									style="width: 190px; height: 52px; line-height: 26px; overflow: hidden; font-size: 14px; margin-top: 10px;">"用最省钱的办法设计出客户最满意的居室"</div>
							</div>
						</li>
						<li>
							<div class="inner">
								<div class="u-img1">
									<a href=""><img
										src="${ctx }/www/about/images/shejishi_03.jpg" /></a>
								</div>
								<div class="u-txt5">
									<a href="">赵利明</a>
								</div>
								<div class="pinpai_zw">首席设计师</div>
								<div
									style="width: 190px; height: 52px; line-height: 26px; overflow: hidden; font-size: 14px; margin-top: 10px;">"用最省钱的办法设计出客户最满意的居室"</div>
							</div>
						</li>

					</ul>

				</div>
			</div>


		</div>
	</div>




	<div class="pinpai">

		<img src="${ctx }/www/about/images/xzpinpai/pinpaigushi_08.jpg" />

	</div>

	<div class="pinpai_rongyu clearfix">
		<div class="pinpairy_left">
			<img src="${ctx }/www/about/images/xzpinpai/pinpaigushi_ry_left.jpg" />
		</div>
		<div class="pinpairy_right">

			<div class="fr fgsjj-fr mCustomScrollbar _mCS_1 mCS-autoHide"
				style="position: relative; overflow: visible;">
				<div id="mCSB_1"
					class="mCustomScrollBox mCS-minimal mCSB_vertical mCSB_outside"
					tabindex="0">
					<div id="mCSB_1_container" class="mCSB_container"
						style="position: relative; top: 0px; left: 0px;" dir="ltr">
						<h1>新洲荣誉</h1>
						<p>新洲装饰一站式服务:售后服务问题新洲公司负全责.如出现问题，您也不用在装饰公司和材料厂商之间周旋，新洲装饰将材料一包到底,无需考虑材料补货、退货。</p>
						<p style="text-align: center;">
							<img alt=""
								src="${ctx }/www/about/images/xzpinpai/pinpai_img.jpg"
								style="width: 620px; height: 290px;" class="mCS_img_loaded">
						</p>
						<p style="text-align: center;">
							<a href="" target="_blank">新洲荣誉</a>
						</p>
						<p>
							新洲装饰一站式服务:售后服务问题新洲公司负全责.如出现问题，您也不用
							在装饰公司和材料厂商之间周旋，新洲装饰将材料一包到底,无需考虑材料补 货、退货。<strong><a
								href="">新洲荣誉</a></strong>设计团队由创意设计师、深化设计师、水电工程师、软装配饰设计师、材料设计师、园林设计师以及合作的结构改建设计师和风水设计师组成，以一个完整设计团队的服务模式为客户提供全方位一站式的服务。公司拥有多位中装协专家顾问团的成员，首家推出工程督导制，全程直管，并有监督小组定期巡查，工程质量层层把关，确保高档住宅及商业空间的整体质量和风范。
						</p>
					</div>
				</div>

				<div id="mCSB_1_scrollbar_vertical"
					class="mCSB_scrollTools mCSB_1_scrollbar mCS-minimal mCSB_scrollTools_vertical"
					style="display: block;">
					<div class="mCSB_draggerContainer">
						<div id="mCSB_1_dragger_vertical" class="mCSB_dragger"
							style="position: absolute; min-height: 50px; display: block; height: 78px; max-height: 416px; top: 0px;"
							oncontextmenu="return false;">
							<div class="mCSB_dragger_bar" style="line-height: 50px;"></div>
						</div>
						<div class="mCSB_draggerRail"></div>
					</div>
				</div>

			</div>

		</div>
	</div>

	<div class="pinpai">
		<img src="${ctx }/www/about/images/xzpinpai/pinpaigushi_09.jpg" /> <img
			src="${ctx }/www/about/images/xzpinpai/pinpaigushi_10.jpg" />

	</div>

	<div class="pinpai_inp">
		<div class="pinpai_foot">
			<img src="${ctx }/www/about/images/xzpinpai/pinpaigushi_11.jpg" />
		</div>

		<div class="pinpai_input">
			<form>
				<input type="text" placeholder="请输入您的姓名" id="name" /> <input
					type="text" name="pinpai_phone" placeholder="请输入您的手机号码" id="phone" />
				<input type="button" class="pinpai_sub" id="jhoneSumbit" value="提交"/>
			</form>
		</div>
	</div>


	<div class="clear"></div>
	<!--footer start-->
	<jsp:include page="public/fotter.jsp" />
	<!--footer end-->
	<!-- servise start -->
	<jsp:include page="public/service.jsp" />
	<!-- servise end -->



	<!-- servise start -->
	<jsp:include page="public/faster.jsp" />
	<!-- servise end -->

	${sessionScope.statistics.value } 
	${sessionScope.shangqiao.value }
	${sessionScope.cnzzSession }
	<script>

		var orderId = getOrderId();
		$("#jhoneSumbit")
				.click(
						function() {

							var clientName = $("#name").val();
							var phone = $("#phone").val();
							if (!clientName.match(/^\s*$/)
									&& phone
											.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/)) {

								$.ajax({
									type : "POST",
									dataType : "json",
									url : "${ctx}/saveOrder",
									data : {
										'clientName' : clientName,
										'phone' : phone,
										'sourceType' : '免费申请'
									},
									success : function(data) {
										if (data.data == "ok") {
											alert("请您稍等，稍后会有客服人员为您服务!");
										} else {
											alert("保存失败");
										}
									}
								});
							} else if (clientName.match(/^\s*$/)) {
								//alert("对不起,请正确填写姓名!");
							} else if (!phone
									.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/)) {
								alert("对不起，请正确填写电话格式!");
							}
						});
	</script>
</body>
</html>
