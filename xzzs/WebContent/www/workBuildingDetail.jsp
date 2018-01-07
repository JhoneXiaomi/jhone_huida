<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp" %>
<%@ include file="public/shangqiao.jsp" %>      
<!doctype html>
<html>
<head>

	<meta charset="utf-8">
	<title>${CurrentSite.siteName}在建工地-${companyCity}新洲公司</title>
	<meta name="keywords" content="新洲装饰、北京新洲装饰、全国10大装修公司排名、北京十大装饰公司之一、老房装修专家、家装套餐公司、整装装饰公司、全包装修、半包装修、整装套餐、新洲装饰怎么样"/>
	<meta name="description" content="北京新洲装饰集团成立于1998年，介导绿色装饰新概念以质量求生存、以信誉求发展、以团结高效的工作热情为宗旨、以完善的服务创企业信誉。北京新洲装饰是装饰行业的门户网站，我们将会全心全意为北京装修业主服务。北京装修公司网为您提供专业的装修信息，可免费查询和咨询家庭装修、客厅装修、二手房装修、小户型装修等装饰装修设计及报价等服务。赢得了新老客户的一致信赖和赞誉，并形成了公司以“回头客”为主体的客户网络。"/>
	<link rel="stylesheet" type="text/css" href="${ctx }/www/css/style.css"/>
	<script type="text/javascript" src="${ctx }/www/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="${ctx }/www/js/pptBox.js"></script> 
	<script src="${ctx }/www/js/jquery.min.js"></script> 
    <script type="text/javascript" src="${ctx }/www/js/commen.js"></script>
    <script src="${ctx }/www/js/jquery.min.js"></script>
	<script src="${ctx }/www/js/lanrenzhijia.js"></script>
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
	
	<div class="ej_main w1200">
	   <div class="ej_main_local sjs_local">您的当前位置：<a href="${ctx }/">${companyCity}装修</a>><a href="${ctx }/workBuilding/p1">在建工地</a></div>
	   
	   <div class="zjgd_con clearfix">
	     <div class="zjgd_con_img fl"><img src="${CurrentSite.siteThumbImg }" width="280" height="232"/></div>
	     <div class="zjgd_con_info fl">
	       <h4>【${CurrentSite.siteName }】 地实景照片</h4>
	       <p>房屋户型：${CurrentSite.houseType }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	       	   价格：${CurrentSite.costs }万&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	       	   面积:${CurrentSite.houseAcreage }㎡<br/>
	       	   装修风格：${CurrentSite.houseStyle }</p>
	       <ul class="clearfix">
	        
	        <h5 class="fl"> 施工进度：</h5>
	        
	        <c:choose>
	        
	        	<c:when test="${CurrentSite.siteStatus>=1 }">
	        		  <li><img src="${ctx }/www/images/plan_bg01.png"/><br/>准备开工</li>
	        	</c:when>
	        	<c:otherwise>
	        		   <li><img src="${ctx }/www/images/plan_bg02.png"/><br/>准备开工</li>
	        	</c:otherwise>
	        </c:choose>
	        <c:choose>
	        
	        	<c:when test="${CurrentSite.siteStatus>=2 }">
	        		  <li><img src="${ctx }/www/images/plan_bg01.png"/><br/>水电阶段</li>
	        	</c:when>
	        	<c:otherwise>
	        		   <li><img src="${ctx }/www/images/plan_bg02.png"/><br/>水电阶段</li>
	        	</c:otherwise>
	        </c:choose>
	        <c:choose>
	        
	        	<c:when test="${CurrentSite.siteStatus>=3 }">
	        		  <li><img src="${ctx }/www/images/plan_bg01.png"/><br/>泥木阶段</li>
	        	</c:when>
	        	<c:otherwise>
	        		   <li><img src="${ctx }/www/images/plan_bg02.png"/><br/>泥木阶段</li>
	        	</c:otherwise>
	        </c:choose>
	        <c:choose>
	        
	        	<c:when test="${CurrentSite.siteStatus>=4 }">
	        		  <li><img src="${ctx }/www/images/plan_bg01.png"/><br/>油漆阶段</li>
	        	</c:when>
	        	<c:otherwise>
	        		   <li><img src="${ctx }/www/images/plan_bg02.png"/><br/>油漆阶段</li>
	        	</c:otherwise>
	        </c:choose>
	        <c:choose>
	        
	        	<c:when test="${CurrentSite.siteStatus>=5 }">
	        		  <li><img src="${ctx }/www/images/plan_bg01.png"/><br/>竣工阶段</li>
	        	</c:when>
	        	<c:otherwise>
	        		   <li><img src="${ctx }/www/images/plan_bg02.png"/><br/>竣工阶段</li>
	        	</c:otherwise>
	        </c:choose>
	       </ul>
	       
	       <p class="dib fl">完工图 <span>${wbuildingNum }</span></p>
	       <p class="dib fl">施工图 <span>${buildingNum }</span></p>
	     </div>
	     
	     <div class="zjgd_con_an fl"><a href="${ctx}/orderLine">免费预约参观</a></div>
	   </div>
	   
	   
	   <!--选项卡切换 start-->
	   
   
   <!--选项卡切换 start-->
   
   <div class="lanrenzhijia fl">
  <div class="title cf">
    <ul class="title-list f1 cf ">
      <li class="on">施工图</li>
      <li>效果图</li>
      <li></li>
      <!--
      <li>优惠券</li>
      <li>会员卡</li>-->
      <!--<p><b></b></p>-->
    </ul>
    
    <h2 class="fr"><a href="${ctx}/orderLine">预约参观工地</a></h2>
    
  </div>
  <div class="product-wrap">
  	
    <!--案例1-->
    <div class="toux clearfix">
      <div class="toux_img fl"><img src="${CurrentSite.siteThumbImg }" width="80" height="80"/></div>
      <div class="toux_info fl">本案例追踪更新者<font>【${CurrentSite.updater }】</font><br/>【${CurrentSite.siteName }】   ${CurrentSite.houseAcreage }平米   ${CurrentSite.houseStyle }</div>
    </div>
    
    <div class="product show">
      <ul class="cf">
      <c:forEach items="${showImages }" var="image" varStatus="status">
      	<c:choose>
      	
      		<c:when test="${status.index == 0 }">
      		
      			<li class="ml0">
	  				<a href="javascript:void(0)" class="imgwrap"> 
	  					<img src="${image.imageUrl }" width="800" alt="${CurrentSite.siteName }"/> 
	  				</a>
  				</li>
      		</c:when>
      		<c:otherwise>
      			<li>
	  				<a href="javascript:void(0)" class="imgwrap"> 
	  					<img src="${image.imageUrl }" width="800" alt="${CurrentSite.siteName }"/> 
	  				</a>
  				</li>
      		</c:otherwise>
      	</c:choose>
  	  </c:forEach>
      </ul>
    </div>
    <!--案例2-->
    <div class="product">
      <ul class="cf">
      <c:forEach items="${wshowImages }" var="image" varStatus="status">
      	<c:choose>
      	
      		<c:when test="${status.index == 0 }">
      		
      			<li class="ml0">
	  				<a href="javascript:void(0)" class="imgwrap"> 
	  					<img src="${image.imageUrl }" width="800" alt="${CurrentSite.siteName }"/> 
	  				</a>
  				</li>
      		</c:when>
      		<c:otherwise>
      			<li >
	  				<a href="javascript:void(0)" class="imgwrap"> 
	  					<img src="${image.imageUrl }" width="800" alt="${CurrentSite.siteName }"/> 
	  				</a>
  				</li>
      		</c:otherwise>
      	</c:choose>
  	  </c:forEach>
      </ul>
    </div>
    
  </div>
