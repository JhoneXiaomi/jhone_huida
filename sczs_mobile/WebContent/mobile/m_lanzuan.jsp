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
<meta name="keywords" content="${scinterDiamondSeoKeywordStr.value }">
<meta name="description" content="${scinterDiamondSeoKeywordStr.value }">
<title>${scinterDiamondSeoTitleStr.value }</title>
<link type="text/css" rel="stylesheet" href="${ctx }/mobile/css/style.css">
<script src="${ctx }/mobile/js/jquery.min.js"></script>
</head>

<body>

<div class="wrap">
  <!-- 代码 开始 -->
    
   <div class="mMain"> 
    
    <div class="mList_al clearfix">
      <div class="mList_title fl">
        <h3>【 蓝钻工艺 】</h3>
      </div>
      <div class="mList_position fr">您的当前位置：<a href="${ctx }/">首页</a> > <a href="">蓝钻工艺</a></div>
    </div>
    
    
  
  
    <div class="clear"></div>
  
  
  <div class="mTaocan">
    <img src="${ctx }/mobile/images/gongyi_01.png">
    <img src="${ctx }/mobile/images/gongyi_02.png">
    <img src="${ctx }/mobile/images/gongyi_03.png">
    <img src="${ctx }/mobile/images/gongyi_04.png">
    <img src="${ctx }/mobile/images/gongyi_05.png">
    <img src="${ctx }/mobile/images/gongyi_06.png">
    <img src="${ctx }/mobile/images/gongyi_07.jpg">
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
