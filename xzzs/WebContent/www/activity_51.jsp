<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="ctx"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新洲五一活动</title>
<link rel="stylesheet" type="text/css" href="${ctx }/www/css/style.css"/>
</head>
<body>
<!--头部 start-->
	<jsp:include page="public/header.jsp"/>
	<!--头部 end-->
	<div class="clear"></div>
	<!--nav start-->
	<jsp:include page="public/nav.jsp"/>
	<!--nav end-->
<div class="xz_may_hd">
  <img src="${ctx }/www/images/xz_may_hd/xz_may_hd_01.jpg"/>
  <img src="${ctx }/www/images/xz_may_hd/xz_may_hd_02.jpg"/>
  <img src="${ctx }/www/images/xz_may_hd/xz_may_hd_03.jpg"/>
  <img src="${ctx }/www/images/xz_may_hd/xz_may_hd_04.jpg"/>
  <img src="${ctx }/www/images/xz_may_hd/xz_may_hd_05.jpg"/>
  <img src="${ctx }/www/images/xz_may_hd/xz_may_hd_06.jpg"/>
</div>
	<!--footer start-->
	<jsp:include page="public/fotter.jsp"/>
	<!--footer end-->
${sessionScope.statistics.value }
${sessionScope.shangqiao.value }
</body>
</html>