<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>   
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"  />
<meta name="keywords" content="${CurrentCase.seoKeyword }">
<meta name="description" content="${CurrentCase.seoDesc }">
<title>${CurrentCase.seoTitle }</title>
<link type="text/css" rel="stylesheet" href="${ctx }/mobile/css/style.css">
<script src="${ctx }/mobile/js/jquery.min.js"></script>
</head>

<body>

<div class="wrap">
  <!-- 代码 开始 -->
   <div class="mMain"> 
    <div class="mList_al clearfix">
      <div class="mList_title fl">
        <h3>【 装修案例 】</h3>
      </div>
      <div class="mList_position fr">您的当前位置：<a href="${ctx }/">首页</a> > <a href="${ctx }/cases">装修案例</a></div>
    </div>
    <div class="mList_al_info">
      <h4>${CurrentCase.caseTitle}</h4>
      <ul class="clear">
        <li>楼盘：${CurrentCase.caseCommunity}</li>
        <li>风格：${CurrentCase.caseStyle }</li>
        <li>户型：${CurrentCase.caseHouseType }</li>
        <li>面积：${CurrentCase.caseAcreage } 平方米</li>
        <li>预算：${CurrentCase.caseMoney } 万</li>
        <li>设计师：${designer.designerName }</li>
      </ul>
    </div>
    
    <div class="slide_container">
      <ul class="rslides" id="slider">
      	<c:forEach items="${caseshowImages }" var="cases" varStatus="status">
     	  <li>
	     	  <img src="${cases.imageUrl }" alt="${CurrentCase.caseTitle }">
	          <p class="caption">${CurrentCase.caseTitle }</p>    	  
     	  </li>
      	</c:forEach>
      </ul>
    </div>
    <div class="clear"></div>
     <!--本案例设计师-->
    <div class="mList_al_sjs">
      <h4>本案设计师</h4>
      <div class="mList_al_sjs_img fl">
	      <a href="${pageContext.request.contextPath}/MdesignerDetail?designerId=${designer.designerId}">
	      	<img src="${designer.designerPhotoImg }" style="width: 100%;height: 160px;">
	      </a>
      </div>
      <div class="mList_al_sjs_info fr">
        <h5>${designer.designerName }</h5>
        <p>职位等级：${designer.designerTitle }</p>
        <p>从业时间：${designer.designerWorkTime }</p>
        <p>擅长风格：${designer.designerStyle }</p>
        <p>设计理念：${fn:substring(designer.designerIdea,0,50) }</p>
      </div>
    </div>
    <div class="clear"></div>
    <div class="mList_al_al">
      <h4>您可能还喜欢<p class="fr"><a href="${ctx }/cases">更多案例 >></a></p></h4>
      <ul>
		<c:forEach items="${casesList }" var="cases" varStatus="status" begin="0" end="5">
		   <c:if test="${(status.index+1) % 3 != 0}" > 
			<li>
			    <a href="${pageContext.request.contextPath}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}">
			    
				    <img src="${cases.caseThumbImg }" alt=">${cases.caseTitle }" style="width: 100%;height: 66px;">
				    <p>${cases.caseTitle }</p>
			    </a>
		   </li>
	      </c:if>
	      
	      <c:if test="${(status.index+1) % 3 == 0}">
			  <li class="no_mar">
			   <a href="${pageContext.request.contextPath}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}">
			  
				    <img src="${cases.caseThumbImg }" alt=">${cases.caseTitle }" style="width: 100%;height: 66px;">
				    <p>${cases.caseTitle }</p>
			    </a>
		   </li> 
	      </c:if>  	  		  	
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
