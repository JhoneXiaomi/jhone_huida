<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="${statScinterhomeSeoKeyword.value }"/>
<meta name="description" content="${statScinterHomeSeoDesc.value }"/>
<title>${statScinterHomeSeoTitle.value }</title>
<link type="text/css" rel="stylesheet" href="${ctx }/www/css/style.css"/>
</head>
<body>
	<!--header start-->
	<jsp:include page="public/header.jsp" />
	<!--header end-->
	  
    <!--nav start-->
    <jsp:include page="public/nav.jsp" />
    <!--nav end-->

	<!--二级页面  主体部分 start-->
	
	<div class="ej_main">
	 
	  <div class="ej_weizhi">
	     <div class="w1200 clearfix">
	       <div class="ej_weizhi_left fl"><span>E</span>STATE &nbsp;热门楼盘</div>
	       <div class="ej_local_right fr">您的当前位置：<a href="${ctx }/">首页</a>&nbsp;>>&nbsp;<a href="">热门楼盘</a></div>
	     </div> 
	  </div>
	   <!--活动列表 start-->
	   <div class="cont_shejishi w1200">
	   <div class="bigTitle">楼盘详细信息</div>
	      
       <!--楼盘详细信息介绍 start--> 

		<div class="content_loupan_main clearfix">
	     <div class="content_loupan_left fl"><img src="${currentHouse.bulidingThumbImg }" width="395" height="300"/></div>
	     <div class="content_loupan_right fl">
	       <h2>${currentHouse.bulidingName }</h2>
	       <p><b>行政区域：</b>${currentHouse.bulidingArea}</p>
	       <p><b>隶属公司：</b><span id="req_branchCompany"></span></p>
	       <p><b>开始时间：</b><fmt:formatDate value="${currentHouse.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
	       <div class="content_loupan_cont clearfix">
	          <div class="content_loupan_tel fl">装修热线：<span>${sessionScope.homeTp.value }</span> </div>
	          <div class="content_loupan_yuyue fr"><a href="${ctx}/orderLine">在线预约</a></div>
	       </div>
	     </div>
	      
	    </div>	  
	  
	   <!--楼盘详细信息介绍 end-->
	   
	   <div class="clearfix"></div>
	    
	    
	    <div class="content_loupan_tj">
	    <div class="bigTitle">您可能还关注以下楼盘</div>
	    
	    <ul>
     <c:forEach items="${hotBuildingList }" var="house" varStatus="status" begin="0" end="7">
      <c:if test="${(status.index+1) % 4 != 0}" >
      	<li>
         <div class="list_loupan_imginfo">
            <div class="loupan_img">
            <a href="${pageContext.request.contextPath}/houseDetail?hotBuildingId=${house.bulidingId}">
            
              <img src="${house.bulidingThumbImg }" width="280" height="213" alt="${house.bulidingName }"/></a>
            </div>
            <div class="loupan_info clear">
              <div class="loupan_fl fl"><p class="info01">
               <a href="${pageContext.request.contextPath}/houseDetail?hotBuildingId=${house.bulidingId}">【${house.bulidingName }】</a></p>
              <p class="info02">在施：10户&nbsp;&nbsp;|&nbsp;&nbsp;报名：12户</p></div>
              
            </div>
         </div>
       </li>
      </c:if>
      <c:if test="${(status.index+1) % 4 == 0}" >
      <li class="no_mar">
         <div class="list_loupan_imginfo">
            <div class="loupan_img">
            <a href="${pageContext.request.contextPath}/houseDetail?hotBuildingId=${house.bulidingId}">
            
              <img src="${house.bulidingThumbImg }" width="280" height="213" alt="${house.bulidingName }"/></a>
            </div>
            <div class="loupan_info clear">
              <div class="loupan_fl fl"><p class="info01">
               <a href="${pageContext.request.contextPath}/houseDetail?hotBuildingId=${house.bulidingId}">
                            【${house.bulidingName }】
                </a>
                </p>
              <p class="info02">在施：10户&nbsp;&nbsp;|&nbsp;&nbsp;报名：12户</p></div>
              <<%-- p class="info03 fr"><a href="javascript:void(0)" class="info03">${house.bulidingArea }</a></p> --%>
              
            </div>
         </div>
       </li>
      </c:if>
      </c:forEach>	    
	  </ul>
	  </div>
	  </div>
	  <!--活动列表 end-->
	</div>
	<!--二级页面  主体部分 end-->
	<!--footer start-->
	<jsp:include page="public/fotter.jsp" />
	<!--footer end-->
	${sessionScope.statistics.value }
${sessionScope.shangqiao.value }
</body>
</html>
