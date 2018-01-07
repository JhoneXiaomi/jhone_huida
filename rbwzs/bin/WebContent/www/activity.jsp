<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="${newsSeoKeywordStr.value }"/>
<meta name="description" content="${newsSeoDescStr.value }"/>
<title>${newsSeoTitleStr.value }</title>
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
	       <div class="ej_weizhi_left fl"><span>A</span>CTIVITY &nbsp;热门活动</div>
	       <div class="ej_local_right fr">您的当前位置：<a href="${ctx }/">首页</a>&nbsp;>>&nbsp;<a href="javascript:void(0)">装修案例</a></div>
	     </div> 
	  </div>
	  
	  
	  
	  <!--活动列表 start-->
	   <div class="ej_huodong w1200">
	     
	      <div class="bigTitle">热门活动</div>
	      <c:forEach items="${newsList }" var="news" begin="0" end="3">
	      
			<dl class="clearfix">
		      <dt class="fl">
		      <a href="${ctx}/activityDetail?newsId=${news.newsId}&type=${news.type }" target="_blank">
		      <img src="${news.thumbImg }" width="800" height="250" alt="${news.title }"/>
		      </a>
		      </dt>
		      <dd class="ej_huodong_info fr">
		         <h4><a href="${ctx}/activityDetail?newsId=${news.newsId}&type=${news.type }">${news.title }</a></h4>
		         <p class="huodong_con">
		         
					  <c:choose>
			          		<c:when test="${fn:length(news.contents) >= 90}">
			          		
				               ${fn:substring(news.contents, 0, 90)}...
			          		</c:when>
			          		<c:otherwise>${news.contents}</c:otherwise>
			          </c:choose>				         
		         </p>
		         <p class="huodong_time">活动时间：<span><fmt:formatDate value="${news.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/></span></p>
		         <div class="huodong_more">参加活动>></div>
		      </dd>
		    </dl>	      
	      </c:forEach>
	   </div>
	  <!--活动列表 end-->
	    
	 <div class="w1200">
	  <div class="Page clearfix">
		 <ul>
			 <span>共${page.totalRecords }条记录 ${page.pageNo }/${page.pageCount } 页</span>
	 		 <c:if test="${page.pageNo > 1}" >
	 		 <li class="paging_next">
	         	<a href="${pageContext.request.contextPath}/specNews/p${page.pageNo-1 }">上一页</a>  
	         </li>	   
	         </c:if>
	         <c:if test="${page.pageNo <= 1}" >
	         <li class="paging_next">
	         	<a href="javascript:void(0);">上一页</a>   
	         </li>	  
	         </c:if>
			 <c:forEach var="i" begin="1" end="${page.pageCount}">
			 <li class="paging_page">
	         	<a <c:if test='${page.pageNo == i }'>style="width: 36;height: 32;background-color:#009c42;color:#FFF;"</c:if> href="${pageContext.request.contextPath}/specNews/p${i }">&nbsp;${i}&nbsp;</a>
	         </li>	
			 </c:forEach>			         					
			 <c:if test="${page.pageNo < page.pageCount}" >
			 <li class="paging_next">
	         	<a href="${pageContext.request.contextPath}/specNews/p${page.pageNo+1 }">下一页</a>
	         </li>	
	         </c:if>
	         <c:if test="${page.pageNo >= page.pageCount}" >
	         <li class="paging_next">
	         	<a href="javascript:void(0);">下一页</a>   
	         </li>	  
	         </c:if>
		</ul>        
	  </div>
	</div>
	
	
	<!--二级页面  主体部分 end-->
	
	<!--footer start-->
	<jsp:include page="public/fotter.jsp" />
	<!--footer end-->
</body>
</html>
