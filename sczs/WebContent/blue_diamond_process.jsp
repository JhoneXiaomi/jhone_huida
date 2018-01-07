<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="ctx"  value="${pageContext.request.contextPath }"/>  
<%@ include file="public/shangqiao.jsp" %>  
<!doctype html>
<html>
<head>

	<meta charset="utf-8">
	<title>${scinterDiamondSeoTitleStr.value }</title>
	<meta name="keywords" content="${scinterDiamondSeoKeywordStr.value }">
	<meta name="description" content="${scinterDiamondSeoKeywordStr.value }">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/www/css/style.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/www/js/nav.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/www/js/minify(2).js"></script>
</head>

<body>

<!--header start-->
<div class="header">
 <jsp:include page="public/head.jsp"/>
  <!--nav start--> 
  <jsp:include page = "public/nav.jsp"/>
  <!--nav end-->  
  
</div>
<!--header end-->


<div class="lanzuanMain w1180">
    <img src="${pageContext.request.contextPath}/www/images/bluePck_01.jpg"/>
    <img src="${pageContext.request.contextPath}/www/images/bluePck_02.jpg"/>
    <img src="${pageContext.request.contextPath}/www/images/bluePck_03.jpg"/>
    <img src="${pageContext.request.contextPath}/www/images/bluePck_04.jpg"/>
    <img src="${pageContext.request.contextPath}/www/images/bluePck_05.jpg"/>
    <img src="${pageContext.request.contextPath}/www/images/bluePck_06.jpg"/>
    <img src="${pageContext.request.contextPath}/www/images/bluePck_07.jpg"/>
</div>
<!--footer start-->
<jsp:include page="public/fotter.jsp"/>
<!-- footer end -->	
</body>
</html>
