<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp" %> 
<%@ include file="public/shangqiao.jsp" %>    
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>团装小区-${companyCity}装修哪家好-${companyCity}新洲装饰公司</title>
	<meta name="keywords" content="${statScinterhomeSeoKeyword.value }"/>
	<meta name="description" content="${statScinterHomeSeoDesc.value }"/>
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
	<div class="clear"></div>
	<!-- banner start-->
	<div class="ej_ban_tzxq"><img src="${ctx }/www/images/recommendbg.jpg" width="100%"/></div>
	<!--banner end-->
	
	
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
	<div class="clear">
	<div class="w120001">
	<div class="tzxq_search">
	  <p>找自家小区，快速了解最热消息</p>
	  <div class="tzxq_search_inp">
	  <form action="${ctx }/community/p1">
	  
		  <input type="text" class="sjs_search_in" placeholder="小区名称" name="key">
	      <input type="submit" class="sjs_search_an" value="搜索">	  
	  </form>
	  </div>
	  <p>
	    热门小区：
	    <a href="">早安北京</a><a href="">星河湾</a><a href="">早安北京</a><a href="">星河湾</a>
	  </p>
	</div>
	</div>
	</div>
		
	<div class="clear"></div>
	
	<div class="ej_main w1200">
	  <div class="ej_main_local">您的当前位置：<a href="${ctx}/">${companyCity}装修</a>><a href="${ctx }/community/p1">团装小区</a></div>
	  <div class="clearfix">
	    <div class="ej_main_left fl">
	      <ul>
		      <c:forEach items="${communitys }" var="community">
		      
			      <li class="clearfix">
			           <div class="ej_main_left_img fl">
			           		<a href="${ctx }/departmentDetail?communityId=${community.communityId } ">
			           			<img src="${community.communityImage }" width="280" height="232"/>
			           		</a>
			           </div>
			           <div class="ej_main_left_info fl">
			             <h4>【${community.communityName }】</h4>
			             <p>已签约（<i>${community.communityCases }</i>）户   <b>（<i>${community.signNumber }</i>）户参观了工地</b></p>
			             <div class="loupan_hei">${community.communityDescription }</div>
			             <div class="a">
			               <a href="${ctx }/cases/p1" class="no_mar">查看小区案例</a>
			               <a href="${community.activityUrl}">最新装修优惠</a>
			               <a href="javascript:void(0)" class="md-trigger" data-modal="modal-1">预约参观工地</a>
			             </div>
			           </div>
		        </li>
		      </c:forEach>
	      </ul>
	     
	      <!-- page begin -->
	    
	    <div class="Page clearfix">
		     <span>共${page.totalRecords }条记录 ${page.pageNo }/${page.pageCount } 页</span>  
		      <c:if test="${page.pageNo > 1}" >
	         	<a href="${pageContext.request.contextPath}/community/p${page.pageNo-1 }">上一页</a>  
	         </c:if>
	         <c:if test="${page.pageNo <= 1}" >
	         	<a href="javascript:void(0);">上一页</a>
	         </c:if>   
		     <c:forEach var="i" begin="1" end="${page.pageCount}">
			     <a <c:if test='${page.pageNo == i }'>style="width: 36;height: 32;background-color:#008cd6;color:#FFF;"</c:if> href="${pageContext.request.contextPath}/community/p${i }">&nbsp;${i}&nbsp;</a>
		      </c:forEach>	
			  <c:if test="${page.pageNo < page.pageCount}" >
	         	<a href="${pageContext.request.contextPath}/community/p${page.pageNo+1 }">下一页</a>
	         </c:if>
	         <c:if test="${page.pageNo >= page.pageCount}" >
	         	<a href="javascript:void(0);">下一页</a>   
	         </c:if> 
	    </div>
	    <!-- page end -->
	     
	  </div>
	  <div class="main_anli_right ej_bj fr">
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
	      <a href="javascript:void(0)" id="_submit" style="margin-left: 13px;">立即申请</a>
	    </div>
	    <p>已有（<font color="red"><%-- ${orderNumber } --%>656</font>）业主申请了此服务</p>
	    <p>免费电话申请${homeTp.value }</p>		
	   
	    <h3>热装小区</h3>
	    <ul>
	      <c:forEach items="${communitys }" var="community" begin="0" end="2">
	      		<li>
		      		<a href="${ctx }/departmentDetail?communityId=${community.communityId } ">
		      			<img src="${community.communityImage }" width="229" height="196"/>
		      		</a>
	      		</li>
	      </c:forEach>
	    </ul>
	  </div>
	  
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
    <script src="${ctx }/www/js/classie.js"></script>
	<script src="${ctx }/www/js/modalEffects.js"></script>

	<script>
	
		// this is important for IEs
		var polyfilter_scriptpath = '/js/';
	</script>
	<script src="${ctx }/www/js/cssParser.js"></script>
	<script src="${ctx }/www/js/css-filters-polyfill.js"></script>
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
