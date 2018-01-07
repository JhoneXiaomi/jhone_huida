<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="ctx" value="${pageContext.request.contextPath }"/> 
<%@ include file="/public/shangqiao.jsp" %> 
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>${designer.designerName}设计师-${cityCompany}三创</title>
<meta name="keywords" content="${statScinterhomeSeoKeyword.value }">
<meta name="description" content="${statScinterHomeSeoDesc.value }">
<link type="text/css" href="${pageContext.request.contextPath}/www/css/style.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/www/js/nav.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/www/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/www/js/minify(2).js"></script>


    <!--底部报价 js-->
	<script src="${ctx }/www/js/jquery-1.10.2.min.js" type="text/javascript"></script>
	<script>
	   var jq = jQuery.noConflict();
	</script>
	<script type="text/javascript" src="${ctx }/www/js/db_01.js"></script>
	<script type="text/javascript" src="${ctx }/www/js/GlobalProvinces.js"></script>
	<script src="${ctx }/www/js/bdzxbj_bottom_new.js" type="text/javascript"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/www/js/commen.js"></script>
	
	<!--底部报价 js-->
</head>	

<body>
<!--header start-->
<div class="header">
 <jsp:include page="../public/head.jsp"/>
  
</div>
<!--header end-->   
   <!--nav start--> 
   <jsp:include page="../public/nav.jsp"/>
   <!--nav end-->  


<div class="cont_main w1180">
  <div class="list_position">您的当前位置：<a href="${ctx}/"> ${cityCompany}装修</a>> <a href="${ctx }/designer/p1"> 设计团队</a> > <a href="javascript:void(0)"> 案例设计师</a></div>
  
  <div class="list_alpic">
     
    <!--设计师介绍 start--> 
  <div class="list_per clear">
     <div class="list_per_left fl">
       <div class="list_per_img">
       <a href=""><img src="${designer.designerPhotoImg }" width="240" height="280" alt=""></a></div>
       <a href="${pageContext.request.contextPath}/orderLine?designerName=${designer.designerName}&designerSex=${designer.designerSex}"><div class="list_per_yuy">预约设计师</div></a>
     </div>
     
     <div class="list_per_right fl">
       <h2>${designer.designerName }</h2>
       <p><b style="color:#f39800">职位等级：</b>${designer.designerTitle }</p>
       <p><b style="color:#f39800">从业时间：</b>${designer.designerWorkTime }</p>
       <p><b style="color:#f39800">擅长风格：</b>${designer.designerStyle }</p>
       <p><b style="color:#f39800">设计理念：</b>
	       	<c:choose>
	       	
	  	     	<c:when test="${fn:length(designer.designerIdea)>=50 }">
	  	     	   ${fn:substring(designer.designerIdea,0,50)}....
	  	     	</c:when>
	  	     	<c:otherwise>${designer.designerIdea }</c:otherwise>
	       	</c:choose>
      </p>
     </div>
    
  </div>
   <!--设计师介绍 end-->
   
   <div class="clearfix"></div>
    <div class="list_per_al">
      <div class="list_title">
        <h3>相关案例</h3>
        <span><a href="${pageContext.request.contextPath}/cases/p1">查看更多>></a></span>
      </div>
    
      <div class="list_alpic_con clear">
      	<c:forEach items="${caseList }" var="cases" varStatus="status">
      		<c:if test="${(status.index+1) % 4 != 0}">
		 		<dl>
		          <dt>
			         <a href="${pageContext.request.contextPath}/casesDetail?casesId=${cases.caseId }&designerId=${designer.designerId}">
			          <img src="${cases.caseThumbImg }" width="280" height="213" alt="">
			          </a>
		          </dt>
		          <dd>
		             <div class="list_al_info">
		               <p><a href="">【 ${cases.caseTitle }】</a></p>
		               <div class="list_info_js">${cases.caseStyle } &nbsp;&nbsp;${cases.caseHouseType } &nbsp;&nbsp;${cases.caseAcreage }</div>
		             </div>
		          </dd>
		        </dl>     		
      		</c:if>
		 	<c:if test="${(status.index+1) % 4 == 0}">
				<dl class="no_mar">
		          <dt>
			          <a href="${pageContext.request.contextPath}/casesDetail?casesId=${cases.caseId }&designerId=${designer.designerId}">
			          <img src="${cases.caseThumbImg }" width="280" height="213" alt="">
			          </a>
		          </dt>
		          <dd>
		             <div class="list_al_info">
		               <p><a href="">【 ${cases.caseTitle }】</a></p>
		               <div class="list_info_js">${cases.caseStyle } &nbsp;&nbsp;${cases.caseHouseType } &nbsp;&nbsp;${cases.caseAcreage }</div>
		             </div>
		          </dd>
		        </dl>     	
		     </c:if>  	       		
      	</c:forEach>    
      </div>
      
      <!-- 设计师相关的案例展示结束-->
 	 <div class="list_page">
       <div class="Page clearfix">
       	
       	 <c:if test="${page.pageNo > 1}" >
         	<a href="${pageContext.request.contextPath}/designerMessage/p${page.pageNo-1 }?designerId=${designer.designerId}">上一页</a>     
         </c:if>
         <c:if test="${page.pageNo <= 1}" >
         	<a href="javascript:void(0);">上一页</a>     
         </c:if>
         
         <c:forEach var="i" begin="1" end="${page.pageCount}">
         	<a <c:if test='${page.pageNo == i }'>style="background-color:#f39800;color:#FFF;"</c:if> href="${pageContext.request.contextPath}/designerMessage/p${i }?designerId=${designer.designerId}">&nbsp;${i}&nbsp;</a>
		 </c:forEach>
		 
		 <c:if test="${page.pageNo < page.pageCount}" >
         	<a href="${pageContext.request.contextPath}/designerMessage/p${page.pageNo+1 }?designerId=${designer.designerId}">下一页</a>
         </c:if>
         <c:if test="${page.pageNo >= page.pageCount}" >
         	<a href="javascript:void(0);">下一页</a>     
         </c:if>
         
         <a href="${pageContext.request.contextPath}/designerMessage/p${page.pageCount }?designerId=${designer.designerId}">最后一页</a> <span>${page.totalRecords }条记录 ${page.pageNo }/${page.pageCount } 页</span>
       </div>
    </div>
      
    </div>
    
    
  </div>
</div>



<!--footer start-->
<jsp:include page="../public/fotter.jsp"/>
<!-- footer end -->
</body>
</html>
