<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>   
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"  />
<meta name="keywords" content="${news.seoKeyword }">
<meta name="description" content="${news.seoDesc }">
<title>${news.seoTitle }</title>
<script type="text/javascript" src="${ctx }/mobile/js/jquery-1.9.1.min.js"></script>
<link type="text/css" rel="stylesheet" href="${ctx }/mobile/css/style.css">
</head>

<body>

<div class="wrap">
  <!-- 代码 开始 -->
    
   <div class="mMain"> 
    
    <div class="mList_al clearfix">
      <div class="mList_title fl">
        <h3>【 装修新闻】</h3>
      </div>
      <div class="mList_position fr">您的当前位置：<a href="${ctx }/">首页</a> > <a href="${ctx }/news">装修知识</a></div>
    </div>
    
  
  <div class="mCont_news_title"><h4>${news.title }</h4></div>
  <div class="mCont_news_data">文章作者：${news.author }  | 上传更新：<fmt:formatDate value="${news.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/></div>
  <div class="mCont_news_con">${news.contents }</div>
  
    
    
 
    <div class="clear"></div>
    <div class="mCont_news">
      <h4>推荐新闻<p class="fr"><a href="${ctx }/news">更多新闻 >></a></p></h4>
      <ul>
      	<c:forEach items="${newListNews }" var="news" begin="0" end="7">
      	
      		  <li style="background:url(${ctx}/mobile/images/title_dian.png) no-repeat left "><span><fmt:formatDate value="${news.updateTime }" pattern="yyyy-MM-dd"/></span>
      		  	<a href="${ctx }/newDetail?newsId=${news.newsId}"  style=" padding-left:20x;">${news.title }</a>
      		  </li>
      	</c:forEach>
      
     
      </ul>
    </div>
    
    
    
  </div>
<!-- 代码 结束 -->
<script src="${ctx }/mobile/js/responsiveslides.min.js"></script>
<script src="${ctx }/mobile/js/slide.js"></script>

</div>

<!--底部导航 start-->
<jsp:include page = "public/fotter.jsp"/>
<!--底部导航  end-->
${sessionScope.statistics.value }
${sessionScope.shangqiao.value }
</body>
</html>
