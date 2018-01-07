<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp" %>     
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">	
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="keywords" content="${newsSeoKeywordStr.value }"/>
<meta name="description" content="${newsSeoDescStr.value }"/>
<title>${newsSeoTitleStr.value }</title>
<link rel="stylesheet" type="text/css" href="${ctx }/mobile/css/style.css"/>
<script type="text/javascript" src="${ctx }/mobile/js/jquery-1.9.1.min.js"></script>
</head>
<body>
<div class="wrap">
 <div class="ej_top">
  <div class="ej_tit clearfix">
   <div class="back fl"><img src="${ctx }/mobile/images/backicon.png"/><a href="javascript:history.back();">返回</a></div>
   <div class="lanmu">装修活动</div>
  </div>
  
  <div class="ej_local fl">您的当前位置：<a href="${ctx }/">首页</a>> <a href="javascript:void(0)">装修活动</a></div>
 </div>
 <div class="clear"></div>
 <div class="news_list clearfix">
  <c:forEach items="${newsList }" var="news" begin="0" end="7" varStatus="status">
	  <dl class="clearfix">
	   <a href="${ctx}/m/activatyDetail?newsId=${news.newsId}"  class="clearfix">
	      <dt><img src="${news.thumbImg }" style="margin-top:9px"/></dt>
	      <dd>
	        <h4>
	        <c:choose>
	        	<c:when test="${fn:length(news.title)>19 }">${fn:substring(news.title,0,19) }</c:when>
	        	<c:otherwise> ${news.title }</c:otherwise>
	        </c:choose>
	       </h4>
	        <div class="news_list_con">
			<c:choose>
          		<c:when test="${fn:length(news.contents) >= 40}">
          		
	               ${fn:substring(news.contents, 0, 40)}...
          		</c:when>
          		<c:otherwise>${news.contents}</c:otherwise>
            </c:choose>		        
	        </div>
	        <p style="color:#009c42">活动详情>></p>
	      </dd>
	    </a>
	  </dl>
  </c:forEach>
 </div>
<div class="clear"></div>

</div>

<!--底部导航 start-->
<jsp:include page="public/fotter.jsp"/>
<!--底部导航  end-->

<div class="" style="margin-bottom:100px;"></div>
${sessionScope.statistics.value }
${sessionScope.shangqiao.value }
</body>
</html>
