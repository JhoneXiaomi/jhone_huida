<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/head.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html >
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<meta name="keywords" content="${news.seoKeyword }"/>
	<meta name="description" content="${news.seoDesc }"/>
	<title>${news.seoTitle }</title>
	<link href="${ctx }/mobile/css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>

	<div class="neiye-top">装修攻略详情<div class="neiye-fanhui"><a href="javascript:void(0)" onclick="javascript:history.go(-1)">返回</a></div></div>
	<div class="weizhi"><em class="dqwz">当前位置</em><a href="${ctx }/">首页</a>&gt;<a href="${ctx }/decStrategy/p1">装修攻略</a></div>
	<div class="msg-title">
		<h1>${news.title }</h1>
	    <p class="msg-time">
		    <i style="margin-right:5px;">
		   	 <img src="${ctx }/mobile/images/time.jpg"/>
		    </i>发布时间：<fmt:formatDate value="${news.updateTime }" pattern="yyyy-MM-dd hh:mm:ss"/>
		    <i style="margin-right:5px; margin-left:25px;">
		    	<img src="${ctx }/mobile/images/eye.jpg"/>
		    </i>浏览：${news.readNum }次
	    </p>
	</div>
	
	<div class="msg-news-con">${news.contents }</div>
	<!-- fotter begin -->
	
		<jsp:include page="public/fotter.jsp" />
	<!-- fotter end -->
	${sessionScope.statistics.value }
	${sesscionScope.angqiao.value }
</body>
</html>