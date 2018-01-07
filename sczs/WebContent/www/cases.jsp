<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/> 
<%@ include file="/public/shangqiao.jsp" %> 
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<c:choose>
	<c:when test="${caseStyle=='全部'||empty caseStyle}">
		<title>装修风格展示-${cityCompany}三创装饰公司</title>
	</c:when>
	<c:otherwise> 
   		<title>${caseStyle}风格效果-${cityCompany}三创装饰公司</title>
   	</c:otherwise>
</c:choose>
<meta name="keywords" content="${scinterCasesSeoKeywordStr.value }">
<meta name="description" content="${scinterCasesSeoDescStr.value }">
<link type="text/css" href="${pageContext.request.contextPath}/www/css/style.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/www/js/list_pic.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/www/js/nav.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/www/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/www/js/minify(2).js"></script>
<script type="text/javascript" src="${ctx}/www/js/top.js"></script>
</head>

<body  onload="setTimeout(function() { window.scrollTo(0, 1)}, 100);">
<!--header start-->
<div class="header">
 <jsp:include page="../public/head.jsp"/>
    
   <!--nav start--> 
   <jsp:include page="../public/nav.jsp"/>
   <!--nav end-->  
  
  
  
  
  <div class="list_main w1180">
     <!--当前位置 start--><div class="list_position">您的当前位置：<a href="${ctx}/"> ${cityCompany}装修</a> > <a href=""> 案例展示</a></div><!--当前位置 end-->
     <!--分类 start-->
     <div class="list_fenl">
       <dl  id="caseStyle">
         <dd>风格</dd>
          <dt>
          <a id="caseStyleFirst">全部</a>
          <a >现代简约</a>
          <!-- <a >经典欧式</a> -->
          <a >混搭风格</a>
          <a >中式风格</a>
         <!--  <a >乡村田园</a> -->
          <a >美式乡村</a>
          <a >地中海</a>
          <a >北欧风格 </a>
          <!-- <a >淡雅时光</a> -->
          <!-- <a >其他</a> -->
         </dt>
       </dl>
       
       <!-- <dl id="caseAcreage" >
         <dd >面积</dd>
         <dt >
          <a id="caseAcreageFirst">全部</a>
          <a >50-80平米</a>
          <a >80-120平米</a>
          <a >120-150平米</a>
          <a >150平米以上</a>
          <a >其他</a>
         </dt>
       </dl>
       
       <dl id="caseHouseType">
         <dd>户型</dd>
         <dt>
          <a id="caseHouseTypeFirst">全部</a>
          <a>一居</a>
          <a >两居</a>
          <a >三居</a>
          <a >多居</a>
          <a >复式</a>
          <a >别墅</a>
          <a >洋房</a>
          <a >会所</a>
          <a >其他</a>
         </dt>
       </dl> -->
      
     </div>
     <!--分类 end-->

       
     <!--案例列表 start-->
    <div class="list_al clearfix">
     <c:forEach items="${listCases }" var="cases" varStatus="status">
      <c:if test="${(status.index+1) % 4 != 0}" > 
      <dl>
        <div class="list_pic"><a href="${pageContext.request.contextPath}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}"><img src="${cases.caseThumbImg }" width="280 " height="213"></a></div>
        <dt><a href="${pageContext.request.contextPath}/designerMessage/p1?designerId=${cases.designerId}"><img src="${cases.designerPhotoImg }" width="70" height="70"></a></dt>
        <dd>
          <div class="list_info">
            <span><b style="color:#f39800">${cases.caseTitle }</b>&nbsp;&nbsp;${cases.caseStyle }</span>
            <span>${cases.caseStyle }&nbsp;|&nbsp;${cases.caseAcreage }&nbsp;|&nbsp;&nbsp;<b style="color:#f39800">${cases.caseMoney }万</b>起</span>
          </div>
        </dd>
      </dl>
      </c:if>
      <c:if test="${(status.index+1) % 4 == 0}">
		  <dl class="no_mar">
			<div class="list_pic"><a href="${pageContext.request.contextPath}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}"><img src="${cases.caseThumbImg }" width="280" height="213"></a></div>
	        <dt><a href="${pageContext.request.contextPath}/designerMessage/p1?designerId=${cases.designerId}"><img src="${cases.designerPhotoImg }" width="70" height="70"></a></dt>
	        <dd>
	          <div class="list_info">
	            <span><b style="color:#f39800">${cases.caseTitle }</b>&nbsp;&nbsp;${cases.caseStyle }</span>
	            <span>${cases.caseStyle }&nbsp;|&nbsp;${cases.caseAcreage }&nbsp;|&nbsp;&nbsp;<b style="color:#f39800">${cases.caseMoney }万</b>起</span>
	          </div>
	        </dd>	       
	      </dl>
      </c:if>  	  	
     </c:forEach>
    </div>
    <!--案例列表 end-->
    
     <div class="list_page">
       <div class="Page clearfix">
       	
       	 <c:if test="${page.pageNo > 1}" >
         	<a href="${pageContext.request.contextPath}/cases/p${page.pageNo-1 }">上一页</a>     
         </c:if>
         <c:if test="${page.pageNo <= 1}" >
         	<a href="javascript:void(0);">上一页</a>     
         </c:if>
         
         <c:forEach var="i" begin="1" end="${page.pageCount}">
         	<a <c:if test='${page.pageNo == i }'>style="background-color:#f39800;color:#FFF;"</c:if> href="${pageContext.request.contextPath}/cases/p${i }">&nbsp;${i}&nbsp;</a>
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
    
