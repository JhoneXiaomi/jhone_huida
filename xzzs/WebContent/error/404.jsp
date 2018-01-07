<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <c:set var="ctx" value="${pageContext.request.contextPath}"/>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>页面不存在</title>
<link rel="stylesheet" type="text/css" href="${ctx}/www/css/style.css"/>
<script type="text/javascript" src="${ctx}/www/js/jquery-1.7.2.min.js"></script>
</head>
<body>
<div class="head">
	  <div class="head_top">
	    <div class="w1200">
	      <div class="head_top01 fl">当前站&nbsp;<span id="CurrCompany" style="color:#008cd6;"></span>
	     		&nbsp;新洲装饰全国分站：
		      	<a href="http://www.xz27800.com" rel="nofollow" target="_blank">北京</a>&nbsp;
				<a href="http://bd.xz27800.com" rel="nofollow">保定</a>&nbsp;
				<a href="http://sjz.xz27800.com" rel="nofollow">石家庄</a>&nbsp;
				<a href="http://ty.xz27800.com" rel="nofollow">太原</a>&nbsp;
				<a href="http://www.0531zhuangshi.com" rel="nofollow">济南</a>&nbsp; 
				<a href="http://www.xzzstj.com" rel="nofollow">天津</a>&nbsp;
				<a href="http://lf.xz27800.com" rel="nofollow">廊坊</a>&nbsp;
				<a href="http://ts.xz27800.com" rel="nofollow">唐山</a>&nbsp;
				<a href="http://cz.xz27800.com" rel="nofollow">沧州</a>&nbsp; 
				<a href="http://zz.xz27800.com" rel="nofollow">郑州</a>&nbsp;
				<a href="http://hf.xz27800.com" rel="nofollow">合肥</a>&nbsp;
				<a href="javascript:void(0)" rel="nofollow">重庆</a>
	      </div>
	      <div class="head_top02 fr">◎ 京城百姓信赖品牌家装公司 ◎ 室内装饰协会理事单位 </div>
	    </div>
	  </div>
	  <div class="head_bottom w1200">
	      
	    <div class=""> 
	     <div class="head_logo fl"><a href="${ctx }/"><img src="${ctx }/www/images/404logo.png"  id="where" width="600" height="120"/></a></div>
	      <!--search start-->
	     <%-- <div class="head_search fl">
	       <div class="search_1">
	          <form action="${ctx }/cases/p1">
	            <input type="text" class="search_put" name="key" placeholder="搜索案例" />
	            <input type="submit" class="search_sub" value="搜索" />
	          </form>
	       </div>
	       
	       <div class="search_2">
	         热门搜索：
	         <a href="${ctx }/cases/p1?key=简约"> 简约 &nbsp;|</a>
	         <a href="${ctx }/cases/p1?key=欧式"> 欧式 &nbsp;|</a>
	         <a href="${ctx }/cases/p1?key=怀旧"> 怀旧 &nbsp;|</a>
	         <a href="${ctx }/cases/p1?key=乡村"> 乡村 &nbsp;|</a>
	       </div>
	     </div> --%>
	    <!--search end-->
	     <div class="head_tel fr">
	       <span>全国免费咨询电话</span>
	       <p id="telePhone"></p>
	     </div>
	     </div>
	     
	  </div>
	</div>
<div class="clear"></div>
<%@ include file="/www/public/nav.jsp" %>

<div class="bodybg" style="padding-bottom: 0px">

   <div class="cenpic"><img src="${ctx}/www/images/404pic.png" /></div>
   
   <div class="backan">
     <ul class="clearfix">
       <li><img src="${ctx}/www/images/backpic.png" /><a href="${ctx}/">返回首页</a></li>
       <li><img src="${ctx}/www/images/backpic.png" /><a href="" onclick="back()">返回上一页</a></li>
       <li><img src="${ctx}/www/images/backpic.png" /><a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn" target="_blank">联系客服</a></li>
     </ul>
     
     <p>没找到您要访问的网页原因可能如下：·可能网速过慢，或网络中断；可能页面已删除；这个页面太受欢迎了，太多人访问。</p>
   </div>
</div>

<div class="clear"></div>

<div class="footer" style="margin: 0px">
	   
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
	        <b id="companyPhone"></b><br/>
	        <div style="width: 329px;">地址：<span id="companyAddress"></span></div>
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
		$("#link").children().attr("rel","nofollow");
		$(function(){
			var url=window.location.href;
			var lastIndex=url.lastIndexOf("/");
			if((url.length-lastIndex)>1){
				$("#friendLink").hide();
			}
		});
	</script>	
	${sessionScope.statistics.value }
	${sessionScope.shangqiao.value }

