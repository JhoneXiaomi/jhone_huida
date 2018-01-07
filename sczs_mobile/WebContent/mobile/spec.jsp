<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>         
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="keywords" content="${scinterNewsSeoKeywordStr.value }">
<meta name="description" content="${scinterNewsSeoDescStr.value }">
<title>${scinterNewsSeoTitleStr.value }</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"  />
<link type="text/css" rel="stylesheet" href="${ctx }/mobile/css/style.css">
<script type="text/javascript" src="${ctx }/mobile/js/jquery-1.9.1.min.js"></script>
</head>

<body>
<div class="wrap">
  <!--主体部分 start-->
    <div class="mList_al clearfix">
      <div class="mList_title fl">
        <h3>【 热门活动 】</h3>
      </div>
      <div class="mList_position fr">您的当前位置：<a href="${ctx }/">首页</a> > <a href="">热门活动</a></div>
    </div>
    
    
    <div class="mList_news">
      <ul>
      
      <c:forEach items="${newsList }" var="news">
       <li>
          <div class="mList_news_img fl">
          <a href="${ctx}/MspecDetail?newsId=${news.newsId}"><img src="${news.thumbImg }" alt="${news.title }"></a></div>
          <div class="mList_news_info fr">
            <h4><a href="${ctx}/MspecDetail?newsId=${news.newsId}"> ${news.title }</a></h4>
            <span>
				<c:choose>
	          		<c:when test="${fn:length(news.contents) >= 15}">
	          		
		               ${fn:substring(news.contents, 0, 15)}...
	          		</c:when>
	          		<c:otherwise>${news.contents}</c:otherwise>
	            </c:choose>            
                <a style="color: #f39800;" href="${ctx}/MspecDetail?newsId=${news.newsId}">[详细]</a></span>
            <p>上传更新：<fmt:formatDate value="${news.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/></p>
          </div>
        </li>     
      </c:forEach>
      </ul>
      <div class="clear"></div>
     
    </div>

</div>


<!--底部导航 start-->
<jsp:include page = "public/fotter.jsp"/>
<!--底部导航  end-->
${sessionScope.statistics.value }
${sessionScope.shangqiao.value }
</body>
</html>
