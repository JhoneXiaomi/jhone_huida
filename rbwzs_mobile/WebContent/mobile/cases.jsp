<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp" %>    
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">	
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="keywords" content="${casesSeoKeywordStr.value }"/>
<meta name="description" content="${casesSeoDescStr.value }"/>
<title>${casesSeoTitleStr.value }</title>
<link rel="stylesheet" type="text/css" href="${ctx }/mobile/css/style.css"/>
<script type="text/javascript" src="${ctx }/mobile/js/jquery-1.9.1.min.js"></script>
</head>
<body>
<div class="wrap">
 
 <div class="ej_top">
  <div class="ej_tit clearfix">
   <div class="back fl"><img src="${ctx }/mobile/images/backicon.png"/><a href="javascript:history.back();">返回</a></div>
   <div class="lanmu">装修案例</div>
  </div>
  
  <div class="ej_local fl">您的当前位置：<a href="${ctx }/">首页</a>> <a href="javascript:void(0)">装修案例</a></div>
 </div>
 
 
 <div class="clear"></div>
 
 
   <div class="mList_al_con">
      <ul class="clearfix">
      <c:forEach items="${casesList }" var="cases" varStatus="status" begin="0" end="11">
      
      	<c:if test="${(statue.index+1)%2 !=0 }" >
      	
	  		 <li class="ri">
	           <a href="${ctx}/m/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}">
	          		 <img src="${cases.caseThumbImg}" style="width: 170px; height:132px"/>
	           </a>
	           <div class="mList_info">
	             <h4>${cases.caseTitle }</h4>
	             <div class="p"><p class="pL fl">${cases.caseHouseType }</p> <p class="pR fr">设计师：${cases.caseDesigner }</p></div>
	           </div>
	        </li>    	
      	</c:if>
      	<c:if test="${(statue.index+1)%2 ==0 }" >
      	
	  		<li class="le">
	           <a href="${ctx}/m/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}">
	          		 <img src="${cases.caseThumbImg}" style="width: 170px; height:132px"/>
	           </a>
	           <div class="mList_info">
	             <h4>
	             <c:choose>
	             	<c:when test="${fn:length(cases.caseTitle)>13 }">${fn:substring(cases.casesTitle,0,13) }</c:when>
	             	<c:otherwise>${case.caseTitle }</c:otherwise>
	             </c:choose>
	             ${cases.caseTitle }</h4>
	             <div class="p"><p class="pL fl">${cases.caseHouseType }</p> <p class="pR fr">设计师：${cases.caseDesigner }</p></div>
	           </div>
	        </li>    	 	
      	</c:if>
      </c:forEach>
      </ul>
    </div>
<div class="clear"></div>
</div>
<div class="pages">
	<ul>
	<c:if test="${page.pageNo > 1}" >
			<li class=""><a>共${page.totalRecords }条记录 ${page.pageNo }/${page.pageCount } 页</a></li> 
			<li class="paging_next"><a href="${pageContext.request.contextPath}/m/cases/p${page.pageNo-1 }">上一页</a></li>
         </c:if>
         <c:if test="${page.pageNo <= 1}" >
        	<li class=""><a>共${page.totalRecords }条记录 ${page.pageNo }/${page.pageCount } 页</a></li>
         	<li class="paging_next"><a href="javascript:void(0)">上一页</a></li>   
         </c:if>
         
         <c:forEach var="i" begin="1" end="${page.pageCount}">
          <li class="paging_current">
         	 <a <c:if test='${page.pageNo == i }'>style="background-color:#f39800;color:#FFF;"</c:if> href="${pageContext.request.contextPath}/m/cases/p${i }">&nbsp;${i}&nbsp;</a>
          </li>
		 </c:forEach>
		 <c:if test="${page.pageNo < page.pageCount}" >
		   <li class="paging_next"><a href="${pageContext.request.contextPath}/m/cases/p${page.pageNo+1 }">下一页</a></li>
         	
         </c:if>
         <c:if test="${page.pageNo >= page.pageCount}" >
         	 <li class="paging_next"><a href="javascript:void(0);">下一页</a></li>     
         </c:if>
         	<li><a href="${pageContext.request.contextPath}/m/cases/p${page.pageCount }">最后一页</a></li>
    
	</ul>
</div>
<!--底部导航 start-->
<jsp:include page="public/fotter.jsp"/>
<!--底部导航  end-->

<div class="" style="margin-bottom:100px;"></div>

${sessionScope.statistics.value }
${sessionScope.shangqiao.value }
</body>
</html>
