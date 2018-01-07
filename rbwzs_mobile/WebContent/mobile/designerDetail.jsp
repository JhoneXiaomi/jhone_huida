<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp" %>    
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">	
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="" name="Keywords">
<meta content="" name="Description">
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
     <div class="lanmu">设计师</div>
   </div>
   <div class="ej_local fl">您的当前位置：<a href="${ctx }/">首页</a>> <a href="${ctx }/m/designer/p1">设计师</a></div>
  </div>
 <div class="clear"></div>
    <div class="mCont_per_img">
      <img src="${designer.designerPhotoImg }" height="268">
      <span><a href="${ctx }/m/order?designerName=${designer.designerName}&designerSex=${designer.designerSex}">马上约TA</a></span>
    </div>
    <div class="clear"></div>
     <!--本案例设计师-->
    <div class="shejishi_con">
     <div class="mCont_per_js">
        <p>姓名：${designer.designerName }</p>
        <p>级别：首席设计师</p>
        <p>从业时间：${designer.designerWorkTime }</p>
        <p>擅长风格：${designer.designerStyle }</p>
        <p>设计理念：${designer.designerIdea }</p>
     </div>
     
     
     <div class="mList_al_al">
       <div class="mTitle clearfix">
        <h4 class="fl">相关装修案例</h4>
        <span class="fr"><a href="${ctx }/cases/p1">更多&nbsp;>></a></span>
       </div>
      <ul>
      <c:forEach items="${casesList }" var="cases" begin="0" end="5" varStatus="status">
      <c:if test="${(status.index+1)%3 != 0 }">
            <li>
	    	    <a href="${pageContext.request.contextPath}/m/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}">
	    	    <img src="${cases.caseThumbImg }" alt="${cases.caseTitle }"/>
	    	    <p>${cases.caseTitle }</p>
	    	    </a>
    	    </li>
      </c:if>
      <c:if test="${(status.index+1)%3 == 0 }">
            <li class="no_mar">
	    	    <a href="${pageContext.request.contextPath}/m/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}">
	    	    <img src="${cases.caseThumbImg }" alt="${cases.caseTitle }"/>
	    	    <p>${cases.caseTitle }</p>
	    	    </a>
    	    </li>
      </c:if>    
    </c:forEach>
      
      </ul>
    </div>
  </div>
  
  
   <!-- 代码 开始 -->
   
   <div class="anli_con"> 
   
    
    <div class="clear"></div>
     <!--本案例设计师-->
    <div class="mList_al_sjs">
     <div class="mTitle clearfix">
      <h4 class="fl">推荐设计师</h4>
      <span class="fr"><a href="${ctx }/m/designer/p1">更多&nbsp;>></a></span>
     </div>
     <c:forEach items="${designerlist }" var="designer" begin="0" end="1">
     
	     <div class="shejishiimginfo clearfix">
	      <div class="mList_al_sjs_img fl">
		      <a href="">
		      	<img src="${designer.designerPhotoImg }" style="width: 100%;height: 160px;"/>
		      </a>
	      </div>
	      <div class="mList_al_sjs_info fr">
	        <h5>${designer.designerName }</h5>
	        <p>职位等级:${designer.designerTitle }</p>
	        <p>从业时间：${designer.designerWorkTime }</p>
	        <p>擅长风格：${designer.designerStyle }</p>
	        <p>设计理念：
		        <c:choose>
		        
		        		<c:when test="${fn:length(designer.designerIdea)>20 }">${fn:substring(designer.designerIdea,0,20) }</c:when>
		        		<c:otherwise>${designer.designerIdea }</c:otherwise>
		        </c:choose>
	        </p>
	      </div>
	     </div>
     </c:forEach>
      
    </div>
    <div class="clear"></div>
   
        
  </div>
<!-- 代码 结束 -->
<script src="${ctx }/mobile/js/responsiveslides.min.js"></script>
<script src="${ctx }/mobile/js/slide.js"></script>

</div>

<!--底部导航 start-->
<jsp:include page="public/fotter.jsp"/>
<!--底部导航  end-->
<div class="" style="margin-bottom:100px;"></div>
${sessionScope.statistics.value }
${sessionScope.shangqiao.value }
</body>
</html>
