<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/head.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<meta name="keywords" content="${newsSeoKeywordStr.value }"/>
	<meta name="description" content="${newsSeoDescStr.value }"/>
	<title>${newsSeoTitleStr.value }</title>
	<link href="${ctx }/mobile/css/style.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="${ctx }/mobile/js/jquery-1.10.2.min.js"></script>
</head>
<body>
	<div class="neiye-top">装修新闻<div class="neiye-fanhui"><a href="javascript:void" onclick="javascript:history.go(-1)">返回</a></div></div>
	<div class="weizhi"><em class="dqwz">当前位置</em><a href="${ctx }/">首页</a>&gt;<a href="javascript:void(0)">装修新闻</a></div>
	<div class="nycase">
		<ul class="nycaselb">
			<c:forEach items="${newsList }" var="news">
				<li>
		            <a href="${ctx }/MdecStrategyDetail?newsId=${news.newsId}">
		                <div class="nycase-con">
		                    <p class="nycase-con-title">${news.title }</p>
		                    <p class="nycase-con-js nynews">
								<c:choose>
					          		<c:when test="${fn:length(news.contents) >= 90}">
					          		
						               ${fn:substring(news.contents, 0, 90)}...
					          		</c:when>
					          		<c:otherwise>${news.contents}</c:otherwise>
					            </c:choose>  	                    
		                    </p>
		                </div>
		                <div class="nycase-img"><img src="${news.thumbImg }"/></div>
		                <div class="nycase-jiantou"><img src="${ctx }/mobile/images/case-jiantou.png"/></div>
		            </a>
		        </li>
			</c:forEach>
	            
		</ul>
		<div class="clear"></div>
	</div>
	
	<div class="pages">
		<ul>
	     <c:if test="${page.pageNo > 1}" >
				<li class="paging_next"><a href="${pageContext.request.contextPath}/Mnews/p${page.pageNo-1 }">上一页</a></li>
	         </c:if>
	         <c:if test="${page.pageNo <= 1}" >
	         	<li class="paging_next"><a href="javascript:void(0)">上一页</a></li>   
	         </c:if>
	         <c:forEach var="i" begin="1" end="${page.pageCount}">
	          <li class="paging_current">
	         	 <a <c:if test='${page.pageNo == i }'>style="background-color:#f39800;color:#FFF;"</c:if> href="${pageContext.request.contextPath}/Mnews/p${i }">&nbsp;${i}&nbsp;</a>
	          </li>
			 </c:forEach>
			 <c:if test="${page.pageNo < page.pageCount}" >
			   <li class="paging_next"><a href="${pageContext.request.contextPath}/Mnews/p${page.pageNo+1 }">下一页</a></li>
	         	
	         </c:if>
	         <c:if test="${page.pageNo >= page.pageCount}" >
	         	 <li class="paging_next"><a href="javascript:void(0);">下一页</a></li>     
	         </c:if>
		</ul>
	</div>
	
	<!-- 引入fotter.js -->
	<jsp:include page="public/fotter.jsp" />
	${sessionScope.statistics.value }
	${sesscionScope.angqiao.value }
</body>
</html>