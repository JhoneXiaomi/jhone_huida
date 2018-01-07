<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp" %>  
<%@ include file="public/shangqiao.jsp" %>  
<!doctype html>
<html>
<head>  
	<meta charset="utf-8">
	<title>${newsSeoTitleStr.value }</title>
	<meta name="keywords" content="${newsSeoKeywordStr.value }"/>
	<meta name="description" content="${newsSeoDescStr.value }"/>
	<link rel="stylesheet" type="text/css" href="${ctx }/www/css/style.css"/>
	<script type="text/javascript" src="${ctx }/www/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="${ctx }/www/js/pptBox.js"></script>
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
	
	<!--banner end-->
	<div class="clear"></div>
	
	<!--main部分 start-->
	<div class="ej_main w1200">
	  <div class="ej_main_local">您的当前位置：<a href="${ctx }/">${companyCity}装修</a>><a href="${ctx }/activity/p1">热门活动</a></div>
	  <div class="lc"><img src="${ctx }/www/images/lcimg.jpg"/></div>
	  
	  <div class="clearfix">
	    <!--活动列表 start-->
	   <div class="ej_huodong w1200">
	   <c:forEach items="${newsList }" var="news" varStatus="status">
	   		
				<dl class="clearfix">
			       <dt class="fl">
			       <a href="${ctx }/activityDetail?activityId=${news.newsId}">
			       
			       <img src="${news.thumbImg }" width="800" height="250" alt="${news.title }"/>
			       </a>
			       </dt>
			       <dd class="ej_huodong_info fr">
			          <h4><a href="">${news.title }</a></h4>
			          <p class="huodong_con">
			          
		 				 <c:choose>
						        <c:when test="${fn:length(news.contents) >= 40}">
				          		
					               ${fn:substring(news.contents, 0, 40)}...
				          		</c:when>
				          		<c:otherwise>${news.contents}</c:otherwise>
				          </c:choose>					          
			          </p>
			          <p class="huodong_time">活动时间：<span><fmt:formatDate value="${news.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/></span></p>
			          <div class="huodong_more">参加活动>></div>
			       </dd>
			     </dl>	   				
	   </c:forEach>
	   
	    <!-- page begin -->
	    
	    <div class="Page clearfix">
		     <span>共${page.totalRecords }条记录 ${page.pageNo }/${page.pageCount } 页</span>  
		      <c:if test="${page.pageNo > 1}" >
	         	<a href="${pageContext.request.contextPath}/activity/p${page.pageNo-1 }">上一页</a>  
	         </c:if>
	         <c:if test="${page.pageNo <= 1}" >
	         	<a href="javascript:void(0);">上一页</a>
	         </c:if>   
		     <c:forEach var="i" begin="1" end="${page.pageCount}">
			     <a <c:if test='${page.pageNo == i }'>style="width: 36;height: 32;background-color:#008cd6;color:#FFF;"</c:if> href="${pageContext.request.contextPath}/activity/p${i }">&nbsp;${i}&nbsp;</a>
		      </c:forEach>	
			  <c:if test="${page.pageNo < page.pageCount}" >
	         	<a href="${pageContext.request.contextPath}/activity/p${page.pageNo+1 }">下一页</a>
	         </c:if>
	         <c:if test="${page.pageNo >= page.pageCount}" >
	         	<a href="javascript:void(0);">下一页</a>   
	         </c:if> 
	    </div>
	    <!-- page end -->
	   </div>
	  <!--活动列表 end-->
	 </div>
	</div>
	<!--main部分 end-->
	
	<div class="clear"></div>
	<!--footer start-->
	<jsp:include page="public/fotter.jsp"/>
	<!--footer end-->
	
	<!-- servise start -->
    <jsp:include page="public/service.jsp"/>
    <!-- servise end -->
	${sessionScope.statistics.value }
	${sessionScope.shangqiao.value }
	${sessionScope.cnzzSession }
</body>
</html>
