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
<script type="text/javascript" src="${ctx }/www/js/jquery-1.8.2.min.js"></script>
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
	       <div class="ej_weizhi_left fl"><span>N</span> DECORATION &nbsp;行业资讯</div>
	       <div class="ej_local_right fr">您的当前位置：<a href="${ctx }/">首页</a>&nbsp;>>&nbsp;<a href="javascript:void(0)">行业资讯</a></div>
	     </div> 
	  </div>
	  <!--新闻列表 start-->
	   <div class="ej_news w1200 clearfix">
	  <div class="bigTitle">新闻中心</div>
	     <div style="padding-bottom:20px;"></div>
	     <div class="clearfix"></div>
	     <c:forEach items="${newsList }" var="news" begin="0" end="7" varStatus="status">
	     	<c:if test="${(status.index+1)%2 !=0}">
			  <dl class="clearfix">
		       <dt>
			       <a href="${ctx}/newsDetail?newsId=${news.newsId}">
			      	 <img src="${news.thumbImg }" width="260" height="198"/>
			       </a>
		       </dt>
		       <dd>
		         <h4><a href="${ctx}/newsDetail?newsId=${news.newsId}">
		         
		          <c:choose>
			         		<c:when test="${fn:length(news.title)>17 }">
			         			${fn:substring(news.title,0,17) }
			         		</c:when>
			         		<c:otherwise>
			         			 ${news.title }
			         		</c:otherwise>
			         </c:choose>
		         </a></h4>
		         <p>
		             <c:choose>
			          		<c:when test="${fn:length(news.contents) >= 90}">
			          		
				               ${fn:substring(news.contents, 0, 90)}...
			          		</c:when>
			          		<c:otherwise>${news.contents}</c:otherwise>
			          </c:choose>	
			     </p>
		         <span class="news_data"><fmt:formatDate value="${news.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
		       </dd>
		     </dl>		     	
	     	</c:if>
			<c:if test="${(status.index+1)%2 ==0}">
			   <dl class="clearfix no_mar">
		       <dt>
			       <a href="${ctx}/newsDetail?newsId=${news.newsId}">
			      		 <img src="${news.thumbImg }" width="260" height="198"/>
			       </a>
		       </dt>
		       <dd>
		         <h4><a href="${ctx}/newsDetail?newsId=${news.newsId}">
		          <c:choose>
			         		<c:when test="${fn:length(news.title)>17 }">
			         			${fn:substring(news.title,0,17) }
			         		</c:when>
			         		<c:otherwise>
			         			 ${news.title }
			         		</c:otherwise>
			         </c:choose>
		         </a></h4>
		         <p>
		             <c:choose>
			          		<c:when test="${fn:length(news.contents) >= 90}">
			          		
				               ${fn:substring(news.contents, 0, 90)}...
			          		</c:when>
			          		<c:otherwise>${news.contents}</c:otherwise>
			          </c:choose>	
			     </p>
		         <span class="news_data"><fmt:formatDate value="${news.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
		       </dd>
		     </dl>		     	
	     	</c:if>			      
	     </c:forEach>
	     
	   </div>
	   
	  <!--新闻列表 end-->
	    
	    <div class="clearfix"></div>
	 <div class="w1200">
	  <div class="Page clearfix">
	    <c:if test="${page.pageNo > 1}" >
         	<a href="${pageContext.request.contextPath}/industry/p${page.pageNo-1 }">上一页</a>     
         </c:if>
         <c:if test="${page.pageNo <= 1}" >
         	<a href="javascript:void(0);">上一页</a>     
         </c:if>
         
         <c:forEach var="i" begin="1" end="${page.pageCount}">
         	<a <c:if test='${page.pageNo == i }'>style="background-color:#009c42;color:#FFF;"</c:if> href="${pageContext.request.contextPath}/industry/p${i }">&nbsp;${i}&nbsp;</a>
		 </c:forEach>
		 
		 <c:if test="${page.pageNo < page.pageCount}" >
         	<a href="${pageContext.request.contextPath}/industry/p${page.pageNo+1 }">下一页</a>
         </c:if>
         <c:if test="${page.pageNo >= page.pageCount}" >
         	<a href="javascript:void(0);">下一页</a>     
         </c:if>
         
         <a href="${pageContext.request.contextPath}/industry/p${page.pageCount }">最后一页</a> <span>${page.totalRecords }条记录 ${page.pageNo }/${page.pageCount } 页</span>
          
	  </div>
	 </div>
	</div>
	
	<!--二级页面  主体部分 end-->
	<!--footer start-->
	<jsp:include page="public/fotter.jsp" />
	<!--footer end-->
	${sessionScope.statistics.value }
${sessionScope.shangqiao.value }
</body>
</html>
