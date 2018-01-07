<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ include file="public/shangqiao.jsp" %> 
<c:set var="ctx"  value="${pageContext.request.contextPath }"/> 
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>${scinterAboutSeoTitleStr.value }</title>
	<meta name="keywords" content="${scinterAboutSeoKeywordStr.value }">
	<meta name="description" content="${scinterAboutSeoDescStr.value }">
	<link type="text/css" rel="stylesheet" href="${ctx }/www/css/style.css">
	<script type="text/javascript" src="${ctx }/www/js/nav.js"></script>
</head>
<body>
<!--header start-->
<jsp:include page="public/head.jsp"/>
  <!--nav start--> 
  <jsp:include page = "public/nav.jsp"/>
  <!--nav end--> 
  
</div>
<!--header end-->



<div class="aboutSC_Main">
   <img src="${ctx }/www/images/aboutSC001.jpg" width="100%" alt="">
   <img src="${ctx }/www/images/aboutSC0022.jpg" width="100%" alt="">
   <img src="${ctx }/www/images/aboutSC003.jpg" width="100%" alt="">
   <img src="${ctx }/www/images/aboutSC004.jpg" width="100%" alt="">
   <img src="${ctx }/www/images/aboutSC005.jpg" width="100%" alt="">
   <img src="${ctx }/www/images/aboutSC006.jpg" width="100%" alt=""> 
   <img src="${ctx }/www/images/aboutSC007.jpg" width="100%" alt="">
   <img src="${ctx }/www/images/aboutSC008.jpg" width="100%" alt="">
   <img src="${ctx }/www/images/aboutSC009.jpg" width="100%" alt="">
</div>

<!--footer start-->
<jsp:include page="public/fotter.jsp"/>
<!-- footer end -->
</body>
</html>
