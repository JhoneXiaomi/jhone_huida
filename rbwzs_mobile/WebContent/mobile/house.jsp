<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp" %>    
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">	
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="keywords" content="${xzzsHouseSeoKeyword.value }"/>
<meta name="description" content="${xzzsHouseSeoDesc.value }"/>
<title>${xzzsHouseSeoTitle.value }</title>
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
  
  <div class="ej_local fl">您的当前位置：<a href="${ctx }/">首页</a>> <a href="javascript:void(0)">热装楼盘</a></div>
 </div>
 <div class="clear"></div>
 
   <div class="mList_al_con">
   <ul class="clearfix">
   <c:forEach items="${hotBuildingLists }" var="building" varStatus="status">
   		<c:choose>
   				<c:when test="${(status.index+1)%2 !=0 }">
			        <li class="ri">
			         <a href="${ctx }/m/houseDetail?buildingId=${building.bulidingId}">
			           <img src="${building.bulidingThumbImg }" alt="${building.bulidingName }">
			         </a>  
			           <div class="mList_info"> 
			             <h4>${building.bulidingName }</h4>
			             <div class="p"><p class="pL fl">${building.bulidingArea }</p></div>
			           </div>
			        </li>  				
   				</c:when>
   				<c:otherwise>
   					<li class="le">
   					   <a href="${ctx }/m/houseDetail?buildingId=${building.bulidingId}">
			         		 <img src="${building.bulidingThumbImg }" alt="${building.bulidingName }">
			           </a>
			           <div class="mList_info">
			             <h4>${building.bulidingName }</h4>
			             <div class="p"><p class="pL fl">${building.bulidingArea }</p></div>
			           </div>
			        </li>  		
   				</c:otherwise>
   		</c:choose>
     </c:forEach>  
      </ul>
    </div>
<div class="clear"></div>
</div>
	<!--底部导航 start-->
	<jsp:include page="public/fotter.jsp"/>
	<!--底部导航  end-->
	<div class="" style="margin-bottom:50px;"></div>
	${sessionScope.statistics.value }
${sessionScope.shangqiao.value }
</body>
</html>
