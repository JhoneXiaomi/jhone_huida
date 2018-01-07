<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/public/shangqiao.jsp" %> 
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>热装楼盘-${cityCompany}三创装饰公司</title>
<meta name="keywords" content="${statScinterhomeSeoKeyword.value }">
<meta name="description" content="${statScinterHomeSeoDesc.value }">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/www/css/style.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/www/js/nav.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/www/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/www/js/minify(2).js"></script>
</head>

<body>
   <!--header start-->
   <div class="header">
	 <jsp:include page="../public/head.jsp"/>
   </div>
   <!--header end-->
   
   <!--nav start--> 
   <jsp:include page="../public/nav.jsp"/>
   <!--nav end-->  

<div class="list_loupan_main w1180">
   <div class="list_position">您的当前位置：<a href="${pageContext.request.contextPath}/">${cityCompany}装修</a> > <a href="${pageContext.request.contextPath}/hotBuilding/p1">热装楼盘</a></div>
   <div class="list_loupan_title"> <div class="cont_anli_title"><h3 class="">【热装楼盘】</h3></div></div>
   
   <!-- <div class="list_loupan_fenl">
     <dl>
       <dd>按区域</dd>
       <dt>
         <a href="">朝阳区</a>
         <a href="">海淀区</a>
         <a href="">丰台区</a>
         <a href="">昌平区</a>
         <a href="">房山区</a>
         <a href="">东城区</a>
         <a href="">西城区</a>
         <a href="">大兴区</a>
       </dt>
     </dl>
   </div> -->
   
   
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
     <div class="clear"></div>
     <!-- 分页开始 -->
	  <div class="list_page">
	       <div class="Page clearfix">
	       	
	       	 <c:if test="${page.pageNo > 1}" >
	         	<a href="${pageContext.request.contextPath}/cases/p${page.pageNo-1 }">上一页</a>     
	         </c:if>
	         <c:if test="${page.pageNo <= 1}" >
	         	<a href="javascript:void(0);">上一页</a>     
	         </c:if>
	         
	         <c:forEach var="i" begin="1" end="${page.pageCount}">
	         	<a <c:if test='${page.pageNo == i }'>style="background-color:#f39800;color:#FFF;"</c:if> href="${pageContext.request.contextPath}/house/p${i }">&nbsp;${i}&nbsp;</a>
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
      <!-- 分页结束 -->
    
   </div>
   
</div>

<div class="clearfix"></div>
<!--footer start-->
<jsp:include page="../public/fotter.jsp"/>
<!-- footer end -->
</body>
</html>
