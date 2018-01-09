<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/> 
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="keywords" content="${statScinterhomeSeoKeyword.value }">
<meta name="description" content="${statScinterHomeSeoDesc.value }">
<title>${statScinterHomeSeoTitle.value }</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"  />
<link rel="stylesheet" type="text/css" href="${ctx }/mobile/css/style.css">
<script type="text/javascript" src="${ctx }/mobile/js/jquery-1.9.1.min.js"></script>
</head>

<body>
  <div class="wrap">
    <div class="mList_al clearfix">
      <div class="mList_title fl">
        <h3>【常见问题】</h3>
      </div>
      <div class="mList_position fr">您的当前位置：<a href="${ctx }/">首页</a> > <a href="Javascript:void(0)">常见问题</a></div>
    </div>
   
   <div class="mCjwt_main">
    <c:forEach items="${faqLists }" var="faq">
    <dl>
      <dd><h3>${faq.faqDesc }</h3></dd>
      <dt>${faq.faqAnswer }</dt>
      <span>上传更新：<fmt:formatDate value="${faq.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
    </dl>
   </c:forEach>
   </div>

  </div>

<!--底部导航 start-->
<jsp:include page = "public/fotter.jsp"/>
<!--底部导航  end-->   
${sessionScope.statistics.value }
${sessionScope.shangqiao.value }
</body>
</html>
