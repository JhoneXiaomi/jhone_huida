<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="ctx" value="${pageContext.request.contextPath}"/> 
<%@ include file="public/shangqiao.jsp" %> 
<!doctype html>
<html>
<head>
<meta charset="utf-8">
	<title>${scinterPackageSeoTitle.value }</title>
	<meta name="keywords" content="${scinterPackageSeoKeyword.value }">
	<meta name="description" content="${scinterPackageSeoDesc.value }">
	<link rel="stylesheet" type="text/css" href="${ctx }/www/css/style.css">
	<script type="text/javascript" src="${ctx }/www/js/nav.js"></script>
	<script type="text/javascript" src="${ctx }/www/js/jquery-1.8.3.min.js"></script>
</head>

<body>
<!--header start-->
<div class="header">
  <jsp:include page="public/head.jsp"/>
 <!--nav start--> 
  <jsp:include page="public/nav.jsp"/>
  <!--nav end--> 
</div>
<!--header end-->


<div class="taocan_main w1180">
  <div class="taocan">
    <div class="marT"></div>
    <img src="${ctx }/www/images/taocan_01.jpg">
    <img src="${ctx }/www/images/taocan_03.jpg">
    <img src="${ctx }/www/images/taocan_04.jpg">
    <div class="marT"></div>
    <img src="${ctx }/www/images/taocan_06.jpg">
    <img src="${ctx }/www/images/taocan_07.jpg">
    <img src="${ctx }/www/images/taocan_09.jpg">
    <img src="${ctx }/www/images/taocan_10.jpg">
    <img src="${ctx }/www/images/taocan_11.jpg">
    <img src="${ctx }/www/images/taocan_14.jpg">
    <img src="${ctx }/www/images/taocan_15.jpg">
    <img src="${ctx }/www/images/taocan_16.jpg">
    <img src="${ctx }/www/images/taocan_19.jpg">
    <img src="${ctx }/www/images/taocan_20.jpg">
    <img src="${ctx }/www/images/taocan_21.jpg">    
    <img src="${ctx }/www/images/taocan_22.jpg">
    <img src="${ctx }/www/images/taocan_24.jpg">
    <img src="${ctx }/www/images/taocan_25.jpg">
    <img src="${ctx }/www/images/taocan_26.jpg">
    <img src="${ctx }/www/images/taocan_27.jpg">
    <img src="${ctx }/www/images/taocan_28.jpg">
  </div>
</div>
<div class="clearfix"></div>

<!--footer start-->
<jsp:include page="public/fotter.jsp"/>
<!--footer end-->
</body>
</html>
