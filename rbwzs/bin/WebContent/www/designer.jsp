<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
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
       <div class="ej_weizhi_left fl"><span>D</span>ESIGNER &nbsp;设计师</div>
       <div class="ej_local_right fr">您的当前位置：<a href="${ctx }/">首页</a>&nbsp;>>&nbsp;<a href="javascrip:void(0)">设计师</a></div>
     </div> 
  </div>
  
  
  
  <!--设计师列表 start-->
   <div class="w1200"> 
    <div style="margin-top:20px;"></div>
    <div class="bigTitle">设计师</div>
    <div class="list_al clearfix">
      <c:forEach items="${designerList }" var="designer" varStatus="status">
      		 <c:if test="${(status.index+1) % 4 != 0}">
			      		 
				  <dl>
			        <div class="list_pic">
				         <a href="${ctx}/casesDetail?casesId=${designer.caseId }&designerId=${designer.designerId}">
				       		 <img src="${designer.caseThumbImg }" width="280" height="213"/>
				       	 </a>	 
			        </div>
			        <dt>
				        <a href="${ctx}/designerDetail/p1?designerId=${designer.designerId}">
				        	<img src="${designer.designerPhotoImg }" width="70" height="70"/>
				        </a>
			        </dt>
			        <dd>
			          <div class="list_info">
			            <span><b style="color:#009c42">${designer.designerName }</b>&nbsp;&nbsp;设计师</span>
			            <span>${designer.designerWorkTime}任&nbsp;&nbsp;
			            <div class="list_p_yy">
			            	<a href="${ctx}/designerDetail/p1?designerId=${designer.designerId}">预约</a>
			            </div>
			            </span>
			          </div>
			        </dd>
			      </dl>      		 
      		 </c:if>
	  </c:forEach>
      
    </div>
    
    
    </div>
  <!--设计师列表 end-->
    
    
 <div class="w1200">
  <div class="Page clearfix">
	 	<c:if test="${page.pageNo > 1}" >
         	<a href="${pageContext.request.contextPath}/designer/p${page.pageNo-1 }">上一页</a>     
         </c:if>
         <c:if test="${page.pageNo <= 1}" >
         	<a href="javascript:void(0);">上一页</a>     
         </c:if>
         
         <c:forEach var="i" begin="1" end="${page.pageCount}">
         	<a <c:if test='${page.pageNo == i }'>style="background-color:#009c42;color:#FFF;"</c:if> href="${pageContext.request.contextPath}/designer/p${i }">&nbsp;${i}&nbsp;</a>
		 </c:forEach>
		 
		 <c:if test="${page.pageNo < page.pageCount}" >
         	<a href="${pageContext.request.contextPath}/designer/p${page.pageNo+1 }">下一页</a>
         </c:if>
         <c:if test="${page.pageNo >= page.pageCount}" >
         	<a href="javascript:void(0);">下一页</a>     
         </c:if>
         
         <a href="${pageContext.request.contextPath}/designer/p${page.pageCount }">最后一页</a> <span>${page.totalRecords }条记录 ${page.pageNo }/${page.pageCount } 页</span>
          
       </div>
 </div>
  
  
</div>



  <!--装修流程 start-->
 <div class="liucheng w1200">
    
    <div style="margin-top:20px;"></div>
    <div class="bigTitle">装修流程</div>
    <div class="liucheng_con">
      <ul class="clearfix">
        <li>
            <i class="zxlc_ico1"></i>
            <span>收房量房</span>
        </li>
        
        <li>
            <i class="zxlc_ico2"></i>
            <span>前期准备</span>
        </li>
        
        <li>
            <i class="zxlc_ico3"></i>
            <span>选装修公司</span>
        </li>
        
        <li>
            <i class="zxlc_ico4"></i>
            <span>设计阶段</span>
        </li>
        
        <li>
            <i class="zxlc_ico5"></i>
            <span>材料选购</span>
        </li>
        
        <li>
            <i class="zxlc_ico6"></i>
            <span>施工阶段</span>
        </li>
        
        
        <li>
            <i class="zxlc_ico7"></i>
            <span>竣工验收</span>
        </li>
        
        <li>
            <i class="zxlc_ico8"></i>
            <span>软装配饰</span>
        </li>
        
        <li class="no_mar">
            <i class="zxlc_ico9"></i>
            <span>装修保障</span>
        </li>
      </ul>
    </div>
    
 </div>
 <div class="clear"></div>
	<!--装修流程 end-->

	<!--二级页面  主体部分 end-->

	<!--footer start-->
	<jsp:include page="public/fotter.jsp" />
	<!--footer end-->
</body>
</html>
