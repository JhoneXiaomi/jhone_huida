<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp"%>
<%@ include file="public/shangqiao.jsp" %> 
<!doctype html>
<html>
<head>

<meta charset="utf-8">
<c:if test="${((houseStyle=='styleAll'||not empty houseStyle) && (designerLevel=='allLevel'||empty designerLevel))||(empty houseStyle &&empty designerLevel)}">
	<title>${designerSeoTitleStr.value }</title>
</c:if>
<c:if test="${designerLevel=='sjzj'}">
	<title>高级设计总监装修团队_户型装修效果-${companyCity}新洲装饰公司</title>
</c:if>
<c:if test="${designerLevel=='gjsxsjs'}">
	<title>高级首席设计师装修团队_户型装修效果-${companyCity}新洲装饰公司</title>
</c:if>
<c:if test="${designerLevel=='sxsjs'}">
	<title>首席设计师装修团队_户型装修效果-${companyCity}新洲装饰公司</title>
</c:if>
<c:if test="${designerLevel=='zrsjs'}">
	<title>主任设计师装修团队_户型装修效果-${companyCity}新洲装饰公司</title>
</c:if>
<c:if test="${designerLevel=='yxsjs'}">
	<title>优秀设计师装修团队_户型装修效果-${companyCity}新洲装饰公司</title>
</c:if>
<meta name="keywords" content="${designerSeoKeywordStr.value }" />
<meta name="description" content="${designerSeoDescStr.value }" />
<link rel="stylesheet" type="text/css" href="${ctx }/www/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx }/www/css/component.css" />
<script type="text/javascript" src="${ctx }/www/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${ctx }/www/js/pptBox.js"></script>
<script type="text/javascript" src="${ctx }/www/js/hezuo.js"></script>
<script type="text/javascript" src="${ctx }/www/js/commen.js"></script>
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

	<div class="ej_main w1200">
		<div class="ej_main_local sjs_local">
			您的当前位置：<a href="${ctx }/">${companyCity}装修</a>><a
				href="${ctx }/designer/p1">设计团队 </a>
		</div>

		<div class="sjs_list_left fl">
			<div class="sjs_list_left_xuanze">
				<div class="xuanze01">
					擅长风格： <a onclick="aHouseStyle(this)" name="styleAll">全部</a> <a
						onclick="aHouseStyle(this)" name="xdjy">现代简约</a> <a
						onclick="aHouseStyle(this)" name="osgd">欧式古典</a> <a
						onclick="aHouseStyle(this)" name="tyxc">田园乡村</a> <a
						onclick="aHouseStyle(this)" name="jo">简欧</a> <a
						onclick="aHouseStyle(this)" name="msfg">美式风格</a> <a
						onclick="aHouseStyle(this)" name="dzh">地中海</a> <a
						onclick="aHouseStyle(this)" name="hd">混搭</a> <a
						onclick="aHouseStyle(this)" name="zs">中式</a> <a
						onclick="aHouseStyle(this)" name="xzs">新中式</a> <a
						onclick="aHouseStyle(this)" name="hxd">后现代</a>
				</div>
				<div class="xuanze02">
					设计级别： <a name="allLevel" onclick="level(this)">全部</a> <a
						name="sjzj" onclick="level(this)">高级设计总监</a> <a name="gjsxsjs"
						onclick="level(this)">高级首席设计师</a> <a name="sxsjs"
						onclick="level(this)">首席设计师</a> <a name="zrsjs"
						onclick="level(this)">主任设计师</a> <a name="yxsjs"
						onclick="level(this)">优秀设计师</a>

				</div>
			</div>

			<!--大牌设计师 start-->
			<div class="hzbj">
				<!-- picrotate_left start  -->
				<div class="blk_18">
					<div class="title">
						<div class="title_cen clearfix">
							<h3 class="fl">大牌设计师</h3>
						</div>
					</div>
					<a class="LeftBotton" onmousedown="ISL_GoUp_1()"
						onmouseup="ISL_StopUp_1()" onmouseout="ISL_StopUp_1()"
						href="javascript:void(0);" target="_self"></a>
					<div class="pcont" id="ISL_Cont_1">
						<div class="ScrCont clearfix">
							<div id="List1_1">
								<!-- piclist begin -->
								<c:forEach items="${designerList }" var="designer" >

									<a class="pl"
										href="${ctx}/designerDetail/p1?designerId=${designer.designerId}">
										<img src="${designer.designerPhotoImg }" width="150"
										height="150" alt="${designer.designerName }"
										title="${designer.designerName }" /> <span><b
											style="color: #ff3900; font-size: 16px;">${designer.designerName }</b>&nbsp;&nbsp;${designer.designerTitle 

}</span>
									</a>
									<div class="md-modal md-effect-1" id="modal-1">
										<div>
											<div class="md-content">
												<h3>立即预约设计师</h3>
												<div>
													<p>
														您的姓名：<input type="text" name="order_clientName" />
													</p>
													<p>
														您的手机：<input type="text" name="order_phone" />
													</p>
													<p>
														楼盘信息：<input type="text" name="order_address" />
													</p>


													<p>
														房屋面积：<input type="text" name="order_acreage" />
													</p>
													<p>
														设&nbsp;计&nbsp;师&nbsp;：<input type="text"
															name="order_designerName" id="order_designerName"
															value="${designer.designerName }" />
													</p>
													<div class="submit_btn" id="but_order">立即预约</div>
													<button class="md-close"></button>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>

								<!-- piclist end -->
							</div>
							<div id="List2_1"></div>
						</div>
					</div>
					<a class="RightBotton" onmousedown="ISL_GoDown_1()"
						onmouseup="ISL_StopDown_1()" onmouseout="ISL_StopDown_1()"
						href="javascript:void

