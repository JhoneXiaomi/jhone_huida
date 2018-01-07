<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp" %>
<%@ include file="public/shangqiao.jsp" %>     
<!doctype html>
<html>
<head>

	<meta charset="utf-8">
	<title>${community.communityName}团装小区-${companyCity}新洲装饰公司</title>
	<meta name="keywords" content="新洲装饰、北京新洲装饰、全国10大装修公司排名、北京十大装饰公司之一、老房装修专家、家装套餐公司、整装装饰公司、全包装修、半包装修、整装套餐、新洲装饰怎么样"/>
	<meta name="description" content="北京新洲装饰集团成立于1998年，介导绿色装饰新概念以质量求生存、以信誉求发展、以团结高效的工作热情为宗旨、以完善的服务创企业信誉。北京新洲装饰是装饰行业的门户网站，我们将会全心全意为北京装修业主服务。北京装修公司网为您提供专业的装修信息，可免费查询和咨询家庭装修、客厅装修、二手房装修、小户型装修等装饰装修设计及报价等服务。赢得了新老客户的一致信赖和赞誉，并形成了公司以“回头客”为主体的客户网络。"/>
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
	
	<div class="ej_main w1200">
	  <div class="ej_main_local">您的当前位置：<a href="${ctx}/">${companyCity}装修</a>><a href="">团装小区</a></div>
	  <div class="clearfix">
	    <div class="ej_main_left fl" style="margin-right:17px;">
	      <ul>
	        <li class="clearfix">
	           <div class="ej_main_left_img fl">
	           <img src="${community.communityImage }" width="280" height="232"/></div>
	           <div class="ej_main_left_info fl">
	             <h4>【${community.communityName }】</h4>
	             <p>已签约（<font color="red">${community.communityCases }</font>）户  </p>
	            <!--  <p>（）户参观了工地</b></p> -->
	             <!-- <a href="" class="loupan">楼盘说明</a> -->
	             <div class="a">
	               <a href="${ctx }/cases/p1?communityId=${community.communityId}" class="no_mar">查看小区案例</a>
	               <a href="javascript:void(0)">最新装修优惠</a>
	               <!-- <a href="">预约参观工地</a> -->
	             </div>
	           </div>
	        </li>      
	      </ul>
	     
	     <div class="ej_main_left_youhui">
	       <h2>装修优惠</h2>
	       <p>${community.communityDescription }</p>
	     </div>
	     
	     
	     <div class="ej_main_left_anli">
	       <h2>该小区案例</h2>
	       <ul class="clearfix">
	       
	       <c:forEach items="${communityCases }" var="cases" begin="0" end="3" varStatus="status">
	       
	         <c:if test="${status.index != 3 }">
		        
		         <li>
		           <div class="ej_anli_img">
			           <img src="${cases.caseThumbImg }" width="200" height="166"/>
			           <span>${cases.caseHouseType }m²${cases.caseStyle}风格的家</span>
		           </div>
		           <div class="ej_anli_anniu">
		           <a target="_blank" href="${ctx }/orderLine?address=${community.communityName }">预约设计</a>
		           <a target="_blank" href="${ctx}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}">查看详情</a>
		           </div>
		         </li>
	         </c:if>
	         
	         <c:if test="${status.index == 3 }">
	         
		          <li class="no_mar">
		           <div class="ej_anli_img">
			           <img src="${cases.caseThumbImg }" width="200" height="166"/>
			           <span>${cases.caseHouseType }m²${cases.caseStyle}风格的家</span>
		           </div>
		           <div class="ej_anli_anniu">
		           <a href="">预约设计</a>
		           <a target="_blank" href="${ctx}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}">查看详情</a>
		           </div>
		         </li>
	         </c:if>
	       </c:forEach>
	       </ul>
	     </div>
	     
	     <div class="ej_main_left_huodong">
	       <h2>最新活动</h2>
	       <div class="huodong_img">
	       		<a href="${ctx }/activityDetail?activityId=${newsAct.newsId}">
	       		
		       		<img src="${newsAct.thumbImg }" width="100%" height="100%" alt="${newsAct.title }"/>
		        </a>
	       </div>
	     </div>
	     
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
	    <p>已有（<font color="red"><%-- ${orderNumber } --%>656</font>）业主申请了此服务<br>
	    免费电话申请${homeTp.value }</p>
	   
	    <h3>热装小区</h3>
	    <ul>
	    	<c:forEach items="${communitys }" var="community" begin="0" end="2">
	    		   <li>
		    		   <a target="_blank" href="${ctx }/departmentDetail?communityId=${community.communityId } ">
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
	${sessionScope.cnzzSession }
</body>
</html>
