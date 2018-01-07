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
<meta name="keywords" content="${scinterPackageSeoKeyword.value }">
<meta name="description" content="${scinterPackageSeoDesc.value }">
<title>${scinterPackageSeoTitle.value }</title>
<link type="text/css" rel="stylesheet" href="${ctx }/mobile/css/style.css">
<script src="${ctx }/mobile/js/jquery.min.js"></script>
</head>
<body>
<div class="wrap">
  <!-- 代码 开始 -->
   <div class="mMain"> 
    <div class="mList_al clearfix">
      <div class="mList_title fl">
        <h3>【 装修案例 】</h3>
      </div>
        <div class="mList_position fr">您的当前位置：<a href="${ctx }/">首页</a> > <a href="javascript:void(0)">装修案例</a></div>
    </div>
    <div class="clear"></div>
  <div class="mTaocan">
    <img src="${ctx }/mobile/images/328tianjin_01.jpg"/>
    <img src="${ctx }/mobile/images/328tianjin_02.jpg"/>
    <img src="${ctx }/mobile/images/328tianjin_03.jpg"/>
    <img src="${ctx }/mobile/images/328tianjin_04.jpg"/>
    <img src="${ctx }/mobile/images/328tianjin_06.jpg"/>
    <img src="${ctx }/mobile/images/328tianjin_07.jpg"/>
    <img src="${ctx }/mobile/images/328tianjin_08.jpg"/>
    <img src="${ctx }/mobile/images/328tianjin_09.jpg"/>
    <img src="${ctx }/mobile/images/328tianjin_10.jpg"/>
    
    <div class="mb"></div>
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
