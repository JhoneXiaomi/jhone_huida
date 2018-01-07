<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/head.jsp" %>   
<c:set var="ctx" value="${pageContext.request.contextPath }"/>  
<!DOCTYPE html >
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<title>新洲555装修套餐</title>
	<meta name="description" content="${xzzsHouseSeoDesc.value }"/>
	<meta name="keywords" content="${xzzsHouseSeoKeyword.value }"/>
	<link href="${ctx }/mobile/css/style.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="${ctx }/mobile/js/jquery-1.10.2.min.js"></script>
</head>
<body>
	
	<div class="activity_cls">
			<a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn"><img src="${ctx }/mobile/images/xz555_01.jpg" /></a>
			<img src="${ctx }/mobile/images/xz555_02.jpg" />
			<img src="${ctx }/mobile/images/xz555_03.jpg" />
			<img src="${ctx }/mobile/images/xz555_04.jpg" />
			<img src="${ctx }/mobile/images/xz555_05.jpg" />
			<img src="${ctx }/mobile/images/xz555_06.jpg" />
	</div>
	<!-- fotter begin -->
	<jsp:include page="public/fotter.jsp" />
	<!-- fotter begin-->
</body>
</html>