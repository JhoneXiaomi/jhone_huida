<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="${rbwCasesSeoKeywordStr.value }"/>
<meta name="description" content="${rbwCasesSeoDescStr.value }"/>
<title>${rbwCasesSeoTitleStr.value }</title>
<link type="text/css" rel="stylesheet" href="${ctx }/www/css/style.css"/>
<script type="text/javascript" src="${ctx}/www/js/jquery-1.8.2.min.js"></script>
<style type="">
.all{background-color: #009c42;}
</style>
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
       <div class="ej_weizhi_left fl"><span>C</span>ASE &nbsp;装修案例</div>
       <div class="ej_local_right fr">您的当前位置：<a href="${ctx }/">首页</a>&nbsp;>>&nbsp;<a href="javascript:void(0)">装修案例</a></div>
     </div> 
  </div>
  <div class="anli_info w1200">
   <div style="margin-top:20px;"></div>
   <div class="bigTitle">新闻中心</div>
   
    <div class="ej_anli_fenl">
      <ul class="clearfix" id="caseStyle">
        <span>风格：</span>
        <li><a id="caseStyleFirst">全部</a></li>
        <li><a >现代简约</a></li>
        <li><a >经典欧式</a></li>
        <li><a >中式风格</a></li>
        <li><a >乡村田园</a></li>
        <li><a >地中海</a></li>
        <li><a >淡雅时光</a></li>
        <li><a >美式乡村</a></li>
        <li><a >其他</a></li>
      </ul>
      
      <ul class="clearfix" id="caseHouseType">
        <span>户型：</span>
        <li><a id="caseHouseTypeFirst">全部</a></li>
        <li><a >一居</a></li>
        <li><a >两居</a></li>
        <li><a >三居</a></li>
        <li><a >多居</a></li>
        <li><a >复式</a></li>
        <li><a >别墅</a></li>
        <li><a >洋房</a></li>
        <li><a >会所</a></li>
        <li><a >其他</a></li>
      </ul>
      
      <ul class="clearfix"  id="caseAcreage">
        <span>风格：</span>
        <li><a id="caseAcreageFirst">全部</a></li>
        <li><a >50-80平米</a></li>
        <li><a >80-120平米</a></li>
        <li><a >120-150平米</a></li>
        <li><a >150平米以上</a></li>
        <li><a >其他</a></li>
      </ul>
    </div>
  </div>
  
  <!--案例列表 start-->
    <div class="list_al clearfix w1200">
      <c:forEach items="${listCases }" var="cases" varStatus="status">
      
	      <c:if test="${(status.index+1) % 4 != 0}" > 
			  <dl>
		        <div class="list_pic">
		        <a href="${pageContext.request.contextPath}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}">
		        <img src="${cases.caseThumbImg }" width="280" height="213"/>
		        </a>
		        </div>
		        <dt>
		        <a href="${ctx}/designerDetail/p1?designerId=${cases.designerId}">
		        <img src="${cases.designerPhotoImg }" width="70" height="70"/>
		        </a>
		        </dt>
		        <dd>
		          <div class="list_info">
		            <span><b style="color:#009c42">${cases.caseTitle }</b>&nbsp;&nbsp;${cases.caseStyle }</span>
		            <span>${cases.caseStyle }&nbsp;|&nbsp;${cases.caseAcreage }平米&nbsp;|&nbsp;&nbsp;<b style="color:#009c42">${cases.caseMoney }万</b>起</span>
		          </div>
		        </dd>
		      </dl>	      
	      </c:if>
	       <c:if test="${(status.index+1) % 4 == 0}" > 
			  <dl class="no_mar">
		        <div class="list_pic">
			        <a href="${pageContext.request.contextPath}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}">
			       		 <img src="${cases.caseThumbImg }" width="280" height="213"/>
			        </a>
		        </div>
		        <dt>
		        <a href="${ctx}/designerDetail/p1?designerId=${cases.designerId}">
		        <img src="${cases.designerPhotoImg }" width="70" height="70"/>
		        </a>
		        </dt>
		        <dd>
		          <div class="list_info">
		            <span><b style="color:#009c42">${cases.caseTitle }</b>&nbsp;&nbsp;${cases.caseStyle }</span>
		            <span>${cases.caseStyle }&nbsp;|&nbsp;${cases.caseAcreage }平米&nbsp;|&nbsp;&nbsp;<b style="color:#009c42">${cases.caseMoney }万</b>起</span>
		          </div>
		        </dd>
		      </dl>	      
	      </c:if>
      </c:forEach>
      
    </div>
    <!--案例列表 end-->
 <div class="w1200">
  <div class="Page clearfix">
       	
       	 <c:if test="${page.pageNo > 1}" >
         	<a href="${pageContext.request.contextPath}/cases/p${page.pageNo-1 }">上一页</a>     
         </c:if>
         <c:if test="${page.pageNo <= 1}" >
         	<a href="javascript:void(0);">上一页</a>     
         </c:if>
         
         <c:forEach var="i" begin="1" end="${page.pageCount}">
         	<a <c:if test='${page.pageNo == i }'>style="background-color:#009c42;color:#FFF;"</c:if> href="${pageContext.request.contextPath}/cases/p${i }">&nbsp;${i}&nbsp;</a>
		 </c:forEach>
		 
		 <c:if test="${page.pageNo < page.pageCount}" >
         	<a href="${pageContext.request.contextPath}/cases/p${page.pageNo+1 }">下一页</a>
         </c:if>
         <c:if test="${page.pageNo >= page.pageCount}" >
         	<a href="javascript:void(0);">下一页</a>     
         </c:if>
         
         <a href="${pageContext.request.contextPath}/cases/p${page.pageCount }">最后一页</a> <span>${page.totalRecords }条记录 ${page.pageNo }/${page.pageCount } 页</span>
       </div>
 </div>
  
  
</div>


<!--二级页面  主体部分 end-->
	
	<!--footer start-->
		<jsp:include page="public/fotter.jsp" />
	<!--footer end-->
	<script type="text/javascript">
	 var caseStyleP = '${sessionScope.caseStyle}';
	 var caseAcreageP = '${sessionScope.caseAcreage}';
	 var caseHouseTypeP = '${sessionScope.casesType}';
	 if(caseStyleP == "" || caseStyleP == "全部" ){
		 $("#caseStyleFirst").attr("class","all");
	 }else{
		 $("#caseStyle  li a:contains("+caseStyleP+")").attr("class","all");
	 }
	 if(caseAcreageP == "" || caseAcreageP == "全部"){
		 $("#caseAcreageFirst").attr("class","all");
	 }else{
		 $("#caseAcreage  li a:contains("+caseAcreageP+")").attr("class","all");
	 }
	 if(caseHouseTypeP == "" || caseHouseTypeP == "全部"){
		 $("#caseHouseTypeFirst").attr("class","all");
	 }else{
		 $("#caseHouseType  li a:contains("+caseHouseTypeP+")").attr("class","all");
	 }
	 
	 $("#caseStyle li a").bind("click",function(){
		 
		 var casesType1 = '${sessionScope.casesType}';
		 var caseAcreage1 =  '${sessionScope.caseAcreage}';
		 var caseStyle1 = $(this).text();
		 window.location.href = "${ctx}/cases/p1?casesType="+casesType1+"&caseAcreage="+caseAcreage1+"&caseStyle="+caseStyle1;
		
	 });
	 $("#caseAcreage li a").bind("click",function(){
		 
		 var casesType2 =  '${sessionScope.casesType}';
		 var caseAcreage2 = $(this).text();
		 var caseStyle2 =  '${sessionScope.caseStyle}';
		 window.location.href = "${ctx}/cases/p1?casesType="+casesType2+"&caseAcreage="+caseAcreage2+"&caseStyle="+caseStyle2;
		
	 });
	 $("#caseHouseType li a").bind("click",function(){
		
		 var casesType3 = $(this).text();
		 var caseAcreage3 = '${sessionScope.caseAcreage}';
		 var caseStyle3 =  '${sessionScope.caseStyle}';
		 window.location.href = "${ctx}/cases/p1?casesType="+casesType3+"&caseAcreage="+caseAcreage3+"&caseStyle="+caseStyle3;
		
	 });
	</script>
		${sessionScope.statistics.value }
${sessionScope.shangqiao.value }
</body>
</html>
