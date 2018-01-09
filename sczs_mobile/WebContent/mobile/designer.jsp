<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>   
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="keywords" content="${scinterDesignerSeoKeywordStr.value }">
<meta name="description" content="${scinterDesignerSeoDescStr.value }">
<title>${scinterDesignerSeoTitleStr.value }</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"  />
<link rel="stylesheet" type="text/css" href="${ctx }/mobile/css/style.css">
<script src="${ctx }/mobile/js/jquery-1.7.2.min.js"></script>
</head>

<body>
  <div class="wrap">
    <div class="mList_al clearfix">
      <div class="mList_title fl">
        <h3>【设计师】</h3>
      </div>
      <div class="mList_position fr">您的当前位置：<a href="${ctx }/">首页</a> > <a href="${ctx }/designer">设计师</a></div>
    </div>
    <div class="mList_per">
      <ul>
       
        <c:forEach items="${designerList }" var="designer" varStatus="status">
	        <li class="clearfix">
	          <div class="mList_per_left fl" >
	       	  <a href="${pageContext.request.contextPath}/MdesignerDetail?designerId=${designer.designerId}">
	       
	         		 <img src="${designer.designerPhotoImg }" style="height: 165px;">
	          </a>
	          </div>
	          <div class="mList_per_right fr">
	            <h3>
	            <a href="${pageContext.request.contextPath}/MdesignerDetail?designerId=${designer.designerId}"> ${designer.designerName }</a>
	            <span style="">${designer.designerTitle }</span></h3>
	            <p>职位等级：${designer.designerTitle }</p>
	            <p>从业时间：${designer.designerWorkTime }</p>
	            <p>擅长风格：${designer.designerStyle }</p>
	            
	            <p>设计理念：
		 			<c:choose>
			       	
			  	     	<c:when test="${fn:length(designer.designerIdea)>=20 }">
			  	     	   ${fn:substring(designer.designerIdea,0,20)}....
			  	     	   <a href="${pageContext.request.contextPath}/MdesignerDetail?designerId=${designer.designerId}">查看详情</a> 
			  	     	</c:when>
			  	     	<c:otherwise>${designer.designerIdea }</c:otherwise>
			       	</c:choose>	
			       	           
	            </p>
	            
	            <div class="mar"><a href="${pageContext.request.contextPath}/Morder?designerName=${designer.designerName }">预约设计师</a></div>
	          </div>
	        </li>
        </c:forEach>
       
      </ul>
      
      <div  id="moreNum" class="jz_more"><input class="btn btn-red btn-lg" type="button" value="加载更多"/></div>
    </div>
    
  </div>

<!--底部导航 start-->
<jsp:include page="public/fotter.jsp"/>
<!--底部导航  end-->    
${sessionScope.statistics.value }
${sessionScope.shangqiao.value }
<script type="text/javascript">
var DesignerNum = '${DesignerNum }';
var totalNums = '${totalNums }';
if(parseInt(DesignerNum) >= parseInt(totalNums)){
	$("#moreNum").remove();
}
	$("#moreNum").bind("click",function(){
		
		if(parseInt(DesignerNum) < parseInt(totalNums)){
			DesignerNum = '${DesignerNum +6 }';
			window.location.href = "${ctx }/designer?DesignerNum="+DesignerNum;
		}
	});
</script>
</body>
</html>