(0);" target="_self"></a>
				</div>

			</div>
			<div class="c"></div>
			<script type="text/javascript">
	  <!--
	  picrun_ini()
	  //-->
	</script>


			<!--大牌设计师 end-->


			<div class="sjs_list">

				<ul>
					<c:forEach items="${designerList }" var="designer"
						varStatus="status" begin="0" end="20">
						<li>
							<div class="sjs_list_top clearfix">


								<div class="sjs_list_img fl">
									<a target="_blank"
										href="${ctx}/designerDetail/p1?designerId=${designer.designerId}">
										<img src="${designer.designerPhotoImg }" width="240"
										height="262" />
									</a>
								</div>
								<div class="sjs_list_info fl">
									<h3>${designer.designerName }
										<span>${designer.designerTitle }</span>
									</h3>
									<p>部门：${designer.designerDept }
										级别：${designer.designerTitle} 从业时间：${designer.designerWorkTime 

}</p>
									<p>擅长风格：${designer.designerStyle }</p>
									<p>
										最新案例：
										<c:forEach items="${designer.cases }" var="caseOne" begin="0"
											end="3">

											<a
												href="${ctx}/casesDetail?casesId=${caseOne.caseId }&designerId=${caseOne.designerId}">

												<c:choose>

													<c:when test="${fn:length(caseOne.caseTitle)>5 }">${fn:substring

(caseOne.caseTitle,0,5) }</c:when>
													<c:otherwise>${caseOne.caseTitle }</c:otherwise>
												</c:choose>
											</a>&nbsp;||&nbsp;
			        		</c:forEach>
									<div class="sjs_list_sj clearfix">
										<span>案例数<br />
										<b>${2389-(status.index*125)}<%-- ${designer.designerCases } --%></b></span>
										<span>浏览量<br />
										<b>${designer.designerPopularity }</b></span>
									</div>
								</div>
								<div class="sjs_list_yuyue fl">
									<a href="javascrpt:void(0)"><button class="md-trigger"
											data-modal="modal-1">马 上约她</button></a>
								</div>
							</div>

							<div class="clearfix"></div>
							<div class="sjs_list_bottom">
								<dl class="clearfix">
									<c:forEach items="${designer.cases }" var="cases" begin="0"
										end="3" varStatus="status">
										<c:if test="${status.index != 3 }">

											<dd>
												<a
													href="${ctx}/casesDetail?casesId=${cases.caseId }&designerId=

${cases.designerId}">
													<img src="${cases.caseThumbImg }" width="195" height="162" />
												</a>
											</dd>
										</c:if>
										<c:if test="${status.index == 3 }">

											<dd class="no_mar">
												<a
													href="${ctx}/casesDetail?casesId=${cases.caseId }&designerId=

