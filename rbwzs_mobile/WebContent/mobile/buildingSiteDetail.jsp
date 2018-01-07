<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>${statScinterHomeSeoTitle.value }</title>
<meta name="keywords" content="${statScinterhomeSeoKeyword.value }" />
<meta name="description" content="${statScinterHomeSeoDesc.value }" />
<link href="${ctx }/mobile/css/xzstyle.css" rel="stylesheet"
	type="text/css" />
</head>
<body>

	<div class="neiye-top">
		工地信息
		<div class="neiye-fanhui">
			<a href="javascript:void(0)" onclick="javascript:history.go(-1)">返回</a>
		</div>
	</div>

	<div class="weizhi">
		<em class="dqwz">当前位置</em><a href="${ctx }/">首页</a>&gt;<a
			href="${ctx }/MbuildingSite/p1">在建工地</a>
	</div>

	<div class="msg-title">

		<h1>${buildingSite.siteName }</h1>
		<p class="msg-time">
			<i style="margin-right: 5px;"> <img
				src="${ctx }/mobile/images/time.jpg" />
			</i>发布时间：
			<fmt:formatDate value="${buildingSite.createTime }"
				pattern="yyyy-MM-dd hh:mm:ss" />
			<i style="margin-right: 5px; margin-left: 2%;"><img
				src="${ctx }/mobile/images/eye.jpg" /> ${buildingSite.readNum } </i>发布者：${buildingSite.creater }
		</p>
	</div>

	<div class="msg-news-con">
		<c:forEach items="${siteImageList }" var="siteImg">

			<img src="${siteImg.imageUrl }" style="max-width: 640px" />
			<br />
		</c:forEach>
	</div>

	<script src="${ctx }/mobile/js/responsiveslides.min.js"></script>
	<script src="${ctx }/mobile/js/slide.js"></script>


	<!--底部导航 start-->
	<div style="width:100%; height:50px;"></div>
	
	<div class="foot-nav">
		<ul class="foot-navlb">
			<li><a href="${ctx }/"><img src="${ctx }/mobile/images/1.png"><br>首页</a></li>
			<li><a href="${ctx }/Morder"><img src="${ctx }/mobile/images/2.png"><br>报价</a></li>
			<li>
   bt
    <c:if test="${branchCompany == 'sjzrbw1'}">
    
    	<a href="http://p.qiao.baidu.com/cps/chat?siteId=10017115&userId=6095603"><img src="${ctx }/mobile/images/3.png" ><br>在线咨询</a>
    </c:if>
      
    <c:if test="${branchCompany == 'hsrbw1'}">
    
    	<a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn"><img src="${ctx }/mobile/images/3.png" ><br>在线咨询</a>
    </c:if>
    
      
    <c:if test="${branchCompany == 'bdrbw1'}">
    
   	    <a href="http://p.qiao.baidu.com/cps/chat?siteId=10016909&userId=6095603"><img src="${ctx }/mobile/images/3.png" ><br>在线咨询</a>
    </c:if>
      
    <c:if test="${branchCompany == 'lfrbw1'}">
    
    	<a href="http://p.qiao.baidu.com/cps/chat?siteId=10017826&userId=6095603"><img src="${ctx }/mobile/images/3.png" ><br>在线咨询</a>
    </c:if>	
    
    </li>
			<li><a href="tel:${sessionScope.MhomeTp.value }"><img src="${ctx }/mobile/images/4.png"><br>电话</a></li>
		</ul>
	</div>
	<div class="fhdb" id="top"><div id="izl_rmenu" class="izl-rmenu"><div class="btn btn-top"></div></div></div>
	<script type="text/javascript" src="${ctx }/mobile/js/zzsc.js"></script>
	<!--底部导航  end-->
	<div class="" style="margin-bottom: 100px;"></div>
	${sessionScope.statistics.value } ${sessionScope.shangqiao.value }
</body>
</html>