<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/head.jsp" %>    
<!DOCTYPE html>
<html >
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<title>${casesSeoTitleStr.value }</title>
	<meta name="keywords" content="${casesSeoKeywordStr.value }"/>
	<meta name="description" content="${casesSeoDescStr.value }"/>
	<link href="${ctx }/mobile/css/style.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="${ctx }/mobile/js/jquery-1.10.2.min.js"></script> 
</head>
<body>
<div class="neiye-top">设计案例<div class="neiye-fanhui"><a href="javascript:void(0)" onclick="javascript:history.go(-1)">返回</a></div></div>
<div class="weizhi"><em class="dqwz">当前位置</em><a href="${ctx }/">首页</a>&gt;<a href="${ctx }/Mcases/p1">设计案例</a></div>

<div class="nycase">
	<ul class="nycaselb">
		<c:forEach items="${casesList }" var="cases" varStatus="status">
			<li>
	            <a href="${pageContext.request.contextPath}/McasesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}">
	                <div class="nycase-con nycase_pad">
	                    <p class="nycase-con-title">${cases.caseTitle }${cases.caseHouseType }${cases.caseStyle }${cases.caseAcreage }平</p>
	                    <p class="nycase-con-js">风格：${cases.caseStyle }<br>户型：${cases.caseHouseType }</p>
	                </div>
	                <div class="nycase-img"><img src="${cases.caseThumbImg}"/></div>
	                <div class="nycase-jiantou"><img src="${ctx }/mobile/images/case-jiantou.png"/></div>
	            </a>
			</li>
		</c:forEach>
    </ul>
	<div class="clear"></div>
</div>

<div class="pages">
	<ul>
	<c:if test="${page.pageNo > 1}" >
			<li class=""><a>共${page.totalRecords }条记录 ${page.pageNo }/${page.pageCount } 页</a></li> 
			<li class="paging_next"><a href="${pageContext.request.contextPath}/Mcases/p${page.pageNo-1 }">上一页</a></li>
         </c:if>
         <c:if test="${page.pageNo <= 1}" >
        	<li class=""><a>共${page.totalRecords }条记录 ${page.pageNo }/${page.pageCount } 页</a></li>
         	<li class="paging_next"><a href="javascript:void(0)">上一页</a></li>   
         </c:if>
         
         <c:forEach var="i" begin="1" end="${page.pageCount}">
          <li class="paging_current">
         	 <a <c:if test='${page.pageNo == i }'>style="background-color:#f39800;color:#FFF;"</c:if> href="${pageContext.request.contextPath}/Mcases/p${i }">&nbsp;${i}&nbsp;</a>
          </li>
		 </c:forEach>
		 <c:if test="${page.pageNo < page.pageCount}" >
		   <li class="paging_next"><a href="${pageContext.request.contextPath}/Mcases/p${page.pageNo+1 }">下一页</a></li>
         	
         </c:if>
         <c:if test="${page.pageNo >= page.pageCount}" >
         	 <li class="paging_next"><a href="javascript:void(0);">下一页</a></li>     
         </c:if>
         	<li><a href="${pageContext.request.contextPath}/Mcases/p${page.pageCount }">最后一页</a></li>
    
	</ul>
</div>

	<!-- 引入fotter.jsp -->
	<jsp:include page="public/fotter.jsp" />
</body>
</html>