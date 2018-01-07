<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/public/shangqiao.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!doctype html>
<html>
<head>

<meta charset="utf-8">
<title>${statScinterHomeSeoTitle.value }</title>
<meta name="keywords" content="${statScinterhomeSeoKeyword.value }">
<meta name="description" content="${statScinterHomeSeoDesc.value }">
<c:if test="${branchCompany == 'bjsc'}">
	<meta name="baidu-site-verification" content="lkPMcPjLGG" />
</c:if>
<script type="text/javascript">
	//判断是否是PC端浏览器
	function isPC() {
		var userAgentInfo = navigator.userAgent;
		var Agents = [ "Android", "iPhone", "SymbianOS", "Windows Phone",
				"iPad", "iPod", "BlackBerry" ];
		var flag = true;
		for (var v = 0; v < Agents.length; v++) {
			if (userAgentInfo.indexOf(Agents[v]) > 0) {
				flag = false;
				break;
			}
		}
		return flag;
	}

	// make sjz and tj turn to the top-level domain
	var url = window.location.href;

	// if the server is mobile phone then turn to the phone automatic
	if (!isPC()) {

		// 保定  
		if (url.indexOf('bd.sc27800.com') > 0) {

			location.href = "http://bd.sc27800.com";
			// 保定
		} else if (url.indexOf('sjz.sc27800.com') > 0) {

			location.href = "http://msjz.sc27800.com";
			// 天津  
		} else if (url.indexOf('tj.sc27800.com') > 0) {

			location.href = "http://mtj.sc27800.com";
			// 唐山  
		} else if (url.indexOf('ts.sc27800.com') > 0) {

			location.href = "http://mts.sc27800.com";
			// 廊坊  
		} else if (url.indexOf('lf.sc27800.com') > 0) {

			location.href = "http://mlf.sc27800.com";
			// 衡水  
		} else if (url.indexOf('hs.sc27800.com') > 0) {

			location.href = "http://mhs.sc27800.com";
			// 太原  
		} else if (url.indexOf('ty.sc27800.com') > 0) {

			location.href = "http://mty.sc27800.com";
			// 北京  
		} else {

			location.href = "http://m.sc27800.com";
		}

	}
</script>
<link type="text/css"
	href="${pageContext.request.contextPath}/www/css/style.css"
	rel="stylesheet">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/www/js/nav.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/www/js/terminator2.2.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/www/js/koala.min.1.5.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/www/js/jquery.jslides.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/www/js/jquery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/www/js/lrtk.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/www/js/jquery.smint.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/www/js/jdt.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/www/js/minify(2).js"></script>
<script type="text/javascript" src="${ctx}/www/js/top.js"></script>

<!--底部报价 js-->
<script src="${ctx }/www/js/jquery-1.10.2.min.js" type="text/javascript"></script>
<script>
	var jq = jQuery.noConflict();
</script>
<script type="text/javascript" src="${ctx }/www/js/db_01.js"></script>
<script type="text/javascript" src="${ctx }/www/js/GlobalProvinces.js"></script>
<script src="${ctx }/www/js/bdzxbj_bottom_new.js" type="text/javascript"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/www/js/commen.js"></script>

<!--底部报价 js-->

