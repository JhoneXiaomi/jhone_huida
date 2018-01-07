<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script src="${ctx }/mobile/js/jquery-1.7.2.min.js"></script>
</head>

<body>
<div class="wrap">
  <!--主体部分 start-->
    <div class="mList_al clearfix">
      <div class="mList_title fl">
        <h3>【 热门活动 】</h3>
      </div>
      <div class="mList_position fr">您的当前位置：<a href="${ctx }/">首页</a> > <a href="${ctx }/news">热门活动</a></div>
    </div>
    
    <div class="mList_news">
    
      <ul>
       <c:forEach items="${newsList }" var="news">
 		<li>
          <div class="mList_news_img fl"  style="margin-top: 5%">
	          <a href="${ctx}/newDetail?newsId=${news.newsId}">
	          	<img src="${news.thumbImg }" alt="${news.title }" style="height: 90px;">
	          </a>
          </div>
          <div class="mList_news_info fr">
            <h4><a href="${ctx}/newDetail?newsId=${news.newsId}">${news.title }</a></h4>
            <span>
	  			<c:choose>
	          		<c:when test="${fn:length(news.contents) >= 25}">
	          		
		               ${fn:substring(news.contents, 0, 25)}...
		               <a href="${ctx}/newDetail?newsId=${news.newsId}" style="color: #f39800;">活动详情</a>
	          		</c:when>
	          		<c:otherwise>${news.contents}</c:otherwise>
	          </c:choose>  
	                
             </span>
           <%--  <p>上传更新：<fmt:formatDate value="${news.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/></p> --%>
          </div>
        </li>            	
       </c:forEach>
       
      </ul>
      <div id="moreNum" class="jz_more"><input class="btn btn-red btn-lg"  type="button" value="加载更多"/></div>
      <div class="clear"></div>
     
    </div>

</div>


<!--底部导航 start-->
<jsp:include page = "public/fotter.jsp"/>
<!--底部导航  end-->
${sessionScope.statistics.value }
${sessionScope.shangqiao.value }
<script type="text/javascript">
var NewsNum = '${NewsNum }';
var totalNums = '${totalNums }';
if(parseInt(NewsNum) >= parseInt(totalNums)){
	$("#moreNum").remove();
}
	$("#moreNum").bind("click",function(){
		
		
		if(parseInt(NewsNum) < parseInt(totalNums)){
			NewsNum = '${NewsNum +6 }';
			window.location.href = "${pageContext.request.contextPath}/news?NewsNum="+NewsNum;
		}
		
	});
</script>
</body>
</html>