<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/head.jsp" %>    
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<title>${xzzsHouseSeoTitle.value }</title>
	<meta name="description" content="${xzzsHouseSeoDesc.value }"/>
	<meta name="keywords" content="${xzzsHouseSeoKeyword.value }"/>
	<link href="${ctx }/mobile/css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	
	<div class="activity_cls">
		<img src="${ctx }/mobile/images/bj/activity_bj_01.jpg"/>
		<img src="${ctx }/mobile/images/bj/activity_bj_02.jpg"/>
		<img src="${ctx }/mobile/images/bj/activity_bj_03.jpg"/>
	</div>
	
	<!-- fotter begin -->
	<jsp:include page="public/fotter.jsp" />
	<!-- fotter begin-->
</body>
</html>