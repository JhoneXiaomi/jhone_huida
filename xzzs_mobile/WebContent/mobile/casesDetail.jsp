<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page language="java" import="com.scinter.www.util.WeixinUtil" %>    
<%@ include file="public/head.jsp" %>    
<!DOCTYPE html>
<!-- saved from url=(0036)http://m.xz27800.com/detail/815.html -->
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="keywords" content="${CurrentCase.seoKeyword }">
	<meta name="description" content="${CurrentCase.seoDesc }">
	<title>${CurrentCase.seoTitle }</title>
	
	<%
       Map<String,Object>  ret = new HashMap<String,Object> ();
       ret=WeixinUtil.getWxConfig(request);
       request.setAttribute("appId", ret.get("appId"));
       request.setAttribute("timestamp", ret.get("timestamp"));
       request.setAttribute("nonceStr", ret.get("nonceStr"));
       request.setAttribute("signature", ret.get("signature"));
    %> 
    
	<link href="${ctx }/mobile/css/style.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="${ctx}/mobile/css/content.css" />
	<script type="text/javascript" src="${ctx }/mobile/js/jquery-1.10.2.min.js"></script>
	
	<!-- 微信分享朋友圈 js-->
	<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
	<script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
	<script type="text/javascript">
	
	// 微信信息的以及调用的配置
	wx.config({
		
	    debug: true, 
	    appId: '${appId}', 
	    timestamp: '${timestamp}', 
	    nonceStr: '${nonceStr}', 
	    signature: '${signature}',
	    jsApiList: ['onMenuShareTimeline','onMenuShareQZone'] 
	});
	
	wx.checkJsApi({
	    jsApiList: ['chooseImage'], // 需要检测的JS接口列表，所有JS接口列表见附录2,
	    success: function(res) {
	    	alert(res);
	        // 以键值对的形式返回，可用的api值true，不可用为false
	        // 如：{"checkResult":{"chooseImage":true},"errMsg":"checkJsApi:ok"}
	    }
	});
	</script>
	<style>
		.popup-swiper .swiper-wrapper img{
		
										width:375px;
										height:281.25px;
										position:relative;
										top:50%;
										margin-top:-140.625px;
										}
	</style>
</head>
<body>

	<div class="neiye-top">设计案例
		<div class="neiye-fanhui">
		<a href="javascript:void(0)" onclick="javascript:history.go(-1)">返回</a>
		</div>
	</div>
	
	<div class="weizhi"><em class="dqwz">当前位置</em><a href="${ctx }/">首页</a>&gt;<a href="${ctx }/cases/p1">设计案例</a></div>
	
	<div class="msg-title">
		<h1>【${CurrentCase.caseTitle}】</h1>
	    <p class="msg-time"><i style="margin-right:5px;"><img src="${ctx }/mobile/images/time.jpg"></i>发布时间：<fmt:formatDate value="${CurrentCase.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/><i style="margin-right:5px; margin-left:25px;"><img src="${ctx }/mobile/images/eye.jpg"></i>浏览：495次</p>
	</div>
	
	<script type="text/javascript" src="${ctx }/mobile/js/jquery-1.9.1.min.js"></script>
	
	<div class="slide_container">
	      <ul class="rslides" id="slider">
	      	  <c:forEach items="${caseImages }" var="image" >
					 <li> <img src="${image.imageUrl }"></li>
			  </c:forEach>
	      </ul>
	    </div>
	
	<script src="${ctx }/mobile/js/responsiveslides.min.js"></script>
	<script src="${ctx }/mobile/js/slide.js"></script>
	
	<div class="msg-info">
		<p><em>房屋户型：</em>${CurrentCase.caseHouseType }</p>
	    <p><em>装修风格：</em>${CurrentCase.caseStyle }</p>
	    <p><em>装修面积：</em>${CurrentCase.caseAcreage } &nbsp;平方米</p>
	    <p><em>总造价：</em><i style="color:#77bd0c;">${CurrentCase.caseMoney }</i>万</p>
	</div>
	<div class="msg-info">
		<a href="sms:${sessionScope.MhomeTp.value }" class="btn btn-oran fl">短信咨询</a>
		<a href="${ctx }/Morder?designerName=${designer.designerName}" class="btn btn-blue fr">委托设计</a>
	    <div class="clear"></div>
	</div>
	
	<p class="listrow-title" style="margin-top:10px;">本案设计师</p>
	<div class="leader">
		 <div class="nyteam-img"><a href="${ctx }/MdesignerDetail?designerId=${designer.designerId }"><img src="${designer.designerPhotoImg }"></a></div>
		<div class="leader-con">
	    	<p class="nycase-con-title">${designer.designerName }<i style="font-size:12px; color:#77bd0c; margin-left:5px;">[主任设计师]</i></p>
	        <p class="nycase-con-js">从业时间：<i style="color:#77bd0c;">${designer.designerWorkTime }</i>年<br/>${designer.designerStyle }</p>
	   		<p class="nycase-con-js">
	               擅长风格：${designer.designerStyle }<br/>
	                           设计理念：
		           <c:choose>
		  	     	<c:when test="${fn:length(designer.designerIdea)>=7}">
		  	     	   ${fn:substring(designer.designerIdea,0,7)}....
		  	     	</c:when>
		  	     	<c:otherwise>${designer.designerIdea }</c:otherwise>
		           </c:choose>	
	        </p>
	    </div>
	</div>
	<!-- 引入fotter -->
	<jsp:include page="public/fotter.jsp"/>
</body>
</html>