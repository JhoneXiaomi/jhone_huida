<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp" %>    
<%@ include file="public/shangqiao.jsp" %>
<!doctype html>
<html>
<head>

	<meta charset="utf-8">
	<title>${packageSeoTitle.value }</title>
	<meta name="keywords" content="${packageSeoKeyword.value }"/>
	<meta name="description" content="${packageSeoDesc.value }"/>
	<link rel="stylesheet" type="text/css" href="${ctx }/www/css/style.css"/>
	<script type="text/javascript" src="${ctx }/www/js/db_01.js"></script>
    
	<link rel="stylesheet" type="text/css" href="${ctx }/www/css/style.css"/>
	<script type="text/javascript" src="${ctx }/www/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="${ctx }/www/js/pptBox.js"></script>
	
	<!--底部报价 js-->
	<script src="${ctx }/www/js/jquery-1.10.2.min.js" type="text/javascript"></script>
	<script>
	   var jq = jQuery.noConflict();
	</script>
	<script type="text/javascript" src="${ctx }/www/js/GlobalProvinces.js"></script>
	<script src="${ctx }/www/js/bdzxbj_bottom_new.js" type="text/javascript"></script>
	<!--底部报价 js-->
</head>

<body>


	<!--头部 start-->
	<jsp:include page="public/header.jsp"/>
	<!--头部 end-->
	<div class="clear"></div>
	<!--nav start-->
	<jsp:include page="public/nav.jsp"/>
	<!--nav end-->
	
	<script type="text/javascript" src="${ctx }/www/js/jquery-1.8.0.min.js"></script>
	<script type="text/javascript" src="${ctx }/www/js/jquery.jslides.js"></script>
	<div class="clear"></div>
	 
	<!-- banner start-->
	<div id="full-screen-slider">
		<ul id="slides">
			<c:forEach items="${homeTurn }" var="decrateImg">
				<li>
				
					<a href="${decrateImg.homeimgUrl }" target="_blank" >
						<img src="${decrateImg.homeimgSrc }"/>
					</a>
				</li>
			</c:forEach>	
		</ul>
	</div>
	<!--banner end-->
	<div class="clear"></div>
	
	<div class="ej_main w1200">
	  <div class="ej_main_local sjs_local">您的当前位置：<a href="${ctx }/">首页</a>><a href="javascript:void(0)">老房套餐</a></div>
	  
	  <div class="huodong01 w1200">
	  <c:forEach items="${activitys }" var="activity" varStatus="status">
		  
		  	<c:if test="${status.index==0 }">
		  	
		  	   <a href="${ctx }/activityDetail?activityId=${activity.newsId}">
					       
		       <img src="${activity.thumbImg }" width="100%" height="100%" alt="${activity.title }"/>
		       </a>
		  	</c:if>
		  </c:forEach>
	  </div>
	  
	    <!--大牌设计师 start-->
	    <div class="hzbj">
		<!-- picrotate_left start  -->
		<div class="blk_18 blk_181"> 
		   <div class="title">
		        <div class="title_cen clearfix">
		           <h3 class="fl">大牌设计师</h3>
		        </div>
		        
		    </div>
	  
	   <a class="LeftBotton" onmousedown="ISL_GoUp_1()" onmouseup="ISL_StopUp_1()" onmouseout="ISL_StopUp_1()" href="javascript:void(0);" target="_self"></a>
	  <div class="pcont1" id="ISL_Cont_1">
	    <div class="ScrCont clearfix">
	      <div id="List1_1">
	         <!-- piclist begin -->
	         <c:forEach items="${designerList }" var="designer">
	        
		        <a class="pl" href="${ctx}/designerDetail/p1?designerId=${designer.designerId}">
		        	<img src="${designer.designerPhotoImg }" width="150" height="150" alt="${designer.designerName }" title="${designer.designerName }"/>
		        	<span>${designer.designerName }&nbsp;&nbsp;${designer.designerTitle }</span>
		        </a> 
	        </c:forEach>
	        <!-- piclist end -->
	      </div>
	      <div id="List2_1"></div>
	    </div>
	  </div>
	   <a class="RightBotton" onmousedown="ISL_GoDown_1()" onmouseup="ISL_StopDown_1()" onmouseout="ISL_StopDown_1()" href="javascript:void(0);" target="_self"></a> 
	</div>
	 
	 </div>
	<div class="c"></div>
	<script type="text/javascript">
	  <!--
	  picrun_ini()
	  //-->
	</script>
	    
	    
	<!--大牌设计师 end-->
	<div class="taocan_kjpz w1200">
	<div class="taocan_title"><h3>空间配置</h3></div>
	   
	<script type="text/javascript" src="${ctx }/www/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="${ctx }/www/js/lrtk.js"></script>
	
	 <!--空间配置图片 s-->
	   <div class="common_cp">
		  <ul class="clearfix">
		  <c:forEach items="${listPackage }" var="packages" varStatus="status">
			   		<li class="listbox mr20">
				      <div class="listimg"> 
					      <a href="">
					      	<img src="${packages.integratedPackageImage }" class="attachment-thumbnail wp-post-image" alt="${packages.integratedPackageName }" width="280" height="232"/>
					      </a>
				        <div class="summary">
				          <div class="summarytxt">
				            <p>
				            	<c:choose>
				            	
				            		<c:when test="${fn:length(packages.integratedPackageDescribe)>60 }">
				            		
				            			${fn:substring(packages.integratedPackageDescribe,0,60) }...
				            		</c:when>
				            		<c:otherwise>${packages.integratedPackageDescribe }</c:otherwise>
				            	</c:choose>
				            </p>
				          </div>
				        </div>
				      </div>
				      <div class="clear"></div>
				    </li>
			   </c:forEach>
		  </ul>
		</div>
	  <!--空间配置图片 e--> 
	   
	  </div>
	  <div class="taocan_zcpp clearfix">
	    <div class="taocan_title"><h3>精选主材品牌</h3></div>
	    <div class="taocan_left fl">
	      <ul class="clearfix">
	      <c:forEach items="${homeCok }" var="coworker" >
					 <li>
						 <a href="javascript:void(0)">
						     <img src="${coworker.value }"  width="218" height="95"/>
						 </a>
					 </li>
					 
		    </c:forEach>
	      </ul>
	    </div>
	    <div class="main_anli_right fr" style="margin-left:0px;">
	 		  <h4 style="text-align:center">共有<b>130</b>&nbsp;&nbsp;位资深设计师 <br/> 为您提供<b>2890</b>&nbsp;&nbsp;套精品案例<br/>
	 		   共计&nbsp;<b>36985</b>&nbsp;&nbsp;位客户选择新洲装饰</h4>
	          <h4></h4>
	          <h4><b></b></h4>
	          <h3 style="text-align:center;height:40px;line-height:40px;">优秀的设计团队 丰富的设计经验</h3>
	          <p style="text-align:center;height:40px;line-height:40px;">获得最靠谱的装修预算</p>	 
	    <div class="main_anli_right_input">
	      <input type="hidden" id="branchCompany" value="${branchCompany }"/>
	      <input type="hidden" name="orderId" id="orderId"/>
	      <input type="text" name="clientName" placeholder="请输入您的称呼"/>
	      <input type="text" name="phone" placeholder="请输入您的电话"/>
	      <input type="text" name="address" placeholder="请输入小区名称"/>
	      <input type="text" name="areage" placeholder="请输入楼盘面积"/>
	      <a href="javascript:void(0)" id="_submit">立即申请</a>
	    </div>
	    <h4 style="text-align:center;height:40px;line-height:40px;">已有（<font color="red"><%-- ${orderNumber } --%>656</font>）业主申请了此服务</h4>
	    <h4 style="text-align:center;height:40px;line-height:40px;">免费电话申请${homeTp.value } </h4>
	    <h4 style="text-align:center;height:40px;line-height:40px;">现在预约即送精美礼品</h4>
	  </div>
	  
	  </div>
	  <div class="huodong01 w1200">
	  
	  <c:forEach items="${activitys }" var="activity" varStatus="status">
		  
		  	<c:if test="${status.index==1 }">
		  	
		  	   <a href="${ctx }/activityDetail?activityId=${activity.newsId}">
					       
		       <img src="${activity.thumbImg }" width="100%" height="100%" alt="${activity.title }"/>
		       </a>
		  	</c:if>
		  </c:forEach>
	  </div>
	   
	    
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
	  
	  
	</div>
	
	
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
				 alert("对不起,请填请正确天填写房屋面积!");
			 }
	   });
	</script>
	${sessionScope.statistics.value }
	${sessionScope.shangqiao.value }
</body>
</html>
