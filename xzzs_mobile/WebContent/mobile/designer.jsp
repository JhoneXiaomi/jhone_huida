<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/head.jsp" %>    
<!DOCTYPE html >
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<title>${designerSeoTitleStr.value }</title>
	<meta name="description" content="${designerSeoDescStr.value }"/>
	<meta name="keywords" content="${designerSeoKeywordStr.value }"/>
	<link href="${ctx }/mobile/css/style.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="${ctx }/mobile/js/jquery-1.10.2.min.js"></script> 
</head>
<body>

	<div class="neiye-top">设计团队
		<div class="neiye-fanhui">
				<a href="javascript:void(0)" onclick="javascript:history.go(-1)">返回</a>
		</div>
	</div>
	
	<div class="weizhi">
		<em class="dqwz">当前位置</em>
		<a href="${ctx }/m">首页</a>&gt;<a href="javascript:void(0)">设计团队</a>
	</div>
	
	<div class="nycase">
		<ul class="nyteamlb">
		  <c:forEach items="${designerList }" var="designer" varStatus="status">
			<li>
				
	            <a href="${pageContext.request.contextPath}/MdesignerDetail?designerId=${designer.designerId}">
	            	<div class="nyteam-img"><img src="${designer.designerPhotoImg }"/></div>
	            	<div class="nycase-con">
	                	<p class="nycase-con-title">${designer.designerName }
	                	<i style="font-size:12px; color:#db6327; margin-left:5px;">[${designer.designerTitle } ]</i></p>
	                	<p class="nycase-con-js">从业时间:&nbsp;<font color="red">${designer.designerWorkTime }</font>&nbsp;年
			                <br/>擅长风格：${designer.designerStyle }<br/>
			                             设计理念：
				            <c:choose>
					  	     	<c:when test="${fn:length(designer.designerIdea)>=20 }">
					  	     	   ${fn:substring(designer.designerIdea,0,20)}....
					  	     	</c:when>
					  	     	<c:otherwise>${designer.designerIdea }</c:otherwise>
					       	</c:choose>	
	                    </p>
	                </div>
	                
	                <div class="nyteam-jiantou"><img src="${ctx }/mobile/images/case-jiantou.png"/></div>
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
				<li class="paging_next"><a href="${pageContext.request.contextPath}/m/designer/p${page.pageNo-1 }">上一页</a></li>
	         </c:if>
	         <c:if test="${page.pageNo <= 1}" >
	        	<li class=""><a>共${page.totalRecords }条记录 ${page.pageNo }/${page.pageCount } 页</a></li>
	         	<!-- <li class="paging_next"><a href="javascript:void(0)">上一页</a></li>    -->
	         </c:if>
	         <c:forEach var="i" begin="1" end="${page.pageCount}">
	          <li class="paging_current">
	         	 <a <c:if test='${page.pageNo == i }'>style="background-color:#f39800;color:#FFF;"</c:if> href="${pageContext.request.contextPath}/m/designer/p${i }">&nbsp;${i}&nbsp;</a>
	          </li>
			 </c:forEach>
			 <c:if test="${page.pageNo < page.pageCount}" >
			   <li class="paging_next"><a href="${pageContext.request.contextPath}/m/designer/p${page.pageNo+1 }">下一页</a></li>
	         </c:if>
	         	<li><a href="${pageContext.request.contextPath}/m/designer/p${page.pageCount }">最后一页</a></li>
		</ul>
	</div>

	<!-- fotter begin -->
	<jsp:include page="public/fotter.jsp" />
	<!-- fotter end -->
</body>
</html>