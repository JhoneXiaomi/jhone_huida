<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/head.jsp" %>   
<c:set var="ctx" value="${pageContext.request.contextPath }"/>  
<!DOCTYPE html >
<html>
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
			<img src="mobile/images/bd_37800_01.jpg" />
		    <img src="mobile/images/bd_37800_02.jpg" />
		    <img src="mobile/images/bd_37800_03.jpg" />
		    <img src="mobile/images/bd_37800_04.jpg" />
		    <img src="mobile/images/bd_37800_05.jpg" />
		    <img src="mobile/images/bd_37800_06.jpg" />
	</div>
	<!-- fotter begin -->
	<jsp:include page="public/fotter.jsp" />
	<!-- fotter begin-->
</body>
</html>