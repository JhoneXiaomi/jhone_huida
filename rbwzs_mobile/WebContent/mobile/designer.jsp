<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp" %>    
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">	
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="keywords" content="${designerSeoKeywordStr.value }"/>
<meta name="description" content="${designerSeoDescStr.value }"/>
<title>${designerSeoTitleStr.value }</title>
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
  <div class="ej_local fl">您的当前位置：<a href="${ctx }/">首页</a>> <a href="javascript:void(0)">设计师</a></div>
 </div>
 <div class="clear"></div>
 <div class="mList_per">
      <ul>
      <c:forEach items="${designerList }" var="designer" varStatus="status" begin="0" end="5">
      
       <li class="clearfix">
          <div class="mList_per_left fl">
	          <a href="${pageContext.request.contextPath}/m/designerDetail?designerId=${designer.designerId}">
	          	<img src="${designer.designerPhotoImg }">
	          </a>	
          </div>
          <div class="mList_per_right fr">
            <h3>${designer.designerName }<span style="">${designer.designerTitle }</span></h3>
            <p>从业时间：${designer.designerWorkTime }</p>
            <p>擅长风格：${designer.designerStyle }</p>
            <div class="mar">
            	<a href="${ctx}/m/order?designerName=${designer.designerName}">预约设计师</a>
            </div>
          </div>
        </li>
      </c:forEach>
      </ul>
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