</body>
<script type="text/javascript">
	var url = window.location.href ;
	if(url.indexOf('www.xz37800.com')>0){
		$("#CurrCompany").text('石家庄站');
		$("#where").attr("alt","石家庄新洲家装公司");
		$("#telePhone").text('18034010917');
		$("#companyPhone").text('18034010917');
		$("#companyAddress").text('石家庄翟营大街与跃进路交叉口西行50米路北');
		
	}else if(url.indexOf('sjz.xz27800.com')>0){
		$("#CurrCompany").text('石家庄站');
    	$("#where").attr("alt","石家庄新洲家装公司");
    	$("#telePhone").text('18034010917');
    	$("#companyPhone").text('18034010917');
    	$("#companyAddress").text('石家庄翟营大街与跃进路交叉口西行50米路北');
    	
	}else if(url.indexOf('bd.xz27800.com')>0){
		$("#CurrCompany").text('保定站');
    	$("#where").attr("alt","保定新洲家装公司");
    	$("#telePhone").text('18034010917');
    	$("#companyPhone").text('18034010917');
    	$("#companyAddress").text('阳光北大街与复兴路交叉口北行1000米路东');
	}else if(url.indexOf('ty.xz27800.com')>0){
		$("#CurrCompany").text('太原站');
    	$("#where").attr("alt","太原新洲家装公司");
    	$("#telePhone").text('18034010917');
    	$("#companyPhone").text('18034010917');
    	$("#companyAddress").text('小店区许坦东街太榆路交叉口往东500米锦东国际B座24层');
	}else if(url.indexOf('www.0531zhuangshi.com')>0){
		$("#CurrCompany").text('济南站');
    	$("#where").attr("alt","济南新洲家装公司");
    	$("#telePhone").text('18034010917');
    	$("#companyPhone").text('18034010917');
    	$("#companyAddress").text('历城区华龙路与二环东路交叉口嘉恒大厦A座3层');
	}else if(url.indexOf('www.xzzstj.com')>0){
		$("#CurrCompany").text('天津站');
    	$("#where").attr("alt","天津新洲家装公司");
    	$("#telePhone").text('18034010917');
    	$("#companyPhone").text('18034010917');
    	$("#companyAddress").text('南开三马路与四维路交口华都大厦12层');
	}else if(url.indexOf('tj.xz27800.com')>0){
		$("#CurrCompany").text('天津站');
    	$("#where").attr("alt","天津新洲家装公司");
    	$("#telePhone").text('18034010917');
    	$("#companyPhone").text('18034010917');
    	$("#companyAddress").text('南开三马路与四维路交口华都大厦12层');
	}else if(url.indexOf('lf.xz27800.com')>0){
		$("#CurrCompany").text('廊坊站');
    	$("#where").attr("alt","廊坊新洲家装公司");
    	$("#telePhone").text('18034010917');
    	$("#companyPhone").text('18034010917');
    	$("#companyAddress").text('廊坊步行街二大街南外街新洲装饰');
	}else if(url.indexOf('cz.xz27800.com')>0){
		$("#CurrCompany").text('沧州站');
    	$("#where").attr("alt","沧州新洲家装公司");
    	$("#telePhone").text('18034010917');
    	$("#companyPhone").text('18034010917');
    	$("#companyAddress").text('沧州市运河区黄河西路冀春大厦负一层新洲装饰');
	}else if(url.indexOf('ts.xz27800.com')>0){
		$("#CurrCompany").text('唐山站');
    	$("#where").attr("alt","唐山新洲家装公司");
    	$("#telePhone").text('18034010917');
    	$("#companyPhone").text('18034010917');
    	$("#companyAddress").text('唐山市路北区龙泽路与龙华道交口大陆阳光517号4层');
	}else if(url.indexOf('zz.xz27800.com')>0){
		$("#CurrCompany").text('郑州站');
    	$("#where").attr("alt","郑州新洲家装公司");
    	$("#telePhone").text('18034010917');
    	$("#companyPhone").text('18034010917');
    	$("#companyAddress").text('金水区经三路与农业路财富广场3号楼17层');
	}else if(url.indexOf('hf.xz27800.com')>0){
		$("#CurrCompany").text('合肥站');
    	$("#where").attr("alt","合肥新洲家装公司");
    	$("#telePhone").text('18034010917');
    	$("#companyPhone").text('18034010917');
    	$("#companyAddress").text('合肥市包河区徽州大道与水阳江路交口 兴业大厦6楼');
	}else if(url.indexOf('xzzstj.com')>0){
		$("#CurrCompany").text('天津站');
    	$("#where").attr("alt","天津新洲家装公司");
    	$("#telePhone").text('18034010917');
    	$("#companyPhone").text('18034010917');
    	$("#companyAddress").text('南开三马路与四维路交口华都大厦12层');
	}else if(url.indexOf('hs.xz27800.com')>0){
		$("#CurrCompany").text('衡水站');
    	$("#where").attr("alt","衡水新洲家装公司");
    	$("#telePhone").text('18034010917');
    	$("#companyPhone").text('18034010917');
    	$("#companyAddress").text('北京市朝阳区十里河闽龙广场B2层');
	}else{
		$("#CurrCompany").text('北京站');
    	$("#where").attr("alt","北京新洲家装公司");
    	$("#telePhone").text('18034010917');
    	$("#companyPhone").text('18034010917');
    	$("#companyAddress").text('北京市朝阳区十里河闽龙广场B2层');
	}

	function back(){
		history.go(-1);
	}

</script>
</html>