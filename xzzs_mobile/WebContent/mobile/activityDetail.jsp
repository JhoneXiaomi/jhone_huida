<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/head.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<title>${news.seoTitle }</title>
	<meta name="description" content="${news.seoDesc }"/>
	<meta name="keywords" content="${news.seoKeyword }"/>
	<link href="${ctx }/mobile/css/style.css" rel="stylesheet" type="text/css"/>
	<style>
	
		.msg-con p img{
		
			width: 100%;
			font-size: 0px;
		}
	</style>
</head>
<body>

	<div class="msg-con">${news.contents }</div>
	
	<!-- fotter begin -->
	<jsp:include page="public/fotter.jsp" />
	<!-- fotter begin-->
</body>
</html>