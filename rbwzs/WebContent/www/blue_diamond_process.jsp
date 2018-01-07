<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords" content="${aboutSeoKeywordStr.value }"/>
		<meta name="description" content="${aboutSeoDescStr.value }"/>
		<title>${aboutSeoTitleStr.value }</title>
		<link type="text/css" rel="stylesheet" href="${ctx }/www/css/style.css"/>
		<script type="text/javascript" src="${ctx }/www/js/jquery-1.8.2.min.js"></script>
        <script type="text/javascript" src="${ctx }/www/js/jquery-1.7.2.min.js"></script>
	</head>
<body>

    <!--header start-->
	<jsp:include page="public/header.jsp" />
	<!--header end-->
	
    <!--nav start-->
    <jsp:include page="public/nav.jsp" />
    <!--nav end-->
	<div class="clear"></div>
	
	
	<div class="clear"></div>
	 
	
	<div class="xf_taocan">
	 
	 <img src="${ctx }/www/images/blue/WANGYE-2_01.png"/>
	 <img src="${ctx }/www/images/blue/WANGYE-2_02.png"/>
	 <img src="${ctx }/www/images/blue/WANGYE-2_03.png"/>
	 <img src="${ctx }/www/images/blue/WANGYE-2_04.png"/>
	 <img src="${ctx }/www/images/blue/WANGYE-2_05.png"/>
	</div>
	
	<div class="clearfix"></div>
	

	<!--二级页面  主体部分 end-->

    <!--footer start-->
	<jsp:include page="public/fotter.jsp" />
	<!--footer end-->
	${sessionScope.statistics.value }
	${sessionScope.shangqiao.value }
</body>
</html>
