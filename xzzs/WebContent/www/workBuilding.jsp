<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp" %>
<%@ include file="public/shangqiao.jsp" %>      
<!doctype html>
<html>
<head>

	<meta charset="utf-8">
	<title>在建工地-${companyCity}新洲装饰公司</title>
	<meta name="keywords" content="新洲装饰,全国10大装修公司排名,京十大装饰公司之一,老房装修专家,家装套餐公司,整装装饰公司,全包装修,半包装修,整装套餐,新洲装饰怎么样"/>
	<meta name="description" content="北京新洲装饰集团成立于1998年，介导绿色装饰新概念以质量求生存、以信誉求发展、以团结高效的工作热情为宗旨、以完善的服务创企业信誉。北京新洲装饰是装饰行业的门户网站，我们将会全心全意为北京装修业主服务。北京装修公司网为您提供专业的装修信息，可免费查询和咨询家庭装修、客厅装修、二手房装修、小户型装修等装饰装修设计及报价等服务。赢得了新老客户的一致信赖和赞誉，并形成了公司以“回头客”为主体的客户网络。"/>
	<link rel="stylesheet" type="text/css" href="${ctx }/www/css/style.css"/>
	<link rel="stylesheet" type="text/css" href="${ctx }/www/css/component.css" />
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
	
	
	<div class="md-modal md-effect-1" id="modal-1" >
		<div>
		<div class="md-content">
			<h3>立即预约设计师</h3>
			<div>
				<p>您的姓名：<input type="text" name="order_clientName"/></p>
				<p>您的手机：<input type="text" name="order_phone"/></p>
				<p>楼盘信息：<input type="text" name="order_address"/></p>							
				<p>房屋面积：<input type="text" name="order_acreage"/></p>
				<div class="submit_btn" id="but_order">立即预约</div>
				<button class="md-close" style="left: 317px;"></button>	
			</div>
		</div>
		</div>
	</div>		
	<div class="clear"></div>
	
	<div class="ej_main w1200">
	   <div class="ej_main_local sjs_local">您的当前位置：<a href="${ctx }/">${companyCity}装修</a>><a href="/workBuilding/p1">在建工地</a></div>
	   
	   <c:forEach items="${hotBuildingList }" var="building" begin="0" end="8">
	   
	   <div class="zjgd_con clearfix">
	     <div class="zjgd_con_img fl">
	     <a href="${ctx }/workBuildingDetail?siteId=${building.id }">
	    
	     <img src="${building.siteThumbImg }" width="280" height="232"/>
	      </a>
	     </div>
	
	     <div class="zjgd_con_info fl">
	       <h4><font color="#008cd6">【${building.siteName }】 </font>地实景照片</h4>
	       <p>
	       	装修风格：${building.houseType }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		       价格：${building.costs }万&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		       面积：${building.houseAcreage }㎡<br/>
		       工长 ：  ${building.manager }
		   </p>
	       <ul class="clearfix">
	        
	        <h5 class="fl"> 施工进度：</h5>
	        <c:choose>
	        
	        	<c:when test="${building.siteStatus>=1 }">
	        		  <li><img src="${ctx }/www/images/plan_bg01.png"/><br/>准备开工</li>
	        	</c:when>
	        	<c:otherwise>
	        		   <li><img src="${ctx }/www/images/plan_bg02.png"/><br/>准备开工</li>
	        	</c:otherwise>
	        </c:choose>
	        <c:choose>
	        
	        	<c:when test="${building.siteStatus>=2 }">
	        		  <li><img src="${ctx }/www/images/plan_bg01.png"/><br/>水电阶段</li>
	        	</c:when>
	        	<c:otherwise>
	        		   <li><img src="${ctx }/www/images/plan_bg02.png"/><br/>水电阶段</li>
	        	</c:otherwise>
	        </c:choose>
	        <c:choose>
	        
	        	<c:when test="${building.siteStatus>=3 }">
	        		  <li><img src="${ctx }/www/images/plan_bg01.png"/><br/>泥木阶段</li>
	        	</c:when>
	        	<c:otherwise>
	        		   <li><img src="${ctx }/www/images/plan_bg02.png"/><br/>泥木阶段</li>
	        	</c:otherwise>
	        </c:choose>
	        <c:choose>
	        
	        	<c:when test="${building.siteStatus>=4 }">
	        		  <li><img src="${ctx }/www/images/plan_bg01.png"/><br/>油漆阶段</li>
	        	</c:when>
	        	<c:otherwise>
	        		   <li><img src="${ctx }/www/images/plan_bg02.png"/><br/>油漆阶段</li>
	        	</c:otherwise>
	        </c:choose>
	        <c:choose>
	        
	        	<c:when test="${building.siteStatus>=5 }">
	        		  <li><img src="${ctx }/www/images/plan_bg01.png"/><br/>竣工阶段</li>
	        	</c:when>
	        	<c:otherwise>
	        		   <li><img src="${ctx }/www/images/plan_bg02.png"/><br/>竣工阶段</li>
	        	</c:otherwise>
	        </c:choose>
	       </ul>
	       
	       <p class="dib fl">效果图 <span>${building.fimages }</span></p>
	       <p class="dib fl">施工图 <span>${building.ximages}</span></p>
	     </div>
	     
	     <div class="zjgd_con_an fl"><a href="javascript:void(0)" class="md-trigger" data-modal="modal-1">免费预约参观</a></div>
	   </div>
	   
	   </c:forEach>
	  <!-- page begin -->
	    
	    <div class="Page clearfix">
		     <span>共${page.totalRecords }条记录 ${page.pageNo }/${page.pageCount } 页</span>  
		      <c:if test="${page.pageNo > 1}" >
	         	<a href="${pageContext.request.contextPath}/workBuilding/p${page.pageNo-1 }">上一页</a>  
	         </c:if>
	         <c:if test="${page.pageNo <= 1}" >
	         	<a href="javascript:void(0);">上一页</a>
	         </c:if>   
		     <c:forEach var="i" begin="1" end="${page.pageCount}">
			     <a <c:if test='${page.pageNo == i }'>style="width: 36;height: 32;background-color:#008cd6;color:#FFF;"</c:if> href="${pageContext.request.contextPath}/workBuilding/p${i }">&nbsp;${i}&nbsp;</a>
		      </c:forEach>	
			  <c:if test="${page.pageNo < page.pageCount}" >
	         	<a href="${pageContext.request.contextPath}/workBuilding/p${page.pageNo+1 }">下一页</a>
	         </c:if>
	         <c:if test="${page.pageNo >= page.pageCount}" >
	         	<a href="javascript:void(0);">下一页</a>   
	         </c:if> 
	    </div>
	    <!-- page end -->
	   
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
    
    <script src="${ctx }/www/js/classie.js"></script>
	<script src="${ctx }/www/js/modalEffects.js"></script>

	<script>
		// this is important for IEs
		var polyfilter_scriptpath = '/js/';
	</script>
	<script src="${ctx }/www/js/cssParser.js"></script>
	<script src="${ctx }/www/js/css-filters-polyfill.js"></script>
	<script type="text/javascript">
	
	$("#submit_btn").click(function(){
				
				var orderId =  getOrderId();
				var order_clientName = $(".clientName").val();
				var order_phone = $(".phone").val();
				var order_acreage = $(".acreage").val();
				var branchCompany= '${sessionScope.branchCompany}';
				alert(branchCompany);
				var order_address = $(".address").val(); 
				console.info("branchCompany"+branchCompany+"order_clientName:"+order_clientName+"order_phone:"+order_phone+"order_address"+order_address);
				
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
					data : {'acreage':order_acreage,'branchCompany':branchCompany,'orderId':orderId,'clientName':order_clientName,'phone':order_phone,'address':order_address,'sourceType':'立即预约'},
					success : function(data) {
						
						if (data.data == "ok") {
							alert("请您稍等，稍后会有客服人员为您服务!");
						}else{
							alert("保存失败");
						}
					}
			    });
			});
	
	$(".submit_btn").click(function(){
		
		var orderId =  getOrderId();
		var order_clientName = $("input[name='order_clientName']").val();
		var order_phone = $("input[name='order_phone']").val();
		var order_acreage = $("input[name='order_acreage']").val();
		var branchCompany= '${sessionScope.branchCompany}';
		var order_address = $("input[name='order_address']").val();
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
			data : {'acreage':order_acreage,'branchCompany':branchCompany,'orderId':orderId,'clientName':order_clientName,'phone':order_phone,'address':order_address,'sourceType':'立即预约'},
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
    ${sessionScope.statistics.value }
	${sessionScope.shangqiao.value }
	${sessionScope.cnzzSession }
</body>
</html>