</head>
<body onload="setTimeout(function() { window.scrollTo(0,1)}, 100);">
	<!--header start-->
	<div class="header">
		<jsp:include page="../public/head.jsp" />
		<!--nav start-->
		<jsp:include page="../public/nav.jsp" />
		<!--nav end-->
	</div>
	<!--header end-->

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/www/js/jquery-1.8.3.min.js"></script>
	<script src="${pageContext.request.contextPath}/www/js/flexslider.js"></script>
	<!--banner start-->
	<div class="banner">
		<div class="bannerimg">
			<ul class="bannerslides clearfix">
				<c:forEach items="${homeTurn }" var="turnImg">
					<li><a href="${turnImg.homeimgUrl }"> <img
							src="${turnImg.homeimgSrc }" width="100%" height="100%"
							name="${turnImg.homeimgName }" alt="${turnImg.homeimgAlt }" />
					</a></li>
				</c:forEach>

			</ul>
		</div>
	</div>
	<!-- js调用部分begin -->
	<script>
		$(function() {
			$('.banner').flexslider({
				directionNav : true,
				pauseOnAction : false
			});
		});
	</script>
	<!-- js调用部分end -->
	<!--banner end-->

	<!-- 代码 结束 -->
	<!--流程 start-->
	<div class="clear"></div>
	<div class="Tech w1180">
		<div class="tech_con">
			<a href="${ctx }/orderLine"><img
				src="${pageContext.request.contextPath}/www/images/tech01.jpg" /><span>在线预约</span><img
				src="${pageContext.request.contextPath}/www/images/jiantou01.jpg" /></a>
		</div>
		<div class="tech_con">
			<img src="${ctx }/www/images/tech02.jpg" /><span>上门量房</span><img
				src="${pageContext.request.contextPath}/www/images/jiantou01.jpg" />
		</div>
		<div class="tech_con">
			<img src="${ctx }/www/images/tech03.jpg" /><span>方案设计</span><img
				src="${pageContext.request.contextPath}/www/images/jiantou01.jpg" />
		</div>
		<div class="tech_con">
			<img src="${ctx }/www/images/tech04.jpg" /><span>施工装修</span><img
				src="${pageContext.request.contextPath}/www/images/jiantou01.jpg" />
		</div>
		<div class="tech_con">
			<img src="${ctx }/www/images/tech05.jpg" /><span>验收竣工</span><img
				src="${pageContext.request.contextPath}/www/images/jiantou01.jpg" />
		</div>
		<div class="zx">

			<c:if test="${branchCompany == 'bjsc'}">
				<a
					href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn">立即在线预约</a>
			</c:if>
			<c:if test="${branchCompany == 'bdsc'}">
				<a
					href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn">立即在线预约</a>
			</c:if>
			<c:if test="${branchCompany == 'tssc'}">
				<a href="${ctx }/orderLine">立即在线预约</a>
			</c:if>
			<c:if test="${branchCompany == 'tjsc'}">
				<a href="${ctx }/orderLine">立即在线预约</a>
			</c:if>
			<c:if test="${branchCompany == 'lfsc'}">
				<a href="${ctx }/orderLine">立即在线预约</a>
			</c:if>
			<c:if test="${branchCompany == 'sjzsc'}">
				<a href="${ctx }/orderLine">立即在线预约</a>
			</c:if>
			<c:if test="${branchCompany == 'hssc'}">
				<a href="${ctx }/orderLine">立即在线预约</a>
			</c:if>
			<c:if test="${branchCompany == 'tysc'}">
				<a href="${ctx }/orderLine">立即在线预约</a>
			</c:if>
		</div>
	</div>
	<!--流程 end-->
	<div class="clear"></div>
	<div class="index_main">
		<!--装修风格 start-->
		<div class="zxfg_bj">
			<div class="zxfg w1180">
				<div class="index_title">
					<div class="tit_left fl">
						<h2>装修风格</h2>
					</div>
					<div class="tit_txt fl">一站式家装行业领导者</div>
					<div class="tit_right fr">
						<!--<a href="${ctx}/cases/p1?caseStyle=现代简约">现代简约</a> <a
							href="${ctx}/cases/p1?caseStyle=经典欧式">经典欧式</a> <a
							href="${ctx}/cases/p1?caseStyle=中式风格">中式风格</a> <a
							href="${ctx}/cases/p1?caseStyle=乡村田园">乡村田园</a> <a
							href="${ctx}/cases/p1?caseStyle=地中海">地中海</a> <a
							href="${ctx}/cases/p1?caseStyle=淡雅时光">淡雅时光</a> <a
							href="${ctx}/cases/p1?caseStyle=美式乡村">美式乡村</a> --><!--<a
							href="${ctx}/cases/p1?caseStyle=其他">其他</a>-->
					</div>
				</div>
				<div class="8fge">
					<div class="p6">
						<div class="row row1">
							<div id="center">
								<div id="slider">
									<c:forEach items="${homeDec }" var="decrateImg">

										<div class="slide" style="border-left-style: none; left: 0px;">
											<a href="${pageContext.request.contextPath }/cases/p1"><img
												class="diapo" border="0" src="${decrateImg.value }"
												style="opacity: 0.7; visibility: visible;"></a>
											<div class="backgroundText" style="top: 402px;"></div>
											<div class="backgroundText" style="top: 338px;"></div>
											<div class="text" style="top: 338px;"></div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
		<!--装修风格 end-->
		<div class="clear"></div>
		<!--装修案例 start-->
		<div class="zxal w1180">
			<div class="index_title">
				<div class="tit_left fl">
					<h2>装修案例</h2>
				</div>
				<div class="tit_txt fl">一站式家装行业领导者</div>
				<div class="tit_right fr">
					<a class="no_mar"
						href="${pageContext.request.contextPath}/cases/p1">查看更多...</a>
				</div>
			</div>

			<div class="zxal_fenl">
				<!--<ul id="caseHouseType">
					<li><span>户型</span></li>
					
					<li><a href="${ctx}/cases/p1?caseType=全部" class="allHome">全部</a></li>
					<li><a href="${ctx}/cases/p1?caseType=一居">一居</a></li>
					<li><a href="${ctx}/cases/p1?caseType=两居">两居</a></li>
					<li><a href="${ctx}/cases/p1?caseType=三居">三居</a></li>
					<li><a href="${ctx}/cases/p1?caseType=多局">多居</a></li>
					<li><a href="${ctx}/cases/p1?caseType=复式">复式</a></li>
					<li><a href="${ctx}/cases/p1?caseType=别墅">别墅</a></li>
					<li><a href="${ctx}/cases/p1?caseType=洋房">洋房</a></li>
					<li><a href="${ctx}/cases/p1?caseType=会所">会所</a></li>
					
				</ul>

				<ul id="caseAcreage">
					<li><span>面积</span></li>
					<li><a class="allHome" href="${ctx}/cases/p1?caseAcreage=全部">全部</a></li>
					<li><a href="${ctx}/cases/p1?caseAcreage=50-80平米">50-80平米</a></li>
					<li><a href="${ctx}/cases/p1?caseAcreage=80-120平米">80-120平米</a></li>
					<li><a href="${ctx}/cases/p1?caseAcreage=80-120平米">120-150平米</a></li>
					<li><a href="${ctx}/cases/p1?caseAcreage=150平米以上">150平米以上</a></li>
					
				</ul>-->
				<ul id="style">
					<li><span>装修风格</span></li>
					<li><a href="${ctx}/cases/p1?caseStyle=现代简约" class="allHome">现代简约</a></li>
					<li><a href="${ctx}/cases/p1?caseStyle=混搭风格">混搭风格</a></li>
					<li><a href="${ctx}/cases/p1?caseStyle=中式风格">中式风格</a></li>
					<li><a href="${ctx}/cases/p1?caseStyle=美式乡村">美式乡村</a></li>
					<li><a href="${ctx}/cases/p1?caseStyle=地中海">地中海</a></li>
					<li><a href="${ctx}/cases/p1?caseStyle=北欧风格">北欧风格</a></li>
				</ul>
			</div>


			<div class="zxal_con clearfix" id="homeCaseone">
				<c:forEach items="${CasesList }" var="cases" varStatus="status">

					<c:if test="${status.index==0 }">

						<div class="zxal_con_01 fl">
							<div class="zxal_pic">
								<a
									href="${pageContext.request.contextPath}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}">
									<img src="${cases.caseThumbImg }" width="545" height="415" alt="${cityCompany} ${cases.caseAcreage}平${cases.caseStyle}装修效果图"></a>
								<p>￥${cases.caseMoney }万起</p>
							</div>
							<div class="zxal_info clearfix">
								<a
									href="${pageContext.request.contextPath}/designerMessage/p1?designerId=${cases.designerId}">
									<img src="${cases.designerPhotoImg }" width="80" height="80">
								</a>
								<div class="info_left fl">
									<p>${cases.caseDesigner }</p>
									<p class="bg">${cases.designerTitle }</p>
								</div>
								<div class="info_right fr">
									<p>${cases.caseHouseType }${cases.caseAcreage }㎡</p>
									<p>${cases.caseTitle }</p>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>

				<div class="pic02 fl" id="homeCasetwo">
					<c:forEach items="${CasesList }" var="cases" varStatus="status">

						<c:if test="${status.index==1 }">

							<div class="zxal_con_02">
								<div class="zxal_pic">
									<a
										href="${pageContext.request.contextPath}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}">
										<img src="${cases.caseThumbImg }" width="330" height="176" alt="${cityCompany} ${cases.caseAcreage}平${cases.caseStyle}装修效果图"></a>
									<p>￥${cases.caseMoney }万起</p>
								</div>
								<div class="zxal_info clear">
									<a
										href="${pageContext.request.contextPath}/designerMessage/p1?designerId=${cases.designerId}">
										<img src="${cases.designerPhotoImg }" width="80" height="80">
									</a>
									<div class="info_left fl">
										<p>${cases.caseDesigner }</p>
										<p class="bg">${cases.designerTitle }</p>
									</div>
									<div class="info_right fr">
										<p>${cases.caseHouseType }&nbsp;${cases.caseAcreage }㎡</p>
										<p>${cases.caseTitle }</p>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>

					<c:forEach items="${CasesList }" var="cases" varStatus="status">

						<c:if test="${status.index==2 }">

							<div class="zxal_con_02 fl">
								<div class="zxal_pic">
									<a
										href="${pageContext.request.contextPath}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}"><img
										src="${cases.caseThumbImg }" alt="${cases.caseCommunity}${cases.caseStyle}装修效果图" width="330" height="176"></a>
									<p>￥${cases.caseMoney }万起</p>
								</div>
								<div class="zxal_info clear">
									<a
										href="${pageContext.request.contextPath}/designerMessage/p1?designerId=${cases.designerId}">
										<img src="${cases.designerPhotoImg }" width="80" height="80">
									</a>
									<div class="info_left fl">
										<p>${cases.caseDesigner }</p>
										<p class="bg">${cases.designerTitle }</p>
									</div>
									<div class="info_right fr">
										<p>${cases.caseHouseType }&nbsp;${cases.caseAcreage }㎡</p>
										<p>${cases.caseTitle }</p>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
				<c:forEach items="${CasesList }" var="cases" varStatus="status">

					<c:if test="${status.index==3 }">

						<div class="zxal_con_03 fr">
							<div class="zxal_pic">
								<a
									href="${pageContext.request.contextPath}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}"><img
									src="${cases.caseThumbImg }" alt="${cases.caseCommunity}${cases.caseStyle}装修效果图" width="280" height="415"></a>
								<p>￥${cases.caseMoney }万起</p>
							</div>
							<div class="zxal_info">
								<a
									href="${pageContext.request.contextPath}/designerMessage/p1?designerId=${cases.designerId}">
									<img src="${cases.designerPhotoImg }" width="80" height="80">
								</a>
								<div class="info_left fl">
									<p>${cases.caseDesigner }</p>
									<p class="bg">${cases.designerTitle }</p>
								</div>
								<div class="info_right fr">
									<p>${cases.caseHouseType }&nbsp;${cases.caseAcreage }㎡</p>
									<p>${cases.caseTitle }</p>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>




		</div>
		<!--装修案例end-->
		<div class="clear"></div>
		<!--装修攻略 start-->
		<div class="zxgl_bg">
			<div class="zxgl w1180">
				<div class="index_title">
					<div class="tit_left fl">
						<h2>装修攻略</h2>
					</div>
					<div class="tit_txt fl">一站式家装行业领导者</div>
					<div class="tit_right fr">
						<a class="no_mar"
							href="${pageContext.request.contextPath}/specase/p1?type=说装修">查看更多....</a>
					</div>
				</div>

				<div class="w1180 clearfix">


					<div class="news fl">
						<div class="focus">
							<div class="focus_con fn">

								<script type="text/javascript">
									//    reScrollPic("p", "p_main", "p_left", "p_right", 884, 221, null);
									$("div.fs_lt>h4>a").html(
											function() {
												return "<b>"
														+ $(this).attr("title")
														+ "</b>"
														+ $("#p_fn_title")
																.html();
											});
								</script>
								<div class="fs_rt fl">
									<h4>
										<a href="javascript:void(0)" class="n_more">查看更多</a> <a
											href="javascript:void(0)" class="n_name">行业资讯</a> <a
											href="javascript:void(0)" class="n_name">装修攻略</a> <a
											href="javascript:void(0)" class="n_name no_01">家装日记</a>
									</h4>
									<ul class="n_list">
										<c:forEach items="${CompNewsLists }" var="news"
											varStatus="status">

											<c:if test="${(status.index+1)%3 != 0 }">

												<li class=""><img
														src="${news.thumbImg }" width="85" height="85">
													<dl>
														<dt>
															<span><fmt:formatDate value="${news.createTime }" /></span>
															<a target="_blank"
																href="${pageContext.request.contextPath}/newDetail?newsId=${news.newsId}&type=行业资讯">${news.title }</a>
														</dt>
														<dd>

															<c:choose>
																<c:when test="${fn:length(news.contents) >= 60}">
                  
                     ${fn:substring(news.contents,0,60) }... 
                  </c:when>
																<c:otherwise> ${news.contents}</c:otherwise>
															</c:choose>
															<a target="_blank"
																href="${pageContext.request.contextPath}/newDetail?newsId=${news.newsId}&type=行业资讯"><font
																color="red">[详细]</font></a>
														</dd>
													</dl></li>
											</c:if>
											<c:if test="${(status.index+1)%3 == 0 }">
												<li class="no_mar"><img
														src="${news.thumbImg }" width="85" height="85">
													<dl>
														<dt>
															<span><fmt:formatDate value="${news.createTime }" /></span>
															<a target="_blank"
																href="${pageContext.request.contextPath}/newDetail?newsId=${news.newsId}&type=行业资讯">${news.title }</a>
														</dt>
														<dd>
															<c:choose>
																<c:when test="${fn:length(news.contents) >= 60}">
                  
                     ${fn:substring(news.contents,0,60) }... 
                  </c:when>
																<c:otherwise> ${news.contents}</c:otherwise>
															</c:choose>
															<a target="_blank"
																href="${pageContext.request.contextPath}/newDetail?newsId=${news.newsId}&type=行业资讯"><font
																color="red">[详细]</font></a>
														</dd>
													</dl></li>
											</c:if>
										</c:forEach>
									</ul>
									<ul class="n_list">
										<!-- 装修攻略  开始 -->
										<c:forEach items="${newsActLists }" var="news"
											varStatus="status">
											<c:if test="${(status.index+1)%3 != 0 }">

												<li class=""><img
														src="${news.thumbImg }" width="85" height="85">
													<dl>
														<dt>
															<span><fmt:formatDate value="${news.createTime }" /></span>
															<a target="_blank"
																href="${pageContext.request.contextPath}/newDetail?newsId=${news.newsId}&type=装修攻略">${news.title }</a>
														</dt>
														<dd>

															<c:choose>
																<c:when test="${fn:length(news.contents) >= 60}">
                  
                     ${fn:substring(news.contents,0,60) }... 
                  </c:when>
																<c:otherwise> ${news.contents}</c:otherwise>
															</c:choose>
															<a target="_blank"
																href="${pageContext.request.contextPath}/newDetail?newsId=${news.newsId}&type=装修攻略"><font
																color="red">[详细]</font></a>
														</dd>
													</dl></li>
											</c:if>
											<c:if test="${(status.index+1)%3 == 0 }">
												<li class="no_mar"><img
														src="${news.thumbImg }" width="85" height="85">
													<dl>
														<dt>
															<span><fmt:formatDate value="${news.createTime }" /></span>
															<a target="_blank"
																href="${pageContext.request.contextPath}/newDetail?newsId=${news.newsId}&type=装修攻略">${news.title }</a>
														</dt>
														<dd>
															<c:choose>
																<c:when test="${fn:length(news.contents) >= 60}">
                  
                     ${fn:substring(news.contents,0,60) }... 
                  </c:when>
																<c:otherwise> ${news.contents}</c:otherwise>
															</c:choose>
															<a target="_blank"
																href="${pageContext.request.contextPath}/newDetail?newsId=${news.newsId}&type=装修攻略"><font
																color="red">[详细]</font></a>
														</dd>
													</dl></li>
											</c:if>
										</c:forEach>
									</ul>
									<!-- 装修攻略结束 -->
									<ul class="n_list">

										<!-- 家装日记开始 -->
										<c:forEach items="${newsTechsLists }" var="news"
											varStatus="status">

											<c:if test="${(status.index+1)%3 != 0 }">

												<li class=""><img
														src="${news.thumbImg }" width="85" height="85">
													<dl>
														<dt>
															<span><fmt:formatDate value="${news.createTime }" /></span>
															<a target="_blank"
																href="${pageContext.request.contextPath}/newDetail?newsId=${news.newsId}&type=家装日记">${news.title }</a>
														</dt>
														<dd>
															<c:choose>
																<c:when test="${fn:length(news.contents) >= 60}">
                  
                     ${fn:substring(news.contents,0,60) }... 
                  </c:when>
																<c:otherwise> ${news.contents}</c:otherwise>
															</c:choose>
															<a target="_blank"
																href="${pageContext.request.contextPath}/newDetail?newsId=${news.newsId}&type=家装日记"><font
																color="red">[详细]</font></a>
														</dd>
													</dl></li>
											</c:if>
											<c:if test="${(status.index+1)%3 == 0 }">
												<li class="no_mar"><img
														src="${news.thumbImg }" width="85" height="85">
													<dl>
														<dt>
															<span><fmt:formatDate value="${news.createTime }" /></span>
															<a target="_blank"
																href="${pageContext.request.contextPath}/newDetail?newsId=${news.newsId}&type=家装日志">${news.title }</a>
														</dt>
														<dd>
															<c:choose>
																<c:when test="${fn:length(news.contents) >= 60}">
                  
                     ${fn:substring(news.contents,0,60) }... 
                  </c:when>
																<c:otherwise> ${news.contents}</c:otherwise>
															</c:choose>
															<a target="_blank"
																href="${pageContext.request.contextPath}/newDetail?newsId=${news.newsId}&type=家装日志"><font
																color="red">[详细]</font></a>
														</dd>
													</dl></li>
											</c:if>
										</c:forEach>
									</ul>
									<!-- 家装日志结束 -->
								</div>
								<script type="text/javascript">
									$(".fs_rt>h4>a.n_name")
											.mouseover(
													function() {
														var url = $(this).attr(
																"href");
														$(this).siblings(
																".n_more")
																.attr({
																	href : url
																});
														$(this)
																.parent("h4")
																.siblings("ul")
																.eq(
																		$(this)
																				.addClass(
																						"cur")
																				.siblings(
																						".n_name")
																				.removeClass(
																						"cur")
																				.parent()
																				.children(
																						".n_name")
																				.index(
																						this))
																.show()
																.siblings("ul")
																.hide();
													}).eq(0).trigger(
													"mouseover");
								</script>
							</div>
						</div>
					</div>
					<div class="gl_pic fr">
						<!-- 代码 开始 -->
						<!--<div id="fsD1" class="pic_focus" style="margin-left:400px">  -->
						<div id="fsD1" class="pic_focus">
							<div id="D1pic1" class="fPic">
								<c:forEach items="${newsList }" var="news">

									<div class="fcon" style="display: none;">
										<a target="_blank"
											href="${pageContext.request.contextPath}/newDetail?newsId=${news.newsId}&type=${news.type}"><img
											src="${news.thumbImg }" style="opacity: 1;"
											alt="${news.title }" width="520" height="396"></a> <span
											class="shadow"><a target="_blank" href="">${news.title }</a></span>
									</div>
								</c:forEach>
							</div>
							<div class="fbg">
								<div class="D1fBt" id="D1fBt">
									<a href="javascript:void(0)" target="_self" class=""><i>1</i></a>
									<a href="javascript:void(0)" target="_self" class=""><i>2</i></a>
									<a href="javascript:void(0)" target="_self" class="current"><i>3</i></a>
									<a href="javascript:void(0)" target="_self" class=""><i>4</i></a>
								</div>
							</div>
							<span class="prev"></span> <span class="next"></span>
						</div>
						<script type="text/javascript">
							Qfast
									.add(
											'widgets',
											{
												path : "${pageContext.request.contextPath}/www/js/terminator2.2.min.js",
												type : "js",
												requires : [ 'fx' ]
											});
							Qfast(false, 'widgets', function() {
								K.tabs({
									id : 'fsD1', //焦点图包裹id  
									conId : "D1pic1", //** 大图域包裹id  
									tabId : "D1fBt",
									tabTn : "a",
									conCn : '.fcon', //** 大图域配置class       
									auto : 1, //自动播放 1或0
									effect : 'fade', //效果配置
									eType : 'click', //** 鼠标事件
									pageBt : true,//是否有按钮切换页码
									bns : [ '.prev', '.next' ],//** 前后按钮配置class                          
									interval : 3000
								//** 停顿时间  
								});
							})
						</script>
						<!-- 代码 结束 -->
					</div>
				</div>
			</div>
		</div>
		<!--装修攻略 end-->
		<div class="clear"></div>
		<!--装修楼盘 start-->
		<div class="zxlp w1180">
			<div class="index_title">
				<div class="tit_left fl">
					<h2>装修楼盘</h2>
				</div>
				<div class="tit_txt fl">一站式家装行业领导者</div>

			</div>
			<div class="adorn-case w1180">
				<div class="box1 w1180 clearfix">
					<div class="clear"></div>
					<c:forEach items="${BuildingList }" var="house" varStatus="status">

						<c:if test="${status.index==0 }">
							<div class="bigPic fl">
								<i class="ico-new"></i> <a class="pic" target="_blank"
									href="${pageContext.request.contextPath}/houseDetail?hotBuildingId=${house.bulidingId}"><img
									class="lazy" alt="${cityCompany}${house.bulidingName}楼盘"
									data-original="${pageContext.request.contextPath}/www/images/anlipic_01.jpg"
									src="${house.bulidingThumbImg }" width="490" height="370"
									style="display: block; "></a>
								<div class="bar">
									<div class="txt">
										<p class="tit text-nowrap">
											<a target="_blank"
												href="${pageContext.request.contextPath}/houseDetail?hotBuildingId=${house.bulidingId}">${house.bulidingName }</a>
										</p>
									</div>
									<div class="shadow"></div>
								</div>
							</div>
						</c:if>
					</c:forEach>



					<div class="lp_pic_mid fl">

						<c:forEach items="${BuildingList }" var="house" varStatus="status">

							<c:if test="${status.index==1 }">
								<div class="pic1">
									<a class="pic" target="_blank"
										href="${pageContext.request.contextPath}/houseDetail?hotBuildingId=${house.bulidingId}"><img
										class="lazy" alt="${house.bulidingName}楼盘"
										data-original="${pageContext.request.contextPath}/www/images/anlipic_01.jpg"
										src="${house.bulidingThumbImg }" style="display: block;"
										width="322" height="170"></a>
									<div class="bar">
										<div class="txt">
											<p class="tit text-nowrap">
												<a target="_blank"
													href="${pageContext.request.contextPath}/houseDetail?hotBuildingId=${house.bulidingId}">${house.bulidingName }</a>
											</p>
										</div>
										<div class="shadow"></div>
									</div>
								</div>
							</c:if>
						</c:forEach>

						<c:forEach items="${BuildingList }" var="house" varStatus="status">

							<c:if test="${status.index==2 }">
								<div class="pic1 no_mar">
									<a class="pic" target="_blank"
										href="${pageContext.request.contextPath}/houseDetail?hotBuildingId=${house.bulidingId}"><img
										class="lazy" alt="${house.bulidingName}楼盘"
										data-original="${pageContext.request.contextPath}/www/images/anlipic_01.jpg"
										src="${house.bulidingThumbImg }" style="display: block;"
										width="322" height="170"></a>
									<div class="bar">
										<div class="txt">
											<p class="tit text-nowrap">
												<a target="_blank"
													href="${pageContext.request.contextPath}/houseDetail?hotBuildingId=${house.bulidingId}">${house.bulidingName }</a>
											</p>
										</div>
										<div class="shadow"></div>
									</div>
								</div>
							</c:if>
						</c:forEach>

					</div>



					<div class="lp_pic_rig fr">
						<c:forEach items="${BuildingList }" var="house" varStatus="status">

							<c:if test="${status.index==3 }">
								<div class="pic1">
									<a class="pic" target="_blank"
										href="${pageContext.request.contextPath}/houseDetail?hotBuildingId=${house.bulidingId}"><img
										class="lazy" alt="${house.bulidingName}楼盘"
										data-original="${pageContext.request.contextPath}/www/images/anlipic_01.jpg"
										src="${house.bulidingThumbImg }" style="display: block;"
										width="322" height="170"></a>
									<div class="bar">
										<div class="txt">
											<p class="tit text-nowrap">
												<a target="_blank"
													href="${pageContext.request.contextPath}/houseDetail?hotBuildingId=${house.bulidingId}">${house.bulidingName }</a>
											</p>
										</div>
										<div class="shadow"></div>
									</div>
								</div>
							</c:if>
						</c:forEach>

						<c:forEach items="${BuildingList }" var="house" varStatus="status">

							<c:if test="${status.index==4 }">
								<div class="pic1 no_mar">
									<a class="pic" target="_blank"
										href="${pageContext.request.contextPath}/houseDetail?hotBuildingId=${house.bulidingId}"><img
										class="lazy" alt="${house.bulidingName}楼盘"
										data-original="${pageContext.request.contextPath}/www/images/anlipic_01.jpg"
										src="${house.bulidingThumbImg }" style="display: block;"
										width="322" height="170"></a>
									<div class="bar">
										<div class="txt">
											<p class="tit text-nowrap">
												<a target="_blank"
													href="${pageContext.request.contextPath}/houseDetail?hotBuildingId=${house.bulidingId}">${house.bulidingName }</a>
											</p>
										</div>
										<div class="shadow"></div>
									</div>
								</div>
							</c:if>
						</c:forEach>

					</div>

				</div>
			</div>

		</div>
		<!--装修楼盘  end-->
		<div class="clear"></div>
		<!--合作品牌 start-->

		<div class="hz_bg">
			<div class="hz w1180 clearfix ">
				<div class="hz_tit fl">
					<p>合作品牌</p>
				</div>

				<!-- 代码开始 -->
				<div class="box fr">
					<div class="picbox">
						<ul class="piclist mainlist">
							<c:forEach items="${homeCok }" var="coworkerImg">

								<li><a target="_blank"><img src="${coworkerImg.value }"
										width="170" height="100" /></a></li>
							</c:forEach>

						</ul>
						<ul class="piclist swaplist"></ul>
					</div>
					<div class="og_prev"></div>
					<div class="og_next"></div>
				</div>


				<!-- 代码结束 -->

			</div>

		</div>

		<!--合作品牌  end-->

		<div class="clear"></div>

	</div>
	<!--footer start-->
	<div class="footer">
		<div class="footer01_bg">
			<div class="footer01 w1180">
				<div class="link">${homeLk.value }</div>
				<div class="footer_nav fl">
					<h3>快速导航</h3>
					<ul>

						<li><a
							href="${pageContext.request.contextPath }/Integrated_package.jsp">整装套餐</a></li>
						<li><a href="${pageContext.request.contextPath }/cases/p1">设计案例</a></li>
						<li><a
							href="${pageContext.request.contextPath}/spec/p1?type=热门活动"
							id="s3" class="subNavBtn">热门活动</a></li>
						<li><a href="${pageContext.request.contextPath}/designer/p1">设计团队</a></li>
						<li><a
							href="${pageContext.request.contextPath}/specase/p1?type=说装修">说装修</a></li>
						<li><a
							href="${pageContext.request.contextPath}/blue_diamond_process.jsp">蓝钻工艺</a></li>
						<li><a href="${pageContext.request.contextPath}/orderLine">三创服务</a></li>
						<li><a href="${pageContext.request.contextPath}/about.jsp">关于三创</a></li>
					</ul>
				</div>

				<div class="footer_cont fl">
					<h3>联系我们</h3>
					<ul class="clear">
						<c:if test="${branchCompany!='bjsc'}">
							<li><img
								src="${pageContext.request.contextPath}/www/images/company.png"><span>总公司名称：北京三创装饰设计有限公司(总部)</span></li>
							<li><img
								src="${pageContext.request.contextPath}/www/images/company.png"><span>总公司地址：北京市朝阳区十里河古隆盛四层</span></li>
						</c:if>
						<li><img
							src="${pageContext.request.contextPath}/www/images/company.png"><span>公司名称：${scinterHomeChildCompany.value }</span></li>
						<li><img
							src="${pageContext.request.contextPath}/www/images/footer_tel.png"><span>公司电话：${homeTp.value }</span></li>
						<li><img
							src="${pageContext.request.contextPath}/www/images/footer_des.png"><span>公司地址：${homeAdress.value }</span>

						</li>
					</ul>
				</div>

				<div class="footer_ewm">
					<h3>扫描二维码</h3>
					<ul>

						<li><img src="${homeTc.value }"></li>
						<li><a href="javascript:void(0)"><img
								src="${pageContext.request.contextPath}/www/images/tianmao.png"></a></li>
						<li><a href="javascript:void(0)"><img
								src="${pageContext.request.contextPath}/www/images/jingdong.jpg"></a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="clear"></div>

		<div class="footer02_bg">
			<div class="w1180">Copyright 2013-2016 北京三创国际装饰设计有限公司</div>
		</div>
	</div>
	<!--footer end-->

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/www/js/fengge.js"></script>

	<!--右侧悬浮 开始-->
	<jsp:include page="../public/fastToTop.jsp" />
	<!--右侧悬浮 结束-->


	<div class="layout">
		<!--我要报价-->

		<!-- bj start -->
		<jsp:include page="../public/faster.jsp" />
		<!-- bj end -->

	</div>
	<!--右侧悬浮 end-->
	${sessionScope.statistics.value } ${sessionScope.shangqiao.value }
</body>
</html>