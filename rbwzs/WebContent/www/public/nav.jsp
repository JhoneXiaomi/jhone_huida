<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include  file="include.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<div class="nav" id="nav">
	  <ul class="nav1">
	    <li> <a href="${ctx }/" target="_self"><img src="${ctx }/www/images/icon0.png" />网站首页</a> </li>
	    <li>
	    <c:if test="${branchCompany== 'sjzrbw1'}">
		      <a href="${ctx }/IntegratedPackage?key=348"><img src="${ctx }/www/images/icon1.png" />整装套餐</a>
			       <ul class="nav2">
				        <li><a href="${pageContext.request.contextPath}/IntegratedPackage?key=348">348套餐</a></li>
				        <li><a href="${pageContext.request.contextPath}/IntegratedPackage?key=398">398套餐</a></li>
				        <li><a href="${pageContext.request.contextPath}/IntegratedPackage?key=598">598套餐</a></li>
			       </ul>
	    </c:if>
	    <c:if test="${branchCompany== 'bdrbw1'}">
	    	  <a href="${ctx }/IntegratedPackage"><img src="${ctx }/www/images/icon1.png" />整装套餐</a>
			     <ul class="nav2">
			        <li><a href="${pageContext.request.contextPath}/IntegratedPackage?key=279">279套餐</a></li>
			        <li><a href="${pageContext.request.contextPath}/IntegratedPackage?key=379">379套餐</a></li>
			        <li><a href="${pageContext.request.contextPath}/IntegratedPackage?key=579">579套餐</a></li>
			     </ul>
	    </c:if>
	    
	    <c:if test="${branchCompany== 'hsrbw1'}">
	      <a href="${ctx }/IntegratedPackage"><img src="${ctx }/www/images/icon1.png" />整装套餐</a>
			      <ul class="nav2">
			        <li><a href="${pageContext.request.contextPath}/IntegratedPackage?key=369">279套餐</a></li>
			        <li><a href="${pageContext.request.contextPath}/IntegratedPackage?key=699">379套餐</a></li>
			      </ul>
	    </c:if>
	    
	    <c:if test="${branchCompany== 'lfrbw1'}">
	        <a href="${ctx }/IntegratedPackage?key=299"><img src="${ctx }/www/images/icon1.png" />299套餐</a>
		       
		        <ul class="nav2">
			        <li><a href="${pageContext.request.contextPath}/IntegratedPackage?key=299">299套餐</a></li>
			        <li><a href="${pageContext.request.contextPath}/IntegratedPackage?key=499">499套餐</a></li>
		        </ul>
	    </c:if>
	    </li>
	  
	    <li> <a href="${ctx }/cases/p1"><img src="${ctx }/www/images/icon6.png" />设计案例</a>
	      <ul class="nav2">
	        <li><a href="${ctx }/house/p1">楼盘信息</a></li>
	      </ul>
	    </li>
	    
	    <li><a href="${ctx }/activity/p1"><img src="${ctx }/www/images/icon17.png"/>热门活动</a>
	      <ul class="nav2">
	        <li><a href="${ctx }/house/p1">热装楼盘</a></li>
	        <li><a href="${ctx }/activity/p1">装修活动</a></li>
	      </ul>
	    </li>
	    
	    <li> <a href="${ctx }/designer/p1"><img src="${ctx }/www/images/icon11.png"/>设计团队</a></li>
	    
	    <li><a href="${ctx }/news/p1"><img src="${ctx }/www/images/icon22.png" />说装修</a>
		      <ul class="nav2">
		        <li><a href="${ctx }/industry/p1">行业资讯</a></li>
		        <li><a href="${ctx }/domesticOutfit/p1">装修攻略</a></li>
		        <li><a href="${ctx }/decorateStrategy/p1">家装日记</a></li>
		      </ul>
	    </li>
	    
	    <li><a href="${ctx }/blueDiamondProcess"><img src="${ctx }/www/images/icon28.png" />蓝钻工艺</a></li>
	    
	    <li><a href=""><img src="${ctx }/www/images/icon29.png" />瑞博文服务</a>
	      <ul class="nav2">
	        <li><a href="${ctx }/commen/p1">常见问题</a></li>
	        <li><a href="${ctx }/orderLine">在线订单</a></li>
	      </ul>
	    </li>
	    
	    <li><a href="${ctx }/about"><img src="${ctx }/www/images/icon28.png" />关于瑞博文</a></li>
	  </ul>
	</div>
</body>
</html>