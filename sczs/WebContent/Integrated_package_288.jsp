<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"/>     
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
  <jsp:include page="public/head.jsp"/>
  <!--nav start--> 
  <jsp:include page = "public/nav.jsp"/>
  <!--nav end--> 
</div>
<!--header end-->

<div class="taocan_main w1180">
  <div class="taocan">
    <div class="marT"></div>
    <img src="${ctx }/www/images/bj28800_02.jpg"/>
    <img src="${ctx }/www/images/bj28800_04.jpg"/>
    <img src="${ctx }/www/images/bj28800_05.jpg"/>
  </div>
</div>
<div class="clearfix"></div>
<!--footer start-->
<jsp:include page="public/fotter.jsp"/>
<jsp:include page="public/faster.jsp"/>
<!--footer end-->
</body>
</html>
