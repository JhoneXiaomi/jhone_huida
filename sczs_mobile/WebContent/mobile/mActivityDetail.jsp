<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<meta name="keywords" content="${news.seoKeywords }">
<meta name="description" content="${news.seoDesc }">
<title>${news.seoTitle }</title>
<script type="text/javascript"
	src="${ctx }/mobile/js/jquery-1.9.1.min.js"></script>
<link type="text/css" rel="stylesheet"
	href="${ctx }/mobile/css/style.css">
</head>

<body>

	<div class="wrap">
		<!-- 代码 开始 -->
		<div class="mMain">
			<div class="mList_al clearfix">
				<div class="mList_title_new">
					<h3>【 ${news.title }】</h3>
				</div>
			</div>
			<div class="mCont_news_con">${news.content }</div>
		</div>
	</div>
	${sessionScope.statistics.value }
</body>
</html>
