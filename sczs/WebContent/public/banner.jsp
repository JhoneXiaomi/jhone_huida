<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
</head>
<body>
    <script type="text/javascript" src="${pageContext.request.contextPath}/www/js/jquery-1.8.3.min.js"></script>
	<script src="${pageContext.request.contextPath}/www/js/flexslider.js"></script>
<!--banner start-->
  <div class="banner">
	<div class="bannerimg">
     <ul class="bannerslides clearfix">
		<li ><img src="${pageContext.request.contextPath}/www/images/banner01.jpg" width="100%" height="100%"/></li>
        <li ><img src="${pageContext.request.contextPath}/www/images/banner02.jpg" width="100%" height="100%"/></li>
        <li ><img src="${pageContext.request.contextPath}/www/images/banner01.jpg" width="100%" height="100%"/></li>
	</ul>
   </div> 
</div>
  <!-- js调用部分begin -->
    <script>
    $(function(){
        $('.banner').flexslider({
            directionNav: true,
            pauseOnAction: false
        });
    });
    </script>
    <!-- js调用部分end -->
<!--banner end-->
</body>
</html>