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
    <div class="back fl">
   		<img src="${ctx }/mobile/images/backicon.png"/>
	    <a href="javascript:history.back();">返回</a>
    </div>
   <div class="lanmu">热装楼盘</div>
  </div>
  
  <div class="ej_local fl">您的当前位置：<a href="${ctx }/">首页</a>> <a href="${ctx }/m/house/p1">热装楼盘</a></div>
 </div>
 
 
 <div class="clear"></div>
 
    <div class="loupan_con">
    <div class="mCont_loupan">
      <img src="${buliding.bulidingThumbImg }" alt="${buliding.bulidingName }">
      <div class="mCont_loupan_info">
        <h4>${buliding.bulidingName }</h4>
        <p><b>发布时间：</b><fmt:formatDate value="${buliding.updateTime }" pattern="yyyy-MM-dd hh:mm:ss"/></p>
        <p><b>发布者：</b>${bulding.creater }</p>
      </div>
      
    </div>
    
    
    <div class="mList_al_al">
      <div class="mTitle clearfix">
       <h4 class="fl">更多热装楼盘</h4>
       <span class="fr"><a href="${ctx }/m/house/p1">更多&nbsp;>></a></span>
      </div>
      
      <ul class="clearfix">
        <c:forEach items="${hotBuildingList}" var="hotBuilding" varStatus="status" begin="0" end="5">
      		<c:if test="${(status.index+1)%3 !=0 }">
      		 	<li>
	      		 	<a href="${ctx }/m/houseDetail?buildingId=${building.bulidingId}">
		      		 	<img src="${hotBuilding.bulidingThumbImg }" alt="${hotBuilding.bulidingName }">
		      		 	<p>${hotBuilding.bulidingName }</p>
	      		 	</a>
      		 	</li>
      		</c:if>
      		<c:if test="${(status.index+1)%3 ==0 }">
      		 	<li class="no_mar">
	      		 	<a href="${ctx }/m/houseDetail?buildingId=${building.bulidingId}">
		      		 	<img src="${hotBuilding.bulidingThumbImg }" alt="${hotBuilding.bulidingName }">
		      		 	<p>${hotBuilding.bulidingName }</p>
	      		 	</a>
      		 	</li>
      		</c:if>
      </c:forEach>
      </ul>
    </div>	
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

