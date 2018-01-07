<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/head.jsp" %>    
<!DOCTYPE html>
<html >
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<title>${casesSeoTitleStr.value }</title>
	<meta name="keywords" content="${casesSeoKeywordStr.value }"/>
	<meta name="description" content="${casesSeoDescStr.value }"/>
	<link href="${ctx }/mobile/css/style.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="${ctx }/mobile/js/jquery-1.10.2.min.js"></script> 
</head>
<body>
<div class="neiye-top">在建工地<div class="neiye-fanhui"><a href="javascript:void(0)" onclick="javascript:history.go(-1)">返回</a></div></div>
<div class="weizhi"><em class="dqwz">当前位置</em><a href="${ctx }/">首页</a>&gt;<a href="${ctx }/MlistHotBuildingSite/p1">在建工地</a></div>


<div class="anli_list_sj">
  <!--<h3>8万精装早安北京校区现代风格120㎡现代简约</h3>-->
  <ul class="clearfix">
  
	  <c:forEach items="${buildingSiteList }" var="buildingSite">
	  
		  <li>
			  <a href="${ctx }/MshowBuildingSite?siteId=${buildingSite.id }">
			  
			  		<img src="${buildingSite.siteThumbImg }" />
			  </a>
			  <span>${buildingSite.siteName }</span>
			  <p><b style="float:left;">${buildingSite.houseStyle }</b> <b style="float:right;"><em>${buildingSite.designerName }</em>设计</b></p>
		  </li>
	  </c:forEach>
  </ul>
</div>


<div class="pages">
	<ul>
	<c:if test="${page.pageNo > 1}" >
			<li class="paging_next"><a href="${pageContext.request.contextPath}/MlistHotBuildingSite/p${page.pageNo-1 }">上一页</a></li>
         </c:if>
         <c:if test="${page.pageNo <= 1}" >
         	<li class="paging_next"><a href="javascript:void(0)">上一页</a></li>   
         </c:if>
         
         <c:forEach var="i" begin="1" end="${page.pageCount}">
          <li class="paging_current">
         	 <a <c:if test='${page.pageNo == i }'>style="background-color:#f39800;color:#FFF;"</c:if> href="${pageContext.request.contextPath}/MlistHotBuildingSite/p${i }">&nbsp;${i}&nbsp;</a>
          </li>
		 </c:forEach>
		 <c:if test="${page.pageNo < page.pageCount}" >
		   <li class="paging_next"><a href="${pageContext.request.contextPath}/MlistHotBuildingSite/p${page.pageNo+1 }">下一页</a></li>
         	
         </c:if>
         <c:if test="${page.pageNo >= page.pageCount}" >
         	 <li class="paging_next"><a href="javascript:void(0);">下一页</a></li>     
         </c:if>
         	<li><a href="${pageContext.request.contextPath}/MlistHotBuildingSite/p${page.pageCount }">最后一页</a></li>
	</ul>
</div>

	<!-- 引入fotter.jsp -->
	<jsp:include page="public/fotter.jsp" />
</body>
</html>