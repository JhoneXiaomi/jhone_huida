<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include.jsp" %>    
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

	<div class="footer">
	   
	  <div class="foot01bg">
	   <div class="foot01 w1200">
	     <div class="clearfix">
	     <div class="foot01_left fl" id="friendLink">
	       	<h3>友情链接</h3>
	        <div class=""  id="link">
	         	${homeLk.value }
	        </div>
	     </div>
	     
	     <div class="foot01_left foot_link fl">
	        <h3>快速导航</h3>
	        <div class="">
	         <a href="${ctx }/">网站首页</a>
	         <a href="${ctx }/cases/p1">装修案例</a>
	         <a href="${ctx }/news/p1">装修新闻</a>
	         <a href="${ctx }/workBuilding/p1">在建工地</a>
	         <a href="${ctx }/about">关于新洲</a>
	        </div>
	     </div>
	     
	     <div class="foot01_cent fl">
	              全国统一咨询热线:<br/>
	        <b>${homeTp.value }</b><br/>
	        <div style="width: 329px;">地址：${homeAdress.value }</div>
	       <p>
	       	   <c:choose>
	       	   
	       	   		<c:when test="${branchCompany == 'bjxz'}">
	       	   			<a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn">在线咨询</a>
	       	   		</c:when>
	       	   		<c:when test="${branchCompany == 'hfxz'}">
	       	   			<a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn">在线咨询</a>
	       	   		</c:when>
	       	   		<c:otherwise>
	       	   			<a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn">在线咨询</a>
	       	   		</c:otherwise>
	       	   </c:choose>
	       </p>
	     </div>
	     <div class="foot01_right fr">
	        <h3></h3>
	       <ul class="clearfix">
	         <li><img src="${homeTc.value }" alt="${companyCity}新洲二维码"/></li>
	         <li><img src="${ctx }/www/images/tianmao.png" alt=""/></li>
	         <li><img src="${ctx }/www/images/jingdong.jpg" alt=""/></li>
	       </ul>
	     </div>    
	   </div>
	   </div>
	 </div>
	   
	   <div class="foot02" style="height: 100px">
	      Copyright @2015-2016  京ICP备12044014号 版权所有   北京新洲伟业装饰有限公司<br>
	   	中国家居装饰行业百强企业  北京市装饰协会理事单位
	   </div>
	</div>
	<script type="text/javascript">
	//除首页外隐藏友情链接
		$(function(){
			var url=window.location.href;
			var lastIndex=url.lastIndexOf("/");
			if((url.length-lastIndex)>1){
				$("#friendLink").hide();
			}
			if(url.indexOf('www.xz27800.com')>0){
				$("#link").children().attr("rel","nofollow");
			}
		});
	</script>	
	${sessionScope.statistics.value }
	${sessionScope.shangqiao.value }
</body>
</html>