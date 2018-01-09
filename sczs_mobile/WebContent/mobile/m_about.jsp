<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>   
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"  />
<meta name="keywords" content="${scinterAboutSeoKeywordStr.value }">
<meta name="description" content="${scinterAboutSeoDescStr.value }">
<title>${scinterAboutSeoTitleStr.value }</title>
<link type="text/css" rel="stylesheet" href="${ctx }/mobile/css/style.css">
<script src="${ctx }/mobile/js/jquery.min.js"></script>
</head>

<body>

<div class="wrap">
  <!-- 代码 开始 -->
    
   <div class="mMain"> 
    
    <div class="mList_al clearfix">
      <div class="mList_title fl">
        <h3>【 关于三创 】</h3>
      </div>
      <div class="mList_position fr">您的当前位置：<a href="${ctx }/">首页</a> > <a href="">关于三创</a></div>
    </div>
    
  
    <div class="clear"></div>
  
  
  <div class="mTaocan">
    <img src="${ctx }/mobile/images/about/sc_ppwh_01.jpg">
    <img src="${ctx }/mobile/images/about/sc_ppwh_02.jpg">
    <img src="${ctx }/mobile/images/about/sc_ppwh_03.jpg">
    <img src="${ctx }/mobile/images/about/sc_ppwh_04.jpg">
    <img src="${ctx }/mobile/images/about/sc_ppwh_05.jpg">
    <img src="${ctx }/mobile/images/about/sc_ppwh_06.jpg">
    <img src="${ctx }/mobile/images/about/sc_ppwh_07.jpg">
    <img src="${ctx }/mobile/images/about/sc_ppwh_08.jpg">
    <img src="${ctx }/mobile/images/about/sc_ppwh_09.jpg">
    <img src="${ctx }/mobile/images/about/sc_ppwh_10.jpg">
  </div>
    
    
  </div>
<!-- 代码 结束 -->
<script src="${ctx }/mobile/js/responsiveslides.min.js"></script>
<script src="${ctx }/mobile/js/slide.js"></script>

</div>

<!--底部导航 start-->
<jsp:include page = "public/fotter.jsp"/>
<!--底部导航  end-->
${sessionScope.statistics.value }
${sessionScope.shangqiao.value }
</body>
</html>
