<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="${rbwHouseSeoKeyword.value }"/>
<meta name="description" content="${rbwHouseSeoDesc.value }"/>
<title>${rbwHouseSeoTitle.value }</title>
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
       <div class="ej_weizhi_left fl"><span>E</span>STATE &nbsp;热装楼盘</div>
       <div class="ej_local_right fr">您的当前位置：<a href="${ctx }/">首页</a>&nbsp;>>&nbsp;<a href="javascript:void(0)">热装楼盘</a></div>
     </div> 
  </div>
  
  
  
  <!--楼盘列表 start-->
  <div class="anli_info w1200">
   <div class="list_looupan_list">
     <ul>
     <c:forEach items="${hotBuildingList }" var="house" varStatus="status">
	      	<c:if test="${(status.index+1) % 4 != 0}" > 
		   		<li>
		         <div class="list_loupan_imginfo">
		            <div class="loupan_img"><a href="${pageContext.request.contextPath}/houseDetail?hotBuildingId=${house.bulidingId}"><img src="${house.bulidingThumbImg }" width="280" height="213" alt="${house.bulidingName }"></a></div>
		            <div class="loupan_info clear">
		              <div class="loupan_fl fl">
		              <p class="info01">
		                 <a href="${pageContext.request.contextPath}/houseDetail?hotBuildingId=${house.bulidingId}" class="info03">【${house.bulidingName }】</a>
		              </p>
		              <p class="info02">在施：10户&nbsp;&nbsp;|&nbsp;&nbsp;报名：12户</p></div>
		              <p class="info03 fr">${house.bulidingArea }</p>
		              
		            </div>
		         </div>
		       </li>	      	
	      	</c:if>
	      	<c:if test="${(status.index+1) % 4 == 0}">
				<li class="no_mar">
		         <div class="list_loupan_imginfo">
		            <div class="loupan_img"><a href="${pageContext.request.contextPath}/houseDetail?hotBuildingId=${house.bulidingId}"><img src="${house.bulidingThumbImg }" width="280" height="213" alt="${house.bulidingName }"></a></div>
		            <div class="loupan_info clear">
		              <div class="loupan_fl fl"><p class="info01">
		              <a href="${pageContext.request.contextPath}/houseDetail?hotBuildingId=${house.bulidingId}" class="info03">【${house.bulidingName }】</a>
		              </p>
		              <p class="info02">在施：10户&nbsp;&nbsp;|&nbsp;&nbsp;报名：12户</p></div>
		              <p class="info03 fr">${house.bulidingArea }</p>
		              
		            </div>
		         </div>
		       </li>	   	      	
	      	</c:if>
	     </c:forEach>
     </ul>
     <div class="clearfix"></div>
   </div>
    
  </div>
  <!--楼盘列表 end-->
 <div class="w1200">
           <div class="Page clearfix">
	       	
	       	 <c:if test="${page.pageNo > 1}" >
	         	<a href="${pageContext.request.contextPath}/cases/p${page.pageNo-1 }">上一页</a>     
	         </c:if>
	         <c:if test="${page.pageNo <= 1}" >
	         	<a href="javascript:void(0);">上一页</a>     
	         </c:if>
	         
	         <c:forEach var="i" begin="1" end="${page.pageCount}">
	         	<a <c:if test='${page.pageNo == i }'>style="background-color:#009c42;color:#FFF;"</c:if> href="${pageContext.request.contextPath}/house/p${i }">&nbsp;${i}&nbsp;</a>
			 </c:forEach>
			 
			 <c:if test="${page.pageNo < page.pageCount}" >
	         	<a href="${pageContext.request.contextPath}/house/p${page.pageNo+1 }">下一页</a>
	         </c:if>
	         <c:if test="${page.pageNo >= page.pageCount}" >
	         	<a href="javascript:void(0);">下一页</a>     
	         </c:if>
	         
	         <a href="${pageContext.request.contextPath}/house/p${page.pageCount }">最后一页</a> <span>${page.totalRecords }条记录 ${page.pageNo }/${page.pageCount } 页</span>
	       </div>
 </div>
  
  
</div>


	<!--二级页面  主体部分 end-->
	<!--footer start-->
	<jsp:include page="public/fotter.jsp" />
	<!--footer end-->
</body>
</html>
