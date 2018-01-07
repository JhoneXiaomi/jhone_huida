<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp" %>
<%@ include file="public/shangqiao.jsp" %>    
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>${packageSeoTitle.value }</title>
	<meta name="keywords" content="${packageSeoKeyword.value }"/>
	<meta name="description" content="${packageSeoDesc.value }"/>
	<link rel="stylesheet" type="text/css" href="${ctx }/www/css/style.css"/>
	<script type="text/javascript" src="${ctx }/www/js/db_01.js"></script>
    
	<link rel="stylesheet" type="text/css" href="${ctx }/www/css/style.css"/>
	<script type="text/javascript" src="${ctx }/www/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="${ctx }/www/js/pptBox.js"></script>
	
	<!--底部报价 js-->
	<script src="${ctx }/www/js/jquery-1.10.2.min.js" type="text/javascript"></script>
	<script>
	   var jq = jQuery.noConflict();
	</script>
	<script type="text/javascript" src="${ctx }/www/js/GlobalProvinces.js"></script>
	<script src="${ctx }/www/js/bdzxbj_bottom_new.js" type="text/javascript"></script>
	<!--底部报价 js-->
	<style>
	
		.tstc{
		
			font-size:0px;
		}
		.tstc img{
			width:100%;
		}
	</style>
</head>
<body>
	<!--头部 start-->
	<jsp:include page="public/header.jsp"/>
	<!--头部 end-->
	<div class="clear"></div>
	<!--nav start-->
	<jsp:include page="public/nav.jsp"/>
	<!--nav end-->
	
	<div class="clear"></div>
	
	<div class="tstc">
	 
	 <img src="${ctx }/www/images/tsxz/51800.jpg"/>
	 <img src="${ctx }/www/images/tsxz/51800wsj.jpg"/>
	 <img src="${ctx }/www/images/tsxz/51800kct.jpg"/>
	 <img src="${ctx }/www/images/tsxz/51800ws.jpg"/>
	 <img src="${ctx }/www/images/tsxz/51800cf.jpg"/>
	 <img src="${ctx }/www/images/tsxz/51800yt.jpg"/>
	 <img src="${ctx }/www/images/tsxz/51800qt.jpg"/>
	  <a href="http://ts.xz27800.com"><img src="${ctx }/www/images/tsxz/tsxz35800_08.jpg"/></a>
	</div>

	<!-- servise start -->
    <jsp:include page="public/service.jsp"/>
    <!-- servise end -->
	${sessionScope.statistics.value }
	${sessionScope.shangqiao.value }
</body>
</html>
