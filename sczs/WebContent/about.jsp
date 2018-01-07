<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"/>    
<%@ include file="public/shangqiao.jsp" %> 
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>${scinterAboutSeoTitleStr.value }</title>
	<meta name="keywords" content="${scinterAboutSeoKeywordStr.value }">
	<meta name="description" content="${scinterAboutSeoDescStr.value }">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/www/css/style.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/www/js/nav.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/www/js/minify(2).js"></script>
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
   <img src="${pageContext.request.contextPath}/www/images/aboutSC001.jpg" width="100%" alt="">
   <img src="${pageContext.request.contextPath}/www/images/aboutSC002.jpg" width="100%" alt="">
   <img src="${pageContext.request.contextPath}/www/images/aboutSC003.jpg" width="100%" alt="">
   <c:choose>
   	<c:when test="${sessionScope.branchCompany == 'tssc' }">
   	<img src="${pageContext.request.contextPath}/www/images/aboutTSSC004.jpg" width="100%" alt="">
   	</c:when>
   	<c:otherwise>
   	 <img src="${pageContext.request.contextPath}/www/images/aboutSC004.jpg" width="100%" alt="">
   	</c:otherwise>
   </c:choose>
   <img src="${pageContext.request.contextPath}/www/images/aboutSC005.jpg" width="100%" alt="">
   <img src="${pageContext.request.contextPath}/www/images/aboutSC006.jpg" width="100%" alt=""> 
   <img src="${pageContext.request.contextPath}/www/images/aboutSC007.jpg" width="100%" alt="">
   <img src="${pageContext.request.contextPath}/www/images/aboutSC008.jpg" width="100%" alt="">
   <img src="${pageContext.request.contextPath}/www/images/aboutSC009.jpg" width="100%" alt="">
</div>


<!--footer start-->
<jsp:include page="public/fotter.jsp"/>
<!-- footer end -->
</body>
</html>
