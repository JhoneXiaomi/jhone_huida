<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp" %>    
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">	
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="" name="Keywords">
<meta content="" name="Description">
<meta name="keywords" content="${news.seoKeyword }"/>
<meta name="description" content="${news.seoDesc }"/>
<title>${news.seoTitle }</title>
<script type="text/javascript" src="${ctx }/mobile/js/jquery-1.9.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx }/mobile/css/style.css"/>
</head>
<body>

<div class="wrap">
 
  <div class="ej_top">
   <div class="ej_tit clearfix">
     <div class="back fl"><img src="${ctx }/mobile/images/backicon.png"/><a href="javascript:history.back();">返回</a></div>
     <div class="lanmu">装修攻略</div>
   </div>
   <div class="ej_local fl">您的当前位置：<a href="${ctx }/">首页</a>> <a href="${ctx }/m/strategy/p1">装修攻略</a>> <a href="javascript:void(0)">${type }</a></div>
  </div>
 
 <div class="clear"></div>

  <div class="mCont_news_title"><h4>${news.title }</h4></div>
  <div class="mCont_news_data">文章作者：${news.author }  | 上传更新：<fmt:formatDate value="${news.updateTime }" pattern="yyyy-MM-dd hh:mm:ss"/></div>
  <div class="mCont_news_img"><img src="${news.thumbImg }"></div>
  <div class="mCont_news_con">${news.contents }</div>
<div class="mCont_news">
  <div class="mTitle clearfix">
    <h4 class="fl">新闻资讯</h4>
    <span class="fr"><a href="${ctx }/m/news/p1">更多&nbsp;>></a></span>
  </div>
      <ul>
      <c:forEach items="${newListNews }" var="news">
      
       <li><span>2016-07-28</span>
       <a href="${ctx }/m/newsDetail?newsId=${news.newsId}">
       <c:choose>
       		<c:when test="${fn:length(news.contents)>20 }">
       			${news.title }
       		</c:when>
       		<c:otherwise>${news.title }</c:otherwise>
       </c:choose>
       </a>
       </li>
      </c:forEach>
      </ul>
    </div>
</div>
<!--底部导航 start-->
<jsp:include page="public/fotter.jsp"/>
<!--底部导航  end-->
<div class="" style="margin-bottom:100px;"></div>
${sessionScope.statistics.value }
${sessionScope.shangqiao.value }
</body>
</html>
