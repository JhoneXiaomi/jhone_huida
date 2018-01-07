<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="ctx" value="${pageContext.request.contextPath }"/> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="${packageSeoKeyword.value }"/>
<meta name="description" content="${packageSeoDesc.value }"/>
<title>${packageSeoTitle.value }</title>
<link type="text/css" rel="stylesheet" href="${ctx }/www/css/style.css"/>
<script type="text/javascript" src="${ctx }/www/js/index.js"></script>
<script type="text/javascript" src="${ctx }/www/js/jquery-1.8.2.min.js"></script>
</head>
<body>
	<!--header start-->
	<jsp:include page="public/header.jsp" />
	<!--header end-->
	  
  	<!--nav start-->
	<jsp:include page="public/nav.jsp" />
    <!--nav end-->
	<!--二级页面  主体部分 start-->
	
	<div class="ej_main">
 
	  <img src="${ctx }/www/images/sjz39800_01.jpg" />
	  <img src="${ctx }/www/images/sjz39800_02.jpg" />
	  <img src="${ctx }/www/images/sjz39800_03.jpg" />
	  <img src="${ctx }/www/images/sjz39800_04.jpg" />
	  <img src="${ctx }/www/images/sjz39800_05.jpg" />
	  <img src="${ctx }/www/images/sjz39800_06.jpg" />
	</div>
	
	<!--二级页面  主体部分 end-->

	<!--footer start-->
	<jsp:include page="public/fotter.jsp" />
	<!--footer end-->
	${sessionScope.statistics.value }
${sessionScope.shangqiao.value }
</body>
</html>

