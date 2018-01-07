<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp" %>    
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">	
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="keywords" content="${statrbwhomeSeoKeyword.value }"/>
<meta name="description" content="${statrbwHomeSeoDesc.value }"/>
<title>${statrbwHomeSeoTitle.value }</title>
<link rel="stylesheet" type="text/css" href="${ctx }/mobile/css/style.css"/>
<script type="text/javascript" src="${ctx }/mobile/js/jquery-1.9.1.min.js"></script>
</head>
<body>
<div class="wrap">
 
 <div class="ej_top">
  <div class="ej_tit clearfix">
   <div class="back fl"><img src="${ctx }/mobile/images/backicon.png"/><a href="javascript:history.back();">返回</a></div>
   <div class="lanmu">装修效果图</div>
  </div>
  
  <div class="ej_local fl">您的当前位置：<a href="${ctx }/">首页</a>> <a href="javascript:void(0)">装修效果图</a></div>
 </div>
 
 
 <div class="clear"></div>
 
 
   <div class="mList_al_con">
      <ul class="clearfix">
      <c:forEach items="${casesList }" var="cases" varStatus="status" begin="0" end="5">
      
      	<c:if test="${(statue.index+1)%2 !=0 }" >
      	
	  		 <li class="ri">
	           <a href="${ctx}/m/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}">
	          		 <img src="${cases.caseThumbImg}">
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
	          		 <img src="${cases.caseThumbImg}">
	           </a>
	           <div class="mList_info">
	             <h4>${cases.caseTitle }</h4>
	             <div class="p"><p class="pL fl">${cases.caseHouseType }</p> <p class="pR fr">设计师：${cases.caseDesigner }</p></div>
	           </div>
	        </li>    	 	
      	</c:if>
      </c:forEach>
      </ul>
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