<!--  推荐文章 start-->  
 <div class="list_txt">
      <div class="list_title">
        <h3>您可能喜欢以下文章</h3>
        <span><a href="${pageContext.request.contextPath }/specase/p1?type=说装修">查看更多...</a></span>
      </div>
     
    <div class="slide_m1 clearfix fixed"> <a href="javascript:;" id="LeftID3" class="btn btn_l"></a>
      <div class="slide_c list_txt_con" id="ScollName3">
        <ul>
       	 <c:forEach items="${listNews }" var="news" begin="0" end="10">
		  <li>
            <div class="list_txt_info clearfix">
            <a href="${pageContext.request.contextPath}/newDetail?newsId=${news.newsId}&type=${news.type}">
              <span><img src="${news.thumbImg }" width="180" height="137"></span>
            </a>
            <h4><a href="${pageContext.request.contextPath}/newDetail?newsId=${news.newsId}&type=${news.type}">${news.title }</a></h4>
           
            </div>
          </li>	        
        </c:forEach>
        </ul>
      </div>
      <a href="javascript:;" id="RightID3" class="btn btn_r"></a> </div>
    <script>
	   $(function() {
			var ads = new ScrollPicleft();
			ads.scrollContId = "ScollName3"; // 内容容器ID""
			ads.arrLeftId = "LeftID3"; //左箭头ID
			ads.arrRightId = "RightID3"; //右箭头ID
	
			ads.frameWidth = 1130; //显示框宽度
	
			ads.pageWidth = 1; //翻页宽度
	
			ads.speed = 1; //移动速度(单位毫秒，越小越快)
			ads.space = 1; //每次移动像素(单位px，越大越快)
			ads.autoPlay = true; //自动播放
			ads.autoPlayTime = 0.03; //自动播放间隔时间(秒)
	
			ads.initialize(); //初始化
		});
     </script>
      <div class="clearfix"></div>
    </div>  
<!--    推荐文章 end-->
  </div>
</div>
<!--footer start-->
<jsp:include page="../public/fotter.jsp" />
<!--右侧悬浮 开始-->
<jsp:include page="../public/fastToTop.jsp"/>
<!--右侧悬浮 结束-->

<div class="layout">  
</div>	
<script src="${pageContext.request.contextPath}/www/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">


	 var caseStyleP = '${sessionScope.caseStyle}';
	 var caseAcreageP = '${sessionScope.caseAcreage}';
	 var caseHouseTypeP = '${sessionScope.casesType}';
	 if(caseStyleP == "" || caseStyleP == "全部" ){
		 $("#caseStyleFirst").attr("class","all");
	 }else{
		 $("#caseStyle  dt a:contains("+caseStyleP+")").attr("class","all");
	 }
	 if(caseAcreageP == "" || caseAcreageP == "全部"){
		 $("#caseAcreageFirst").attr("class","all");
	 }else{
		 $("#caseAcreage  dt a:contains("+caseAcreageP+")").attr("class","all");
	 }
	 if(caseHouseTypeP == "" || caseHouseTypeP == "全部"){
		 $("#caseHouseTypeFirst").attr("class","all");
	 }else{
		 $("#caseHouseType  dt a:contains("+caseHouseTypeP+")").attr("class","all");
	 }
	 
	 $("#caseStyle dt a").bind("click",function(){
		 
		 var casesType1 = '${sessionScope.casesType}';
		 var caseAcreage1 =  '${sessionScope.caseAcreage}';
		 var caseStyle1 = $(this).text();
		 window.location.href = "${ctx}/cases/p1?casesType="+casesType1+"&caseAcreage="+caseAcreage1+"&caseStyle="+caseStyle1;
		
	 });
	 $("#caseAcreage dt a").bind("click",function(){
		 
		 var casesType2 =  '${sessionScope.casesType}';
		 var caseAcreage2 = $(this).text();
		 var caseStyle2 =  '${sessionScope.caseStyle}';
		 window.location.href = "${ctx}/cases/p1?casesType="+casesType2+"&caseAcreage="+caseAcreage2+"&caseStyle="+caseStyle2;
		
	 });
	 $("#caseHouseType dt a").bind("click",function(){
		
		 var casesType3 = $(this).text();
		 var caseAcreage3 = '${sessionScope.caseAcreage}';
		 var caseStyle3 =  '${sessionScope.caseStyle}';
		 window.location.href = "${ctx}/cases/p1?casesType="+casesType3+"&caseAcreage="+caseAcreage3+"&caseStyle="+caseStyle3;
		
	 });
	function faseMoney(){
		
		window.location.href="${ctx }/orderLine";
	}
	</script>
	${sessionScope.statistics.value }
	${sessionScope.shangqiao.value }
</body>
</html>
