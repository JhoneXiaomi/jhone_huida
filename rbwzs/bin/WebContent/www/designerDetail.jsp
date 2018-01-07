<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp" %>       
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="${rbwhomeSeoKeyword.value }"/>
<meta name="description" content="${rbwHomeSeoDesc.value }"/>
<title>${statScinterHomeSeoTitle.value }</title>
<link type="text/css" rel="stylesheet" href="${ctx }/www/css/style.css"/>
</head>
<body>
	<!--header start-->
	<jsp:include page="public/header.jsp" />
	<!--header end-->
    <!--nav start-->
	<jsp:include page="public/nav.jsp" />
    <!--nav end-->
	<!--二级页面  主体部分 start-->

	<div class="ej_main">
	 
	  <div class="ej_weizhi">
	     <div class="w1200 clearfix">
	       <div class="ej_weizhi_left fl"><span>A</span>DESIGNER &nbsp;设计团队</div>
	       <div class="ej_local_right fr">您的当前位置：<a href="${ctx }/">首页</a>&nbsp;>>&nbsp;<a href="${ctx }/designer/p1">设计团队</a></div>
	     </div> 
	  </div>

  <!--活动列表 start-->
   <div class="cont_shejishi w1200">
      <div class="bigTitle">设计师</div>
       <!--设计师介绍 start--> 
	  	<div class="list_per clear">
	     <div class="list_per_left fl">
	       <div class="list_per_img">
	       <img src="${designer.designerPhotoImg }" width="240" height="280" alt="${designer.designerName}"/>
	       </div>
	       <a href="${ctx}/orderLine?designerName=${designer.designerName}&designerSex=${designer.designerSex}">
	      	 	<div class="list_per_yuy">预约设计师</div>
	       </a>
	     </div>
	     
	     <div class="list_per_right fl">
	       <div class="bor clearfix">
	          <h2 class="fl">${designer.designerName }</h2>
	          <i class="vip fl"></i>
	          <span class="pos fl">${designer.designerTitle }</span>
	          <em class="fr"></em>
	       </div>
	       <p><b style="color:#009c42">级别：</b>${designer.designerTitle }</p>
	       <p><b style="color:#009c42">从业时间：</b>${designer.designerWorkTime }年</p>
	       <p><b style="color:#009c42">擅长风格：</b>${designer.designerStyle }</p>
	       <p><b style="color:#009c42">设计理念：</b>${designer.designerIdea } </p>
	     </div>
	  </div>
   <!--设计师介绍 end-->
   
   <div class="clearfix"></div>
    <div class="list_per_al">
       <div class="bigTitle">设计师的其他案例</div>
    
      <div class="list_alpic_con clear">
	      <c:forEach items="${caseList }" var="cases" varStatus="status" begin="0" end="7">
	      	<c:if test="${(status.index+1)%4 != 0 }">
	        <dl>
	          <dt><a href="${ctx}/casesDetail?casesId=${cases.caseId }&designerId=${designer.designerId}">
	          <img src="${cases.caseThumbImg }" width="280" height="213" alt="${cases.caseTitle }"/></a></dt>
	          <dd>
	             <div class="list_al_info">
	               <p><a href="">【 ${cases.caseTitle }】</a></p>
	               <div class="list_info_js">${cases.caseStyle } &nbsp;&nbsp; ${cases.caseHouseType } &nbsp;&nbsp; ${cases.caseAcreage }平米</div>
	             </div>
	          </dd>
	        </dl>
	        </c:if>
	        <c:if test="${(status.index+1)%4 == 0 }">
	        <dl class="no_mar">
	          <dt ><a href="${ctx}/casesDetail?casesId=${cases.caseId }&designerId=${designer.designerId}">
	          <img src="${cases.caseThumbImg }" width="280" height="213" alt="${cases.caseTitle }"/></a></dt>
	          <dd>
	             <div class="list_al_info">
	               <p><a href="">【 ${cases.caseTitle }】</a></p>
	               <div class="list_info_js">${cases.caseStyle } &nbsp;&nbsp; ${cases.caseHouseType } &nbsp;&nbsp; ${cases.caseAcreage }平米</div>
	             </div>
	          </dd>
	        </dl>
	        </c:if>
	      </c:forEach>  
	        
      </div>
      
    </div>
    
   </div>
  <!--活动列表 end-->
    
</div>


<!--二级页面  主体部分 end-->
	<!--footer start-->
	<jsp:include page="public/fotter.jsp" />
	<!--footer end-->
</body>
</html>
