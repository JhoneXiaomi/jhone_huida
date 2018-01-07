<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/head.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<title>${statScinterHomeSeoTitle.value }</title>
	<meta name="description" content="${statScinterHomeSeoDesc.value }"/>
	<meta name="keywords" content="${statScinterhomeSeoKeyword.value }"/>
	<link href="${ctx }/mobile/css/style.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="${ctx }/mobile/js/jquery-1.10.2.min.js"></script> 
</head>
<body>
<div class="neiye-top">设计团队<div class="neiye-fanhui">
<a href="javascript:void(0)" onclick="javascript:history.go(-1)">返回</a>
</div>
</div>

<div class="weizhi"><em class="dqwz">当前位置</em><a href="${ctx }/">首页</a>&gt;<a href="${ctx }/designer/p1">设计团队</a></div>

<div class="leader">
    <div class="nyteam-img"><img src="${designer.designerPhotoImg }"/></div>
	<div class="leader-con">
    	<p class="nycase-con-title">${designer.designerName }<i style="font-size:12px; color:#77bd0c; margin-left:5px;">[${designer.designerTitle } ]</i></p>
        <p class="nycase-con-js">从业时间：<i style="color:#77bd0c;">${designer.designerWorkTime }</i>年<br/>擅长风格：${designer.designerStyle }     </p>
    </div>
   
</div>

<div class="msg-info">
	<p><em>委托人数：</em>已有<i style="color:#77bd0c;">${cases.designerPopularity }</i>位业主委托设计</p>
	<p><em>设计师简历：</em><br/>设计师：${designer.designerName }<br/>设计师毕业学院：${designer.designerSchool }<br/></p>
    <p><em>设计理念：</em>${designer.designerIdea }<br/></p>
    <p><em>代表作品：</em>
    	<c:forEach items="${casesList }" var="cases">
    		${cases.caseTitle }&nbsp;,&nbsp;
    	</c:forEach>
	</p>
</div>
<div class="msg-info">
	<a href="sms:${sessionScope.MhomeTp.value }" class="btn btn-oran fl">短信咨询</a>
	<a href="${ctx }/Morder?designerName=${designer.designerName}" class="btn btn-blue fr">委托设计</a>
    <div class="clear"></div>
</div>
<div class="listrow">
	<p class="listrow-title">设计师案例</p>
    <ul class="listrowlb">
    <c:forEach items="${casesList }" var="cases" begin="0" end="3">
    	    <li>
    	    <a href="${pageContext.request.contextPath}/McasesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}">
    	    <img src="${cases.caseThumbImg }"/>
    	    <p class="listrow-name">${cases.caseTitle }</p>
    	    </a>
    	    </li>
    </c:forEach>
    </ul>
    <div class="clear"></div>
</div>

<!-- jsp include 引入底部样式 -->
<jsp:include page="public/fotter.jsp" />
</body>
</html>