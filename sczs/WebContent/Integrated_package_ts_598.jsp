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
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<script type="text/javascript" src="${ctx }/www/js/nav.js"></script>
	<script type="text/javascript" src="${ctx }/www/js/jquery-1.8.3.min.js"></script>
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

<div class="taocan_main w1180">
  <div class="taocan">
    <div class="marT"></div>
    <img src="${ctx }/www/images/tssc/ts_598_01.jpg"/>
    <img src="${ctx }/www/images/tssc/ts_598_02.jpg"/>
    <img src="${ctx }/www/images/tssc/ts_598_03.jpg"/>
    <img src="${ctx }/www/images/tssc/ts_598_04.jpg"/>
    <img src="${ctx }/www/images/tssc/ts_598_05.jpg"/>
    <img src="${ctx }/www/images/tssc/ts_598_06.jpg"/>
    <img src="${ctx }/www/images/tssc/ts_598_07.jpg"/>
    <img src="${ctx }/www/images/tssc/ts_598_08.jpg"/>
  </div>
</div>

<div class="clearfix"></div>
<!--footer start-->
<jsp:include page="public/fotter.jsp"/>
</body>
</html>
