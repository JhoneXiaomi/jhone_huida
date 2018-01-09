<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/> 
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="keywords" content="${scinterHouseSeoKeyword.value }">
<meta name="description" content="${scinterHouseSeoDesc.value }">
<title>${scinterHouseSeoTitle.value }</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"  />
<link type="text/css" rel="stylesheet" href="${ctx }/mobile/css/style.css">
</head>
<body>
<div class="wrap">
   
   
   <!--主体部分 start-->
    <div class="mList_al clearfix">
      <div class="mList_title fl">
        <h3>【装修楼盘】</h3>
      </div>
      <div class="mList_position fr">您的当前位置：<a href="${ctx }/">首页</a> > <a href="javascript:void(0)">装修楼盘</a></div>
    </div>
    
   <div class="mList_loupan">
     <dl>
       <dd>按区域</dd>	
       <dt>
         <a href="">朝阳区</a>
         <a href="">海淀区</a>
         <a href="">丰台区</a>
         <a href="">昌平区</a>
         <a href="">房山区</a>
       </dt>
     </dl>
   </div>
    
    <div class="clear"></div>
    <div class="mList_al_con">
      <ul>
        <c:forEach items="${hotBuildingList }" var="house" varStatus="status">
         <c:if test="${(status.index+1) % 2 != 0}" > 
	          <li class="ri">
	           <img src="${house.bulidingThumbImg }" style="width: 697;height: 464;">
	           <div class="mList_info">
	             <h4>${house.bulidingName }</h4>
	             <div class="p">
		             <p class="pL fl">行政区域：${house.bulidingArea }</p> 
		             <p class="pR fr">设计师：${house.dsesignerId }</p>
	             </div>
	           </div>
	          </li>
        </c:if>
        <c:if test="${(status.index+1) % 2 == 0}">
 			  <li class="le">
	           <img src="${house.bulidingThumbImg }" style="width: 697;height: 464;">
	           <div class="mList_info">
	             <h4>${house.bulidingName }</h4>
	             <div class="p">
		             <p class="pL fl">行政区域：${house.bulidingArea }</p> 
		             <p class="pR fr">设计师：${house.dsesignerId }</p>
	             </div>
	           </div>
	          </li>        
        </c:if>
        </c:forEach>
      </ul>
    </div>
    
  </div>
  <!--主体部分  end-->
  
<!--底部导航 start-->
<jsp:include page = "public/fotter.jsp"/>
<!--底部导航  end-->
${sessionScope.statistics.value }
${sessionScope.shangqiao.value }
</body>
</html>
