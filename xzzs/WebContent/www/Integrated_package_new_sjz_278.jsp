<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp" %>
<%@ include file="public/shangqiao.jsp" %>    
<!doctype html>
<html>
<head>

	<meta charset="utf-8">
	<title>整装套餐278|石家庄装修公司|石家庄装装饰公司|石家庄装修公司排名|新洲装饰怎么样|全包装修|老房装修|新房装修</title>
	<meta name="keywords" content="石家庄装修公司、全国十大装饰公司之一、老房装修专家、家装套餐公司、整装装饰公司、全包装修、半包装修、整装套餐、新洲装饰怎么样"/>
	<meta name="description" content="石家庄新洲装饰集团成立于1998年，介导绿色装饰新概念以质量求生存、以信誉求发展、以团结高效的工作热情为宗旨、以完善的服务创企业信誉。北京新洲装饰是装饰行业的门户网站，我们将会全心全意为北京装修业主服务。北京装修公司网为您提供专业的装修信息，可免费查询和咨询家庭装修、客厅装修、二手房装修、小户型装修等装饰装修设计及报价等服务。赢得了新老客户的一致信赖和赞誉，并形成了公司以“回头客”为主体的客户网络。"/>
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
	
	<div class="xf_taocan">
	 
	 <img src="${ctx }/www/images/sjz/sjc278_01.jpg"/>
	 <img src="${ctx }/www/images/sjz/sjc278_02.jpg"/>
	 <img src="${ctx }/www/images/sjz/sjc278_03.jpg"/>
	 <img src="${ctx }/www/images/sjz/sjc278_04.jpg"/>
	</div>


	<div class="clear"></div>
	<!--footer start-->
	<jsp:include page="public/fotter.jsp"/>
	<!--footer end-->

	
	
	 <!-- servise start -->
    <jsp:include page="public/service.jsp"/>
    <!-- servise end -->
    
    
    	
	<!-- faster begin -->
	<jsp:include page="public/faster.jsp"/>
	<!-- faster end -->
	${sessionScope.statistics.value }
	${sessionScope.shangqiao.value }
	${sessionScope.cnzzSession }
</body>
</html>
