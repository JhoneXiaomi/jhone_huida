<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp" %>    
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">	
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="keywords" content="${CurrentCase.seoKeyword }">
<meta name="description" content="${CurrentCase.seoDesc }">
<title>${CurrentCase.seoTitle }</title>
<link rel="stylesheet" type="text/css" href="${ctx }/mobile/css/style.css"/>
<script type="text/javascript" src="${ctx }/mobile/js/jquery-1.9.1.min.js"></script>
</head>
<body>
<div class="wrap">
  <div class="ej_top">
   <div class="ej_tit clearfix">
     <div class="back fl"><img src="${ctx }/mobile/images/backicon.png"/><a href="javascript:history.back();">返回</a></div>
     <div class="lanmu">案例详情</div>
   </div>
   <div class="ej_local fl">您的当前位置：<a href="${ctx }/">首页</a>> <a href="${ctx }/m/cases/p1">案例详情</a></div>
  </div>
 
 <div class="clear"></div>

  
   <!-- 代码 开始 -->
   <div class="anli_con"> 
   
    <div class="mList_al_info">
      <h4>${CurrentCase.caseTitle}</h4>
      <ul class="clear">
        <li>风格：${CurrentCase.caseStyle }</li>
        <li>户型：${CurrentCase.caseHouseType }</li>
        <li>面积：${CurrentCase.caseAcreage } 平方米</li>
        <li>预算： ${CurrentCase.caseMoney }万</li>
        <li>设计师：${CurrentCase.caseDesigner }</li>
      </ul>
    </div>
    
    <div class="slide_container">
      <ul class="rslides" id="slider">
      	<c:forEach items="${caseshowImages }" var="cases"> 
      	
      	 <li>
	     	  <img src="${cases.imageUrl }" alt="${CurrentCase.caseTitle}">
	          <p class="caption">${CurrentCase.caseTitle}</p>    	  
     	  </li>
      	</c:forEach>
      </ul>
    </div>
    <div class="clear"></div>
     <!--本案例设计师-->
    <div class="mList_al_sjs">
     <div class="mTitle clearfix">
      <h4 class="fl">装修楼盘</h4>
      <span class="fr"><a href="">更多&nbsp;>></a></span>
     </div>
      <div class="mList_al_sjs_img fl">
	      <a href="">
	      	<img src="${designer.designerPhotoImg }" style="width: 100%;height: 160px;">
	      </a>
      </div>
      <div class="mList_al_sjs_info fr">
        <h5>${designer.designerName }</h5>
        <p>职位等级：首席设计师</p>
        <p>从业时间：${designer.designerWorkTime }</p>
        <p>擅长风格：${designer.designerStyle }</p>
        <p>设计理念：${designer.designerIdea}。</p>
      </div>
    </div>
    <div class="clear"></div>
    <div class="mList_al_al">
      <h4>您可能还喜欢<p class="fr"><a href="">更多案例 >></a></p></h4>
      <ul>
		<c:forEach items="${casesList }" var="cases" varStatus="status" begin="0" end="5">
			<c:if test="${(status.index+1)%3 !=0 }">
			<li>
			    <a href="${ctx}/m/casesDetail?casesId=${cases.caseId }&designerId=${designer.designerId}" target="_blank">
				    <img src="${cases.caseThumbImg }" alt="${cases.caseTitle }" style="width: 100%;height: 66px;">
				    <p>${cases.caseTitle }</p>
			    </a>
		     </li>
		     </c:if>
		     <c:if test="${(status.index+1)%3 ==0 }">
			   <li class="no_mar">
			    <a href="${ctx}/m/casesDetail?casesId=${cases.caseId }&designerId=${designer.designerId}" target="_blank">
			  
				    <img src="${cases.caseThumbImg }" alt="${cases.caseTitle }" style="width: 100%;height: 66px;">
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
<jsp:include page="public/fotter.jsp"/>
<!--底部导航  end-->

<div class="" style="margin-bottom:100px;"></div>
${sessionScope.statistics.value }
${sessionScope.shangqiao.value }

</body>
</html>
