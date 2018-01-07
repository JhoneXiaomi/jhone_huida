<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp" %> 
<%@ include file="public/shangqiao.jsp" %>      
<!doctype html>
<html>
<head>

	<meta charset="utf-8">
	<title>${speSeoTitleStr.value }</title>
	<meta name="keywords" content="${speSeoKeywordStr.value }"/>
	<meta name="description" content="${speSeoDescStr.value }"/>
	<link rel="stylesheet" type="text/css" href="${ctx }/www/css/style.css"/>
	<script type="text/javascript" src="${ctx }/www/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="${ctx }/www/js/pptBox.js"></script>
	<script type="text/javascript" src="${ctx }/www/js/commen.js"></script>
</head>

<body>
	<!--头部 start-->
		<jsp:include page="public/header.jsp"/>
	<!--头部 end-->
	<div class="clear"></div>
	<!--nav start-->
	<jsp:include page="public/nav.jsp"/>
	<!--nav end-->
	
	<div class="clear"></div>
	   	
	<script type="text/javascript" src="${ctx }/www/js/jquery.js"></script>
	<script type="text/javascript" src="${ctx }/www/js/scroll.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$('.list_lh li:even').addClass('lieven');
	});
	$(function(){
		$("div.list_lh").myScroll({
			speed:40, //数值越大，速度越慢
			rowHeight:68 //li的高度
		});
	});
	</script>
	
	
	
	<div class="ej_main w1200">
	  <div class="ej_main_local">您的当前位置：<a href="${ctx }/">${companyCity}装修</a>><a href="${ctx }/news/p1">装修新闻</a></div>
	  <div class="lc"><img src="${ctx }/www/images/lcimg.jpg"/></div>
	  
	  <div class="clearfix">
	    
	    <div class="ej_news_left fl">
	    <c:forEach items="${listNews }" var="news" varStatus="status">
	    
	     <dl class="clearfix">
	        <dt>
		        <a href="${ctx}/newsDetail?newsId=${news.newsId}" target="_blank">
		        	<img src="${news.thumbImg }" width="250" height="208"/>
		        </a>
	        </dt>
	        <dd>
	          <h4 >
	          	<a href="${ctx}/newsDetail?newsId=${news.newsId}" target="_blank" style="color: #008cd6"> 【${news.title }】 </a>
	          </h4>
	          <p>
	          	  <c:choose>
				        <c:when test="${fn:length(news.contents) >= 135}">
		          		
			               ${fn:substring(news.contents, 0, 135)}...
		          		</c:when>
		          		<c:otherwise>${news.contents}</c:otherwise>
		          </c:choose>	
	          </p>
	          <span style="color: #fff;">发布时间：<i style="font-style: normal!important;"><fmt:formatDate value="${news.updateTime }" pattern="yyyy-MM-dd hh:mm:ss"/></i></span>
	        </dd>
	      </dl>
	    </c:forEach>
	      
	      
	   <!-- page begin -->
	    
	    <div class="Page clearfix">
		     <span>共${page.totalRecords }条记录 ${page.pageNo }/${page.pageCount } 页</span>  
		      <c:if test="${page.pageNo > 1}" >
	         	<a href="${pageContext.request.contextPath}/news/p${page.pageNo-1 }">上一页</a>  
	         </c:if>
	         <c:if test="${page.pageNo <= 1}" >
	         	<a href="javascript:void(0);">上一页</a>
	         </c:if>   
		     <c:forEach var="i" begin="1" end="${page.pageCount}">
			     <a <c:if test='${page.pageNo == i }'>style="width: 36;height: 32;background-color:#008cd6;color:#FFF;"</c:if> href="${pageContext.request.contextPath}/news/p${i }">&nbsp;${i}&nbsp;</a>
		      </c:forEach>	
			  <c:if test="${page.pageNo < page.pageCount}" >
	         	<a href="${pageContext.request.contextPath}/news/p${page.pageNo+1 }">下一页</a>
	         </c:if>
	         <c:if test="${page.pageNo >= page.pageCount}" >
	         	<a href="javascript:void(0);">下一页</a>   
	         </c:if> 
	    </div>
	    <!-- page end -->
	      
	    </div>
	    
	    
	    
	 
	    
	    
	    
	    
	    
	 <%--    
	 <div class="main_anli_right ej_bj sideBox  fr" id="DesignerBMK">
		  <h4>共有<b>130</b>&nbsp;&nbsp;位资深设计师 <br/> 为您提供<b>2890</b>&nbsp;&nbsp;套精品案例<br/>
		   共计&nbsp;<b>36985</b>&nbsp;&nbsp;位客户选择新洲装饰</h4>
         <h4></h4>
         <h4><b></b></h4>
         <h2>优秀的设计团队 丰富的设计经验</h2>
         <p>获得最靠谱的装修预算</p>	       
	    <div class="main_anli_right_input">
	   	  <input type="hidden" id="branchCompany" value="${branchCompany }"/>
	      <input type="hidden" name="orderId" id="orderId"/>
	      <input type="text" name="clientName" placeholder="请输入您的称呼"/>
	      <input type="text" name="phone" placeholder="请输入您的电话"/>
	      <input type="text" name="address" placeholder="请输入小区名称"/>
	      <input type="text" name="acreage" placeholder="请输入楼盘面积"/>
	      <a href="javascript:void(0)" id="_submit">立即申请</a>
	    </div>
	    <p>已有（<font color="red">${orderNumber }656</font>）业主申请了此服务</p>
	    <p>免费电话申请${homeTp.value }</p>
	   
	    
	        
	          <div class="yuyue_info">
	            <div class="box">
	             <div class="bcon">
			<!-- 代码开始 -->
			<div class="list_lh">
				<ul>
					<c:forEach items="${orders }" var="order">
						<li>
						 <p>
						 <a href="javascript:void(0)" target="_blank">
						 <span style="float:left;width:90px"> 
							 <c:if test="${fn:length(order.clientName)==1 }">
							  ${order.clientName }××
							 </c:if>
							  <c:if test="${fn:length(order.clientName)==3 }">
							  ${order.clientName }
							 </c:if>
						 </span>
						 <c:if test="${fn:length(order.phone) >0 }">
					     ${fn:substring(order.phone,0,3) }****${fn:substring(order.phone,7,11) }
					     </c:if>
						 <!--  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;成功预约免费设计 -->
						  </a>
						  </p>
						</li>
					</c:forEach>
				</ul>
			</div>
			<!-- 代码结束 -->
		</div>
		
	</div>
	          </div>
	   
	  </div> --%>
	  
	  
	  <div class="main_anli_right fr">
	      
	      
	         
   <!--滚动div模块  start-->
   <div class="designSide">
     <div class="sideBox" id="DesignerBMK" style="position: relative; z-index: 9990;">
			  <h4 style="text-align: center;">共有<b>130</b>&nbsp;&nbsp;位资深设计师 <br> 为您提供<b>2890</b>&nbsp;&nbsp;套精品案例<br>
	 		   共计&nbsp;<b>36985</b>&nbsp;&nbsp;位客户选择新洲装饰</h4>
	          <h4></h4>
	          <h4><b></b></h4>
	          <h2>优秀的设计团队 丰富的设计经验</h2>
	          <p>获得最靠谱的装修预算</p>	 
	    <div class="main_anli_right_input">
	      <input type="hidden" id="branchCompany" value="bjxz">
	      <input type="hidden" name="orderId" id="orderId">
	      <input type="text" name="clientName" placeholder="请输入您的称呼">
	      <input type="text" name="phone" placeholder="请输入您的电话">
	      <input type="text" name="address" placeholder="请输入小区名称">
	      <input type="text" name="acreage" placeholder="请输入楼盘面积">
	      <a href="javascript:void(0)" id="_submit">立即申请</a>
	    </div>
	    <p>已有（<font color="red">646</font>）业主申请了此服务</p>
	    <p>免费电话申请<font color="red">18034010917</font> </p>
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
	      
	     
	    <h3 style="text-align:center; height:40px;line-height:40px;">热门案例</h3>
	    <ul class="clearfix">
	    	
    		<c:forEach items="${listCases}" var="cases" begin="0" end="7">
    		
    		
	    		<li>
		    		 <a target="_blank" href="${ctx }/casesDetail?casesId=${cases.caseId }&amp;designerId=${cases.designerId}">
		    		 	<img src="${cases.caseThumbImg }" width="228" height="187" style="margin-left:11px">
		    		 </a>
		    			 <span style="margin-left:53px;">&nbsp;【${cases.caseStyle }】&nbsp;${cases.caseHouseType }&nbsp;${cases.caseAcreage }㎡</span>
	    		 </li>
    		</c:forEach>
	    </ul>
	    
	     <div class="sideBox" id="DesignerAD" style="border:0;"></div>
	  </div>
	  
	  
	  
	  
	  
	     
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
	  
	  
	  
	  
	 </div>
	</div>
	
	
	<div class="clear"></div>
	<!--底部流程 start-->
  
  <div class="point">
        <div class="wrap">
            <p class="l"><span class="i1"><b>免费</b><br>上门量房</span></p>
            <p><span class="i2"><b>免费</b><br>全屋家居定制</span></p>
            <p><span class="i3"><b>免费</b><br>3D效果预想</span></p>
            <p><span class="i4"><b>免费</b><br>产品上门安装</span></p>
            <p class="r"><span class="i5"><b>免费</b><br>保修，终身维护</span></p>
        </div>
    </div>

  <!--底部流程 end-->
	
	<div class="clear"></div>
	<!--footer start-->
		<jsp:include page="public/fotter.jsp"/>
	<!--footer end-->
	 <!-- servise start -->
    <jsp:include page="public/service.jsp"/>
    <!-- servise end -->
	<script type="text/javascript">
		
	   $("#_submit").click(function(){
		   
		  	 var orderId =  getOrderId();
			 var clientName= $("input[name='clientName']").val();
			 var phone= $("input[name='phone']").val();
			 var acreage= $("input[name='acreage']").val();
			 var branchCompany= $('#branchCompany').val();
			 console.info("orderId"+orderId,"clientName"+clientName+"phone"+phone+"acreage"+acreage+"branchCompany"+branchCompany);
			 alert(clientName)
			 if(!clientName.match(/^\s*$/) && phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/) && !acreage.match(/^\s*$/)){
				 
				 $.ajax({
						type : "POST",
						dataType : "json",
						async: false,
						url : "${ctx}/saveOrder",
						data : {'branchCompany':branchCompany,'orderId':orderId,'clientName':clientName,'phone':phone,'acreage':acreage,'sourceType':'免费申请'},
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
				 alert("对不起,请正确天填写房屋面积!");
			 }
	   });
	   
	   var url = window.location.href;
	   var articleId = "";
	   var shareTitle="明日医疗资讯";
	   var shareImgUrl="";
	   var userinfo = localStorage.getItem("_userinfo");
	   var timestamp;
	   var noncestr;
	   var signature;
	   //获取签名
	    $.ajax({
	      type: "GET",
	      url: "WeixinshareController/Api/Inteface/getSignature",
	      //data:{timestamp:timestamp,noncestr:noncestr,url:url},
	      data:{url:url},
	      success: function(data){
	        var objData=JSON.parse(data); 
	        timestamp=objData.timestamp; 
	        noncestr=objData.noncestr; 
	        signature=objData.signature;
	         console.log(objData);
	         wxShare();
	      }
	     });
	   function wxShare(){
	   wx.config({
	    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
	    appId: '您的appid', // 和获取Ticke的必须一样------必填，公众号的唯一标识
	    timestamp:timestamp, // 必填，生成签名的时间戳
	    nonceStr: noncestr, // 必填，生成签名的随机串
	    signature: signature,// 必填，签名，见附录1
	    jsApiList: [
	    'onMenuShareAppMessage'
	    ] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
	   });
	   }
	   wx.ready(function(){
	     //config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，
	     //config是一个客户端的异步操作，所以如果需要在页面加载时就调用相关接口，则须把相关
	     //接口放在ready函数中调用来确保正确执行。对于用户触发时才调用的接口，则可以直接调用，不需要放在ready函数中。
	 
	    //----------“分享给朋友”
	    wx.onMenuShareAppMessage({
	     title: "明日医疗资讯", // 分享标题
	     desc: shareTitle, // 分享描述
	     link: url, // 分享链接
	     imgUrl: shareImgUrl, // 分享图标
	     type: '', // 分享类型,music、video或link，不填默认为link
	     dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
	     success: function () { 
	      // 用户确认分享后执行的回调函数、
	     },
	     cancel: function () { 
	      // 用户取消分享后执行的回调函数
	     }
	    });
	    //------------"分享到朋友圈"
	    wx.onMenuShareTimeline({
	     title: '明日医疗资讯', // 分享标题
	     link: '', // 分享链接
	     imgUrl: shareImgUrl, // 分享图标
	     success: function () { 
	      // 用户确认分享后执行的回调函数
	     },
	     cancel: function () { 
	      // 用户取消分享后执行的回调函数
	     }
	    });
	    //-------------分享到QQ
	    wx.onMenuShareQQ({
	     title: '明日医疗资讯', // 分享标题
	     desc: shareTitle, // 分享描述
	     link: '', // 分享链接
	     imgUrl: shareImgUrl, // 分享图标
	     success: function () { 
	      // 用户确认分享后执行的回调函数
	     },
	     cancel: function () { 
	      // 用户取消分享后执行的回调函数
	     }
	    });
	    //-------------分享到QQ空间
	    wx.onMenuShareQZone({
	     title: '明日医疗资讯', // 分享标题
	     desc: shareTitle, // 分享描述
	     link: '', // 分享链接
	     imgUrl: shareImgUrl, // 分享图标
	     success: function () { 
	      // 用户确认分享后执行的回调函数
	     },
	     cancel: function () { 
	      // 用户取消分享后执行的回调函数
	     }
	    });
	 
	   });
	</script>
	${sessionScope.cnzzSession }
</body>
</html>