</div>
   
   <!--选项卡切换 end-->
   
   
   <div class="rightinfo fr">
     <div class="rightinfo_sjs clearfix">
       <div class="rightinfo_title clear">
         <h3>推荐设计师</h3>
         <a href="${ctx }/designer/p1"><span>更多>></span></a>
       </div>
       
       <ul class="clearfix">
       <c:forEach items="${designers}" begin="0" end="3" var="designer" varStatus="status"> 
       
       		<c:choose>
       			
       				<c:when test="${(status.index+1)%2 !=0}">
       				
       					<li class="sjs_left01">
				           <div class="rightinfo_img">
				             <a href="${ctx}/designerDetail/p1?designerId=${designer.designerId}">
				             	<img src="${designer.designerPhotoImg}" width="132" height="144"/>
				             </a>
				             <span>${designer.designerName }&nbsp;${designer.designerTitle}</span>
				           </div>
				            <a href="${ctx}/orderLine?designerName=${designer.designerName}"  target="_blank">
				            <div class="right_yuyue"> </div>
				            </a>
				         </li>
       				</c:when>
       				<c:otherwise>
				         <li>
				           <div class="rightinfo_img">
				             <a href="${ctx}/designerDetail/p1?designerId=${designer.designerId}">
				              	<img src="${designer.designerPhotoImg}" width="132" height="144"/></a>
				              	<span>${designer.designerName }&nbsp;${designer.designerTitle}</span>
				           </div>
				           <a href="${ctx}/orderLine?designerName=${designer.designerName}" target="_blank">
				           <div class="right_yuyue"> </div>
				           </a>
				         </li>
       				</c:otherwise>
       		</c:choose>
       </c:forEach>
       
       </ul>
     </div>
     <div class="clearfix"></div>
     
     
     <div class="right_zxal">
      <div class="rightinfo_title clear">
         <h3>推荐案例</h3>
         <a href="${ctx }/cases/p1"><span>更多>></span></a>
       </div>
       
       <!-- 代码 开始 -->
	<div class="accordion_container">
	  <div class="accordion">
	  		<c:forEach items="${listCases }" begin="0" end="5" var="cases" varStatus="status">
	  			<c:if test="${status.index == 0 }">
	  				<div class="first">
					  <div class="content">
						  <a href="${ctx}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}" target="_blank">
						  		<img src="${cases.caseThumbImg }" />
						  </a>
					  </div>
					  <div class="tab">
						  <strong>
							  <a  href="${ctx}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}" target="_blank">
							  <font>${cases.caseHouseType }|</font>【${cases.caseTitle }】</a>
						  </strong>
					  </div>
					</div>
	  			</c:if>
	  			<c:if test="${status.index == 1 }">
	  				<div class="second current">
					  <div class="content second">
						  <a href="${ctx}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}" target="_blank">
						  		<img src="${cases.caseThumbImg }" />
						  </a>
					  </div>
					  <div class="tab">
						  <strong>
							  <a  href="${ctx}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}" target="_blank">
							  <font>${cases.caseHouseType }|</font>【${cases.caseTitle }】</a>
						  </strong>
					  </div>
					</div>
	  			</c:if>
	  			<c:if test="${status.index == 2 }">
	  				<div class="third current">
					  <div class="content third">
						  <a href="${ctx}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}" target="_blank">
						  		<img src="${cases.caseThumbImg }" />
						  </a>
					  </div>
					  <div class="tab">
						  <strong>
							  <a  href="${ctx}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}" target="_blank">
							  <font>${cases.caseHouseType }|</font>【${cases.caseTitle }】</a>
						  </strong>
					  </div>
					</div>
	  			</c:if>
	  			<c:if test="${status.index == 3 }">
	  				<div class="fourth current">
					  <div class="content fourth">
						  <a href="${ctx}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}" target="_blank">
						  		<img src="${cases.caseThumbImg }" />
						  </a>
					  </div>
					  <div class="tab">
						  <strong>
							  <a  href="${ctx}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}" target="_blank">
							  <font>${cases.caseHouseType }|</font>【${cases.caseTitle }】</a>
						  </strong>
					  </div>
					</div>
	  			</c:if>
	  			<c:if test="${status.index == 4 }">
	  				<div class="fifth current">
					  <div class="content fifth">
						  <a href="${ctx}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}" target="_blank">
						  		<img src="${cases.caseThumbImg }" />
						  </a>
					  </div>
					  <div class="tab">
						  <strong>
							  <a  href="${ctx}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}" target="_blank">
							  <font>${cases.caseHouseType }|</font>【${cases.caseTitle }】</a>
						  </strong>
					  </div>
					</div>
	  			</c:if>
	  			<c:if test="${status.index == 5 }">
	  				<div class="sixth current">
					  <div class="content sixth">
						  <a href="${ctx}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}" target="_blank">
						  		<img src="${cases.caseThumbImg }" />
						  </a>
					  </div>
					  <div class="tab">
						  <strong>
							  <a  href="${ctx}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}" target="_blank">
							  <font>${cases.caseHouseType }|</font>【${cases.caseTitle }】</a>
						  </strong>
					  </div>
					</div>
	  			</c:if>
	  		</c:forEach>
	  </div>
	</div>
	<script type="text/javascript" src="${ctx }/www/js/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx }/www/js/j-accordin.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$('.accordion').jaccordion();
		});
	</script>
	<!-- 代码 结束 -->
	       
	     </div>
	     
	    
	     
	     <div class="clearfix"></div>
	     
	     
	     <div class="designSide">
	     <div class="rightinfo_yuyue sideBox01"  id="DesignerBMK">
	        <h2>免费预约就送精美礼品</h2>
	        <span>本月已有<font color="red">5783</font>人申请报名成功</span>
	        <div class="inp">
	          <input type="text" id="clientName" class="name" placeholder="请输入您的姓名"/>
	          <input type="text" id="phone" class="tel" placeholder="请输入您的手机号"/>
	          <input type="button" id="but_submit" class="bm" value="我要预约"/>
	        </div>
	     </div>
	     
	     <div class="sideBox01" id="DesignerAD" style="border:0;"><a href="" target="_blank"><img src="" width="230"/></a></div>
	        
	      </div>  
	        
	     
	    <script>
		$(window).scroll(function() {
			var top = $('#DesignerAD').offset().top;
			var element = $("#DesignerBMK");
			//var left = ($(window).width()-1160)/2+931;
			var left = ($(window).width()-1160)/2+880;
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
	   <!--选项卡切换 end-->
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
		
	   $("#but_submit").click(function(){
		   
		  	 var orderId = getOrderId();
			 var clientName= $("#clientName").val();
			 var phone= $("#phone").val();
			 var branchCompany = '${sessionScope.branchCompany}';
			 if(!clientName.match(/^\s*$/) && phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/) ){
				 
				 $.ajax({
						type : "POST",
						dataType : "json",
						url : "${ctx}/saveOrder",
						data : {'branchCompany':branchCompany,'orderId':orderId,'clientName':clientName,'phone':phone,'sourceType':'免费申请'},
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
			 }
	   });
	</script>
    ${sessionScope.statistics.value }
	${sessionScope.shangqiao.value }
	${sessionScope.cnzzSession }
</body>
</html>