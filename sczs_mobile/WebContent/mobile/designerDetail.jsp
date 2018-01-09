<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>       
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"  />
<meta name="keywords" content="${statScinterhomeSeoKeyword.value }">
<meta name="description" content="${statScinterHomeSeoDesc.value }">
<title>${statScinterHomeSeoTitle.value }</title>
<link type="text/css" rel="stylesheet" href="${ctx }/mobile/css/style.css">
<script src="${ctx }/mobile/js/jquery.min.js"></script>
</head>

<body>

<div class="wrap">
  <!-- 代码 开始 -->
    
   <div class="mMain"> 
    
    <div class="mList_al clearfix">
      <div class="mList_title fl">
        <h3>【 设计师 】</h3>
      </div>
      <div class="mList_position fr">您的当前位置：<a href="${ctx }/">首页</a>><a href="${ctx }/designer">设计师</a></div>
    </div>
    
    
    <div class="mCont_per_img">
      <img src="${designer.designerPhotoImg }" style="width: 88%;height: 480px;">
      <span><a href="${ctx }/Morder?designerName=${designer.designerName }">马上约TA</a></span>
    </div>
    <div class="clear"></div>
     <!--本案例设计师-->
     
     <div class="mCont_per_js">
        <p>姓名：${designer.designerName }</p>
        <p>职位：${designer.designerTitle }</p>
        <p>从业时间：${designer.designerWorkTime }</p>
        <p>擅长风格：${designer.designerStyle }</p>
        <p>设计理念：${designer.designerIdea } </p>
     </div>
   
    <div class="clear"></div>
    <div class="mList_al_al">
      <h4>设计师的其他案例<p class="fr"><a href="${ctx }/cases">更多案例...</a></p></h4>
      <ul>
      	<c:forEach items="${casesList }" var="cases" begin="0" end="5" varStatus="status">
      		<c:if test="${(status.index+1)%3 !=0 }" >

      		     <li>
	      		     <a href="${pageContext.request.contextPath}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}">  
	      		    	 <img src="${cases.caseThumbImg }" alt="${cases.caseTitle }" style="width: 100%;height: 80px;">
	      		     <p>${cases.caseTitle }</p>
	      		     </a>
      		     </li>
      		</c:if>
      		<c:if test="${(status.index+1)%3 ==0 }">
      		
      		     <li class="no_mar">
	      		     <a href="${pageContext.request.contextPath}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}"> 
		      		     <img src="${cases.caseThumbImg }" alt="${cases.caseTitle }" style="width: 100%;height: 80px;">
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

