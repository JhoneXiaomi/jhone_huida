<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp" %>    
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">	
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="keywords" content="${statrbwhomeSeoKeyword.value }">
<meta name="description" content="${statrbwHomeSeoDesc.value }">
<title>${statrbwHomeSeoTitle.value }</title>
<link rel="stylesheet" type="text/css" href="${ctx }/mobile/css/style.css"/>
<script type="text/javascript" src="${ctx }/mobile/js/jquery-1.9.1.min.js"></script>
</head>
<body>
<div class="wrap">
 <div class="ej_top">
  <div class="ej_tit clearfix">
   <div class="back fl"><img src="${ctx }/mobile/images/backicon.png"/><a href="javascript:history.back();">返回</a></div>
   <div class="lanmu">设计师</div>
  </div>
  <div class="ej_local fl">您的当前位置：<a href="${ctx}/">首页</a>> <a href="javascript:void(0)">常见问题</a></div>
 </div>
 <div class="clear"></div>
 <div class="mCjwt_main">
	 <c:forEach items="${faqLists }" var="faq">
	    <dl>
	      <dd><h3>${faq.faqDesc }</h3></dd>
	      <dt>${faq.faqAnswer }</dt>
	      <span>上传更新：<fmt:formatDate value="${faq.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
	    </dl>
	   </c:forEach>
   </div>
<div class="clear"></div>
</div>
<!--底部导航 start-->
<jsp:include page="public/fotter.jsp"/>
<!--底部导航  end-->

<div class="" style="margin-bottom:100px;"></div>
${sessionScope.statistics.value }
${sessionScope.shangqiao.value }
</body>
</html>