${cases.designerId}">
													<img src="${cases.caseThumbImg }" width="195" height="162" />
												</a>
											</dd>
										</c:if>
									</c:forEach>
								</dl>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="main_anli_right fr">



			<!--滚动div模块  start-->
			<div class="designSide">
				<div class="sideBox" id="DesignerBMK">
					<h4 style="text-align: center;">
						共有<b>130</b>&nbsp;&nbsp;位资深设计师 <br /> 为您提供<b>2890</b>&nbsp;&nbsp;套精品案例

						<br /> 共计&nbsp;<b>36985</b>&nbsp;&nbsp;位客户选择新洲装饰
					</h4>
					<h4></h4>
					<h4>
						<b></b>
					</h4>
					<h2>优秀的设计团队 丰富的设计经验</h2>
					<p>获得最靠谱的装修预算</p>
					<div class="main_anli_right_input">
						<input type="hidden" id="branchCompany" value="${branchCompany }" />
						<input type="hidden" name="orderId" id="orderId" /> <input
							type="text" name="clientName" placeholder="请输入您的称呼" /> <input
							type="text" name="phone" placeholder="请输入您的电话" /> <input
							type="text" name="address" placeholder="请输入小区名称" /> <input
							type="text" name="acreage" placeholder="请输入楼盘面积" /> <a
							href="javascript:void(0)" id="_submit">立即申请</a>
					</div>
					<p>
						已有（<font color="red">
							<%-- ${orderNumber } --%>646
						</font>）业主申请了此服务
					</p>
					<p>
						免费电话申请<font color="red">${homeTp.value }</font>
					</p>
					<p>现在预约即送精美礼品</p>
				</div>

			</div>

			<!--滚动div模块 end-->

			<script>
	$(window).scroll(function() {
		var top = $('#DesignerAD').offset().top;
		var element = $("#DesignerBMK");
		var left = ($(window).width()-1200)/2+948;
		var scrolls = $(this).scrollTop();
		if (scrolls > top) {  
			if (window.XMLHttpRequest) {  
				element.css({  
					position: "fixed",  
					top: 0 ,
					left: left+"px",
					zIndex: 9990
				});  
			} else {  
				element.css({  
					top: scrolls  
				});  
			}  
		}else {
			element.css({  
				position: "relative",  
				top: "",
				left: ""  
			});  
		}  
	});
	
	
    var designBanner = new Swiper('.newDesignBanner .swiper-container', {
        pagination: '.newDesignBanner .swiper-pagination',
        nextButton: '.newDesignBanner .swiper-button-next',
        prevButton: '.newDesignBanner .swiper-button-prev',
        paginationClickable: true,
        spaceBetween: 30,
        centeredSlides: true,
        autoplay: 3500,
		loop: true,
        autoplayDisableOnInteraction: false
    });
    var designRecommend = new Swiper('.designRecommend .swiper-container', {
        nextButton: '.designRecommend .swiper-button-next',
        prevButton: '.designRecommend .swiper-button-prev',
		slidesPerView: 5,
        spaceBetween: 30,
		loop: true,
    });
    var designLike = new Swiper('.designLike .swiper-container', {
        pagination: '.newDesignBanner .swiper-pagination',
        nextButton: '.newDesignBanner .swiper-button-next',
        prevButton: '.newDesignBanner .swiper-button-prev',
        paginationClickable: true,
        spaceBetween: 30,
        centeredSlides: true,
        autoplay: 3500,
		loop: true,
        autoplayDisableOnInteraction: false
    });
	
    </script>


			<h3 style="text-align: center; height: 40px; line-height: 40px;">热门案例</h3>
			<ul class="clearfix">
				<c:forEach items="${casesList }" var="cases" begin="0" end="4">

					<li><a target="_blank"
						href="${ctx}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}">
							<img src="${cases.caseThumbImg}" width="228" height="187"
							style="margin-left: 11px" />
					</a> <span style="margin-left: 53px;">&nbsp;【${cases.caseStyle }】&nbsp;
							${cases.caseHouseType}&nbsp; ${cases.caseAcreage }㎡</span></li>
				</c:forEach>
			</ul>

			<div class="sideBox" id="DesignerAD" style="border: 0;"></div>
		</div>


		<!--底部流程 start-->

		<div class="point">
			<div class="wrap">
				<p class="l">
					<span class="i1"><b>免费</b><br>上门量房</span>
				</p>
				<p>
					<span class="i2"><b>免费</b><br>全屋家居定制</span>
				</p>
				<p>
					<span class="i3"><b>免费</b><br>3D效果预想</span>
				</p>
				<p>
					<span class="i4"><b>免费</b><br>产品上门安装</span>
				</p>
				<p class="r">
					<span class="i5"><b>免费</b><br>保修，终身维护</span>
				</p>
			</div>
		</div>
	</div>
	<!--底部流程 end-->


	<div class="clear"></div>

	<!--footer start-->
	<jsp:include page="public/fotter.jsp" />
	<!--footer end-->
	<!-- servise start -->
	<jsp:include page="public/service.jsp" />
	<!-- servise end -->

	<script src="${ctx }/www/js/classie.js"></script>
	<script src="${ctx }/www/js/modalEffects.js"></script>

	<script>
		// this is important for IEs
		var polyfilter_scriptpath = '/js/';
	</script>
	<script src="${ctx }/www/js/cssParser.js"></script>
	<script src="${ctx }/www/js/css-filters-polyfill.js"></script>
	<script type="text/javascript">
	var houseStyle='${houseStyle}';
	var designerLevel='${designerLevel}';
	if(houseStyle==""||houseStyle==null){
		$("a[name='styleAll']").attr("class","all");
	}else{
		$("a[name='"+houseStyle+"']").attr("class","all");
	}
	if(designerLevel==""){
		$("a[name='allLevel']").attr("class","all");
	}else{
		$("a[name='"+designerLevel+"']").attr("class","all");
	}
		function aHouseStyle(aHouseStyle){
			$(aHouseStyle).attr("class","all");
			$(aHouseStyle).siblings().removeClass("all");
			houseStyle=$(aHouseStyle).prop("name");
			window.location.href="${ctx}/designer/p1?houseStyle="+houseStyle+"&designerLevel="+designerLevel;
		}
		function level(level){
			$(level).attr("class","all");
			$(level).siblings().removeClass("all");
			designerLevel=$(level).prop("name");
			window.location.href="${ctx}/designer/p1?houseStyle="+houseStyle+"&designerLevel="+designerLevel;
		}
			 $("#_submit").click(function(){
				   
			  	 var orderId =  getOrderId();
				 var clientName= $("input[name='clientName']").val();
				 var phone= $("input[name='phone']").val();
				 var acreage= $("input[name='acreage']").val();
				 var branchCompany= $('#branchCompany').val();
				 console.info("orderId"+orderId,"clientName"+clientName+"phone"+phone+"acreage"+acreage

+"branchCompany"+branchCompany);
				 if(!clientName.match(/^\s*$/) && phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/) && !acreage.match(/^\s*$/)){
					 
					 $.ajax({
							type : "POST",
							dataType : "json",
							url : "${ctx}/saveOrder",
							data : 

{'branchCompany':branchCompany,'orderId':orderId,'clientName':clientName,'phone':phone,'acreage':acreage,'sourceType':'免费申请'},
							success : function(data) {
								if (data.data == "ok") {
									alert("请您稍等，稍后会有客服人员为您服务!");
								}else{
									alert("保存失败");
								}
							}
						});  
				 }else if(clientName.match(/^\s*$/)){
					 alert("对不起,请正确填写姓名!");
				 }else if(!phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/)){
					 alert("对不起，请正确填写电话格式!");
				 }else if(acreage.match(/^\s*$/)){
					 alert("对不起,请填请正确天填写房屋面积!");
				 }
		   });
			 
			$(".submit_btn").click(function(){
				
				var orderId =  getOrderId();
				var order_clientName = $("input[name='order_clientName']").val();
				var order_phone = $("input[name='order_phone']").val();
				var order_acreage = $("input[name='order_acreage']").val();
				var branchCompany= $("#branchCompany").val();
				var order_address = $("input[name='order_address']").val(); 
				var order_designerName = $("#order_designerName").val();
				console.info("order_clientName:"+order_clientName+"order_phone:"+order_phone+"order_address"+order_address);
				if(order_clientName.match(/^\s*$/)){
					
					alert("对不起，请填写您的名字！");
					return false;
				}
				if(!order_phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/)){
					
					alert("对不起，请填写您的手机号！");
					return false;
				}
				if(order_address.match(/^\s*$/)){
					
					alert("对不起，请填写您的地址！");	
					return false;
				}
			    $.ajax({
			    	
			    	type : "POST",
					dataType : "json",
					url : "${ctx}/saveOrder",
					data : 

{'designer':order_designerName,'acreage':order_acreage,'branchCompany':branchCompany,'orderId':orderId,'clientName':order_clientName,'phone':orderphone,'address':order_address,'sourceType':'立即预约'},
					success : function(data) {
						
						if (data.data == "ok") {
							alert("请您稍等，稍后会有客服人员为您服务!");
						}else{
							alert("保存失败");
						}
					}
			    });
				$(".md-close").click();
			});
	</script>
	${sessionScope.statistics.value } ${sessionScope.shangqiao.value }
	${sessionScope.cnzzSession }
</body>
</html>

